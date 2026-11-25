#!/usr/bin/env bash
# Patch a Waze APK for the car: our turn-by-turn notification (NavNotifier) and cluster turn box (ClusterLayout),
# optionally on top of the JConfig build's cluster patches ported onto this Waze, under its own application id.
# Works across Waze versions: it derives Waze's obfuscated names from the APK (tools/derive.py) instead of
# hardcoding them. Takes a single universal APK (one .apk with lib/ + res/ + all dex; tools/merge_splits.py makes
# one from a bundle). Runs in Git Bash on Windows and in bash on Linux (CI).
#
# Usage:  [JCONFIG=<dir|apk>] [PACKAGE=<app id>] bash patch.sh <input.apk> [output.apk]
#   JCONFIG  the JConfig cluster patches to port onto <input.apk> first (tools/port_jconfig.py): phone UI on
#            Android Automotive, cluster ETA box, alerts, car position. Default: the classes kept in jconfig/
#            (from JConfig's 5.23.0.2 build); a JConfig build's .apk also works. JCONFIG= builds without them
#            (notification and turn box only).
#   PACKAGE  application id of the result (default com.carlosrpg.waze, so it installs next to a normal Waze);
#            PACKAGE= keeps com.waze.
# Tools: ANDROID_HOME (else %LOCALAPPDATA%/Android/Sdk), JAVA_HOME (JDK 17+), APKTOOL (apktool 3.x jar).
# Signing: KEYSTORE, KS_PASS, KS_ALIAS, KEY_PASS; unset ones come from signing.properties next to this script
# (gitignored: storeFile, storePassword, keyAlias, keyPassword), else waze-patch.keystore (created on first run).
# Output: <output.apk> (default: <input>-notify.apk next to the input).
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
SDK="${ANDROID_HOME:-${LOCALAPPDATA:-}/Android/Sdk}"
BT="${BUILD_TOOLS:-$(ls -d "$SDK"/build-tools/* | sort -V | tail -1)}"
ANDROID_JAR="${ANDROID_JAR:-$(ls -d "$SDK"/platforms/android-*/android.jar | sort -V | tail -1)}"
APKTOOL="${APKTOOL:-/c/repos/jconfig-rea2/tools/apktool_3.0.3.jar}"
prop() { [ -f "$HERE/signing.properties" ] && sed -n "s/^$1=//p" "$HERE/signing.properties" | tr -d '\r' || true; }
SF=$(prop storeFile)
KEYSTORE="${KEYSTORE:-${SF:+$HERE/$SF}}"; KEYSTORE="${KEYSTORE:-$HERE/waze-patch.keystore}"
KS_PASS="${KS_PASS:-$(prop storePassword)}"; KS_PASS="${KS_PASS:-wazepatch}"
KS_ALIAS="${KS_ALIAS:-$(prop keyAlias)}"; KS_ALIAS="${KS_ALIAS:-wazepatch}"
KEY_PASS="${KEY_PASS:-$(prop keyPassword)}"; KEY_PASS="${KEY_PASS:-$KS_PASS}"
JCONFIG="${JCONFIG-$HERE/jconfig}"
PACKAGE="${PACKAGE-com.carlosrpg.waze}"
PY="${PYTHON:-python}"

MS_JDK="/c/Program Files/Microsoft/jdk-17.0.14.7-hotspot"
if [ -n "${JAVA_HOME:-}" ]; then export PATH="$JAVA_HOME/bin:$PATH"; elif [ -d "$MS_JDK" ]; then export PATH="$MS_JDK/bin:$PATH"; fi
if [ -f "$BT/aapt2.exe" ]; then EXE=.exe; BAT=.bat; else EXE=; BAT=; fi
w() { if command -v cygpath >/dev/null; then cygpath -w "$1"; else echo "$1"; fi; }

IN=$(cd "$(dirname "$1")" && pwd)/$(basename "$1")
OUT="${2:-${IN%.apk}-notify.apk}"
WORK="$HERE/work/$(basename "${IN%.apk}")"
test -f "$IN" || { echo "no such apk: $IN"; exit 1; }
test -f "$APKTOOL" || { echo "apktool jar not found: $APKTOOL (set APKTOOL)"; exit 1; }

echo "== 1. self-check the text rules (version-independent)"
rm -rf "$WORK"; mkdir -p "$WORK/test" "$WORK/classes" "$WORK/dex" "$HERE/gen"
javac --release 8 -encoding UTF-8 -d "$(w "$WORK/test")" "$(w "$HERE/src/com/carlosrpg/wazenotify/NavText.java")" \
  "$(w "$HERE/src/com/carlosrpg/wazenotify/UpdateTag.java")" "$(w "$HERE/test/NavTextCheck.java")"
java -cp "$(w "$WORK/test")" com.carlosrpg.wazenotify.NavTextCheck

echo "== 2. decode the apk"
java -jar "$(w "$APKTOOL")" d -r -f -o "$(w "$WORK/base")" "$(w "$IN")"

if [ -n "${JCONFIG:-}" ]; then
  echo "== 2b. port the JConfig build's patches onto this Waze"
  JC=$(cd "$(dirname "$JCONFIG")" && pwd)/$(basename "$JCONFIG")
  JC_DIR="$JC"
  if [ -f "$JC" ]; then
    JC_DIR="$HERE/work/jconfig-src/$(basename "${JC%.apk}")"
    [ -d "$JC_DIR" ] || java -jar "$(w "$APKTOOL")" d -r -f -o "$(w "$JC_DIR")" "$(w "$JC")"
  fi
  "$PY" -I "$HERE/tools/port_jconfig.py" "$(w "$JC_DIR")" "$(w "$WORK/base")"
