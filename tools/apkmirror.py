"""Download the latest stable Waze for the car from APKMirror and make it one installable APK.

Usage: python -I apkmirror.py <out-dir>
Writes <out-dir>/waze-<version>.apk (splits merged by merge_splits.py, unsigned) and prints the version last.

Picks the newest release that is not a beta/alpha, then its variant for arm64-v8a with a minimum Android the car
(Android 11) meets, preferring a bundle (APKM: base + config splits) over a plain APK, and follows the variant page
to the download.
"""
import pathlib
import re
import shutil
import subprocess
import sys
import urllib.request
import zipfile

BASE = "https://www.apkmirror.com"
APP = "/apk/waze/waze-gps-maps-traffic-alerts-live-navigation/"
CAR_ANDROID = 11
DENSITIES = ["ldpi", "mdpi", "tvdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi"]
UA = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"


def get(path, referer=BASE + "/"):
    req = urllib.request.Request(path if path.startswith("http") else BASE + path,
                                 headers={"User-Agent": UA, "Referer": referer, "Accept-Language": "en"})
    with urllib.request.urlopen(req, timeout=120) as r:
        return r.read(), r.geturl()


def text(html):
    return " ".join(re.sub(r"<[^>]+>", " ", html).split())


def latest_release():
    html = get(APP)[0].decode()
    for title, href in re.findall(r'<h5 title="([^"]+)"[^>]*>.*?class="fontBlack" href="([^"]+-release/)"', html, re.S):
        if not re.search(r"\b(beta|alpha)\b", title, re.I):
            return re.search(r"\d+(?:\.\d+)+", title).group(0), href
    raise SystemExit("no stable release on the APKMirror listing")


def variant(release_href):
    html = get(release_href)[0].decode()
    best = None
    for row in re.split(r'<div class="table-row headerFont">', html)[2:]:
        cells = re.findall(r'<div class="table-cell[^"]*">(.*?)</div>', row, re.S)
        link = re.search(r'href="([^"#]+-android-apk-download/)"', row)
        if len(cells) < 4 or not link:
            continue
        arch, min_android = text(cells[1]), re.search(r"Android (\d+)", text(cells[2]))
        if "arm64-v8a" not in arch or not min_android or int(min_android.group(1)) > CAR_ANDROID:
            continue
        rank = ("BUNDLE" in row, arch == "arm64-v8a")   # bundle first, then the arm64-only build
        if best is None or rank > best[0]:
            best = (rank, link.group(1), "BUNDLE" in row)
    if not best:
        raise SystemExit(f"no arm64-v8a variant for Android {CAR_ANDROID} in {release_href}")
    return best[1], best[2]


def download(variant_href, dest):
    html = get(variant_href)[0].decode()
    key_page = re.search(r'href="([^"]+/download/\?key=[^"]+)"', html).group(1).replace("&amp;", "&")
    html = get(key_page, BASE + variant_href)[0].decode()
    final = re.search(r'href="([^"]*download\.php\?[^"]+)"', html).group(1).replace("&amp;", "&")
    data, _ = get(final, BASE + key_page)
    assert data[:2] == b"PK", "download is not a zip (APKMirror answered with a page?)"
    dest.write_bytes(data)


def main(out_dir):
    out = pathlib.Path(out_dir)
    out.mkdir(parents=True, exist_ok=True)
    version, release = latest_release()
    href, bundle = variant(release)
    print(f"Waze {version}: {BASE}{href} ({'bundle' if bundle else 'apk'})")
    apk = out / f"waze-{version}.apk"
    if not bundle:
        download(href, apk)
    else:
        apkm = out / f"waze-{version}.apkm"
        download(href, apkm)
        parts = out / "splits"
        shutil.rmtree(parts, ignore_errors=True)
        with zipfile.ZipFile(apkm) as z:
            names = [n for n in z.namelist() if n.endswith(".apk")]
            z.extractall(parts, names)
        # one density split only: they reuse the same (obfuscated) file names; the lowest is the car's closest
        dpis = [d for d in DENSITIES if f"split_config.{d}.apk" in names]
        drop = {f"split_config.{d}.apk" for d in dpis[1:]}
        splits = sorted(str(parts / n) for n in names if n != "base.apk" and n not in drop)
        subprocess.run([sys.executable, "-I", str(pathlib.Path(__file__).with_name("merge_splits.py")),
                        str(parts / "base.apk"), str(apk), *splits], check=True)
    print(version)


if __name__ == "__main__":
    main(sys.argv[1])
