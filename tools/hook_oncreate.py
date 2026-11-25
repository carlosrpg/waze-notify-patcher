"""Insert NavNotifier.install(Application) as the first instruction of Application.onCreate.

Usage: python -I hook_oncreate.py <Application.smali>

p0 is the Application, so it runs before Waze's own start-up; fails if onCreate()V is absent so a wrong app class
cannot pass silently. Idempotent.
"""
import pathlib
import re
import sys

HOOKS = {
    "oncreate": (r"onCreate\(\)V",
                 "invoke-static {p0}, Lcom/carlosrpg/wazenotify/NavNotifier;->install(Landroid/app/Application;)V"),
}


def main(smali, kind="oncreate"):
    method, call = HOOKS[kind]
    p = pathlib.Path(smali)
    text = p.read_text(encoding="utf-8")
    if call in text:
        print(f"{kind} already hooked")
        return 0
    m = re.search(r"^\.method (?:public |protected )?(?:final )?" + method + r"\s*$", text, re.M)
    assert m, f"{method} not found in {smali}"
    pos = text.index("\n", text.index(".locals", m.end())) + 1
    while True:  # method annotations/params must stay before the first instruction
        if not re.match(r"\s*\.(annotation|param)\b", text[pos:]):
            break
        pos = text.index("\n", text.index(".end annotation", pos)) + 1
    p.write_text(text[:pos] + "\n    " + call + "\n" + text[pos:], encoding="utf-8")
    print(f"{kind} hooked")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1]))
