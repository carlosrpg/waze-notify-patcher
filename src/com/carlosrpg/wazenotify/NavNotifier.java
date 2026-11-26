package com.carlosrpg.wazenotify;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

/**
 * Posts Waze's turn-by-turn state as a standard navigation notification (category navigation, distance as title,
 * street as text, manoeuvre arrow as large icon, ETA as sub-text) so a notification listener (QuickSettings) can
 * read it. Waze only does this itself inside an Android Auto session.
 *
 * Version-independent: it does not implement Waze's obfuscated listener interface. It registers on the same
 * NavigationInfoNativeManager feed by reflection and listens through a {@link Proxy}, dispatching the few
 * callbacks it needs by the method names {@link NavMap} carries (generated per APK by tools/derive.py). The
 * instruction enum keeps its real constant names through obfuscation, so its icon mapping needs no per-APK data.
 */
public final class NavNotifier {
    private static final String TAG = "WazeNavNotifier";
    private static final String MANAGER = "com.waze.navigate.NavigationInfoNativeManager";
    private static final String TG_MANAGER = "com.waze.navigate.NavigationTurnGuidanceNativeManager";
    private static final String CHANNEL = "waze_nav_instructions";
    private static final int NOTIFICATION_ID = 0x5A7E;
    private static final long MIN_INTERVAL_MS = 1000;
    private static final int ICON_PX = 128;

    private final Application app;
    private final NotificationManager nm;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Map<String, Bitmap> icons = new HashMap<>();

    private volatile boolean navigating;
    private volatile String instruction = "";
    private volatile int exit;
    private volatile int distMeters;
    private volatile String nextStreet = "";
    private volatile int etaMinutes;
    private volatile LaneStrip.Lanes lanes;
    private LaneStrip.Lanes lanesDrawn;
    private Bitmap lanesBmp;

    // Waze's own translator (its in-app language, not Android's): NativeManager.langGetIntNTV(DisplayStrings id).
    private Object nativeManager;
    private Method langGet;
    private boolean langMissing;

    // Total remaining distance to the destination: read from Waze's etaDistanceMeters field, because its listener
    // callback is handed the next-turn distance instead (a Waze bug). Resolved once at register(), read at publish.
    private Object managerInstance;
    private Field remainingField;
    private boolean infoRegistered;

    private long lastPost;
    private boolean scheduled;
    private boolean showing;

    private NavNotifier(Application app) {
        this.app = app;
        this.nm = app.getSystemService(NotificationManager.class);
    }

