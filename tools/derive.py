"""Derive the per-APK obfuscated names the notifier needs, and write NavMap.java.

Usage: python -I derive.py <apktool-decode-dir> <out/NavMap.java>

What changes between Waze builds is class names and a couple of method names; the listener method LETTERS have
been stable (d,E,k,m,p,s). This derives the parts that move and verifies the stable letters, failing loudly if a
future build breaks an assumption so the map can be fixed by hand rather than silently misbehaving.

Derived structurally (robust to renames):
  - GET_INSTANCE : the static 0-arg method of NavigationInfoNativeManager returning the manager.
  - ADD_LISTENER + the listener interface : the manager method taking one com.waze.navigate interface whose body
    adds to a Set (distinguishes add from remove/restore).
  - M_INSTRUCTION : the interface method whose single parameter is an enum (the instruction enum; its type name
    changes per build but its constants keep real names, so the icon map needs no per-APK data).
  - M_NAVSTATE : the interface method with descriptor (Z,I).
Defaulted to the stable letters and verified by signature (and confirmed via the manager's handler names when
those are descriptive): M_DISTANCE=E, M_ETA=k, M_NEXTSTREET=s, M_EXIT=m.

Split feed (5.28+): when the info listener no longer carries the instruction enum, the turn data (instruction,
distance to the turn, roundabout exit, next street) comes from NavigationTurnGuidanceNativeManager's own listener.
That manager has no static getInstance; it comes from Waze's DI lookup (TG_LOOKUP_CLASS.TG_LOOKUP_METHOD(Class)),
found as the static (Class)Object call that follows a const-class of the manager. Its listener letters are
obfuscated and come in look-alike pairs (current/next instruction, three (I) callbacks, two street callbacks), so
each is traced from the manager's descriptive JNI entry point (onCurrentInstructionChangedJNI, ...) through the
posted runnable's switch case to the manager method and the listener method that method invokes. The lane
callback (TG_M_LANES) is the one listener method invoked by the manager's static method that unpacks the
NavigationLaneList proto; builds without the split feed leave it empty and the notification shows no lanes.
"""
import pathlib
import re
import sys

MANAGER_REL = "com/waze/navigate/NavigationInfoNativeManager.smali"
TG = "com/waze/navigate/NavigationTurnGuidanceNativeManager"
STREET_DESC = "Ljava/lang/String;ZILcom/waze/jni/protos/navigate/NavigationRoadSign;"
SS_I = "Ljava/lang/String;Ljava/lang/String;I"


def smali_methods(text):
    """{name: params-descriptor} for every method in a smali file."""
    out = {}
    for m in re.finditer(r"^\.method[^\n]*? (\S+)\(([^)]*)\)(\S+)\s*$", text, re.M):
        out.setdefault(m.group(1), []).append((m.group(2), m.group(3)))
    return out


def method_body(text, name, params):
    m = re.search(r"^\.method[^\n]*? " + re.escape(name) + r"\(" + re.escape(params) + r"\)\S+\s*$", text, re.M)
    end = text.index(".end method", m.end())
    return text[m.end():end]


