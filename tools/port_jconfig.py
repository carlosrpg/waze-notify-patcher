#!/usr/bin/env python3
"""Port the JConfig build's cluster patches onto a decoded newer Waze.

  port_jconfig.py <jconfig-dir> <target-decoded-dir>

<jconfig-dir> is a decoded JConfig build, or the repository's jconfig/ (smali/ with only JConfig's own classes and
the Alerter data class of the Waze it was built on, which is all this reads).

1. Copies JConfig's own classes (com/waze/patches/*, com/vadimbrk/*) into a new smali dir of the target, remapping
   the few obfuscated Waze names they use (the "Alerter" data class and its getters, found by field name).
2. Keeps Waze's turn box visible on the cluster (JConfig hides it there; ClusterLayout places it instead).
3. Inserts JConfig's hook calls at the matching places of the target, found by stable anchors (class names, JNI
   names, protobuf builders, Compose trace names, structure) rather than obfuscated names. Every hook must be found
   the expected number of times or the port fails.
Hooks whose Waze code no longer exists (the map canvas camera-anchor calls, per-instruction broadcasts) are listed.
"""
import glob, os, re, shutil, sys

P = "Lcom/waze/patches/Patches;"
OV = "Lcom/waze/patches/ClusterAlertOverlay;"
BR = "Lcom/carlosrpg/wazenotify/JconfigBridge;"
MOD = "Landroidx/compose/ui/Modifier;"
COMP = "Landroidx/compose/runtime/Composer;"
OWN = ("com/waze/patches/", "com/vadimbrk/")


# ---------------------------------------------------------------- smali helpers
def rel(root, p):
    return re.sub(r"^smali[^/\\]*[/\\]", "", os.path.relpath(p, root)).replace("\\", "/")


def smali_files(root, sub="com/waze"):
    return glob.glob(os.path.join(root, "smali*", *sub.split("/"), "**", "*.smali"), recursive=True)


def find_class(root, relpath):
    hits = glob.glob(os.path.join(root, "smali*", *relpath.split("/")))
    assert len(hits) == 1, f"{relpath}: {len(hits)} copies"
    return hits[0]


METHOD = re.compile(r"^\.method (?P<sig>[^\n]*)\n(?P<body>.*?)^\.end method", re.M | re.S)


def first_instruction(body):
    """Offset in body where the first real instruction starts (after .locals/.param/.annotation blocks)."""
    pos, depth = 0, 0
    for line in body.splitlines(keepends=True):
        s = line.strip()
        if depth:
            if s.startswith(".end annotation"):
                depth -= 1
        elif s.startswith(".annotation"):
            depth += 1
        elif not (s == "" or s.startswith(("#", ".locals", ".registers", ".line", ".prologue", ".param", ".end param"))):
            return pos
        pos += len(line)
    raise AssertionError("method has no instructions")


def locals_count(body):
    m = re.search(r"^\s*\.locals (\d+)", body, re.M)
    return int(m.group(1)) if m else 0


def reg_num(r):
    return int(r[1:])


class Port:
    def __init__(self, src, dst):
        self.src, self.dst = src, dst
        self.done = {}      # hook name -> count
        self.files = {}     # path -> text (pending writes)

    def text(self, path):
        if path not in self.files:
            self.files[path] = open(path, encoding="utf-8").read()
        return self.files[path]

    def edit_method(self, path, sig_re, fn, name, expect=1):
        """Apply fn(sig, body) -> new body to every method whose signature matches sig_re."""
        t = self.text(path)
        n = 0
        def rep(m):
            nonlocal n
            if not re.search(sig_re, m.group("sig")):
                return m.group(0)
            new = fn(m.group("sig"), m.group("body"))
            if new is None or new == m.group("body"):
                return m.group(0)
            n += 1
            return f".method {m.group('sig')}\n{new}.end method"
        self.files[path] = METHOD.sub(rep, t)
        self.count(name, n, expect)

    def count(self, name, n, expect):
        self.done[name] = self.done.get(name, 0) + n
        if expect is not None:
            assert n == expect, f"hook {name}: matched {n}, expected {expect}"

    def flush(self):
        for p, t in self.files.items():
            open(p, "w", encoding="utf-8", newline="\n").write(t)


