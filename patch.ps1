<#
.SYNOPSIS
Add the turn-by-turn notification (NavNotifier) to any Waze APK and sign it, for the car / QuickSettings.

.DESCRIPTION
PowerShell equivalent of patch.sh (no Git Bash needed). Works across Waze versions: it derives Waze's obfuscated
names from the APK (tools\derive.py) instead of hardcoding them, and registers at runtime by reflection + a
dynamic proxy. Handles a single universal APK (one .apk with lib\ + res\ + all dex).

.PARAMETER InputApk
The Waze APK to patch.

.PARAMETER OutputApk
Output path. Default: <input>-notify.apk next to the input.

.EXAMPLE
pwsh -File patch.ps1 waze.apk
#>
param(
    [Parameter(Mandatory = $true)][string]$InputApk,
    [string]$OutputApk
)
$ErrorActionPreference = 'Stop'

$HERE = Split-Path -Parent $MyInvocation.MyCommand.Path
$SDK = "$env:LOCALAPPDATA\Android\Sdk"
$BT = "$SDK\build-tools\36.0.0"
$ANDROID_JAR = "$SDK\platforms\android-36\android.jar"
$JDK = "C:\Program Files\Microsoft\jdk-17.0.14.7-hotspot"
$APKTOOL = "C:\repos\jconfig-rea2\tools\apktool_3.0.3.jar"
$KEYSTORE = "$HERE\waze-patch.keystore"
$KS_PASS = 'wazepatch'
$KS_ALIAS = 'wazepatch'
$javac = "$JDK\bin\javac.exe"
$java = "$JDK\bin\java.exe"
$keytool = "$JDK\bin\keytool.exe"
$aapt2 = "$BT\aapt2.exe"

# Run a native tool; $A is one array so PowerShell never treats --flags as parameters of this function.
function Run([string]$Exe, [string[]]$A) {
    & $Exe @A
    if ($LASTEXITCODE -ne 0) { throw "$(Split-Path -Leaf $Exe) exited $LASTEXITCODE" }
}

$IN = (Resolve-Path -LiteralPath $InputApk).Path
if (-not $OutputApk) { $OutputApk = [regex]::Replace($IN, '\.apk$', '-notify.apk') }
$name = [IO.Path]::GetFileNameWithoutExtension($IN)
$WORK = "$HERE\work\$name"
$gen = "$HERE\gen"

Write-Host "== 1. self-check the text rules (version-independent)"
Remove-Item -Recurse -Force $WORK -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path "$WORK\test", "$WORK\classes", "$WORK\dex", $gen | Out-Null
Run $javac @('--release', '8', '-encoding', 'UTF-8', '-d', "$WORK\test",
    "$HERE\src\com\carlosrpg\wazenotify\NavText.java", "$HERE\test\NavTextCheck.java")
Run $java @('-cp', "$WORK\test", 'com.carlosrpg.wazenotify.NavTextCheck')

Write-Host "== 2. decode the apk"
Run $java @('-jar', $APKTOOL, 'd', '-r', '-f', '-o', "$WORK\base", $IN)

Write-Host "== 3. find the Application class from the manifest"
$xml = & $aapt2 dump xmltree --file AndroidManifest.xml $IN 2>$null
$inApp = $false; $AppClass = $null
foreach ($line in $xml) {
    if ($line -match 'E: application') { $inApp = $true }
    elseif ($inApp -and $line -match 'android:name\([^)]*\)="([^"]+)"') { $AppClass = $Matches[1]; break }
}
if (-not $AppClass) { throw "could not read application android:name" }
$relPath = ($AppClass -replace '\.', '\') + '.smali'
$AppSmali = Get-ChildItem -Path "$WORK\base" -Directory -Filter 'smali*' |
    ForEach-Object { Join-Path $_.FullName $relPath } | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
if (-not $AppSmali) { throw "smali for $AppClass not found" }
Write-Host "   application: $AppClass"

Write-Host "== 4. derive Waze's obfuscated names for this apk -> NavMap.java"
Run python @('-I', "$HERE\tools\derive.py", "$WORK\base", "$gen\NavMap.java")

Write-Host "== 5. compile the notifier (against android.jar only) and dex it"
Run $javac @('--release', '8', '-encoding', 'UTF-8', '-nowarn', '-cp', $ANDROID_JAR, '-d', "$WORK\classes",
    "$HERE\src\com\carlosrpg\wazenotify\NavText.java",
    "$HERE\src\com\carlosrpg\wazenotify\NavNotifier.java",
    "$gen\NavMap.java")
$classes = Get-ChildItem -Path "$WORK\classes" -Recurse -Filter *.class | ForEach-Object { $_.FullName }
# -join to a single string so -match populates $Matches (it does not when the operand is an array).
$badging = (& $aapt2 dump badging $IN 2>$null) -join "`n"
$MIN = if ($badging -match "sdkVersion:'(\d+)'") { $Matches[1] } else { '29' }
Run "$BT\d8.bat" (@('--release', '--min-api', $MIN, '--lib', $ANDROID_JAR, '--output', "$WORK\dex") + $classes)

Write-Host "== 6. hook the Application's onCreate (first instruction)"
Run python @('-I', "$HERE\tools\hook_oncreate.py", $AppSmali)

Write-Host "== 7. rebuild and assemble (resources/libs/manifest from the original, dex from the rebuild + notifier)"
Remove-Item -Force "$WORK\apktool.apk", "$WORK\unsigned.apk", "$WORK\aligned.apk" -ErrorAction SilentlyContinue
Run $java @('-jar', $APKTOOL, 'b', '-f', '-o', "$WORK\apktool.apk", "$WORK\base")
Run python @('-I', "$HERE\tools\assemble.py", $IN, "$WORK\apktool.apk", "$WORK\dex\classes.dex", "$WORK\unsigned.apk")
Run "$BT\zipalign.exe" @('-P', '16', '-f', '4', "$WORK\unsigned.apk", "$WORK\aligned.apk")

Write-Host "== 8. sign"
if (-not (Test-Path -LiteralPath $KEYSTORE)) {
    Run $keytool @('-genkeypair', '-keystore', $KEYSTORE, '-storepass', $KS_PASS, '-keypass', $KS_PASS,
        '-alias', $KS_ALIAS, '-keyalg', 'RSA', '-keysize', '2048', '-validity', '10000',
        '-dname', 'CN=Waze notify patch (personal sideload)')
}
Run "$BT\apksigner.bat" @('sign', '--ks', $KEYSTORE, '--ks-pass', "pass:$KS_PASS", '--ks-key-alias', $KS_ALIAS,
    '--in', "$WORK\aligned.apk", '--out', $OutputApk)
Remove-Item -Force "$OutputApk.idsig" -ErrorAction SilentlyContinue

Write-Host "== 9. verify"
Run "$BT\apksigner.bat" @('verify', $OutputApk)
Run python @('-I', "$HERE\tools\verify.py", $OutputApk, $IN)
Write-Host "Done: $OutputApk"
