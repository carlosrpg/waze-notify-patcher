# Waze notification patcher

Adds a standard turn-by-turn **navigation notification** to a Waze APK, so a notification listener (the
QuickSettings drawer) can read directions on the car. Stock Waze, run as a normal app (no Android Auto session),
posts no directions in a notification — only "Waze — Running. Tap to open." This patch posts, during navigation:
the distance to the next turn as the title, the road as the text ("Exit 2 · Av. Paulista" at roundabouts), the
ETA and remaining distance as the sub-text, and Waze's own manoeuvre arrow as the large icon (category
`navigation`, ongoing, ≤ 1 update/second).

It is built to survive Waze updates: nothing about Waze's obfuscated names is hardcoded. `tools/derive.py`
reads each APK and writes the few names that move; the runtime registers by **reflection + a dynamic proxy**, so
the notifier never has to be compiled against Waze's version-specific types.

## Use

Git Bash on Windows, or bash on Linux:

```bash
bash patch.sh waze.apk [out.apk]             # the car build
JCONFIG= bash patch.sh waze.apk [out.apk]    # notification + turn box only
```

- The input is a single **universal** APK (one file with `lib/`, `res/` and all dex). `tools/merge_splits.py`
  makes one from a bundle; `tools/apkmirror.py <dir>` downloads the latest stable Waze from APKMirror (the arm64
  bundle that runs on Android 11) and merges it.
- `tools/port_jconfig.py` ports JConfig's cluster patches onto the input: the phone UI on Android Automotive
  (stock Waze hangs on "Signing in..." there), the cluster ETA box, alert overlay and car position. Their classes
  are kept in `jconfig/` (from JConfig's build of Waze 5.23.0.2, with that Waze's Alerter data class for the getter
  remapping). The hooks are found by stable names (JNI methods, Compose trace strings, structure), so the newer
  Waze needs no per-version edits. `JCONFIG=<dir or JConfig .apk>` uses another JConfig build.
- `PACKAGE` sets the application id, default `com.carlosrpg.waze`, so the result installs next to a normal Waze
  (`PACKAGE=` keeps `com.waze`). Class names stay `com.waze.*`; see `tools/rename_package.py`.
- Output: `<input>-notify.apk` next to the input by default. Signed with the key named in `signing.properties`
  (gitignored: `storeFile`, `storePassword`, `keyAlias`, `keyPassword`; the same key as the other car apps), or
  `KEYSTORE`/`KS_PASS`/`KS_ALIAS`/`KEY_PASS`; without either, `waze-patch.keystore` (created on first run). Keep
  the key: later builds must use it to install over each other. Install it on the car with a file manager, then grant notification access to QuickSettings over
  adb (see the QuickSettings README).

Requirements: JDK 17+, the Android SDK (build-tools and a platform; `ANDROID_HOME`), apktool 3.x (`APKTOOL`, the
jar), Python 3.

### CI

`.github/workflows/build.yml` downloads the latest Waze from APKMirror, patches it and uploads the APK: as a
workflow artifact on pull requests, and as a GitHub release on `main`. Signing comes from the repository secrets
`RELEASE_KEYSTORE_BASE64`, `RELEASE_STORE_PASSWORD`, `RELEASE_KEY_ALIAS` and `RELEASE_KEY_PASSWORD` (required on
`main`; a pull request without them signs with a throwaway key).

## What it changes

1. Compiles `NavText` + `NavNotifier` + `ClusterLayout` + `JconfigBridge` + a generated `NavMap` to one dex,
   added after the last `classesN.dex`.
2. Inserts one instruction at the top of the app's `Application.onCreate` (found from the manifest):
   `invoke-static … NavNotifier->install(Application)`.