    /** Called first thing in Waze's Application.onCreate (hook added in smali). */
    public static void install(final Application app) {
        try {
            ClusterLayout.install(app);
            final NavNotifier n = new NavNotifier(app);
            NotificationChannel ch = new NotificationChannel(CHANNEL, "Navigation instructions", NotificationManager.IMPORTANCE_LOW);
            ch.setShowBadge(false);
            n.nm.createNotificationChannel(ch);
            // Register after Waze's own start-up has finished.
            n.main.post(new Runnable() {
                int tries;
                @Override public void run() {
                    try {
                        if (!n.infoRegistered) n.register();
                        if (!NavMap.TG_LOOKUP_CLASS.isEmpty()) n.registerTurnGuidance();
                        Log.i(TAG, "registered");
                    } catch (Throwable t) {
                        // Waze's DI container may not be up yet on the first pass: retry for about half a minute.
                        if (++tries < 15) n.main.postDelayed(this, 2000);
                        else Log.w(TAG, "register failed", t);
                    }
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "install failed", t);
        }
    }

    /** Reflectively get the manager singleton, build a proxy listener, and add it. */
    private void register() throws Exception {
        Class<?> mgr = Class.forName(MANAGER);
        Method getInstance = mgr.getDeclaredMethod(NavMap.GET_INSTANCE);
        getInstance.setAccessible(true);
        Object instance = getInstance.invoke(null);
        managerInstance = instance;
        try {
            remainingField = mgr.getDeclaredField(NavMap.REMAINING_FIELD);
            remainingField.setAccessible(true);
        } catch (Throwable t) {
            Log.w(TAG, "remaining-distance field " + NavMap.REMAINING_FIELD + " missing", t);
        }

        Method addListener = null;
        for (Method m : mgr.getDeclaredMethods()) {
            if (m.getName().equals(NavMap.ADD_LISTENER) && m.getParameterTypes().length == 1
                    && m.getParameterTypes()[0].isInterface()) {
                addListener = m;
                break;
            }
        }
        if (addListener == null) throw new NoSuchMethodException("addListener " + NavMap.ADD_LISTENER);
        Class<?> listener = addListener.getParameterTypes()[0];

        Object proxy = Proxy.newProxyInstance(mgr.getClassLoader(), new Class[]{listener}, new Dispatch());
        addListener.setAccessible(true);
        addListener.invoke(instance, proxy);
        infoRegistered = true;
    }

    /** 5.28+: instruction, turn distance, exit and next street come from the turn-guidance manager's own feed. */
    private void registerTurnGuidance() throws Exception {
        Class<?> mgr = Class.forName(TG_MANAGER);
        Method lookup = Class.forName(NavMap.TG_LOOKUP_CLASS).getDeclaredMethod(NavMap.TG_LOOKUP_METHOD, Class.class);
        lookup.setAccessible(true);
        Object instance = lookup.invoke(null, mgr);   // Waze's DI singleton; there is no static getInstance
        for (Method m : mgr.getDeclaredMethods()) {
            Class<?>[] p = m.getParameterTypes();
            if (m.getName().equals(NavMap.TG_ADD_LISTENER) && p.length == 2 && p[0].isInterface() && p[1] == boolean.class) {
                Object proxy = Proxy.newProxyInstance(mgr.getClassLoader(), new Class[]{p[0]}, new Dispatch());
                m.setAccessible(true);
                m.invoke(instance, proxy, true);   // true: replay the current state now
                return;
            }
        }
        throw new NoSuchMethodException("turn-guidance addListener " + NavMap.TG_ADD_LISTENER);
    }

    /** Turns Waze's listener callbacks (dispatched by name) into our notification state. */
    private final class Dispatch implements InvocationHandler {
        @Override public Object invoke(Object proxy, Method method, Object[] args) {
            String name = method.getName();
            Class<?> decl = method.getDeclaringClass();
            if (decl == Object.class) {  // hashCode / equals / toString on the proxy
                if (name.equals("hashCode")) return System.identityHashCode(proxy);
                if (name.equals("equals")) return proxy == args[0];
                return "WazeNavNotifier$Proxy";
            }
            try {
                if (name.equals(NavMap.M_NAVSTATE)) {
                    navigating = Boolean.TRUE.equals(args[0]);
                    if (!navigating) { instruction = ""; exit = 0; nextStreet = ""; distMeters = 0; lanes = null; }
                    changed();
                } else if (name.equals(NavMap.M_INSTRUCTION)) {
                    instruction = args[0] instanceof Enum ? ((Enum<?>) args[0]).name() : "";
                    changed();
                } else if (name.equals(NavMap.M_DISTANCE)) {
                    distMeters = intArg(args[2]);  // args[0]/[1] are Waze's value+unit words; metres are language-neutral
                    changed();
                } else if (name.equals(NavMap.M_EXIT)) {
                    exit = intArg(args[0]);
                    changed();
                } else if (name.equals(NavMap.M_NEXTSTREET)) {
                    nextStreet = str(args[0]);
                    changed();
                } else if (name.equals(NavMap.M_ETA)) {
                    etaMinutes = intArg(args[2]);  // args[0]/[1] are Waze's value+unit words; minutes are language-neutral
                    changed();
                } else if (name.equals(NavMap.TG_M_LANES)) {
                    lanes = LaneStrip.read(args[0]);
                    changed();
                } else if (name.equals(NavMap.M_REMAINING)) {
                    changed();  // trigger only; this callback is handed the next-turn distance (Waze bug) — real total read at publish
                }
            } catch (Throwable t) {
                Log.w(TAG, "dispatch " + name + " failed", t);
            }
            return defaultReturn(method.getReturnType());  // every nav callback is void, but be safe
        }
    }

    private static String str(Object o) { return o == null ? "" : o.toString(); }
    private static int intArg(Object o) { return o instanceof Number ? ((Number) o).intValue() : 0; }

    /** Waze's total remaining distance to the destination, read from its field; 0 if unavailable. */
    private int readRemaining() {
        if (remainingField == null) return 0;
        try { return remainingField.getInt(managerInstance); } catch (Throwable t) { return 0; }
    }

    private static Object defaultReturn(Class<?> t) {
        if (!t.isPrimitive() || t == void.class) return null;
        if (t == boolean.class) return false;
        if (t == int.class || t == short.class || t == byte.class) return 0;
        if (t == long.class) return 0L;
        if (t == float.class) return 0f;
        if (t == double.class) return 0d;
        if (t == char.class) return '\0';
        return null;
    }

    /** Coalesces Waze's frequent updates to at most one notification per second. */
    private void changed() {
        main.post(new Runnable() {
            @Override public void run() {
                if (scheduled) return;
                scheduled = true;
                long wait = lastPost + MIN_INTERVAL_MS - SystemClock.uptimeMillis();
                main.postDelayed(post, Math.max(0, wait));
            }
        });
    }

    private final Runnable post = new Runnable() {
        @Override public void run() {
            scheduled = false;
            lastPost = SystemClock.uptimeMillis();
            try {
                publish();
            } catch (Throwable t) {
                Log.w(TAG, "publish failed", t);
            }
        }
    };

    private void publish() {
        if (!navigating) {
            if (showing) nm.cancel(NOTIFICATION_ID);
            showing = false;
            return;
        }
        // Clean separate fields so QuickSettings owns the layout: distance (title), road (text),
        // ETA + remaining distance (subText), arrow (large icon), lanes (big picture).
        String instr = instruction;
        String title = NavText.distance(distMeters);
        String street = nextStreet;
        String text = NavText.instruction(instr, street,
                street.trim().isEmpty() ? translate(NavText.promptKey(instr, exit)) : null);
        if (title.isEmpty() && text.isEmpty()) return;

        Notification.Builder b = new Notification.Builder(app, CHANNEL)
                .setSmallIcon(smallIcon())
                .setContentTitle(title.isEmpty() ? text : title)
                .setContentText(title.isEmpty() ? null : text)
                .setCategory(Notification.CATEGORY_NAVIGATION)
                .setOngoing(true)
                .setOnlyAlertOnce(true)
                .setShowWhen(false)
                .setVisibility(Notification.VISIBILITY_PUBLIC);
        String sub = NavText.join(NavText.eta(etaMinutes), NavText.remaining(readRemaining()));
        if (!sub.isEmpty()) b.setSubText(sub);
        Bitmap arrow = arrow(NavText.drawableFor(instr), NavText.exitLabel(instr, exit));
        if (arrow != null) b.setLargeIcon(arrow);
        Bitmap lanePic = lanesBitmap();
        if (lanePic != null) b.setStyle(new Notification.BigPictureStyle().bigPicture(lanePic));
        Intent launch = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
        if (launch != null) {
            b.setContentIntent(PendingIntent.getActivity(app, 0, launch,
                    PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT));
        }
        // Lets you confirm the fields on the car (where real navigation runs): adb logcat -s WazeNavNotifier
        Log.i(TAG, "nav title='" + title + "' text='" + text + "' sub='" + sub + "' lanes=" + (lanePic != null));
        nm.notify(NOTIFICATION_ID, b.build());
        showing = true;
    }

    private int smallIcon() {
        int id = app.getResources().getIdentifier("notification", "drawable", app.getPackageName());
        return id != 0 ? id : app.getApplicationInfo().icon;
    }

    /** Waze's arrow drawable, with the roundabout exit number in its middle the way Waze's turn box draws it. */
    private Bitmap arrow(String resName, String label) {
        if (resName == null) return null;
        String key = label == null ? resName : resName + "#" + label;
        if (icons.containsKey(key)) return icons.get(key);
        Bitmap bmp = null;
        int id = app.getResources().getIdentifier(resName, "drawable", app.getPackageName());
        if (id != 0) {
            Drawable d = app.getDrawable(id);
            if (d != null) {
                bmp = Bitmap.createBitmap(ICON_PX, ICON_PX, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(bmp);
                d.setBounds(0, 0, ICON_PX, ICON_PX);
                d.draw(canvas);
                if (label != null) {
                    Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
                    int cid = app.getResources().getIdentifier("navBar_main_text", "color", app.getPackageName());
                    p.setColor(cid != 0 ? app.getColor(cid) : Color.WHITE);
                    p.setTypeface(Typeface.DEFAULT_BOLD);
                    p.setTextSize(ICON_PX * 0.3f);
                    p.setTextAlign(Paint.Align.CENTER);
                    canvas.drawText(label, ICON_PX / 2f, ICON_PX / 2f - (p.ascent() + p.descent()) / 2f, p);
                }
            }
        }
        icons.put(key, bmp);
        return bmp;
    }

    /** The lane strip for the current lanes, redrawn only when Waze sends new ones. */
    private Bitmap lanesBitmap() {
        LaneStrip.Lanes l = lanes;
        if (l != lanesDrawn) {
            lanesDrawn = l;
            lanesBmp = l == null ? null : LaneStrip.draw(app, l);
        }
        return lanesBmp;
    }

    /** Waze's display string {@code DS_<key>} in Waze's own language, or null. */
    private String translate(String key) {
        if (key == null || langMissing) return null;
        try {
            if (langGet == null) {
                Class<?> nm = Class.forName("com.waze.NativeManager");
                nativeManager = nm.getMethod("getInstance").invoke(null);
                langGet = nm.getDeclaredMethod("langGetIntNTV", int.class);
                langGet.setAccessible(true);
            }
            int id = Class.forName("com.waze.strings.DisplayStrings").getField("DS_" + key).getInt(null);
            Object s = langGet.invoke(nativeManager, id);
            return s == null ? null : s.toString();
        } catch (Throwable t) {
            if (langGet == null) langMissing = true;   // no translator in this Waze: English fallback from now on
            Log.w(TAG, "no translation for " + key + ": " + t);
            return null;
        }
    }
}
