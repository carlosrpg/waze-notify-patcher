package com.carlosrpg.wazenotify;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Waze's lane guidance as a picture for the notification: one cell per lane, left to right, each with its arrows
 * (the lanes to take in Waze's selected colour, the others in its passive colour) and Waze's thin separators.
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

    static Bitmap draw(Context c, Lanes lanes) {
        int n = lanes.angles.length;
        Bitmap bmp = Bitmap.createBitmap(n * CELL, CELL, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bmp);
        int on = color(c, "LanesSelectedColor", Color.WHITE);
        int off = color(c, "LanesPassiveColor", Color.GRAY);
        Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
        line.setStyle(Paint.Style.STROKE);
        line.setStrokeCap(Paint.Cap.ROUND);
        line.setStrokeWidth(CELL * 0.08f);
        Paint head = new Paint(Paint.ANTI_ALIAS_FLAG);
        head.setStyle(Paint.Style.FILL);
        Paint sep = new Paint();
        sep.setColor(off);
        sep.setStrokeWidth(2f);
        for (int i = 0; i < n; i++) {
            float cx = i * CELL + CELL / 2f;
            if (i > 0) canvas.drawLine(i * CELL, CELL * 0.72f, i * CELL, CELL * 0.94f, sep);
            for (int pass = 0; pass < 2; pass++) {   // the lanes to take are drawn last, on top
                for (int j = 0; j < lanes.angles[i].length; j++) {
                    if (lanes.selected[i][j] != (pass == 1)) continue;
                    line.setColor(pass == 1 ? on : off);
                    head.setColor(pass == 1 ? on : off);
                    arrow(canvas, cx, lanes.angles[i][j], line, head);
                }
            }
        }
        return bmp;
    }

    /** One arrow, the way Waze's lane drawable shapes it: up from the bottom, then bent towards its angle. */
    private static void arrow(Canvas canvas, float cx, int angle, Paint line, Paint head) {
        float cy = CELL * 0.5f, r = CELL * 0.36f, bottom = CELL * 0.92f;
        Path p = new Path();
        float endX, endY, dx, dy;
        if (Math.abs(angle) == 180) {   // U-turn: up, over and back down (to the left for -180)
            float side = angle < 0 ? -1f : 1f, x1 = cx - side * CELL * 0.14f, x2 = cx + side * CELL * 0.18f;
            p.moveTo(x1, bottom);
            p.lineTo(x1, cy);
            p.cubicTo(x1, cy - CELL * 0.4f, x2, cy - CELL * 0.4f, x2, cy);
            endX = x2;
            endY = cy + CELL * 0.12f;
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
        canvas.drawPath(p, line);
        float h = CELL * 0.16f, w = CELL * 0.12f;   // arrowhead: tip ahead of the line's end, base across it
        Path tri = new Path();
        tri.moveTo(endX + dx * h, endY + dy * h);
        tri.lineTo(endX - dy * w, endY + dx * w);
        tri.lineTo(endX + dy * w, endY - dx * w);
        tri.close();
        canvas.drawPath(tri, head);
    }

    private static int color(Context c, String name, int fallback) {
        int id = c.getResources().getIdentifier(name, "color", c.getPackageName());
        try { return id != 0 ? c.getColor(id) : fallback; } catch (Throwable t) { return fallback; }
    }
}
