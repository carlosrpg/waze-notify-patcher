package com.carlosrpg.wazenotify;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInstaller;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Display;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Once per start, asks GitHub for this patcher's latest release. When its build number is higher than this build's
 * ({@link BuildInfo#BUILD}, main's commit count; 0 in a local build, which never asks), a dialog offers the update; on
 * yes the release's APK is downloaded and handed to a PackageInstaller session, and Android shows its own confirm
 * screen. Releases are signed with the same key, so they install over this build.
 */
final class Updater {
    private static final String TAG = "WazeUpdater";
    private static final String LATEST = "https://api.github.com/repos/carlosrpg/waze-notify-patcher/releases/latest";
    private static final int DIALOG_THEME = android.R.style.Theme_DeviceDefault_Dialog_Alert;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean checked;
    private static boolean receiving;
    private static WeakReference<Activity> resumed = new WeakReference<>(null);

    private Updater() {}

    /** From ClusterLayout, on every activity resume. */
    static void onResume(Activity a) {
        resumed = new WeakReference<>(a);
        // On the cluster nobody could answer the dialog: wait for a resume on the centre display.
        if (checked || BuildInfo.BUILD == 0 || a.getWindowManager().getDefaultDisplay().getDisplayId() != Display.DEFAULT_DISPLAY) return;
        checked = true;
        new Thread(new Runnable() {
            @Override public void run() {
                try {
                    JSONObject release = new JSONObject(new String(readAll(open(LATEST)), "UTF-8"));
                    final String tag = release.getString("tag_name");
                    if (UpdateTag.build(tag) <= BuildInfo.BUILD) return;
                    JSONArray assets = release.getJSONArray("assets");
                    for (int i = 0; i < assets.length(); i++) {
                        final JSONObject asset = assets.getJSONObject(i);
                        if (!asset.getString("name").endsWith(".apk")) continue;
                        final String url = asset.getString("browser_download_url");
                        final long size = asset.getLong("size");
                        MAIN.post(new Runnable() {
                            @Override public void run() {
                                // The activity that was up when the check began may be gone (Waze's launcher
                                // activity only hands over to the map): ask on the one showing now.
                                Activity now = resumed.get();
                                if (now == null || now.isFinishing() || now.isDestroyed()) checked = false;   // next resume
                                else offer(now, tag, url, size);
                            }
                        });
                        return;
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "update check failed", t);   // offline, rate-limited: ask again next start
                }
            }
        }, "waze-update-check").start();
    }

    private static void offer(final Activity a, String tag, final String url, final long size) {
        new AlertDialog.Builder(a, DIALOG_THEME)
                .setTitle("Waze update")
                .setMessage(tag + " is available (" + size / 1_000_000 + " MB). Download and install it now?")
                .setNegativeButton("Not now", null)
                .setPositiveButton("Update", new DialogInterface.OnClickListener() {
                    @Override public void onClick(DialogInterface d, int which) { download(a, url, size); }
                })
                .show();
    }

    private static void download(final Activity a, final String url, final long size) {
        final boolean[] cancelled = {false};
        final ProgressDialog progress = new ProgressDialog(a, DIALOG_THEME);
        progress.setTitle("Waze update");
        progress.setMessage("Downloading…");
        progress.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
        progress.setMax(100);
        progress.setCancelable(false);
        progress.setButton(DialogInterface.BUTTON_NEGATIVE, "Cancel", new DialogInterface.OnClickListener() {
            @Override public void onClick(DialogInterface d, int which) { cancelled[0] = true; }
        });
        progress.show();
        new Thread(new Runnable() {
            @Override public void run() {
                String error = null;
                try {
                    File apk = new File(a.getCacheDir(), "update.apk");
                    try (InputStream in = open(url); OutputStream out = new FileOutputStream(apk)) {
                        byte[] buf = new byte[1 << 16];
                        long done = 0;
                        for (int n; (n = in.read(buf)) > 0 && !cancelled[0]; ) {
                            out.write(buf, 0, n);
                            done += n;
                            progress.setProgress((int) (done * 100 / Math.max(1, size)));   // thread-safe in ProgressDialog
                        }
                    }
                    if (!cancelled[0]) install(a.getApplicationContext(), apk);
                } catch (Throwable t) {
                    Log.w(TAG, "update failed", t);
                    error = String.valueOf(t.getMessage());
                } finally {
                    new File(a.getCacheDir(), "update.apk").delete();   // the session has its own copy
                }
                final String shown = error;
                a.runOnUiThread(new Runnable() {
                    @Override public void run() {
                        try { progress.dismiss(); } catch (RuntimeException e) { /* the activity went away meanwhile */ }
                        if (shown != null) Toast.makeText(a.getApplicationContext(), "Waze update failed: " + shown, Toast.LENGTH_LONG).show();
                    }
                });
            }
        }, "waze-update-download").start();
    }

    /** Commits the APK to an install session; Android answers with its confirm screen, then the result. */
    private static void install(final Context app, File apk) throws Exception {
        String action = app.getPackageName() + ".UPDATE_RESULT";
        // one receiver for the life of the process: a second attempt must not answer every result twice
        if (!receiving) app.registerReceiver(new BroadcastReceiver() {
            @Override public void onReceive(Context c, Intent intent) {
                int status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE);
                if (status == PackageInstaller.STATUS_PENDING_USER_ACTION) {
                    Intent confirm = intent.getParcelableExtra(Intent.EXTRA_INTENT);
                    if (confirm != null) app.startActivity(confirm.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                    return;
                }
                // On success Android kills this process before the broadcast matters; aborted = the user said no.
                if (status != PackageInstaller.STATUS_SUCCESS && status != PackageInstaller.STATUS_FAILURE_ABORTED) {
                    String why = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE);
                    Log.w(TAG, "install failed: " + status + " " + why);
                    Toast.makeText(app, "Waze update failed: " + why, Toast.LENGTH_LONG).show();
                }
            }
        }, new IntentFilter(action), null, null, Context.RECEIVER_NOT_EXPORTED);
        receiving = true;

        PackageInstaller installer = app.getPackageManager().getPackageInstaller();
        PackageInstaller.SessionParams params = new PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL);
        params.setAppPackageName(app.getPackageName());
        int id = installer.createSession(params);
        try (PackageInstaller.Session session = installer.openSession(id)) {
            try (OutputStream out = session.openWrite("base.apk", 0, apk.length()); InputStream in = new FileInputStream(apk)) {
                byte[] buf = new byte[1 << 16];
                for (int n; (n = in.read(buf)) > 0; ) out.write(buf, 0, n);
                session.fsync(out);
            }
            // Mutable: the installer adds the status extras to this intent.
            session.commit(PendingIntent.getBroadcast(app, id, new Intent(action).setPackage(app.getPackageName()),
                    PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_MUTABLE).getIntentSender());
        }
    }

    private static InputStream open(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(10_000);
        c.setReadTimeout(30_000);
        return c.getInputStream();
    }

    private static byte[] readAll(InputStream in) throws Exception {
        try (InputStream i = in; java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream()) {
            byte[] buf = new byte[8192];
            for (int n; (n = i.read(buf)) > 0; ) out.write(buf, 0, n);
            return out.toByteArray();
        }
    }
}
