"""Insert the NavNotifier.install call as the first instruction of an Application.onCreate smali method.

Usage: python -I hook_oncreate.py <Application.smali>
p0 is the Application at the top of onCreate, so the hook runs before Waze's own start-up. Idempotent; fails if
onCreate()V is absent so a wrong app class cannot pass silently. Shared by patch.sh and patch.ps1.
"""
import pathlib
import re
import sys

HOOK = "\n    invoke-static {p0}, Lcom/carlosrpg/wazenotify/NavNotifier;->install(Landroid/app/Application;)V\n"


def main(smali):
    p = pathlib.Path(smali)
    text = p.read_text(encoding="utf-8")
    if "Lcom/carlosrpg/wazenotify/NavNotifier;->install" in text:
        print("onCreate already hooked")
        return 0
    m = re.search(r"^\.method public (?:final )?onCreate\(\)V\s*$", text, re.M)
    assert m, f"onCreate()V not found in {smali}"
    pos = text.index("\n", text.index(".locals", m.end())) + 1
    while True:  # method annotations/params must stay before the first instruction
        if not re.match(r"\s*\.(annotation|param)\b", text[pos:]):
            break
        pos = text.index("\n", text.index(".end annotation", pos)) + 1
    p.write_text(text[:pos] + HOOK + text[pos:], encoding="utf-8")
    print("onCreate hooked")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1]))
