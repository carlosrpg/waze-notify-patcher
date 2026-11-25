package com.carlosrpg.wazenotify;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Properties;

/**
 * Our part of Waze's instrument-cluster layout, on top of the ported JConfig patches (tools/port_jconfig.py), which
 * own the rest (ETA box, alert overlay, phone UI). When a Waze window is on a landscape display other than the
 * default one (the cluster), only a central ellipse of it is visible; there this shrinks Waze's turn-by-turn box and
 * moves it to the ellipse's north-west, puts the car marker just above the ETA box and moves Waze's speedometer
 * (with its speed-limit sign) to the car's right. Back on the centre display the turn box and speedometer are restored.
 *
 * Positions are fractions of the cluster window. They can be tuned without rebuilding: put keys from {@link #load}
 * in /sdcard/Android/data/com.waze/files/cluster.properties and send Waze to the cluster again.
 */
public final class ClusterLayout implements Application.ActivityLifecycleCallbacks {
    private static final String TAG = "WazeCluster";

    // shortcut: values from a single read per attach; a file edit needs Waze to move display (or restart).
    private static float navX = 0.3f, navTop = 0.3f, navScale = 0.8f;
    // car marker (JConfig's own height is 0.8; lower = higher on screen). The alert state has its own height (car.y.alert),
    // kept from when Waze's ETA changed shape during alerts. car.y puts the car where the speedometer sits, just
    // above the ETA box (emulator cluster at the car's 1920x720); speed.dx then moves the speedometer right, clear of it.
    private static float carX = 0.5f, carY = 0.71f, carYAlert = 0.71f, speedDx = 0.03f, speedScale = 1.4f;

    /** True while a Waze window is on the cluster. */
    private static volatile boolean clusterActive;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Application app;
    private static View currentRoot;

    /** Called from NavNotifier.install (first thing in Application.onCreate). */
    static void install(Application application) {
        app = application;
        application.registerActivityLifecycleCallbacks(new ClusterLayout());
    }

    @Override public void onActivityCreated(Activity a, Bundle b) { attach(a); }
    @Override public void onActivityResumed(Activity a) { attach(a); }
    @Override public void onActivityStarted(Activity a) {}
    @Override public void onActivityPaused(Activity a) {}
    @Override public void onActivityStopped(Activity a) {}
    @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
    @Override public void onActivityDestroyed(Activity a) {}

