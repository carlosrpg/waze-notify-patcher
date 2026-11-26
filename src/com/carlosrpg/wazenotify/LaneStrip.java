package com.carlosrpg.wazenotify;

import android.graphics.RectF;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Waze's lane guidance as a picture for the notification: one cell per lane, left to right, each with its arrows
 * (the lanes to take solid on a soft highlight, the others faint) and faint separators.
 *
 * The lanes come from the turn-guidance listener's lane callback (NavMap.TG_M_LANES): an obfuscated holder whose one
 * List field holds Waze's NavigationLane protobufs, already in left-to-right order. Protobuf classes keep their real
 * names and getters (getAngleList, getAngle, getIsSelected), so they are read by reflection with no per-APK data.
 */
final class LaneStrip {
    private LaneStrip() {}

    private static final int CELL = 96;

    /** Per lane, its arrow angles in degrees (0 ahead, negative left, ±180 U-turn) and which of them to take. */
    static final class Lanes {
        final int[][] angles;
        final boolean[][] selected;
        Lanes(int[][] angles, boolean[][] selected) { this.angles = angles; this.selected = selected; }
    }

    /** The lanes in Waze's callback argument, or null when there are none (Waze sends null to hide them). */
    static Lanes read(Object holder) throws Exception {
        if (holder == null) return null;
        List<?> list = null;
        for (Field f : holder.getClass().getDeclaredFields()) {
            if (List.class.isAssignableFrom(f.getType())) {
                f.setAccessible(true);
                list = (List<?>) f.get(holder);
                break;
            }
        }
        if (list == null || list.isEmpty()) return null;
        int[][] angles = new int[list.size()][];
        boolean[][] selected = new boolean[list.size()][];
        for (int i = 0; i < list.size(); i++) {
            Object lane = list.get(i);
            List<?> as = (List<?>) lane.getClass().getMethod("getAngleList").invoke(lane);
            angles[i] = new int[as.size()];
            selected[i] = new boolean[as.size()];
            for (int j = 0; j < as.size(); j++) {
                Object a = as.get(j);
                angles[i][j] = (Integer) a.getClass().getMethod("getAngle").invoke(a);
                selected[i][j] = (Boolean) a.getClass().getMethod("getIsSelected").invoke(a);
            }
        }
        return new Lanes(angles, selected);
    }

    /**
     * White on transparent, for dark surfaces (the drawer's glass, the car's notification shade): arrows to take in
     * solid white on a soft highlight, the others faint. Each faint pass goes through a layer so overlapping strokes
     * of one lane don't stack into brighter patches.
     */
    static Bitmap draw(Lanes lanes) {
        int n = lanes.angles.length;
        Bitmap bmp = Bitmap.createBitmap(n * CELL, CELL, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bmp);
        Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
        line.setColor(Color.WHITE);
        line.setStyle(Paint.Style.STROKE);
        line.setStrokeCap(Paint.Cap.ROUND);
        line.setStrokeJoin(Paint.Join.ROUND);
        line.setStrokeWidth(CELL * 0.09f);
        Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        fill.setColor(0x24FFFFFF);
        Paint sep = new Paint(Paint.ANTI_ALIAS_FLAG);
        sep.setColor(0x2EFFFFFF);
        sep.setStrokeWidth(CELL * 0.03f);
        sep.setStrokeCap(Paint.Cap.ROUND);
        for (int i = 0; i < n; i++) {
            float left = i * CELL, cx = left + CELL / 2f;
            boolean take = anySelected(lanes.selected[i]);
            if (take && (i == 0 || !anySelected(lanes.selected[i - 1]))) {   // one pill per run of lanes to take
                int end = i;
                while (end + 1 < n && anySelected(lanes.selected[end + 1])) end++;
                canvas.drawRoundRect(new RectF(left + 5, 4, (end + 1) * CELL - 5, CELL - 4), CELL * 0.2f, CELL * 0.2f, fill);
            } else if (!take && i > 0 && !anySelected(lanes.selected[i - 1])) {
                canvas.drawLine(left, CELL * 0.3f, left, CELL * 0.7f, sep);
            }
            for (int pass = 0; pass < 2; pass++) {   // the lanes to take are drawn last, on top
                if (pass == 0) canvas.saveLayerAlpha(left, 0, left + CELL, CELL, 0x5C);
                for (int j = 0; j < lanes.angles[i].length; j++) {
                    if (lanes.selected[i][j] == (pass == 1)) arrow(canvas, cx, lanes.angles[i][j], line);
                }
                if (pass == 0) canvas.restore();
            }
        }
        return bmp;
    }

    private static boolean anySelected(boolean[] s) {
        for (boolean b : s) if (b) return true;
        return false;
    }

    /** One arrow, the way Waze's lane drawable shapes it: up from the bottom, then bent towards its angle. */
    private static void arrow(Canvas canvas, float cx, int angle, Paint line) {
        float cy = CELL * 0.55f, r = CELL * 0.27f, bottom = CELL * 0.84f;
        Path p = new Path();
        float endX, endY, dx, dy;
        if (Math.abs(angle) == 180) {   // U-turn: up, over and back down (to the left for -180)
            float side = angle < 0 ? -1f : 1f, x1 = cx - side * CELL * 0.12f, x2 = cx + side * CELL * 0.14f;
            p.moveTo(x1, bottom);
            p.lineTo(x1, cy - CELL * 0.05f);
            p.cubicTo(x1, cy - CELL * 0.36f, x2, cy - CELL * 0.36f, x2, cy - CELL * 0.05f);
            endX = x2;
            endY = cy + CELL * 0.06f;
            p.lineTo(endX, endY);
            dx = 0f;
            dy = 1f;
        } else {
            double t = Math.toRadians(angle);
            dx = (float) Math.sin(t);
            dy = (float) -Math.cos(t);
            p.moveTo(cx, bottom);
            p.lineTo(cx, cy + 0.45f * r);
            p.quadTo(cx, cy, cx + dx * 0.45f * r, cy + dy * 0.45f * r);
            endX = cx + dx * r;
            endY = cy + dy * r;
            p.lineTo(endX, endY);
        }
        // arrowhead: an open chevron in the same rounded stroke, its tip just past the line's end
        float h = CELL * 0.13f, w = CELL * 0.12f, tipX = endX + dx * CELL * 0.03f, tipY = endY + dy * CELL * 0.03f;
        p.moveTo(tipX - dx * h - dy * w, tipY - dy * h + dx * w);
        p.lineTo(tipX, tipY);
        p.lineTo(tipX - dx * h + dy * w, tipY - dy * h - dx * w);
        canvas.drawPath(p, line);
    }
}
