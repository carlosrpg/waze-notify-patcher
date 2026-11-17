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

Git Bash:

```bash
bash patch.sh <input.apk> [output.apk]
```

PowerShell (same result, no Git Bash needed):

```powershell
pwsh -File patch.ps1 <input.apk> [output.apk]
```

Example:

```bash
bash patch.sh waze.apk
```

Output: `<input>-notify.apk` next to the input, signed with `waze-patch.keystore` (created on first run; keep it —
later patched builds must use the same key to install over each other). Install it on the car with a file
manager, then grant notification access to QuickSettings over adb (see the QuickSettings README). The input here
is a single **universal** APK (one file with `lib/`, `res/` and all dex); install is a plain install, no split
session.

Requirements: JDK 17+, the Android SDK (build-tools and a platform — `android-36` works), apktool 3.x, Python 3,
and Git Bash (for `patch.sh`) or PowerShell 7 (for `patch.ps1`). Tool locations are set near the top of
`patch.sh` / `patch.ps1` (`SDK`, `JDK`, `APKTOOL`, …) — edit them to match your machine.

## What it changes

1. Compiles `NavText` + `NavNotifier` + a generated `NavMap` to one dex, added as the next `classesN+1.dex`.
2. Inserts one instruction at the top of the app's `Application.onCreate` (found from the manifest):
   `invoke-static … NavNotifier->install(Application)`.
3. Re-signs. Resources, native libs and the manifest are copied byte-for-byte from the original APK (only the
   dex are taken from the apktool rebuild — apktool corrupts resources by case-collision on Windows).

Nothing else is touched. `tools/verify.py` confirms the notifier is present, the hook is wired, and no non-dex
entry changed.

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
- `tools/derive.py` — writes `gen/NavMap.java` per APK.
- `tools/hook_oncreate.py` — inserts the onCreate call (shared by both scripts).
- `tools/assemble.py`, `tools/verify.py` — APK assembly and checks.
- `patch.sh` / `patch.ps1` — the whole process (Git Bash / PowerShell; identical result).

Not in the repo (see `.gitignore`): APKs, the signing key, the `work/` build tree and the generated `gen/`.
