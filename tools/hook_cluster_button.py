"""Add the cluster toggle to Waze's own map-button column (music, sound, ...).

Usage: python -I hook_cluster_button.py <decoded apk dir>
Exits 1 without changing anything when this Waze no longer has that shape; patch.sh then builds without the button.
Waze's SoundButton composable (found by its Compose trace name) ends by emitting one round button through a shared
button composable. A second call to that composable is inserted right after it, with the same modifier and style
but ClusterButton's icon and click. Both are children of the same column, so the new button sits under the sound
button and is laid out, animated and hidden with it. The call is unconditional: Compose needs the same sequence of
calls on every pass. Every obfuscated name used is read from the existing call, so nothing is version-specific.
"""
import pathlib
import re
import sys

TRACE = '"com.waze.main_screen.button_pack.sound_button.SoundButton ('
OURS = "Lcom/carlosrpg/wazenotify/ClusterButton;"
# the shared button: (icon, Modifier, style, long, onClick, onLongClick, ?, Composer, $changed, $default)
CALL = re.compile(r"^(\s*)invoke-static/range \{v(\d+) \.\. v(\d+)\}, (L[\w/$]+;->[\w$]+)"
                  r"\((L[\w/$]+;)Landroidx/compose/ui/Modifier;L[\w/$]+;J(L[\w/$]+;)(L[\w/$]+;)L[\w/$]+;"
                  r"Landroidx/compose/runtime/Composer;II\)V$")


def main(base):
    def having_trace(pattern):
        return [p for p in pathlib.Path(base).glob(pattern) if TRACE in p.read_text(encoding="utf-8")]
    # where it is today, else anywhere (slow: the whole tree)
    hits = having_trace("smali*/com/waze/main_screen/**/*.smali") or having_trace("smali*/**/*.smali")
    assert len(hits) == 1, f"SoundButton composable: expected one file, found {hits}"
    lines = hits[0].read_text(encoding="utf-8").split("\n")
    if any(OURS in l for l in lines):
        print("cluster button already hooked")
        return 0
    start = next(i for i, l in enumerate(lines) if TRACE in l)
    end = next(i for i in range(start, len(lines)) if lines[i].startswith(".end method"))
    calls = [(i, CALL.match(lines[i])) for i in range(start, end) if CALL.match(lines[i])]
    assert len(calls) == 1, f"SoundButton: expected one button call, found {len(calls)}"
    at, m = calls[0]
    indent, first, last, _, icon, on_click, on_long = m.groups()
    first, last = int(first), int(last)
    assert last - first == 10 and last <= 15 and on_click == on_long, "button call has another shape"
    # how SoundButton builds its icon: new <icon>(new <res icon>(int, Color))
    wrap = next((re.search(r"\{v\d+, v\d+\}, (%s-><init>\(L[\w/$]+;\)V)" % re.escape(icon), lines[i])
                 for i in range(at, start, -1) if icon + "-><init>(L" in lines[i]), None)
    res = next((re.search(r"(L[\w/$]+;)-><init>\(ILandroidx/compose/ui/graphics/Color;\)V", lines[i])
                for i in range(at, start, -1) if "-><init>(ILandroidx/compose/ui/graphics/Color;)V" in lines[i]), None)
    assert wrap and res, "SoundButton no longer builds its icon from a drawable id"
    v_icon, v_click, v_long = f"v{first}", f"v{first + 5}", f"v{first + 6}"   # the long takes two registers
    add = [
        "",
        f"invoke-static {{}}, {OURS}->iconRes()I",
        f"move-result {v_icon}",
        f"const/4 {v_long}, 0x0",
        f"new-instance {v_click}, {res.group(1)}",
        f"invoke-direct {{{v_click}, {v_icon}, {v_long}}}, {res.group(0)}",
        f"new-instance {v_icon}, {icon}",
        f"invoke-direct {{{v_icon}, {v_click}}}, {wrap.group(1)}",
        f"const-class {v_click}, {on_click}",
        f"invoke-static {{{v_click}}}, {OURS}->onClick(Ljava/lang/Class;)Ljava/lang/Object;",
        f"move-result-object {v_click}",
        f"check-cast {v_click}, {on_click}",
        f"move-object {v_long}, {v_click}",
        lines[at].strip(),
    ]
    lines[at + 1:at + 1] = [indent + l if l else l for l in add]
    hits[0].write_text("\n".join(lines), encoding="utf-8", newline="\n")
    print(f"cluster button hooked after the sound button ({hits[0].name}, {m.group(4)})")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main(sys.argv[1]))
    except AssertionError as e:
        print(f"cluster button not hooked: {e}")
        sys.exit(1)
