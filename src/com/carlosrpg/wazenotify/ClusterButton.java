package com.carlosrpg.wazenotify;

import android.app.ActivityOptions;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.drawable.GradientDrawable;
import android.hardware.display.DisplayManager;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.Toast;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * The cluster toggle. tools/hook_cluster_button.py adds a button to Waze's own map-button column, right after the
 * sound button, drawn by Waze's button composable: same size and style, shown and hidden with the others. It asks
 * this class for its icon ({@link #iconRes}) and its click ({@link #onClick}). A tap moves the running Waze to the
 * cluster: its launcher activity started on the cluster display with NEW_TASK | RESET_TASK_IF_NEEDED, full screen, so
 * the same task moves and no copy is created.
 *
 * Once Waze is on the cluster its window cannot be touched, so a copy of the button then floats on the centre
 * display as an overlay window (highlighted), where the column's third button sits on an idle map, and a tap brings
 * Waze back. Waze already declares the overlay permission; where it is not granted (adb shell appops set APP_ID
 * SYSTEM_ALERT_WINDOW allow) there is no floating button and Waze comes back by opening it from the launcher.
 */
public final class ClusterButton {
    private static final String TAG = "WazeClusterButton";
    private static final String ICON = "ic_open_in_new";   // a Waze drawable (patch.sh checks it exists)
    // Waze's map-button column, in dp (measured on Waze 5.28): 56dp buttons every 64dp, 16dp from the right.
    private static final float SIZE = 56f, STEP = 64f, RIGHT = 16f;
    private static final int ACTIVE = 0xFF33CCFF;   // Waze's blue: the floating button, while Waze is on the cluster

    // Where the floating button goes and how big, from Waze's window while it was on the centre display: screen
    // pixels, -1 = it never was there.
    private static int lastX = -1, lastY, lastSize;
    private static boolean lastNight;
    private static View floating;
    private static Object click;
    private static Runnable pending = new Runnable() { @Override public void run() {} };

    private ClusterButton() {}

    /** The button's icon, for Waze's button composable (hooked in smali). */
    public static int iconRes() {
        Context app = ClusterLayout.app;
        return app.getResources().getIdentifier(ICON, "drawable", app.getPackageName());
    }

    /** The button's click as Waze's (renamed) Kotlin Function0, which the hook passes in. Always the same object. */
    public static synchronized Object onClick(Class<?> function0) {
        if (click == null) {
            click = Proxy.newProxyInstance(function0.getClassLoader(), new Class<?>[]{function0}, new InvocationHandler() {
                @Override public Object invoke(Object proxy, Method method, Object[] args) {
                    if (method.getDeclaringClass() == Object.class) {   // Compose compares it with equals
                        if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                        if (method.getName().equals("equals")) return proxy == args[0];
                        return "ClusterButton.onClick";
                    }
                    toggle();
                    return null;
                }
            });
        }
        return click;
    }

    private static void toggle() {
        Context app = ClusterLayout.app;
        if (ClusterLayout.onCluster()) { moveTo(app, Display.DEFAULT_DISPLAY); return; }
        Integer cluster = clusterDisplay(app);
        if (cluster == null) Toast.makeText(app, "No instrument cluster display", Toast.LENGTH_SHORT).show();
        else moveTo(app, cluster);
    }

    /**
     * From ClusterLayout on every layout pass of a Waze window: note where its button column is on the centre display.
     * A reading only counts once the window is still there half a second later: on the way to the cluster Waze's
     * resources already have the cluster's density while the window is still laid out on the centre display.
     */
    static void remember(final View root) {
        ClusterLayout.MAIN.removeCallbacks(pending);
        pending = new Runnable() {
            @Override public void run() {
                Display on = root.getDisplay();
                int id = root.getResources().getIdentifier("mainContentCompose", "id", root.getContext().getPackageName());
                View content = id == 0 ? null : root.findViewById(id);
                if (on == null || on.getDisplayId() != Display.DEFAULT_DISPLAY || content == null || ClusterLayout.onCluster()) return;
                // Waze's own views can run at a different density than the window (JConfig forces one): size like them
                float d = content.getResources().getDisplayMetrics().density;
                int[] loc = new int[2];
                content.getLocationOnScreen(loc);
                lastSize = Math.round(SIZE * d);
                lastX = loc[0] + content.getWidth() - Math.round((RIGHT + SIZE) * d);
                lastY = loc[1] + Math.round(2 * STEP * d);
                lastNight = (root.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            }
        };
        ClusterLayout.MAIN.postDelayed(pending, 500);
    }

    /** The floating button on the centre display, shown while Waze is on the cluster. */
    static void floating(Context app, boolean show) {
        try {
            if (!show) {
                if (floating != null) ((WindowManager) floating.getContext().getSystemService(Context.WINDOW_SERVICE)).removeView(floating);
                floating = null;
                return;
            }
            if (floating != null) return;
            if (!Settings.canDrawOverlays(app)) {
                Log.w(TAG, "no overlay permission: no button on the centre display to bring Waze back");
                return;
            }
            DisplayManager dm = (DisplayManager) app.getSystemService(Context.DISPLAY_SERVICE);
            final Context c = app.createDisplayContext(dm.getDisplay(Display.DEFAULT_DISPLAY))
                    .createWindowContext(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, null);
            if (lastX < 0) {   // Waze started on the cluster: the same slot, at this display's own density
                float d = c.getResources().getDisplayMetrics().density;
                lastSize = Math.round(SIZE * d);
                lastX = c.getResources().getDisplayMetrics().widthPixels - Math.round((RIGHT + SIZE) * d);
                lastY = Math.round((2 * STEP + SIZE) * d);
            }
            ImageView b = new ImageView(c);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.OVAL);
            bg.setColor(lastNight ? Color.BLACK : Color.WHITE);
            b.setBackground(bg);
            int pad = lastSize / 4;
            b.setPadding(pad, pad, pad, pad);
            b.setImageResource(iconRes());
            b.setRotation(180f);   // the "send out" arrow, pointing back in
            b.setColorFilter(ACTIVE);
            b.setContentDescription("Bring Waze back from the instrument cluster");
            b.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) { moveTo(c, Display.DEFAULT_DISPLAY); }
            });
            WindowManager.LayoutParams lp = new WindowManager.LayoutParams(lastSize, lastSize, lastX, lastY,
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                            | WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
                    PixelFormat.TRANSLUCENT);
            lp.gravity = Gravity.TOP | Gravity.START;
            ((WindowManager) c.getSystemService(Context.WINDOW_SERVICE)).addView(b, lp);
            floating = b;
        } catch (RuntimeException e) {
            Log.w(TAG, "floating button failed", e);
        }
    }

    /** The cluster: display 2 on the car, else a non-default landscape display. */
    static Integer clusterDisplay(Context context) {
        DisplayManager dm = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
        Integer other = null;
        for (Display display : dm.getDisplays()) {
            int id = display.getDisplayId();
            if (id == Display.DEFAULT_DISPLAY) continue;
            if (id == 2) return id;
            Display.Mode m = display.getMode();
            if (other == null && m.getPhysicalWidth() > m.getPhysicalHeight() && (display.getFlags() & Display.FLAG_PRIVATE) == 0) other = id;
        }
        return other;
    }

    /** Moves the running Waze task to a display. */
    private static void moveTo(Context context, int display) {
        try {
            Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (launch == null) return;
            launch.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
            ActivityOptions options = ActivityOptions.makeBasic();
            options.setLaunchDisplayId(display);
            options.setLaunchBounds(null);
            Bundle b = options.toBundle();
            b.putInt("android:windowingMode", 1);         // fullscreen, as QuickSettings does on the car
            b.putInt("android.activity.windowingMode", 1);
            context.startActivity(launch, b);
        } catch (RuntimeException e) {
            Log.w(TAG, "move to display " + display + " refused", e);
        }
    }
}