# ---------------------------------------------------------------- 1. classes
def kotlin_getters(path):
    """{getter name: (source field name, return type)} for a Kotlin data class, via its toString()."""
    t = open(path, encoding="utf-8").read()
    cls = re.search(r"^\.class [^\n]*?(L[^;]+;)", t, re.M).group(1)
    ts = re.search(r"\.method public (?:final )?toString\(\)Ljava/lang/String;(.*?)\.end method", t, re.S).group(1)
    names, cur = {}, None
    for line in ts.splitlines():
        s = re.search(r'const-string(?:/jumbo)? \w+, "([^"]*)"', line)
        if s:
            m = re.search(r"(\w+)=$", s.group(1))
            cur = m.group(1) if m else None
        f = re.search(re.escape(cls) + r"->(\w+):(\S+)", line)
        if f and cur:
            names[f.group(1)] = cur
            cur = None
    out = {}
    for m in re.finditer(r"\.method public final (\w+)\(\)(\S+)\n(.*?)\.end method", t, re.S):
        f = re.search(re.escape(cls) + r"->(\w+):", m.group(3))
        body = [l for l in m.group(3).splitlines() if l.strip() and not l.strip().startswith(".")]
        if f and len(body) <= 2 and f.group(1) in names:
            out[m.group(1)] = (names[f.group(1)], m.group(2))
    return cls, out


def alerter_class(root):
    hits = [p for p in smali_files(root) if re.search(r"^\.class public final Lcom/waze/\w+;", open(p, encoding="utf-8").read(), re.M)
            and '"Alerter(alertId="' in open(p, encoding="utf-8").read()]
    assert len(hits) == 1, f"Alerter data class: {len(hits)} candidates"
    return hits[0]


def copy_classes(port):
    src_files = [p for p in glob.glob(os.path.join(port.src, "smali*", "**", "*.smali"), recursive=True)
                 if rel(port.src, p).startswith(OWN)]
    assert src_files, "no JConfig classes in the source build"
    old_cls, old_get = kotlin_getters(alerter_class(port.src))
    new_cls, new_get = kotlin_getters(alerter_class(port.dst))
    by_field = {f: (g, ty) for g, (f, ty) in new_get.items()}
    remap = {}
    for g, (field, ty) in old_get.items():
        assert field in by_field, f"Alerter.{field} missing in target"
        ng, nty = by_field[field]
        remap[f"{old_cls}->{g}(){ty}"] = f"{new_cls}->{ng}(){nty}"
    dirs = [d for d in glob.glob(os.path.join(port.dst, "smali*")) if os.path.isdir(d)]
    n = max(int(re.search(r"smali_classes(\d+)$", d).group(1)) if d.endswith(tuple("0123456789")) else 1 for d in dirs)
    out_dir = os.path.join(port.dst, f"smali_classes{n + 1}")
    used = set()
    for p in src_files:
        t = open(p, encoding="utf-8").read()
        for a, b in remap.items():
            if a in t:
                used.add(a)
            t = t.replace(a, b)
        t = t.replace(old_cls, new_cls)
        dst = os.path.join(out_dir, *rel(port.src, p).split("/"))
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        open(dst, "w", encoding="utf-8", newline="\n").write(t)
    print(f"   copied {len(src_files)} JConfig classes -> {os.path.basename(out_dir)}; Alerter {old_cls}->{new_cls}, "
          f"getters remapped: {sorted(remap[a].split('->')[1] for a in used)}")
    return out_dir


