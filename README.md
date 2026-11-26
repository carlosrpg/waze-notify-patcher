# Waze notification patcher

Adds a standard turn-by-turn **navigation notification** to a Waze APK, so a notification listener (the
QuickSettings drawer) can read directions on the car. Stock Waze, run as a normal app (no Android Auto session),
posts no directions in a notification — only "Waze — Running. Tap to open." This patch posts, during navigation:
the distance to the next turn as the title, the road as the text, the ETA and remaining distance as the sub-text,
Waze's own manoeuvre arrow as the large icon (with the roundabout exit number on it, as in Waze's turn box) and,
when Waze shows lane guidance, the lanes as the big picture (`EXTRA_PICTURE`: one cell per lane, white on
transparent for dark surfaces: the lanes to take solid on a soft highlight, the others faint). Category `navigation`, ongoing, ≤ 1 update/second.

When there is no road name the text is the manoeuvre in **Waze's in-app language**: the notifier asks Waze's own
translator (`NativeManager.langGetIntNTV`) for its `DisplayStrings` prompt (`CUSTOM_PROMPT_TURN_LEFT`,
`CUSTOM_PROMPT_SECOND`, …), looked up by constant name, and falls back to English only if that call is missing.

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

1. Compiles everything in `src/` plus the generated `NavMap` and `BuildInfo` to one dex, added after the last
   `classesN.dex`.
2. Inserts one instruction at the top of the app's `Application.onCreate` (found from the manifest):
   `invoke-static … NavNotifier->install(Application)`.
3. The ported JConfig classes and their hooks in Waze's code (unless `JCONFIG=`).
4. The application id (manifest package, provider authorities, Waze's own permissions, resource table package)
   and the install permission in the manifest.
5. One more button in Waze's map-button column (the cluster toggle).
6. Re-signs. Resources and native libs are copied byte-for-byte from the original APK (only the dex are taken
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

### Cluster button

`tools/hook_cluster_button.py` adds a button to Waze's own map-button column, right after the sound button (drawn
by Waze's button composable, so it has the same size and style and hides with the others). A tap moves the running
Waze to the cluster display. Its icon is Waze's `ic_open_in_new` drawable. The button is optional: if a future Waze drops that drawable or changes
its button code, `patch.sh` prints a warning and builds without it.

On the cluster the window cannot be touched, so a copy of the button then floats on the centre display and brings
Waze back. That needs the overlay permission, which a sideloaded app does not get by itself:

```bash
adb shell appops set com.carlosrpg.waze SYSTEM_ALERT_WINDOW allow
```

Without it, Waze comes back by opening it from the launcher (or from QuickSettings). The button only moves the
window: it does not send the car's cluster hand-over signals that QuickSettings sends.

## Updates

A CI release build knows its build number (the `-buildN` of its release tag; `BUILD_NUMBER` for `patch.sh`). Once
per start, on the centre display, it asks GitHub for this repository's latest release and, when that build is
newer, offers to download and install it (`Updater.java`): the APK goes to a `PackageInstaller` session and Android
shows its own confirm screen. `assemble.py` adds `REQUEST_INSTALL_PACKAGES` to the manifest for this. If the car has
no "install unknown apps" screen for Waze, allow it once over adb:

```bash
adb shell appops set com.carlosrpg.waze REQUEST_INSTALL_PACKAGES allow
```

A local build (`BUILD_NUMBER` unset) never asks.

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
    `s` next street, `F` eta-distance trigger). On 5.28+ the turn-guidance listener also has a lane callback
    (`TG_M_LANES`): the one listener method called by the manager's static method that unpacks `NavigationLaneList`. These have been stable; the script verifies each by signature and,
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
- `src/com/carlosrpg/wazenotify/LaneStrip.java` — reads Waze's lane protobufs and draws the lane picture.
- `src/com/carlosrpg/wazenotify/ClusterLayout.java`, `JconfigBridge.java` — cluster layout; JConfig glue.
- `src/com/carlosrpg/wazenotify/ClusterButton.java`, `tools/hook_cluster_button.py` — the cluster toggle.
- `src/com/carlosrpg/wazenotify/Updater.java`, `UpdateTag.java` — update check, download and install.
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
