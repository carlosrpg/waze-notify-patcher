"""Assemble the patched APK: rebuilt dex from apktool, everything else from the original.

Usage: python -I assemble.py <original.apk> <apktool-build.apk> <notifier.dex> <out.apk> [new.package.id]
apktool's rebuild can corrupt resources on Windows (names colliding by case), so only its classes*.dex are taken;
res/, lib/, resources.arsc and the manifest are copied byte-for-byte from the original. The notifier is appended
as the next classesN+1.dex. Works for any dex count (this build has 10). With a package id, the manifest and the
resource table are given that application id (tools/rename_package.py) so the result installs next to Waze.
"""
import pathlib
import sys
import zipfile

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))   # run with python -I, which leaves it out
from rename_package import rename_manifest, rename_table


def main(original, built, notifier_dex, out, package=None):
    with zipfile.ZipFile(built) as b:
        dex = {n: b.read(n) for n in b.namelist() if n.startswith("classes") and n.endswith(".dex")}
    assert dex, "apktool build produced no dex"
    renamed = {}
    with zipfile.ZipFile(original) as src:
        if package:
            manifest, old, n = rename_manifest(src.read("AndroidManifest.xml"), package)
            renamed = {"AndroidManifest.xml": manifest,
                       "resources.arsc": rename_table(src.read("resources.arsc"), old, package)}
            print(f"application id {old} -> {package} ({n} manifest attributes)")
        names = src.namelist()
        count = sum(1 for n in names if n.startswith("classes") and n.endswith(".dex"))
        # dex the rebuild has beyond the original's (e.g. classes ported in from another build), kept in order
        extra = sorted((n for n in dex if n not in names), key=lambda n: int(n[7:-4] or 1))
        assert [int(n[7:-4]) for n in extra] == list(range(count + 1, count + 1 + len(extra))), f"gap in dex numbering: {extra}"
        next_dex = f"classes{count + len(extra) + 1}.dex"
        assert next_dex not in names, f"{next_dex} already present"
        with zipfile.ZipFile(out, "w") as dst:
            for info in src.infolist():
                data = renamed.get(info.filename) or dex.get(info.filename) or src.read(info)
                dst.writestr(info, data, compress_type=info.compress_type)
            for n in extra:
                dst.writestr(n, dex[n], compress_type=zipfile.ZIP_STORED)
            dst.write(notifier_dex, next_dex, compress_type=zipfile.ZIP_STORED)
    print(f"assembled: {len(dex)} rebuilt dex ({len(extra)} new), notifier as {next_dex}, resources/libs from original")
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:6]))