def keep_turn_box(port, out_dir):
    """JConfig hides Waze's turn box on the cluster; keep it (ClusterLayout places it) but still skip JConfig's own
    turn-box transform there, so only one placement acts on it."""
    path = os.path.join(out_dir, "com", "waze", "patches", "Patches.smali")
    body = ("    .locals 2\n\n    invoke-static {p0}, " + P + "->getDisplayId(Landroid/view/View;)I\n    move-result v0\n"
            "    const/4 v1, 0x2\n    if-ne v0, v1, :cond_1\n    const/4 v0, 0x0\n    invoke-static {v0}, " + P +
            "->setNavBarExists(Z)V\n    const/4 v0, 0x1\n    return v0\n    :cond_1\n    const/4 v0, 0x0\n    return v0\n")
    port.edit_method(path, r"^public static applyClusterNavBarVisibility\(Landroid/view/View;\)Z$", lambda s, b: body,
                     "keep turn box on cluster")
    # car marker height on the cluster: JConfig returns a fixed 0.8; ask ClusterLayout (tunable as car.y) instead
    def car_y(sig, b):
        assert "const v0, 0x3f4ccccd" in b, "JConfig's 0.8 car height not found"
        return b.replace("const v0, 0x3f4ccccd    # 0.8f",
                         "invoke-static {p2}, Lcom/carlosrpg/wazenotify/ClusterLayout;->jconfigCarY(F)F\n\n    move-result v0") \
                .replace("const v0, 0x3f4ccccd", "invoke-static {p2}, Lcom/carlosrpg/wazenotify/ClusterLayout;->jconfigCarY(F)F\n\n    move-result v0")
    port.edit_method(path, r"^public static applyUserLocationOffsetY\(Ljava/lang/String;FFZ\)F$", car_y, "car height via ClusterLayout")


# ---------------------------------------------------------------- 2. hooks
def at_start(code):
    def fn(sig, body):
        i = first_instruction(body)
        return body[:i] + code + body[i:]
    return fn


def before_last_return(code, ret="return-void"):
    def fn(sig, body):
        i = body.rfind("    " + ret)
        assert i >= 0, f"no {ret}"
        return body[:i] + code + body[i:]
    return fn


