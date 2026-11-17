"""Assemble the patched APK: rebuilt dex from apktool, everything else from the original.

Usage: python -I assemble.py <original.apk> <apktool-build.apk> <notifier.dex> <out.apk>
apktool's rebuild can corrupt resources on Windows (names colliding by case), so only its classes*.dex are taken;
res/, lib/, resources.arsc and the manifest are copied byte-for-byte from the original. The notifier is appended
as the next classesN+1.dex. Works for any dex count (this build has 10).
"""
import pathlib
import sys
import zipfile


def main(original, built, notifier_dex, out):
    with zipfile.ZipFile(built) as b:
        dex = {n: b.read(n) for n in b.namelist() if n.startswith("classes") and n.endswith(".dex")}
    assert dex, "apktool build produced no dex"
    with zipfile.ZipFile(original) as src:
        names = src.namelist()
        count = sum(1 for n in names if n.startswith("classes") and n.endswith(".dex"))
        next_dex = f"classes{count + 1}.dex"
        assert next_dex not in names, f"{next_dex} already present"
        with zipfile.ZipFile(out, "w") as dst:
            for info in src.infolist():
                data = dex.get(info.filename, src.read(info))
                dst.writestr(info, data, compress_type=info.compress_type)
            dst.write(notifier_dex, next_dex, compress_type=zipfile.ZIP_STORED)
    print(f"assembled: {len(dex)} rebuilt dex, notifier as {next_dex}, resources/libs from original")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4]))
