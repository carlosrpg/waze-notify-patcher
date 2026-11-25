package com.carlosrpg.wazenotify;

import android.content.Context;
import android.graphics.PointF;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Glue for the JConfig cluster patches ported onto a newer Waze (tools/port_jconfig.py). Where the newer Waze no
 * longer has the exact call JConfig hooked, its hook calls this instead, and this calls JConfig's code by reflection
 * (that code is smali in the APK, so it cannot be compiled against). Every method is a no-op when the JConfig
 * classes are absent, so a build without the port never reaches here.
 */
public final class JconfigBridge {
    private static final String TAG = "WazeJconfig";
    private static final String PATCHES = "com.waze.patches.Patches";
    private static Method locX, locY, etaDistance;

    private JconfigBridge() {}

    /** After Application.onCreate's super call: start JConfig's MyCar client, as JConfig's build does. */
    public static void initMyCar(Context context) {
        try {
            Class<?> c = Class.forName("com.vadimbrk.mycar.MyCarServiceClient");
            Object client = c.getMethod("getInstance").invoke(null);
            c.getMethod("init", Context.class).invoke(client, context);
        } catch (Throwable t) {
            Log.w(TAG, "MyCar client init failed", t);
        }
    }

    /** The car marker's position (fractions of the map) just before Waze builds it: JConfig's offset rule applied. */
    public static Object userLocation(Object point) {
        if (!(point instanceof PointF)) return point;
        try {
            if (locX == null) {
                Class<?> p = Class.forName(PATCHES);
                locX = p.getMethod("applyUserLocationOffsetX", String.class, float.class, float.class, boolean.class);
                locY = p.getMethod("applyUserLocationOffsetY", String.class, float.class, float.class, boolean.class);
            }
            PointF in = (PointF) point;
            float x = (Float) locX.invoke(null, "bounds", in.x, in.y, false);
            float y = (Float) locY.invoke(null, "bounds", x, in.y, false);
            return new PointF(x, y);
        } catch (Throwable t) {
            Log.w(TAG, "user location offset failed", t);
            return point;
        }
    }

    /** Waze's ETA-distance JNI update (serialized DistanceUpdate) forwarded to JConfig as the parsed message. */
    public static void etaDistance(byte[] update) {
        try {
            if (etaDistance == null) {
                etaDistance = Class.forName(PATCHES).getMethod("onEtaDistanceChanged", Object.class);
            }
            Object msg = Class.forName("com.waze.jni.protos.navigate.DistanceUpdate")
                    .getMethod("parseFrom", byte[].class).invoke(null, (Object) update);
            etaDistance.invoke(null, msg);
        } catch (Throwable t) {
            Log.w(TAG, "eta distance forward failed", t);
        }
    }
}
