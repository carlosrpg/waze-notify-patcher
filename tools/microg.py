"""microG support: point Waze's bundled Play-services client at microG (ReVanced/Morphe GmsCore) instead of Google's.

Usage: python -I microg.py <decoded apk dir> [vendor]     (vendor default: app.revanced, i.e. app.revanced.android.gms)

The same changes as ReVanced/Morphe's "GmsCore support" patch, found by stable strings, not obfuscated names:
1. String literals naming Google's services package, and the permissions, actions and provider authorities microG
   serves under its own name, move from com.google.* to <vendor>.* (content:// URIs too).
2. GooglePlayServicesUtil's availability check (the method that logs "...but their signature is invalid.") returns
   0 (SUCCESS): it would reject microG's signature, and the missing Play Store.
3. Every boolean check of GoogleSignatureVerifier returns true, so the client trusts microG's service.
4. androidx credentials (Waze's "Log in with Google") takes the sign-in routes microG serves: with 2. it would think
   microG new enough (PRE_U_MIN_GMS_APK_VERSION) for the identity-credentials route, which microG answers at once
   with an error ("Can't connect to Google").
5. AuthorizationRequest's forceCodeForRefreshToken is cleared, so microG returns Waze's server auth code without
   its consent screen: that screen rejects a renamed app ("package name mismatch": microG builds it for the spoofed
   com.waze but checks the real caller). Same Google account and scopes, consented at sign-in.
The manifest side (spoof meta-data, queries, c2dm names) is rename_package.add_microg, run by assemble.py.
"""
import pathlib
import re
import sys

# after "com.google.": the names microG answers under its vendor id (ReVanced GmsCoreSupportPatch's lists)
NAMES = [
    "android.gms",
    # permissions
    "android.c2dm.permission.RECEIVE", "android.c2dm.permission.SEND", "android.gms.auth.api.phone.permission.SEND",
    "android.gms.permission.AD_ID", "android.gms.permission.AD_ID_NOTIFICATION", "android.gms.permission.CAR_FUEL",
    "android.gms.permission.CAR_INFORMATION", "android.gms.permission.CAR_MILEAGE", "android.gms.permission.CAR_SPEED",
    "android.gms.permission.CAR_VENDOR_EXTENSION", "android.googleapps.permission.GOOGLE_AUTH",
    "android.googleapps.permission.GOOGLE_AUTH.cp", "android.googleapps.permission.GOOGLE_AUTH.local",
    "android.googleapps.permission.GOOGLE_AUTH.mail", "android.googleapps.permission.GOOGLE_AUTH.writely",
    "android.gtalkservice.permission.GTALK_SERVICE", "android.providers.gsf.permission.READ_GSERVICES",
    # actions
    "android.c2dm.intent.RECEIVE", "android.c2dm.intent.REGISTER", "android.c2dm.intent.UNREGISTER",
    "android.contextmanager.service.ContextManagerService.START", "android.gcm.intent.SEND",
    "android.gms.accounts.ACCOUNT_SERVICE", "android.gms.accountsettings.ACCOUNT_PREFERENCES_SETTINGS",
    "android.mobstore.service.START", "iid.TOKEN_REQUEST", "android.gms.location.places.ui.PICK_PLACE",
]
AUTHORITIES = ["android.gms.auth.accounts", "android.gms.chimera", "android.gms.fonts", "android.gms.phenotype",
               "android.gsf.gservices", "android.gsf.subscribedfeeds", "settings"]
NAMES += AUTHORITIES

AVAILABILITY = "requires Google Play services, but their signature is invalid."
VERIFIER = '"GoogleSignatureVerifier"'


def rename(text, vendor):
    """String literals: the listed names exactly, and content:// URIs on the listed authorities."""
    def literal(m):
        s = m.group(1)
        for n in NAMES:
            if s == "com.google." + n:
                return f'"{vendor}.{n}"'
        for a in AUTHORITIES:
            p = "content://com.google." + a
            if s == p or s.startswith(p + "/"):
                return f'"content://{vendor}.{a}{s[len(p):]}"'
        return m.group(0)
    return re.sub(r'"((?:content://)?com\.google\.[^"\\]*)"', literal, text)


