package com.carlosrpg.wazenotify;

import android.app.ActivityOptions;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.hardware.display.DisplayManager;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;

/**
 * A round "send to cluster" button on Waze's main screen, in the column under Waze's own media and volume buttons
 * (those are Compose-drawn, so the slot is computed: below the turn box while navigating, else at the top). A tap
 * moves the running Waze to the cluster the way QuickSettings does on the car: its launcher activity started on the
 * cluster display with NEW_TASK | RESET_TASK_IF_NEEDED, full screen, so the same task moves and no copy is created.
 * Shown only on the default display and only when a cluster display exists.
 */
final class ClusterButton {
    private static final String TAG = "WazeClusterButton";
    private static final String BUTTON_TAG = "carlosrpg_send_to_cluster";
    // Waze's map-button column, in dp (measured on its main screen): 42dp buttons every 49dp, 12dp from the right,
    // starting 12dp under the turn box while navigating; this button takes the third slot.
    private static final float SIZE = 42f, STEP = 49f, RIGHT = 12f, GAP_NAV = 12f, SLOT = 2;

    private ClusterButton() {}

    static void place(View root) {
        if (!(root instanceof ViewGroup)) return;
        ViewGroup decor = (ViewGroup) root;
        View button = decor.findViewWithTag(BUTTON_TAG);
        Integer cluster = clusterDisplay(root.getContext());
        if (cluster == null) {
            if (button != null) button.setVisibility(View.GONE);
            return;
        }
        // Waze's own views can run at a different density than the window (JConfig forces one): size like them
        View content = byName(root, "mainContentCompose");
        float d = (content != null ? content : root).getResources().getDisplayMetrics().density;
        if (button == null) {
            button = build(root.getContext(), d);
            decor.addView(button, new FrameLayout.LayoutParams(Math.round(SIZE * d), Math.round(SIZE * d)));
        }
        int top = columnTop(root, d) + Math.round(SLOT * STEP * d);
        int left = root.getWidth() - Math.round((RIGHT + SIZE) * d);
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) button.getLayoutParams();
        if (lp.topMargin != top || lp.leftMargin != left) {
            lp.gravity = Gravity.TOP | Gravity.START;
            lp.topMargin = top;
            lp.leftMargin = left;
            button.setLayoutParams(lp);
        }
        boolean night = (root.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        ((GradientDrawable) button.getBackground()).setColor(night ? 0xFF16191C : Color.WHITE);
        ((ImageView) button).setColorFilter(night ? Color.WHITE : 0xFF202124);
        button.setVisibility(View.VISIBLE);
    }

    static void remove(View root) {
        View b = root.findViewWithTag(BUTTON_TAG);
        if (b != null) ((ViewGroup) b.getParent()).removeView(b);
    }

    /** Top of Waze's map-button column in window pixels: under the turn box while it is shown, else the content top. */
    private static int columnTop(View root, float d) {
        int[] loc = new int[2];
        View nav = byName(root, "navBarContentContainer");
        if (nav != null && nav.isShown() && nav.getHeight() > 0) {
            nav.getLocationInWindow(loc);
            return loc[1] + nav.getHeight() + Math.round(GAP_NAV * d);
        }
        View content = byName(root, "mainContentCompose");
        if (content != null) {
            content.getLocationInWindow(loc);
            return loc[1];
        }
        return 0;
    }

    private static View byName(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    private static ImageView build(Context context, float d) {
        ImageView b = new ImageView(context);
        b.setTag(BUTTON_TAG);
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.OVAL);
        b.setBackground(bg);
        b.setElevation(4 * d);
        int pad = Math.round(10 * d);
        b.setPadding(pad, pad, pad, pad);
        b.setImageDrawable(new ClusterIcon());
        b.setContentDescription("Send Waze to the instrument cluster");
        b.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { sendToCluster(v.getContext()); }
        });
        return b;
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

    static void sendToCluster(Context context) {
        Integer cluster = clusterDisplay(context);
        if (cluster == null) return;
        try {
            Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (launch == null) return;
            launch.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
            ActivityOptions options = ActivityOptions.makeBasic();
            options.setLaunchDisplayId(cluster);
            options.setLaunchBounds(null);
            Bundle b = options.toBundle();
            b.putInt("android:windowingMode", 1);         // fullscreen, as QuickSettings does on the car
            b.putInt("android.activity.windowingMode", 1);
            context.startActivity(launch, b);
        } catch (RuntimeException e) {
            Log.w(TAG, "send to cluster refused", e);
        }
    }

    /** A small instrument-cluster glyph: a wide rounded screen with a gauge arc and a needle. */
    private static final class ClusterIcon extends Drawable {
        private final Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);

        @Override public void draw(Canvas c) {
            float w = getBounds().width(), h = getBounds().height(), s = Math.min(w, h);
            float cx = getBounds().left + w / 2f, cy = getBounds().top + h / 2f;
            p.setStyle(Paint.Style.STROKE);
            p.setStrokeWidth(s * 0.09f);
            p.setStrokeCap(Paint.Cap.ROUND);
            RectF screen = new RectF(cx - s * 0.48f, cy - s * 0.30f, cx + s * 0.48f, cy + s * 0.30f);
            c.drawRoundRect(screen, s * 0.12f, s * 0.12f, p);
            RectF gauge = new RectF(cx - s * 0.24f, cy - s * 0.14f, cx + s * 0.24f, cy + s * 0.34f);
            c.drawArc(gauge, 200, 140, false, p);
            Path needle = new Path();
            needle.moveTo(cx, cy + s * 0.10f);
            needle.lineTo(cx + s * 0.13f, cy - s * 0.06f);
            c.drawPath(needle, p);
        }

        @Override public void setAlpha(int alpha) { p.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter cf) { p.setColorFilter(cf); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        @Override public int getIntrinsicWidth() { return 64; }
        @Override public int getIntrinsicHeight() { return 64; }
    }
}