def hooks(port):
    d = port.dst
    # phone UI on Android Automotive
    port.edit_method(find_class(d, "androidx/car/app/utils/CommonUtils.smali"), r"^public static isAutomotiveOS\(Landroid/content/Context;\)Z$",
                     lambda s, b: f"    .locals 1\n\n    invoke-static {{}}, {P}->isAutomotiveOSForced()Z\n    move-result v0\n    return v0\n",
                     "isAutomotiveOS")

    # alert overlay: the alert controller's update (alert, state, Z) -> state and close()
    alert_cls = kotlin_getters(alerter_class(d))[0]
    ctl = []
    for p in smali_files(d):
        t = open(p, encoding="utf-8").read()
        if alert_cls in t and ".method public final close()V" in t and re.search(
                r"^\.method private final \w+\(" + re.escape(alert_cls) + r"(L[^;]+;)Z\)\1$", t, re.M):
            ctl.append(p)
    assert len(ctl) == 1, f"alert controller: {len(ctl)} candidates"
    port.edit_method(ctl[0], r"^private final \w+\(" + re.escape(alert_cls) + r"(L[^;]+;)Z\)\1$",
                     at_start(f"    invoke-static/range {{p0 .. p1}}, {OV}->onAlertUpdated(Ljava/lang/Object;Ljava/lang/Object;)V\n"), "alert update")
    port.edit_method(ctl[0], r"^public final close\(\)V$", at_start(f"    invoke-static {{p0}}, {OV}->onAlertClosed(Ljava/lang/Object;)V\n"), "alert close")

    # ETA panel classes (scrollable_eta, FrameLayout, static self field): "bar" has d(F) scaling an ImageView
    eta = []
    for p in smali_files(d, "com/waze/main_screen"):
        t = open(p, encoding="utf-8").read()
        cls = re.search(r"^\.class [^\n]*?(L[^;]+;)", t, re.M).group(1)
        if "scrollable_eta/" in cls and ".super Landroid/widget/FrameLayout;" in t and re.search(r"^\.field private static \w+:" + re.escape(cls), t, re.M):
            eta.append((p, cls, t))
    bar = [e for e in eta if re.search(r"\.method public final d\(F\)V\n(?:(?!\.end method).)*ImageView;->setAlpha\(F\)V", e[2], re.S)]
    btn = [e for e in eta if e not in bar]
    assert len(bar) == 1 and len(btn) == 1, f"ETA classes: bar {len(bar)}, buttons {len(btn)}"
    p, cls, t = btn[0]
    vg = re.findall(r"^\.field private final (\w+):Landroid/view/ViewGroup;", t, re.M)[0]
    port.edit_method(p, r"^public constructor <init>\(Landroid/content/Context;\)V$",
                     before_last_return(f"    iget-object v0, p0, {cls}->{vg}:Landroid/view/ViewGroup;\n"
                                        f"    invoke-static {{v0}}, {P}->applyEtaButtonsLifter(Landroid/view/ViewGroup;)V\n"), "eta buttons lifter")
    p, cls, t = bar[0]
    def bar_d(sig, body):
        m = re.search(r"^(\s*invoke-virtual \{\w+, \w+\}, Landroid/widget/ImageView;->setAlpha\(F\)V\n)(?:\s*\.line \d+\n|\s*\n)*\s*iget-boolean (\w+), p0, " + re.escape(cls) + r"->(\w+):Z", body, re.M)
        assert m, "ETA bar d(F): setAlpha + expanded flag not found"
        flag = m.group(3)
        rest = body[m.end(1):]
        first_v0 = re.search(r"^\s*[\w/-]+ [^\n]*\bv0\b", rest, re.M)
        assert first_v0 is None or re.match(r"\s*(const|move-result|iget|sget|move)[\w/-]* v0\b", first_v0.group(0)), "v0 is read after the hook point"
        add = (f"    invoke-static {{p0}}, {P}->applyClusterEtaBarChrome(Landroid/view/View;)V\n"
               f"    iget-boolean v0, p0, {cls}->{flag}:Z\n"
               f"    invoke-static {{p0, v0}}, {P}->applyEtaGoClickerOnSetExpanded(Landroid/view/View;Z)V\n")
        return body[:m.end(1)] + add + body[m.end(1):]
    port.edit_method(p, r"^public final d\(F\)V$", bar_d, "eta bar chrome + go clicker")
    port.edit_method(p, r"^public final \w\(Lcom/waze/ui/[\w/]+;\)V$",
                     lambda s, b: before_last_return(f"    invoke-static {{p0}}, {P}->applyClusterEtaBarChrome(Landroid/view/View;)V\n")(s, b)
                     if re.search(r"iput-object p1, p0", b) and re.search(r"invoke-direct \{p0\}, " + re.escape(cls) + r"->\w+\(\)V", b) else None,
                     "eta bar chrome on update")

    # speedometer container: FrameLayout holding a SpeedometerColoredView, two plain View fields
    sp = []
    for p in smali_files(d, "com/waze/main_screen"):
        t = open(p, encoding="utf-8").read()
        if ".super Landroid/widget/FrameLayout;" in t and re.search(r"^\.field [^\n]*:Lcom/waze/view/map/SpeedometerColoredView;", t, re.M) \
                and re.search(r"\.method public constructor <init>\(Landroid/content/Context;\)V", t):
            sp.append((p, t))
    assert len(sp) == 1, f"speedometer container: {len(sp)} candidates"
    p, t = sp[0]
    cls = re.search(r"^\.class [^\n]*?(L[^;]+;)", t, re.M).group(1)
    views = re.findall(r"^\.field (?:final )?(\w+):Landroid/view/View;", t, re.M)
    assert len(views) >= 2, f"speedometer container View fields: {views}"
    port.edit_method(p, r"^public constructor <init>\(Landroid/content/Context;\)V$",
                     before_last_return(f"    iget-object v0, p0, {cls}->{views[0]}:Landroid/view/View;\n"
                                        f"    iget-object v1, p0, {cls}->{views[1]}:Landroid/view/View;\n"
                                        f"    invoke-static {{v0, v1}}, {P}->applyClusterSpeedometerVisibility(Landroid/view/View;Landroid/view/View;)V\n"),
                     "speedometer visibility")

    compose_hooks(port)
    map_hooks(port)
    app_and_nav_hooks(port)


