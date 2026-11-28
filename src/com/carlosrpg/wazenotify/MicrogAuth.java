package com.carlosrpg.wazenotify;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerCallback;
import android.accounts.AccountManagerFuture;
import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Waze's Google login on microG, for a renamed app (tools/microg.py calls this instead of Waze's authorize step).
 *
 * After the ID token, Waze asks Play services' authorization API for a server auth code and sends it to its server.
 * microG's authorization service breaks for a renamed app (it looks the spoofed package com.waze up as installed), so
 * this asks microG for the same code through AccountManager ("oauth2:server:client_id:...:api_scope:..."), where
 * microG starts from the real caller and presents com.waze to Google. Then it does what Waze does with the code:
 * UidModel.setAuthParameters(GOOGLE, code, CODE) and the state's next step. The first time, microG asks the user to
 * allow Waze; the request is repeated once the user is back in Waze. Waze's obfuscated names come as arguments.
 */
public final class MicrogAuth {
    private static final String TAG = "WazeMicrogAuth";
    private static final String ACCOUNT_TYPE = "app.revanced";   // microG's (ReVanced / MicroG-RE) account type

    private MicrogAuth() {}

    /**
     * @param state      Waze's Google login state
     * @param controller the login controller
     * @param email      the signed-in Google account
     * @param request    the AuthorizationRequest Waze built (server client id and scopes)
     * @param names      "{controller's UidModel getter},{state's next step},{state's sign-in error popup}"
     */
    public static void authorize(Object state, Object controller, String email, Object request, String names) {
        String clientId = null;
        StringBuilder scopes = new StringBuilder();
        try {
            for (Field f : request.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object v = f.get(request);
                if (v instanceof String && ((String) v).endsWith(".apps.googleusercontent.com")) clientId = (String) v;
                if (v instanceof List && scopes.length() == 0) {
                    for (Object s : (List<?>) v) scopes.append(scopes.length() == 0 ? "" : " ").append(s);   // Scope.toString() is its uri
                }
            }
        } catch (Exception e) {
            fail(state, names, "cannot read the authorization request", e);
            return;
        }
        request(state, controller, new Account(email, ACCOUNT_TYPE),
                "oauth2:server:client_id:" + clientId + ":api_scope:" + scopes, names, true);
    }

    private static void request(final Object state, final Object controller, final Account account, final String type,
                                final String names, final boolean mayAskConsent) {
        final Application app = app();
        Log.i(TAG, "requesting the server auth code from microG: " + type);
        AccountManager.get(app).getAuthToken(account, type, null, false, new AccountManagerCallback<Bundle>() {
            @Override
            public void run(AccountManagerFuture<Bundle> future) {
                try {
                    Bundle b = future.getResult();
                    Intent consent = b.getParcelable(AccountManager.KEY_INTENT);
                    if (consent == null) {
                        proceed(state, controller, b.getString(AccountManager.KEY_AUTHTOKEN), names);
                    } else if (mayAskConsent) {
                        Log.i(TAG, "microG asks the user to allow Waze");
                        retryWhenBack(app, state, controller, account, type, names);
                        app.startActivity(consent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                    } else {
                        fail(state, names, "not allowed in microG", null);
                    }
                } catch (Exception e) {
                    fail(state, names, "no server auth code from microG", e);
                }
            }
        }, new Handler(Looper.getMainLooper()));
    }

    /** Once the consent screen has closed and a Waze screen is back, ask again (without a second consent). */
    private static void retryWhenBack(final Application app, final Object state, final Object controller,
                                      final Account account, final String type, final String names) {
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                app.unregisterActivityLifecycleCallbacks(this);
                request(state, controller, account, type, names, false);
            }

            @Override public void onActivityCreated(Activity activity, Bundle saved) {}
            @Override public void onActivityStarted(Activity activity) {}
            @Override public void onActivityPaused(Activity activity) {}
            @Override public void onActivityStopped(Activity activity) {}
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle out) {}
            @Override public void onActivityDestroyed(Activity activity) {}
        });
    }

    private static void proceed(Object state, Object controller, String code, String names) throws Exception {
        if (code == null) throw new IllegalStateException("empty auth code");
        String[] n = names.split(",");
        Object model = call(controller, n[0]);
        Class<?> tokenType = Class.forName("com.waze.sharedui.api.AuthTokenType");
        Class<?> community = Class.forName("com.waze.uid.state_impl.util.InstallParameters$Community");
        @SuppressWarnings({"unchecked", "rawtypes"})
        Object google = Enum.valueOf((Class) community, "GOOGLE");
        String api = (String) community.getField("apiName").get(google);
        @SuppressWarnings({"unchecked", "rawtypes"})
        Object codeType = Enum.valueOf((Class) tokenType, "CODE");
        Class<?> paramsClass = Class.forName("com.waze.sharedui.api.AuthParameters");
        Object params = paramsClass.getConstructor(String.class, String.class, tokenType, boolean.class)
                .newInstance(api, code, codeType, false);
        model.getClass().getMethod("setAuthParameters", paramsClass).invoke(model, params);
        call(state, n[1]);
        Log.i(TAG, "server auth code handed to Waze");
    }

    /** Logs and shows Waze's own sign-in error popup, so the login screen does not wait forever. */
    private static void fail(Object state, String names, String why, Exception e) {
        Log.w(TAG, why, e);
        try {
            call(state, names.split(",")[2]);
        } catch (Exception popup) {
            Log.w(TAG, "cannot show Waze's sign-in error", popup);
        }
    }

    /** The zero-argument method {@code name} of obj, from its class or a superclass. */
    private static Object call(Object obj, String name) throws Exception {
        for (Class<?> c = obj.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(name);
                m.setAccessible(true);
                return m.invoke(obj);
            } catch (NoSuchMethodException ignored) {
                // look in the superclass
            }
        }
        throw new NoSuchMethodException(obj.getClass().getName() + "." + name + "()");
    }

    private static Application app() {
        if (ClusterLayout.app != null) return ClusterLayout.app;
        try {
            return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }
}