def force_return(text, signature, value):
    """Make every method matching signature (a regex on the .method line) return the constant value first."""
    count = 0

    def body(m):
        nonlocal count
        count += 1
        locals_ = max(int(m.group(2)), 1)
        # method annotations and params must stay before the first instruction
        return f"{m.group(1)}    .locals {locals_}\n{m.group(3)}    const/4 v0, {value}\n    return v0\n"
    text = re.sub(r"(^\.method [^\n]*" + signature + r"\n)\s*\.locals (\d+)\n"
                  r"((?:\s*\.(?:annotation|param)\b(?:(?!\.method ).)*?\.end (?:annotation|param)\n)*)",
                  body, text, flags=re.M | re.S)
    return text, count


CREDENTIALS = "androidx/credentials/playservices/CredentialProviderPlayServicesImpl.smali"


def legacy_sign_in(text):
    """isAvailableOnDevice(PRE_U_MIN_GMS_APK_VERSION) reads false (the constant is inlined: matched by its value)."""
    value = re.search(r"PRE_U_MIN_GMS_APK_VERSION:I = (0x[0-9a-f]+)", text).group(1)
    return re.subn(r"(\n\s*const v\d+, " + value + r"\n(?:(?!\s*invoke)[^\n]*\n)*"
                   r"\s*invoke-virtual \{p0, v\d+\}, [^\n]*->isAvailableOnDevice\(I\)Z\n"
                   r"(?:(?!\s*move-result)[^\n]*\n)*\s*move-result (\w+)\n)", r"\1    const/4 \2, 0x0\n", text)


AUTHORIZATION = "com/google/android/gms/auth/api/identity/AuthorizationRequest.smali"
# Play services' AuthorizationRequest(scopes, serverClientId, serverAuthCode, idToken, account, hostedDomain,
# sessionId, forceCodeForRefreshToken, ...): the flag is p8
AUTHORIZATION_INIT = (r"^(\.method constructor <init>\(Ljava/util/List;Ljava/lang/String;ZZLandroid/accounts/Account;"
                      r"Ljava/lang/String;Ljava/lang/String;Z[^\n]*\)V\n\s*\.locals \d+\n)")


SIGNED_IN = '"Signed in with Google. User ID: "'
GRANTED = '"Scopes access granted."'
SKIP = r"(?:\s*\.line \d+\n|\s*\n)*"


