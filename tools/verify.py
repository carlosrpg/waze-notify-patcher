"""Check the patched APK: notifier present, hook wired, nothing but dex changed.

Usage: python -I verify.py <out.apk> <original.apk>
"""
import re
import sys
import zipfile


def dex_index(n):
    mid = n[len("classes"):-len(".dex")]
    return int(mid) if mid else 1


def is_signing(n):
    # v1 signature files and Google's source stamp; re-signing legitimately rewrites these.
    return n == "stamp-cert-sha256" or bool(re.fullmatch(r"META-INF/(MANIFEST\.MF|[^/]+\.(SF|RSA|DSA|EC))", n))


def main(out, original):
    with zipfile.ZipFile(out) as z, zipfile.ZipFile(original) as o:
        dexes = sorted((n for n in z.namelist() if n.startswith("classes") and n.endswith(".dex")), key=dex_index)
        notifier = z.read(dexes[-1])
        missing = {n for n in set(o.namelist()) - set(z.namelist()) if not is_signing(n)}
        kept = set(z.namelist())
        changed = [n for n in o.namelist()
                   if n in kept and not n.endswith(".dex") and not is_signing(n) and z.read(n) != o.read(n)]
        hooked = any(b"Lcom/carlosrpg/wazenotify/NavNotifier;" in z.read(n) for n in dexes[:-1])
    problems = []
    if missing:
        problems.append(f"entries lost: {sorted(missing)[:5]}")
    if changed:
        problems.append(f"non-dex entries changed: {changed[:5]}")
    if b"Lcom/carlosrpg/wazenotify/NavNotifier;" not in notifier:
        problems.append(f"notifier class not in {dexes[-1]}")
    if not hooked:
        problems.append("Application onCreate hook not found in any original dex")
    for p in problems:
        print("FAIL", p)
    if problems:
        return 1
    print("verify ok: notifier added, onCreate hooked, resources/libs untouched")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1], sys.argv[2]))