fi

echo "== 3. find the Application class from the manifest"
APP_CLASS=$("$BT/aapt2$EXE" dump xmltree --file AndroidManifest.xml "$(w "$IN")" 2>/dev/null \
  | awk '/E: application/{a=1} a && /A: http:\/\/schemas.android.com\/apk\/res\/android:name/{print; exit}' \
  | grep -oE '"[^"]+"' | head -1 | tr -d '"')
test -n "$APP_CLASS" || { echo "could not read application android:name"; exit 1; }
APP_SMALI=$(ls "$WORK"/base/smali*/"$(echo "$APP_CLASS" | tr . /)".smali)
echo "   application: $APP_CLASS"

echo "== 4. derive Waze's obfuscated names for this apk -> NavMap.java"
"$PY" -I "$HERE/tools/derive.py" "$(w "$WORK/base")" "$(w "$HERE/gen/NavMap.java")"

echo "== 5. compile the notifier (reflection-based; compiles against android.jar only) and dex it"
# BUILD_NUMBER: the CI run number a release is tagged with; 0 (a local build) never asks for updates.
echo "package com.carlosrpg.wazenotify; final class BuildInfo { static final int BUILD = $((${BUILD_NUMBER:-0})); }" > "$HERE/gen/BuildInfo.java"
SRC=(); for f in "$HERE"/src/com/carlosrpg/wazenotify/*.java "$HERE"/gen/*.java; do SRC+=("$(w "$f")"); done
javac --release 8 -encoding UTF-8 -nowarn -cp "$(w "$ANDROID_JAR")" -d "$(w "$WORK/classes")" "${SRC[@]}"
CLS=(); while IFS= read -r c; do CLS+=("$(w "$c")"); done < <(find "$WORK/classes" -name '*.class')
MIN=$("$BT/aapt2$EXE" dump badging "$(w "$IN")" 2>/dev/null | sed -nE "s/.*sdkVersion:'([0-9]+)'.*/\1/p" | head -1)
"$BT/d8$BAT" --release --min-api "${MIN:-29}" --lib "$(w "$ANDROID_JAR")" --output "$(w "$WORK/dex")" "${CLS[@]}"

echo "== 6. hook the Application's onCreate (first instruction)"
"$PY" -I "$HERE/tools/hook_oncreate.py" "$(w "$APP_SMALI")"

echo "== 6c. add the cluster toggle to Waze's map-button column"
# Optional: a Waze that changed its button code or dropped the icon is still built, without the button
# (::warning:: shows on the CI run).
if ! "$BT/aapt2$EXE" dump resources "$(w "$IN")" 2>/dev/null | grep -q "drawable/ic_open_in_new"; then
  echo "::warning::no cluster button: this Waze has no ic_open_in_new drawable (ClusterButton.ICON)"
elif ! "$PY" -I "$HERE/tools/hook_cluster_button.py" "$(w "$WORK/base")"; then
  echo "::warning::no cluster button: Waze's sound button code changed (tools/hook_cluster_button.py)"
fi

echo "== 7. rebuild and assemble (resources/libs/manifest from the original, dex from the rebuild + notifier)"
rm -f "$WORK/apktool.apk" "$WORK/unsigned.apk" "$WORK/aligned.apk"
java -jar "$(w "$APKTOOL")" b -f -o "$(w "$WORK/apktool.apk")" "$(w "$WORK/base")"
"$PY" -I "$HERE/tools/assemble.py" "$(w "$IN")" "$(w "$WORK/apktool.apk")" "$(w "$WORK/dex/classes.dex")" \
  "$(w "$WORK/unsigned.apk")" $PACKAGE
"$BT/zipalign$EXE" -P 16 -f 4 "$(w "$WORK/unsigned.apk")" "$(w "$WORK/aligned.apk")"

echo "== 8. sign"
if [ ! -f "$KEYSTORE" ]; then
  keytool -genkeypair -keystore "$(w "$KEYSTORE")" -storepass "$KS_PASS" -keypass "$KS_PASS" -alias "$KS_ALIAS" \
    -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Waze notify patch (personal sideload)"
fi
"$BT/apksigner$BAT" sign --ks "$(w "$KEYSTORE")" --ks-pass "pass:$KS_PASS" --ks-key-alias "$KS_ALIAS" --key-pass "pass:$KEY_PASS" \
  --in "$(w "$WORK/aligned.apk")" --out "$(w "$OUT")"
rm -f "$OUT.idsig"

echo "== 9. verify"
"$BT/apksigner$BAT" verify "$(w "$OUT")" >/dev/null && echo "signature ok"
"$PY" -I "$HERE/tools/verify.py" "$(w "$OUT")" "$(w "$IN")" $PACKAGE
"$BT/aapt2$EXE" dump permissions "$(w "$OUT")" | grep -q "REQUEST_INSTALL_PACKAGES" \
  || { echo "FAIL the install permission is not in the manifest"; exit 1; }
if [ -n "$PACKAGE" ]; then
  "$BT/aapt2$EXE" dump badging "$(w "$OUT")" 2>/dev/null | grep -q "^package: name='$PACKAGE'" \
    || { echo "FAIL application id is not $PACKAGE"; exit 1; }
  echo "application id $PACKAGE"
fi
echo "Done: $OUT"