def server_code_login(text):
    """Waze's Google login asks microG for the server auth code through AccountManager (MicrogAuth.authorize).

    After "Signed in with Google" Waze builds an AuthorizationRequest and posts it (controller.w(new <state>(this,
    request))) to Play services' authorization API, which microG breaks for a renamed app. This replaces the post with
    MicrogAuth.authorize(this, controller, email, request, "<model getter>,<next step>,<error popup>"); the two names come from what
    Waze does with a code ("Scopes access granted.": controller.<getter>() -> UidModel.setAuthParameters; <next>()).
    Returns (text, count).
    """
    granted = text.index(GRANTED)
    getter = re.compile(r"invoke-virtual \{\w+\}, L[^;]+;->(\w+)\(\)L[^;]+;\n" + SKIP + r"\s*move-result-object \w+\n" + SKIP
                        + r"\s*check-cast \w+, Lcom/waze/uid/UidModel;").search(text, granted).group(1)
    proceed = re.compile(r"UidModel;->setAuthParameters\([^)]*\)V\n" + SKIP
                         + r"\s*invoke-virtual \{p0\}, L[^;]+;->(\w+)\(\)Z").search(text, granted).group(1)
    # Waze's "Google sign-in error" popup: what it calls when the code is missing
    error = re.compile(r'"Authorization error: serverAuthCode is empty"\n(?:[^\n]*\n){0,8}?'
                       r"\s*invoke-direct \{p0\}, L[^;]+;->(\w+)\(\)V").search(text, granted).group(1)
    # the log "Signed in with Google. User ID: " + id + ", name=" ...: the id (the account's email) is the append
    # just before ", name=", read from the credential by a getter shortly before
    signed, name = text.index(SIGNED_IN), text.index('", name="')
    email = list(re.finditer(r"invoke-virtual \{v\d+, (\w+)\}, Ljava/lang/StringBuilder;->append", text[signed:name]))[-1].group(1)
    getters = list(re.finditer(r"invoke-virtual \{(\w+)\}, (L[^;]+;)->(\w+)\(\)Ljava/lang/String;\n" + SKIP
                               + r"\s*move-result-object " + email + r"\n", text[signed:name]))
    cred, cred_class, cred_get = getters[-1].groups()
    post = (r"\n\s*new-instance (v\d+), L[^;]+;\n" + SKIP
            + r"\s*invoke-direct \{\1, p0, (p\d)\}, L[^;]+;-><init>\(L[^;]+;Lcom/google/android/gms/auth/api/identity/AuthorizationRequest;\)V\n"
            + r"(?:(?!\s*invoke)[^\n]*\n)*\s*invoke-virtual \{(v\d+), \1\}, L[^;]+;->w\(L[^;]+;\)V\n")
    m = re.compile(post).search(text, name)
    if not m:
        return text, 0
    request, controller = m.group(2), m.group(3)
    # v9..v13: free here (the method has .locals 14 and only returns after this branch); the credential is still live
    code = f"""
    move-object v9, p0
    move-object v10, {controller}
    invoke-virtual {{{cred}}}, {cred_class}->{cred_get}()Ljava/lang/String;
    move-result-object v11
    move-object v12, {request}
    const-string v13, "{getter},{proceed},{error}"
    invoke-static/range {{v9 .. v13}}, Lcom/carlosrpg/wazenotify/MicrogAuth;->authorize(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
"""
    return text[:m.start()] + code + text[m.end():], 1


def main(base, vendor="app.revanced"):
    files = list(pathlib.Path(base).glob("smali*/**/*.smali"))
    renamed = availability = verifier = credentials = authorization = server_code = 0
    for f in files:
        text = f.read_text(encoding="utf-8")
        new = rename(text, vendor)
        renamed += new != text
        if AVAILABILITY in new:
            new, n = force_return(new, r" \w+\(Landroid/content/Context;I\)I", "0x0")
            availability += n
        if VERIFIER in new and "Package has more than one signature." in new:
            new, n = force_return(new, r"\)Z", "0x1")
            verifier += n
        if f.as_posix().endswith(CREDENTIALS):
            new, credentials = legacy_sign_in(new)
        if f.as_posix().endswith(AUTHORIZATION):
            new, authorization = re.subn(AUTHORIZATION_INIT, r"\1    const/4 p8, 0x0\n", new, flags=re.M)
        if SIGNED_IN in new:
            new, server_code = server_code_login(new)
        if new != text:
            f.write_text(new, encoding="utf-8")
    # fail loudly: a Waze that moved these checks would otherwise build and silently refuse microG
    assert renamed, "no com.google.android.gms literal found"
    assert availability == 1, f"GooglePlayServicesUtil availability check: {availability} matches, expected 1"
    assert verifier >= 3, f"GoogleSignatureVerifier: only {verifier} boolean checks found"
    assert credentials >= 1, "androidx credentials: no isAvailableOnDevice(PRE_U_MIN_GMS_APK_VERSION) call found"
    assert authorization == 1, "AuthorizationRequest constructor not found"
    assert server_code == 1, "Waze's Google login: the authorization step after 'Signed in with Google' not found"
    print(f"microG ({vendor}.android.gms): {renamed} files renamed, availability check forced, "
          f"{verifier} signature checks forced, {credentials} credential routes moved to sign-in")
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:3]))