def traced(port, trace, pattern, insert, name, expect=1):
    """In every method whose body contains the Compose trace string, insert insert(match) before each pattern match
    (insert may also return a full replacement by setting replace=True on the pattern tuple)."""
    total = 0
    for path in smali_files(port.dst, "com/waze/main_screen"):
        t = port.files.get(path) or open(path, encoding="utf-8").read()
        if trace not in t:
            continue
        n = 0
        def per_method(m):
            nonlocal n
            body = m.group("body")
            if trace not in body:
                return m.group(0)
            def rep(c):
                nonlocal n
                n += 1
                return insert(c)
            return f".method {m.group('sig')}\n{pattern.sub(rep, body)}.end method"
        new = METHOD.sub(per_method, t)
        if n:
            port.files[path] = new
            total += n
    port.count(name, total, expect)


def compose_hooks(port):
    sheet = re.compile(r"^(\s*)invoke-static/range \{v(\d+) \.\. v\d+\}, L[^;]+;->\w+\(" + re.escape(MOD) + r"L[^;]+;Z"
                       r"Landroidx/compose/foundation/interaction/MutableInteractionSource;L[^;]+;" + re.escape(COMP) + r"II\)V$", re.M)
    traced(port, "EtaDrawerBottomSheet (EtaDrawerBottomSheet.kt", sheet,
           lambda c: (f"{c.group(1)}invoke-static/range {{v{c.group(2)} .. v{int(c.group(2)) + 5}}}, {P}->applyClusterEtaSheetShape("
                      f"{MOD}Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;{COMP}){MOD}\n"
                      f"{c.group(1)}move-result-object v{c.group(2)}\n" + c.group(0)),
           "eta sheet shape")

    box = re.compile(r"^(\s*)invoke-static/range \{v(\d+) \.\. v\d+\}, Landroidx/compose/foundation/layout/BoxWithConstraintsKt;->BoxWithConstraints\(" + re.escape(MOD), re.M)
    def box_ins(c):
        m, comp = int(c.group(2)), int(c.group(2)) + 4
        assert comp <= 15, "LandscapeMidDrive registers too high for a short invoke"
        return (f"{c.group(1)}invoke-static {{v{m}, v{comp}}}, {P}->applyClusterMidDriveInsets({MOD}{COMP}){MOD}\n"
                f"{c.group(1)}move-result-object v{m}\n" + c.group(0))
    traced(port, "LandscapeMidDrive (MidDriveScreen.kt", box, box_ins, "mid-drive insets")

    gap = r"(?:[ \t]*(?:\.line \d+)?\n)*"
    height = re.compile(r"(?<=getMaxHeight-D9Ej5fM\(\)F\n)(" + gap + r"([ \t]*)move-result (\w+)\n)(?=" + gap +
                        r"(?:[ \t]*const/16 \w+, 0x\w+\n" + gap + r")?[ \t]*invoke-static \{\w+, \w+, \3, (\w+), \w+\}, L[^;]+;->\w+\(L[^;]+;FF"
                        + re.escape(COMP) + r"I\)V)")
    traced(port, "LandscapeMidDrive.<anonymous> (MidDriveScreen.kt", height,
           lambda c: c.group(1) + f"{c.group(2)}invoke-static {{{c.group(3)}, {c.group(4)}}}, {P}->applyClusterMapViewportHeight(F{COMP})F\n"
                                  f"{c.group(2)}move-result {c.group(3)}\n",
           "map viewport height")

    insight = re.compile(r"^(\s*)invoke-static/range \{v(\d+) \.\. v\d+\}, L[^;]+;->\w+\(L[^;]+;ZZ" + re.escape(MOD) + re.escape(COMP) + r"I\)V$", re.M)
    def insight_ins(c):
        a = int(c.group(2))
        return (f"{c.group(1)}invoke-static/range {{v{a + 3} .. v{a + 4}}}, {OV}->applyClusterInsightVisibility({MOD}{COMP}){MOD}\n"
                f"{c.group(1)}move-result-object v{a + 3}\n" + c.group(0))
    traced(port, "mid_drive.LandscapeMainContent (MidDriveScreen.kt", insight, insight_ins, "insight card, mid-drive")
    traced(port, "pre_drive.LandscapeMainContent (PreDriveScreen.kt", insight, insight_ins, "insight card, pre-drive")