3. The ported JConfig classes and their hooks in Waze's code (unless `JCONFIG=`).
4. The application id (manifest package, provider authorities, Waze's own permissions, resource table package).
5. Re-signs. Resources and native libs are copied byte-for-byte from the original APK (only the dex are taken
   from the apktool rebuild; apktool corrupts resources by case-collision on Windows).

`tools/verify.py` confirms the notifier is present, the hook is wired, and nothing else changed.

## Cluster

`ClusterLayout` acts when a Waze window is on a landscape display other than the main one (the instrument
cluster): it shrinks Waze's turn box and moves it to the cluster ellipse's north-west, and with the JConfig patches
keeps the car marker between the speedometer and the ETA (re-applied every 2 s, with its own height while an alert
shows the full-width ETA bar). Tune it without rebuilding in
`/sdcard/Android/data/com.carlosrpg.waze/files/cluster.properties`: `nav.x`, `nav.top`, `nav.scale`, `car.x`,
`car.y`, `car.y.alert`, `speed.dx` (speedometer shift to the right; all fractions of the window), `speed.scale`, then send Waze to
the cluster again.

`ClusterButton.java` (a "send to cluster" button on the main screen) is kept in `src/` but not built.

## How it stays version-independent

- `NavNotifier` holds no Waze types. `install()` does `Class.forName("com.waze.navigate.NavigationInfoNativeManager")`
  (a stable, JNI-bound name), finds `getInstance`/`addListener` by the names in `NavMap`, takes the listener
  **interface from `addListener`'s parameter type**, and registers a `java.lang.reflect.Proxy` for it. The proxy's
  handler dispatches the callbacks it needs by the method names in `NavMap`.
- The instruction enum keeps its real constant names (`TURN_LEFT`, …) through obfuscation, so the proxy reads
  `((Enum) arg).name()` and the arrow table in `NavText` needs no per-APK data.
- `tools/derive.py` writes `NavMap` by analysing the decoded smali:
  - `GET_INSTANCE` — the static 0-arg method of the manager returning the manager.
  - `ADD_LISTENER` + the interface — the manager method taking one `com.waze.navigate` interface whose body adds
    to a `Set` (this is how add is told apart from remove/restore).
  - the listener letters (`p` nav-state, `d` current instruction, `E` distance, `k` ETA, `m` roundabout exit,
    `s` next street, `F` eta-distance trigger). These have been stable; the script verifies each by signature and,
    when the manager keeps descriptive handler names (e.g. `onCurrentInstructionChanged`, `onEtaDistanceChanged`),
    confirms the ambiguous pairs (distance vs ETA, current vs next instruction/street) from the call sites. It
    **fails loudly** if an assumption breaks, so a future build that moved a letter is caught at build time, not
    silently mis-shown.
  - `REMAINING_FIELD` — the total distance to the destination. Its listener callback fires correctly but is handed
    the *next-turn* distance (a Waze bug), so the notifier instead reads the `:I` field that `onEtaDistanceChanged`
    writes from the eta `DistanceUpdate`'s `getRawMeters()`; `derive.py` finds that field and it is read at publish.
- Distances and the ETA are formatted from Waze's raw numbers (metres, minutes) as `m`/`km`/`min`/`h`, not from
  Waze's unit words, so the text reads the same whatever language the app is in.

Proven on two builds with different obfuscation: 5.27.5.0 (interface `dh`, `getInstance`=`a`, `addListener`=`e`)
and 5.23.0.2 (interface `di`, `getInstance`/`addNavigationUpdateListener`). Both derive the same semantic letters,
install, run and log `WazeNavNotifier: registered`.

## Updating for a future Waze

Just re-run `patch.sh` on the new APK. If `derive.py` can't resolve something it stops with a message naming the
method it couldn't place; open the new APK's `com/waze/navigate/NavigationInfoNativeManager.smali` and the listener
interface it prints, adjust the default letter in `derive.py`, and re-run.

To check the notification on a device: `adb logcat -s WazeNavNotifier` prints each published title, text and
sub-text while navigating.

## Files

- `src/com/carlosrpg/wazenotify/NavText.java` — pure text/icon rules (unit-tested by `test/NavTextCheck.java`).
- `src/com/carlosrpg/wazenotify/NavNotifier.java` — reflection + proxy + notification (version-independent).
- `src/com/carlosrpg/wazenotify/ClusterLayout.java`, `JconfigBridge.java` — cluster layout; JConfig glue.
- `tools/derive.py` — writes `gen/NavMap.java` per APK.
- `tools/hook_oncreate.py` — inserts the onCreate call.
- `jconfig/`, `tools/port_jconfig.py` — JConfig's cluster patch classes; ports them onto this Waze.
- `tools/rename_package.py` — moves the application id.
- `tools/assemble.py`, `tools/verify.py` — APK assembly and checks.
- `tools/apkmirror.py`, `tools/merge_splits.py` — download the latest Waze; bundle to one APK.
- `patch.sh` — the whole process.
- `.github/workflows/build.yml` — CI build and releases.

Not in the repo (see `.gitignore`): APKs, the signing key and `signing.properties`, the `work/` build tree and the
generated `gen/`.