    /** One layout listener per window; it re-checks the display on every pass, so a move between displays is seen. */
    private static void attach(Activity a) {
        try {
            final View root = a.getWindow().getDecorView();
            if (root.getTag(R_LISTENER) != null) return;
            ViewTreeObserver.OnGlobalLayoutListener l = new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override public void onGlobalLayout() { apply(root); }
            };
            root.setTag(R_LISTENER, l);
            root.getViewTreeObserver().addOnGlobalLayoutListener(l);
        } catch (Throwable t) {
            Log.w(TAG, "attach failed", t);
        }
    }

    // A tag key needs a resource-id-shaped int; these are in the app package range and unused by Waze.
    private static final int R_LISTENER = 0x7f5a7e01;
    private static final int R_ON_CLUSTER = 0x7f5a7e02;

    private static boolean onCluster(View root) {
        Display d = root.getDisplay();
        return d != null && d.getDisplayId() != Display.DEFAULT_DISPLAY && root.getWidth() > root.getHeight();
    }

    private static void apply(View root) {
        try {
            boolean cluster = onCluster(root);
            boolean was = Boolean.TRUE.equals(root.getTag(R_ON_CLUSTER));
            if (cluster && !was) load();
            root.setTag(R_ON_CLUSTER, cluster);
            View nav = navBox(root);
            View speed = byName(root, "Speedometer");   // holds the dial and the speed-limit sign
            if (cluster) {
                currentRoot = root;
                clusterActive = true;
                if (nav != null) placeNav(root, nav);
                if (speed != null) {
                    // the shifted view leaves its (dial-sized) parents, which would clip it
                    for (ViewParent p = speed.getParent(); p instanceof ViewGroup && p != root; p = p.getParent()) {
                        if (((ViewGroup) p).getClipChildren()) ((ViewGroup) p).setClipChildren(false);
                    }
                    // grow from the left edge, away from the car
                    speed.setPivotX(0f);
                    speed.setPivotY(speed.getHeight() / 2f);
                    speed.setScaleX(speedScale);
                    speed.setScaleY(speedScale);
                    float tx = speedDx * root.getWidth();
                    if (Math.abs(tx - speed.getTranslationX()) > 0.5f) speed.setTranslationX(tx);
                }
                startReanchor();
            } else if (was) {
                if (nav != null) { nav.setScaleX(1f); nav.setScaleY(1f); nav.setTranslationX(0f); nav.setTranslationY(0f); }
                if (speed != null) { speed.setScaleX(1f); speed.setScaleY(1f); speed.setTranslationX(0f); }
                if (currentRoot == root) { currentRoot = null; clusterActive = false; }
            }
        } catch (Throwable t) {
            Log.w(TAG, "apply failed", t);
        }
    }

    /** Waze's turn-by-turn box: the parent of its lane-guidance view (resource names survive obfuscation). */
    private static View navBox(View root) {
        View lane = byName(root, "laneGuidanceView");
        return lane != null && lane.getParent() instanceof View ? (View) lane.getParent() : null;
    }

    private static View byName(View root, String idName) {
        int id = root.getResources().getIdentifier(idName, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    /** Scale about the top-left corner, then put the box's top centre at (navX, navTop) of the window. */
    private static void placeNav(View root, View nav) {
        if (nav.getWidth() == 0) return;
        nav.setPivotX(0f);
        nav.setPivotY(0f);
        nav.setScaleX(navScale);
        nav.setScaleY(navScale);
        int[] loc = new int[2];
        nav.getLocationInWindow(loc);   // with pivot (0,0) this is the laid-out corner plus the current translation
        float baseX = loc[0] - nav.getTranslationX(), baseY = loc[1] - nav.getTranslationY();
        float tx = navX * root.getWidth() - navScale * nav.getWidth() / 2f - baseX;
        float ty = navTop * root.getHeight() - baseY;
        if (Math.abs(tx - nav.getTranslationX()) > 0.5f) nav.setTranslationX(tx);
        if (Math.abs(ty - nav.getTranslationY()) > 0.5f) nav.setTranslationY(ty);
    }

    // ---- ETA box ----------------------------------------------------------------------------------------------
    // While an alert shows, Waze hides its ETA drawer (the centred box on the cluster) and shows a full-width compact
    // bar instead. tools/port_jconfig.py routes both visibility flags here: on the cluster the box always stays.

    public static boolean etaDrawerVisible(boolean waze) { return clusterActive || waze; }

    public static boolean compactEtaVisible(boolean waze) { return !clusterActive && waze; }

    // ---- car marker -----------------------------------------------------------------------------------------

    // car.x / car.y are fractions of Waze's map viewport. Waze sometimes leaves room in it for the ETA drawer and
    // sometimes not (it depends on how the window reached the cluster), which put the car at two different heights;
    // tools/port_jconfig.py routes the viewport's height and offset here so on the cluster it is the whole window.
    public static float viewportHeight(float waze) { return clusterActive ? 1f : waze; }

    public static float viewportOffsetY(float waze) { return clusterActive ? 0f : waze; }

    /** JConfig's car-marker height on the cluster (tools/port_jconfig.py routes it here). */
    public static float jconfigCarY(float jconfigValue) { return carYNow(); }

    private static Field alertActive;
    /** car.y, or car.y.alert while JConfig's cluster alert is up (its ClusterAlertOverlay.sActive). */
    private static float carYNow() {
        try {
            if (alertActive == null) {
                alertActive = Class.forName("com.waze.patches.ClusterAlertOverlay").getDeclaredField("sActive");
                alertActive.setAccessible(true);
            }
            return alertActive.getBoolean(null) ? carYAlert : carY;
        } catch (Throwable t) {
            return carY;
        }
    }

    // Waze sometimes puts its own car position back (camera changes, moving between displays) and the newer Waze no
    // longer has the camera calls JConfig re-anchored after. So while on the cluster the offset is re-applied every
    // REANCHOR_MS through the same native call Waze uses: the car snaps back to (car.x, car.y) within that time.
    private static final long REANCHOR_MS = 2000;
    private static volatile Object mapManager;
    private static volatile String mapId;
    private static Method setOffset;
    private static boolean reanchoring;

    /** Hooked before Waze's nativeSetUserLocationOffset (tools/port_jconfig.py): remember the map it addresses. */
    public static void rememberMap(Object manager, String id) {
        mapManager = manager;
        mapId = id;
    }

    private static final Runnable REANCHOR = new Runnable() {
        @Override public void run() {
            if (!clusterActive) { reanchoring = false; return; }
            Object m = mapManager;
            String id = mapId;
            if (m != null && id != null) {
                try {
                    if (setOffset == null) {
                        setOffset = m.getClass().getDeclaredMethod("nativeSetUserLocationOffset",
                                String.class, float.class, float.class, boolean.class);
                        setOffset.setAccessible(true);
                    }
                    setOffset.invoke(m, id, carX, carYNow(), false);
                } catch (Throwable t) {
                    Log.w(TAG, "re-anchoring the car failed; stopping", t);
                    reanchoring = false;
                    return;
                }
            }
            MAIN.postDelayed(this, REANCHOR_MS);
        }
    };

    private static void startReanchor() {
        if (reanchoring) return;
        reanchoring = true;
        MAIN.postDelayed(REANCHOR, 500);
    }

    /** Optional on-car tuning (fractions of the window): nav.x, nav.top, nav.scale (turn box), car.x, car.y,
     *  car.y.alert (car marker; .alert while an alert shows), speed.dx (speedometer shift to the right), speed.scale (its size). */
    private static void load() {
        File f = new File(app.getExternalFilesDir(null), "cluster.properties");
        if (!f.isFile()) return;
        Properties p = new Properties();
        try (InputStream in = new FileInputStream(f)) {
            p.load(in);
            navX = num(p, "nav.x", navX); navTop = num(p, "nav.top", navTop); navScale = num(p, "nav.scale", navScale);
            carX = num(p, "car.x", carX); carY = num(p, "car.y", carY); carYAlert = num(p, "car.y.alert", carYAlert);
            speedDx = num(p, "speed.dx", speedDx); speedScale = num(p, "speed.scale", speedScale);
            Log.i(TAG, "tuning " + p);
        } catch (Throwable t) {
            Log.w(TAG, "cluster.properties unreadable", t);
        }
    }

    private static float num(Properties p, String k, float d) {
        try { return Float.parseFloat(p.getProperty(k, Float.toString(d)).trim()); } catch (NumberFormatException e) { return d; }
    }
}