def map_hooks(port):
    d = port.dst
    # user location offset right before the native call (mapId, x, y, animate)
    wm = find_class(d, "com/waze/map/WazeMapNativeManager.smali")
    call = re.compile(r"^(\s*)invoke-direct \{(\w+), (\w+), (\w+), (\w+), (\w+)\}, Lcom/waze/map/WazeMapNativeManager;->nativeSetUserLocationOffset\(Ljava/lang/String;FFZ\)V$", re.M)
    t = port.text(wm)
    def rep(c):
        ind, mgr, mid, x, y, a = c.groups()
        # also hand the map manager and map id to ClusterLayout, which re-applies the offset while on the cluster
        return (f"{ind}invoke-static {{{mgr}, {mid}}}, Lcom/carlosrpg/wazenotify/ClusterLayout;->rememberMap(Ljava/lang/Object;Ljava/lang/String;)V\n"
                f"{ind}invoke-static {{{mid}, {x}, {y}, {a}}}, {P}->applyUserLocationOffsetX(Ljava/lang/String;FFZ)F\n{ind}move-result {x}\n"
                f"{ind}invoke-static {{{mid}, {x}, {y}, {a}}}, {P}->applyUserLocationOffsetY(Ljava/lang/String;FFZ)F\n{ind}move-result {y}\n" + c.group(0))
    port.files[wm], n = call.subn(rep, t)
    port.count("user location offset (native)", n, 1)

    # user location built from a PointF into MapBounds.PositionPercentage: adjust the PointF first
    pt = re.compile(r"^(\s*)iget (\w+), (\w+), Landroid/graphics/PointF;->x:F\n(?=(?:\s*\.line \d+\n|\s*\n)*\s*invoke-virtual \{\w+, \2\}, Lcom/waze/jni/protos/map/MapBounds\$PositionPercentage\$Builder;->setXPercentage)", re.M)
    total = 0
    for p in smali_files(d, "com/waze/map"):
        t = port.files.get(p) or open(p, encoding="utf-8").read()
        if "PositionPercentage$Builder;->setXPercentage" not in t:
            continue
        def rp(c):
            ind, _, src = c.group(1), c.group(2), c.group(3)
            return (f"{ind}invoke-static {{{src}}}, {BR}->userLocation(Ljava/lang/Object;)Ljava/lang/Object;\n{ind}move-result-object {src}\n"
                    f"{ind}check-cast {src}, Landroid/graphics/PointF;\n" + c.group(0))
        new, n = pt.subn(rp, t)
        if n:
            port.files[p] = new
            total += n
    port.count("user location offset (PointF)", total, 1)

    # map viewport (Rect, Rect) -> RelativeViewPort: width and offsetX
    vp = find_class(d, "com/waze/map/canvas/a/a.smali")
    def viewport(sig, body):
        out, n = body, 0
        for setter, fn in (("setWidth", "applyRelativeViewportWidth"), ("setOffsetX", "applyRelativeViewportOffsetX")):
            m = re.search(r"^(\s*)invoke-virtual \{\w+, (\w+)\}, Lcom/waze/jni/protos/map/RelativeViewPort\$Builder;->" + setter + r"\(F\)", out, re.M)
            assert m, f"viewport {setter} not found"
            ind, r = m.group(1), m.group(2)
            for reg in ("p1", "p2", r):
                assert reg.startswith("p") or reg_num(reg) <= 15, "register too high for a short invoke"
            ins = f"{ind}invoke-static {{p1, p2, {r}}}, {P}->{fn}(Landroid/graphics/Rect;Landroid/graphics/Rect;F)F\n{ind}move-result {r}\n"
            out = out[:m.start()] + ins + out[m.start():]
            n += 1
        return out
    port.edit_method(vp, r"^public final \w+\(Landroid/graphics/Rect;Landroid/graphics/Rect;\)Lcom/waze/jni/protos/map/RelativeViewPort;$", viewport, "viewport width + offset")