def main(decode_dir, out_java):
    root = pathlib.Path(decode_dir)
    mgr_path = next(root.glob(f"smali*/{MANAGER_REL}"), None)
    assert mgr_path, f"{MANAGER_REL} not found"
    mgr = mgr_path.read_text(encoding="utf-8")

    # GET_INSTANCE: static, no args, returns the manager.
    gi = re.search(r"^\.method public static [\w-]*\s*(\w+)\(\)Lcom/waze/navigate/NavigationInfoNativeManager;",
                   mgr, re.M)
    assert gi, "getInstance not found"
    get_instance = gi.group(1)

    # ADD_LISTENER + interface: a manager method taking one com.waze.navigate interface whose body adds to a Set.
    add_listener = interface = None
    for m in re.finditer(r"^\.method public (?:final )?(\w+)\(L(com/waze/navigate/\w+);\)V\s*$", mgr, re.M):
        body = method_body(mgr, m.group(1), f"L{m.group(2)};")
        if "Ljava/util/Set;->add(" in body:
            add_listener, interface = m.group(1), m.group(2)
            break
    assert add_listener, "addListener (Set.add) not found"

    itf_path = next(root.glob(f"smali*/{interface}.smali"), None)
    assert itf_path, f"interface {interface} not found"
    methods = smali_methods(itf_path.read_text(encoding="utf-8"))

    def read(rel):
        f = next(root.glob(f"smali*/{rel}"), None)
        assert f, f"{rel} not found"
        return f.read_text(encoding="utf-8")

    def letter_with(params, ret="V"):
        return [n for n, sigs in methods.items() if any(p == params and r == ret for p, r in sigs)]

    def is_enum(type_desc):
        if not type_desc.startswith("L"):
            return False
        p = next(root.glob(f"smali*/{type_desc[1:-1]}.smali"), None)
        return bool(p and ".super Ljava/lang/Enum;" in p.read_text(encoding="utf-8"))

    # Which interface letters a manager method whose name matches `pred` invokes (uses descriptive handler names).
    def called_letters(pred):
        hits = set()
        for m in re.finditer(r"^\.method[^\n]*? (\w+)\(([^)]*)\)\S+\s*$", mgr, re.M):
            if pred(m.group(1).lower()):
                body = method_body(mgr, m.group(1), m.group(2))
                hits.update(re.findall(rf"L{re.escape(interface)};->(\w+)\(", body))
        return hits

    # The total remaining distance to the destination: the :I field onEtaDistanceChanged writes from the eta
    # DistanceUpdate's getRawMeters(). Its (I) listener is handed the next-turn distanceMeters instead (a Waze bug),
    # so the notifier reads this field at publish rather than trusting the listener value.
    def eta_distance_field():
        found = list(re.finditer(r"^\.method[^\n]*? (\w+)\(Lcom/waze/jni/protos/navigate/DistanceUpdate;\)V\s*$",
                                 mgr, re.M))
        for m in found:   # 5.28 obfuscates the handler name; then it is the only DistanceUpdate handler
            if "etadistance" in m.group(1).lower() or len(found) == 1:
                body = method_body(mgr, m.group(1), "Lcom/waze/jni/protos/navigate/DistanceUpdate;")
                fm = re.search(r"getRawMeters\(\)I.*?iput v\d+, p0, L[\w$/]+;->(\w+):I", body, re.S)
                if fm:
                    return fm.group(1)
        return None

    def resolve(default, params, prefer, what):
        cands = set(letter_with(params))
        assert cands, f"no interface method with ({params}) for {what}"
        hit = prefer & cands if prefer is not None else set()
        if len(hit) == 1:
            return next(iter(hit))
        return default if default in cands else sorted(cands)[0]

    enum_cands = {n for n, sigs in methods.items()
                  if any(re.fullmatch(r"L[\w/]+;", p) and r == "V" and is_enum(p) for p, r in sigs)}
    m_navstate = resolve("p", "ZI", None, "nav state")
    m_eta = resolve("k", SS_I, called_letters(lambda n: "eta" in n), "eta")
    remaining_field = eta_distance_field()
    assert remaining_field, "remaining-distance field (getRawMeters -> iput in the eta DistanceUpdate handler) not found"
    tg = {"TG_LOOKUP_CLASS": "", "TG_LOOKUP_METHOD": "", "TG_ADD_LISTENER": "", "TG_M_LANES": ""}

    if enum_cands:   # one feed (up to 5.27): everything on the info listener
        # Instruction: prefer the one driven by onCurrentInstructionChanged over onNextInstruction.
        cur = called_letters(lambda n: "current" in n and "instruction" in n) & enum_cands
        m_instruction = next(iter(cur)) if len(cur) == 1 else ("d" if "d" in enum_cands else sorted(enum_cands)[0])
        m_distance = resolve("E", SS_I,
                             (called_letters(lambda n: "instructiondistance" in n) or
                              called_letters(lambda n: "distance" in n and "eta" not in n)) - {m_eta}, "distance")
        m_next = resolve("s", STREET_DESC, called_letters(lambda n: "next" in n and "name" in n), "next street")
        m_exit = resolve("m", "I", None, "roundabout exit")
        # onEtaDistanceChanged's (I) listener fires on every eta-distance change (a good publish trigger) but is
        # handed the next-turn distance, not the total: kept only as a trigger; REMAINING_FIELD is the value.
        m_remaining = resolve("F", "I", called_letters(lambda n: "etadistance" in n), "remaining distance")
        assert len({m_distance, m_eta}) == 2, f"distance and eta resolved to the same letter {m_distance}"
    else:            # split feed (5.28+): turn data on NavigationTurnGuidanceNativeManager's listener
        m_remaining = resolve("t", "I", None, "remaining distance")
        tg_text = read(f"{TG}.smali")
        base_text = read(f"{TG}Base.smali")
        tg_add = tg_itf = None
        for m in re.finditer(r"^\.method public (?:final )?(\w+)\(L(com/waze/navigate/\w+);Z\)V\s*$", tg_text, re.M):
            if "Ljava/util/Set;->add(" in method_body(tg_text, m.group(1), f"L{m.group(2)};Z"):
                tg_add, tg_itf = m.group(1), m.group(2)
        assert tg_add, "turn-guidance addListener(listener, replay) not found"
        lookups = []
        for f in root.glob("smali*/com/waze/**/*.smali"):
            lookups += re.findall(r"const-class (v\d+), L" + TG + r";(?:\s+\.line \d+)*\s+invoke-static \{\1\}, L([\w/$]+);->(\w+)"
                                  r"\(Ljava/lang/Class;\)Ljava/lang/Object;", f.read_text(encoding="utf-8"))
        assert lookups, "DI lookup of the turn-guidance manager not found"
        _, lk_cls, lk_m = max(set(lookups), key=lookups.count)
        tg_methods = smali_methods(read(f"{tg_itf}.smali"))
        lane_m = re.search(r"^\.method[^\n]*? (\w+)\((L" + TG + r";Lcom/waze/jni/protos/navigate/NavigationLaneList;)\)",
                           tg_text, re.M)
        assert lane_m, "lane-list handler (static, takes NavigationLaneList) not found"
        lanes = set(re.findall(rf"L{re.escape(tg_itf)};->(\w+)\(", method_body(tg_text, lane_m.group(1), lane_m.group(2))))
        assert len(lanes) == 1, f"lane-list handler: expected one listener call, got {lanes}"
        m_lanes = lanes.pop()
        tg = {"TG_LOOKUP_CLASS": lk_cls.replace("/", "."), "TG_LOOKUP_METHOD": lk_m, "TG_ADD_LISTENER": tg_add,
              "TG_M_LANES": m_lanes}

        def traced(jni):
            """Listener letters reached from the manager's JNI entry point `jni`, via the runnable it posts."""
            params = re.search(rf" {jni}\(([^)]*)\)", base_text).group(1)
            body = method_body(base_text, jni, params)
            r = re.search(r"new-instance (v\d+), L([\w/$]+);.*?const(?:/4|/16)? v\d+, (-?0x[0-9a-f]+|-?\d+)\s+(?:\.line \d+\s+)*"
                          r"invoke-direct \{\1[^}]*\}, L\2;-><init>", body, re.S)
            assert r, f"{jni}: posted runnable not found"
            run = method_body(read(f"{r.group(2)}.smali"), "run", "")
            sw = re.search(r"\.packed-switch (-?0x[0-9a-f]+|-?\d+)\s+(.*?)\.end packed-switch", run, re.S)
            label = re.findall(r":(pswitch_\w+)", sw.group(2))[int(r.group(3), 0) - int(sw.group(1), 0)]
            seg = run[run.index(f":{label}\n"):]
            mm = re.search(r"L" + TG + r";->(\w+)\(([^)]*)\)V", seg)
            return re.findall(rf"L{re.escape(tg_itf)};->(\w+)\(", method_body(tg_text, mm.group(1), mm.group(2)))

        def one(jni, params):
            hits = [x for x in dict.fromkeys(traced(jni)) if any(p == params for p, _ in tg_methods.get(x, []))]
            assert len(hits) == 1, f"{jni}: expected one listener method taking ({params}), got {hits}"
            return hits[0]

        enum_desc = next(p for sigs in tg_methods.values() for p, _ in sigs if is_enum(p))
        m_instruction = one("onCurrentInstructionChangedJNI", enum_desc)
        m_distance = one("onCurrentInstructionDistanceChangedJNI", SS_I)
        m_exit = one("onExitNumberChangedJNI", "I")
        # the street the current turn leads onto; onNextNameChangedJNI is the following turn's ("and then") street
        m_next = one("onStreetNameChangedJNI", STREET_DESC)
        # both proxies dispatch by name alone, so no letter may exist on the other feed's interface
        clash = ({m_instruction, m_distance, m_exit, m_next, m_lanes} & set(methods)) | \
                ({m_navstate, m_eta, m_remaining} & set(tg_methods))
        assert not clash, f"letters {clash} exist on both listener interfaces"
        interface = f"{interface} + {tg_itf}"

    fields = {
        "GET_INSTANCE": get_instance, "ADD_LISTENER": add_listener,
        "M_NAVSTATE": m_navstate, "M_INSTRUCTION": m_instruction, "M_DISTANCE": m_distance,
        "M_EXIT": m_exit, "M_NEXTSTREET": m_next, "M_ETA": m_eta, "M_REMAINING": m_remaining,
        "REMAINING_FIELD": remaining_field, **tg,
    }
    lines = "\n".join(f'    static final String {k} = "{v}";' for k, v in fields.items())
    pathlib.Path(out_java).write_text(
        "package com.carlosrpg.wazenotify;\n\n"
        "/** Generated per APK by tools/derive.py from " + interface + " — do not edit by hand. */\n"
        "final class NavMap {\n" + lines + "\n    private NavMap() {}\n}\n", encoding="utf-8")
    print(f"NavMap: interface={interface} instructionEnumParam-ok  " +
          " ".join(f"{k}={v}" for k, v in fields.items()))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1], sys.argv[2]))
