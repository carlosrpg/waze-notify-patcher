#!/usr/bin/env bash
# Add the turn-by-turn notification (NavNotifier) to any Waze APK and sign it, for the car / QuickSettings.
# Works across Waze versions: it derives Waze's obfuscated names from the APK (tools/derive.py) instead of
# hardcoding them. Handles a single universal APK (one .apk with lib/ + res/ + all dex).
#
# Usage:  bash patch.sh <input.apk> [output.apk]
# Output: <output.apk> (default: <input>-notify.apk next to the input), signed with waze-patch.keystore.
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
SDK="$LOCALAPPDATA/Android/Sdk"
BT="$SDK/build-tools/36.0.0"
ANDROID_JAR="$SDK/platforms/android-36/android.jar"
JDK="/c/Program Files/Microsoft/jdk-17.0.14.7-hotspot"
APKTOOL=/c/repos/jconfig-rea2/tools/apktool_3.0.3.jar
KEYSTORE="$HERE/waze-patch.keystore"
KS_PASS=wazepatch
KS_ALIAS=wazepatch

IN=$(cd "$(dirname "$1")" && pwd)/$(basename "$1")
OUT="${2:-${IN%.apk}-notify.apk}"
WORK="$HERE/work/$(basename "${IN%.apk}")"

export PATH="$JDK/bin:$PATH"
w() { cygpath -w "$1"; }
test -f "$IN" || { echo "no such apk: $IN"; exit 1; }

echo "== 1. self-check the text rules (version-independent)"
rm -rf "$WORK"; mkdir -p "$WORK/test" "$WORK/classes" "$WORK/dex" "$HERE/gen"
javac --release 8 -encoding UTF-8 -d "$(w "$WORK/test")" "$(w "$HERE/src/com/carlosrpg/wazenotify/NavText.java")" "$(w "$HERE/test/NavTextCheck.java")"
java -cp "$(w "$WORK/test")" com.carlosrpg.wazenotify.NavTextCheck

echo "== 2. decode the apk"
java -jar "$APKTOOL" d -r -f -o "$(w "$WORK/base")" "$(w "$IN")"

echo "== 3. find the Application class from the manifest"
APP_CLASS=$("$BT/aapt2.exe" dump xmltree --file AndroidManifest.xml "$(w "$IN")" 2>/dev/null \
  | awk '/E: application/{a=1} a && /A: http:\/\/schemas.android.com\/apk\/res\/android:name/{print; exit}' \
  | grep -oE '"[^"]+"' | head -1 | tr -d '"')
test -n "$APP_CLASS" || { echo "could not read application android:name"; exit 1; }
APP_SMALI=$(ls "$WORK"/base/smali*/"$(echo "$APP_CLASS" | tr . /)".smali)
echo "   application: $APP_CLASS"

echo "== 4. derive Waze's obfuscated names for this apk -> NavMap.java"
python -I "$HERE/tools/derive.py" "$(w "$WORK/base")" "$(w "$HERE/gen/NavMap.java")"

echo "== 5. compile the notifier (reflection-based; compiles against android.jar only) and dex it"
javac --release 8 -encoding UTF-8 -nowarn -cp "$(w "$ANDROID_JAR")" -d "$(w "$WORK/classes")" \
  "$(w "$HERE/src/com/carlosrpg/wazenotify/NavText.java")" \
  "$(w "$HERE/src/com/carlosrpg/wazenotify/NavNotifier.java")" \
  "$(w "$HERE/gen/NavMap.java")"
CLS=(); while IFS= read -r c; do CLS+=("$(w "$c")"); done < <(find "$WORK/classes" -name '*.class')
MIN=$("$BT/aapt2.exe" dump badging "$(w "$IN")" 2>/dev/null | sed -nE "s/.*sdkVersion:'([0-9]+)'.*/\1/p" | head -1)
"$BT/d8.bat" --release --min-api "${MIN:-29}" --lib "$(w "$ANDROID_JAR")" --output "$(w "$WORK/dex")" "${CLS[@]}"

echo "== 6. hook the Application's onCreate (first instruction)"
python -I "$HERE/tools/hook_oncreate.py" "$(w "$APP_SMALI")"

echo "== 7. rebuild and assemble (resources/libs/manifest from the original, dex from the rebuild + notifier)"
rm -f "$WORK/apktool.apk" "$WORK/unsigned.apk" "$WORK/aligned.apk"
java -jar "$APKTOOL" b -f -o "$(w "$WORK/apktool.apk")" "$(w "$WORK/base")"
python -I "$HERE/tools/assemble.py" "$(w "$IN")" "$(w "$WORK/apktool.apk")" "$(w "$WORK/dex/classes.dex")" "$(w "$WORK/unsigned.apk")"
"$BT/zipalign.exe" -P 16 -f 4 "$(w "$WORK/unsigned.apk")" "$(w "$WORK/aligned.apk")"

echo "== 8. sign"
if [ ! -f "$KEYSTORE" ]; then
  keytool -genkeypair -keystore "$(w "$KEYSTORE")" -storepass "$KS_PASS" -keypass "$KS_PASS" -alias "$KS_ALIAS" \
    -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Waze notify patch (personal sideload)"
fi
"$BT/apksigner.bat" sign --ks "$(w "$KEYSTORE")" --ks-pass "pass:$KS_PASS" --ks-key-alias "$KS_ALIAS" \
  --in "$(w "$WORK/aligned.apk")" --out "$(w "$OUT")"
rm -f "$OUT.idsig"

echo "== 9. verify"
"$BT/apksigner.bat" verify "$(w "$OUT")" >/dev/null && echo "signature ok"
python -I "$HERE/tools/verify.py" "$(w "$OUT")" "$(w "$IN")"
echo "Done: $OUT"