def app_and_nav_hooks(port):
    d = port.dst
    app = find_class(d, "com/waze/mobile/WazeMobileApplication.smali")
    def oncreate(sig, body):
        m = re.search(r"^(\s*)invoke-super \{p0\}, L[^;]+;->onCreate\(\)V\n", body, re.M)
        assert m, "super.onCreate() not found"
        ind = m.group(1)
        return body[:m.end()] + (f"{ind}invoke-static {{p0}}, {BR}->initMyCar(Landroid/content/Context;)V\n"
                                 f"{ind}invoke-static {{p0}}, {P}->init(Landroid/app/Application;)V\n") + body[m.end():]
    port.edit_method(app, r"^public final onCreate\(\)V$", oncreate, "Patches.init")

    base = find_class(d, "com/waze/navigate/NavigationInfoNativeManagerBase.smali")
    port.edit_method(base, r"^protected final onNavigationStateChangedJNI\(ZI\)V$",
                     at_start(f"    invoke-static {{p1}}, {P}->setNavigating(Z)V\n    invoke-static {{p1, p2}}, {P}->onNativeNavigationStateChanged(ZI)V\n"),
                     "navigation state")
    port.edit_method(base, r"^protected final onEtaMinutesChangedJNI\(Ljava/lang/String;Ljava/lang/String;I\)V$",
                     at_start(f"    invoke-static {{p1, p2, p3}}, {P}->onEtaMinutesChanged(Ljava/lang/String;Ljava/lang/String;I)V\n"), "eta minutes")
    port.edit_method(base, r"^protected final onEtaDistanceChangedJNI\(\[B\)V$",
                     at_start(f"    invoke-static {{p1}}, {BR}->etaDistance([B)V\n"), "eta distance")


NOT_PORTED = [
    "map canvas camera anchor (MainCanvasDelegatorImpl native camera calls: no longer in this Waze)",
    "current/next instruction, street names, instruction distance broadcasts (Waze now reports navigation as segments)",
]


def main():
    src, dst = sys.argv[1], sys.argv[2]
    port = Port(src, dst)
    out_dir = copy_classes(port)
    keep_turn_box(port, out_dir)
    hooks(port)
    port.flush()
    for k, v in port.done.items():
        print(f"   hook {k}: {v}")
    print("   not ported: " + "; ".join(NOT_PORTED))


if __name__ == "__main__":
    # self-checks of the generic helpers
    b = "    .locals 2\n    .param p1, \"x\"    # I\n    .annotation build Lx;\n    .end annotation\n\n    const/4 v0, 0x1\n    return-void\n"
    assert b[first_instruction(b):].startswith("    const/4 v0"), "first_instruction self-check"
    assert before_last_return("    nop\n")("", "    a\n    return-void\n").endswith("    nop\n    return-void\n")
    main()
