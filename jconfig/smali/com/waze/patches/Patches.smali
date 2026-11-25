.class public final Lcom/waze/patches/Patches;
.super Ljava/lang/Object;
.source "Patches.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/waze/patches/Patches$DisplayMetricsOverrideState;
    }
.end annotation


# static fields
.field public static final CAMERA_BOTTOM_OFFSET_FROM_RESIZED_VIEW_PCT:F = 0.15f

.field public static final CAMERA_EXTRA_BOTTOM_OFFSET_FROM_SCREEN_PCT:F = 0.07f

.field public static final CAMERA_EXTRA_LEFT_MARGIN_PX:I = 0x0

.field private static final DEBUG_OVERLAY_BG_COLOR:I = -0x48000000

.field private static final DEBUG_OVERLAY_REFRESH_MS:J = 0x1f4L

.field private static final DEBUG_OVERLAY_TAG:Ljava/lang/String; = "patches_debug_overlay"

.field private static final DEBUG_OVERLAY_TEXT_COLOR:I = -0x7070e

.field private static final DEBUG_OVERLAY_TEXT_SIZE_SP:F = 18.0f

.field private static final DEBUG_TOGGLE_BG_DISABLED_COLOR:I = -0x3393e0e1

.field private static final DEBUG_TOGGLE_BG_ENABLED_COLOR:I = -0x33eba5ce

.field private static final DEBUG_TOGGLE_TAG:Ljava/lang/String; = "patches_debug_toggle"

.field private static final DEBUG_TOGGLE_TEXT_SIZE_SP:F = 12.0f

.field public static DISABLE_AAP_MOBILE_DATA_WHILE_CONNECTED:Z = false

.field public static final ETA_COLLAPSED_HEIGHT_RATIO:F = 0.35f

.field private static final ETA_CONTROL_PANEL_VIEW_CLASS:Ljava/lang/String; = "com.waze.main_screen.bottom_bars.scrollable_eta.EtaControlPanelView"

.field private static final ETA_GO_DELAY_MS:J = 0x32L

.field public static final FORCED_DENSITY:F = 2.0f

.field public static final FORCED_DENSITY_DPI:I = 0x140

.field public static final FORCED_SCALED_DENSITY:F = 2.0f

.field public static final FORCED_XDPI:F = 320.0f

.field public static final FORCED_YDPI:F = 320.0f

.field public static final FORCE_XHDPI_METRICS:Z = true

.field private static final FULLSCREEN_ROW_BG_DARK:I = -0xdfdedc

.field private static final FULLSCREEN_ROW_BG_LIGHT:I = -0x60505

.field private static final FULLSCREEN_STATE_OFF_BG_DARK:I = -0xa29c96

.field private static final FULLSCREEN_STATE_OFF_BG_LIGHT:I = -0x908b86

.field private static final FULLSCREEN_STATE_ON_BG:I = -0xff601d

.field private static final FULLSCREEN_STATE_TAG:Ljava/lang/String; = "patches_fullscreen_state"

.field private static final FULLSCREEN_SUBTITLE_DARK:I = -0x47423e

.field private static final FULLSCREEN_SUBTITLE_LIGHT:I = -0xa09c98

.field private static final FULLSCREEN_SUBTITLE_TAG:Ljava/lang/String; = "patches_fullscreen_subtitle"

.field private static final FULLSCREEN_SYSTEM_UI_FLAGS:I = 0x1606

.field private static final FULLSCREEN_TITLE_DARK:I = -0x1

.field private static final FULLSCREEN_TITLE_LIGHT:I = -0xdfdedc

.field private static final FULLSCREEN_TITLE_TAG:Ljava/lang/String; = "patches_fullscreen_title"

.field private static final FULLSCREEN_TOGGLE_TAG:Ljava/lang/String; = "patches_fullscreen_toggle"

.field public static IS_AUTOMOTIVE_OS:Z = false

.field public static final NARROW_SCREEN_MAX_HEIGHT_PX:I = 0x3e8

.field private static final NAVIGATION_BROADCAST_ACTION:Ljava/lang/String; = "com.frodrigues.jconfig.WAZE_NAVIGATION_UPDATE"

.field private static final NAVIGATION_BROADCAST_PACKAGE:Ljava/lang/String; = "com.frodrigues.jconfig"

.field private static final NAV_BAR_CLASS_CANDIDATES:[Ljava/lang/String;

.field private static final NAV_BAR_INSTRUCTION_VIEW_CLASS:Ljava/lang/String; = "com.waze.navbar.InstructionView"

.field private static final NAV_BAR_LANE_GUIDANCE_VIEW_CLASS:Ljava/lang/String; = "com.waze.ui.navbar.LaneGuidanceView"

.field private static final NAV_BAR_TEXT_VIEW_CLASS:Ljava/lang/String; = "com.waze.view.navbar.NavBarText"

.field public static final NAV_MARGIN_FROM_TOP_PCT:F = 0.11f

.field public static volatile NAV_SCALE:F = 0.0f

.field public static final NAV_TARGET_X_PCT:F = 0.5f

.field private static final PATCH_PREF_FULLSCREEN:Ljava/lang/String; = "fullscreen"

.field private static final PATCH_SETTINGS_PREFS_NAME:Ljava/lang/String; = "waze_patches_settings"

.field public static final ROOT_SHIFT_X_PCT:F = 0.0f

.field public static final ROOT_SHIFT_Y_PCT:F = 0.0f

.field public static final ROOT_VIEW_SCALE:F = 1.0f

.field private static final TEMP_CAMERA_LOGS:Z = false

.field private static final TEMP_CAMERA_LOG_TAG:Ljava/lang/String; = "vadim_cam"

.field private static final isDebug:Z = false

.field private static volatile sApplication:Landroid/app/Application; = null

.field private static volatile sBroadcastCurrentInstruction:Ljava/lang/String; = null

.field private static volatile sBroadcastCurrentRoadSignPrimary:Ljava/lang/String; = null

.field private static volatile sBroadcastCurrentRoadSignSecondary:Ljava/lang/String; = null

.field private static volatile sBroadcastCurrentRoadSignText:Ljava/lang/String; = null

.field private static volatile sBroadcastCurrentStreetName:Ljava/lang/String; = null

.field private static volatile sBroadcastCurrentStreetSegmentIdx:I = 0x0

.field private static volatile sBroadcastCurrentStreetShowHov:Z = false

.field private static volatile sBroadcastEtaDistance:Ljava/lang/String; = null

.field private static volatile sBroadcastEtaDistanceMeters:I = 0x0

.field private static volatile sBroadcastEtaDistanceUnit:Ljava/lang/String; = null

.field private static volatile sBroadcastEtaDistanceUnitName:Ljava/lang/String; = null

.field private static volatile sBroadcastEtaDistanceUnitValue:I = 0x0

.field private static volatile sBroadcastEtaDistanceValue:D = 0.0

.field private static volatile sBroadcastEtaMinutes:I = 0x0

.field private static volatile sBroadcastEtaTime:Ljava/lang/String; = null

.field private static volatile sBroadcastEtaTimeUnit:Ljava/lang/String; = null

.field private static volatile sBroadcastInstructionDistance:Ljava/lang/String; = null

.field private static volatile sBroadcastInstructionDistanceMeters:I = 0x0

.field private static volatile sBroadcastInstructionDistanceUnit:Ljava/lang/String; = null

.field private static volatile sBroadcastInstructionDistanceUnitName:Ljava/lang/String; = null

.field private static volatile sBroadcastInstructionDistanceUnitValue:I = 0x0

.field private static volatile sBroadcastInstructionDistanceValue:D = 0.0

.field private static volatile sBroadcastNavigationStateCode:I = 0x0

.field private static volatile sBroadcastNextInstruction:Ljava/lang/String; = null

.field private static volatile sBroadcastNextRoadSignPrimary:Ljava/lang/String; = null

.field private static volatile sBroadcastNextRoadSignSecondary:Ljava/lang/String; = null

.field private static volatile sBroadcastNextRoadSignText:Ljava/lang/String; = null

.field private static volatile sBroadcastNextStreetArrowBeforeText:Z = false

.field private static volatile sBroadcastNextStreetName:Ljava/lang/String; = null

.field private static volatile sBroadcastNextStreetSegmentIdx:I = 0x0

.field private static volatile sCameraAnchorReapplyRootRef:Ljava/lang/ref/WeakReference; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sCameraAnchorReapplyRunnable:Ljava/lang/Runnable; = null

.field private static volatile sCameraBottomOffsetRatio:F = 0.0f

.field private static final sConfigCallbackInstalled:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sCurrentMainActivityRef:Ljava/lang/ref/WeakReference; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sDebugOverlayRefreshRunnable:Ljava/lang/Runnable; = null

.field private static volatile sDisplayHeightPx:I = 0x0

.field private static volatile sDisplayId:I = 0x0

.field private static final sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/res/Resources;",
            "Lcom/waze/patches/Patches$DisplayMetricsOverrideState;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sDisplayWidthPx:I = 0x0

.field private static volatile sEtaCollapsedHeightRatio:F = 0.0f

.field private static volatile sEtaCollapsedNewHeightPx:I = 0x0

.field private static volatile sEtaControlPanelClass:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static volatile sEtaGoDelay:J = 0x0L

.field private static volatile sEtaGoTapMethod:Ljava/lang/reflect/Method; = null

.field private static volatile sEtaGoTapOwnerClass:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static volatile sEtaHeightCollapsedPx:I = 0x0

.field private static volatile sFullscreenEnabled:Z = false

.field private static volatile sInitDone:Z = false

.field private static volatile sIsDebugOverlayEnabled:Z = false

.field private static final sIsEmulator:Z = false

.field private static volatile sIsEtaAutoGoInvoked:Z = false

.field private static volatile sIsExpanded:Z = false

.field private static volatile sIsInSteeringDisplay:Z = false

.field private static volatile sIsLandscape:Z = false

.field private static volatile sIsMyCarActive:Z = false

.field private static volatile sIsNarrowDisplay:Z = false

.field private static volatile sIsNavBarExists:Z = false

.field private static volatile sIsNavigating:Z = false

.field private static volatile sIsWindowMode5Or6:Z = false

.field private static volatile sIsXhdpiEmulationActive:Z = false

.field private static volatile sLastCameraDelegatorRef:Ljava/lang/ref/WeakReference; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sLastCameraTop:I = 0x0

.field private static volatile sMarginsOwnerClass:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static volatile sNativeUpdateMarginsPixelsMethod:Ljava/lang/reflect/Method; = null

.field private static volatile sNavBarClass:Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static volatile sNavBarResolveFailureLogged:Z = false

.field private static volatile sNavKeepRunnable:Ljava/lang/Runnable; = null

.field private static volatile sNewCameraBottom:I = 0x0

.field private static volatile sNewCameraLeft:I = 0x0

.field private static volatile sNewCameraRight:I = 0x0

.field private static volatile sPreviousActivityDisplayId:I = 0x0

.field private static volatile sPreviousEtaDisplayId:I = 0x0

.field private static final sResizeListenerInstalled:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sResizedRootHeight:I = 0x0

.field private static volatile sRoadEventsRemoveRootRef:Ljava/lang/ref/WeakReference; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sRoadEventsRemoveRunnable:Ljava/lang/Runnable; = null

.field private static volatile sViewHeight:I = 0x0

.field private static final version:Ljava/lang/String; = "waze-v5.17.10.0.16-prod"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 44
    const v0, 0x3f19999a    # 0.6f

    sput v0, Lcom/waze/patches/Patches;->NAV_SCALE:F

    .line 97
    const/4 v0, 0x0

    sput-boolean v0, Lcom/waze/patches/Patches;->IS_AUTOMOTIVE_OS:Z

    .line 98
    const/4 v1, 0x1

    sput-boolean v1, Lcom/waze/patches/Patches;->DISABLE_AAP_MOBILE_DATA_WHILE_CONNECTED:Z

    .line 99
    const-string v2, "j8.j"

    const-string v3, "e8.j"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/waze/patches/Patches;->NAV_BAR_CLASS_CANDIDATES:[Ljava/lang/String;

    .line 107
    sput-boolean v0, Lcom/waze/patches/Patches;->sInitDone:Z

    .line 109
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    .line 110
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    .line 111
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsNavBarExists:Z

    .line 112
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsExpanded:Z

    .line 113
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsXhdpiEmulationActive:Z

    .line 114
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsLandscape:Z

    .line 115
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    .line 116
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsWindowMode5Or6:Z

    .line 117
    sput-boolean v0, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    .line 118
    const/4 v2, -0x1

    sput v2, Lcom/waze/patches/Patches;->sDisplayHeightPx:I

    .line 119
    sput v2, Lcom/waze/patches/Patches;->sDisplayWidthPx:I

    .line 122
    sput-boolean v0, Lcom/waze/patches/Patches;->sNavBarResolveFailureLogged:Z

    .line 124
    sput v2, Lcom/waze/patches/Patches;->sViewHeight:I

    .line 125
    sput v2, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    .line 126
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    .line 127
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsDebugOverlayEnabled:Z

    .line 128
    sput-boolean v1, Lcom/waze/patches/Patches;->sIsEtaAutoGoInvoked:Z

    .line 129
    const/4 v1, 0x0

    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastCurrentInstruction:Ljava/lang/String;

    .line 130
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastNextInstruction:Ljava/lang/String;

    .line 131
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastInstructionDistance:Ljava/lang/String;

    .line 132
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnit:Ljava/lang/String;

    .line 133
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitName:Ljava/lang/String;

    .line 134
    sput v2, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitValue:I

    .line 135
    sput v2, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceMeters:I

    .line 136
    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    sput-wide v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceValue:D

    .line 137
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastEtaTime:Ljava/lang/String;

    .line 138
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastEtaTimeUnit:Ljava/lang/String;

    .line 139
    sput v2, Lcom/waze/patches/Patches;->sBroadcastEtaMinutes:I

    .line 140
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastEtaDistance:Ljava/lang/String;

    .line 141
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnit:Ljava/lang/String;

    .line 142
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitName:Ljava/lang/String;

    .line 143
    sput v2, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitValue:I

    .line 144
    sput v2, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceMeters:I

    .line 145
    sput-wide v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceValue:D

    .line 146
    sput v2, Lcom/waze/patches/Patches;->sBroadcastNavigationStateCode:I

    .line 147
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetName:Ljava/lang/String;

    .line 148
    sput v2, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetSegmentIdx:I

    .line 149
    sput-boolean v0, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetShowHov:Z

    .line 150
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignText:Ljava/lang/String;

    .line 151
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignPrimary:Ljava/lang/String;

    .line 152
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignSecondary:Ljava/lang/String;

    .line 153
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastNextStreetName:Ljava/lang/String;

    .line 154
    sput v2, Lcom/waze/patches/Patches;->sBroadcastNextStreetSegmentIdx:I

    .line 155
    sput-boolean v0, Lcom/waze/patches/Patches;->sBroadcastNextStreetArrowBeforeText:Z

    .line 156
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignText:Ljava/lang/String;

    .line 157
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignPrimary:Ljava/lang/String;

    .line 158
    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignSecondary:Ljava/lang/String;

    .line 159
    const/4 v3, 0x0

    sput v3, Lcom/waze/patches/Patches;->sCameraBottomOffsetRatio:F

    .line 160
    const-wide/16 v4, -0x1

    sput-wide v4, Lcom/waze/patches/Patches;->sEtaGoDelay:J

    .line 161
    sput v0, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    .line 162
    sput v0, Lcom/waze/patches/Patches;->sNewCameraRight:I

    .line 163
    sput v0, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    .line 164
    sput v0, Lcom/waze/patches/Patches;->sLastCameraTop:I

    .line 165
    sput v2, Lcom/waze/patches/Patches;->sDisplayId:I

    .line 166
    sput v0, Lcom/waze/patches/Patches;->sPreviousEtaDisplayId:I

    .line 167
    const/16 v0, -0x63

    sput v0, Lcom/waze/patches/Patches;->sPreviousActivityDisplayId:I

    .line 168
    sput v2, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    .line 169
    sput v2, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    .line 170
    sput v3, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    .line 174
    sput-object v1, Lcom/waze/patches/Patches;->sApplication:Landroid/app/Application;

    .line 175
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    .line 176
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sLastCameraDelegatorRef:Ljava/lang/ref/WeakReference;

    .line 179
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRootRef:Ljava/lang/ref/WeakReference;

    .line 181
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRootRef:Ljava/lang/ref/WeakReference;

    .line 183
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/waze/patches/Patches;->sResizeListenerInstalled:Ljava/util/WeakHashMap;

    .line 184
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/waze/patches/Patches;->sConfigCallbackInstalled:Ljava/util/WeakHashMap;

    .line 185
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    .line 854
    sput-object v1, Lcom/waze/patches/Patches;->sMarginsOwnerClass:Ljava/lang/Class;

    .line 855
    sput-object v1, Lcom/waze/patches/Patches;->sNativeUpdateMarginsPixelsMethod:Ljava/lang/reflect/Method;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .line 29
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 29
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    return p0
.end method

.method static synthetic access$100()Z
    .locals 1

    .line 29
    invoke-static {}, Lcom/waze/patches/Patches;->isMyCarActive()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1000(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->attachOrUpdateDebugOverlay(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100()I
    .locals 1

    .line 29
    sget v0, Lcom/waze/patches/Patches;->sLastCameraTop:I

    return v0
.end method

.method static synthetic access$1200()I
    .locals 1

    .line 29
    sget v0, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    return v0
.end method

.method static synthetic access$1300()I
    .locals 1

    .line 29
    sget v0, Lcom/waze/patches/Patches;->sNewCameraRight:I

    return v0
.end method

.method static synthetic access$1400(Landroid/app/Activity;)Landroid/view/View;
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->getRootView(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->scheduleDynamicCameraAnchorReapply(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->syncDisplayMetricsOverride(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1700(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->attachRootLayoutListener(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1800(Landroid/app/Activity;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->attachConfigChangeListener(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$1900(Landroid/app/Activity;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeDebugOverlay(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$200()Z
    .locals 1

    .line 29
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsLandscape:Z

    return v0
.end method

.method static synthetic access$2000(Landroid/app/Activity;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeDebugToggleButton(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    .line 29
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsLandscape:Z

    return p0
.end method

.method static synthetic access$2100(Landroid/app/Activity;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeFullscreenToggle(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$2200()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 29
    sget-object v0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$2202(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 29
    sput-object p0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$2300(Landroid/view/View;)Z
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->isReadyForTransform(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2400(Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2500()Z
    .locals 1

    .line 29
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    return v0
.end method

.method static synthetic access$2502(Z)Z
    .locals 0

    .line 29
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    return p0
.end method

.method static synthetic access$2600(Landroid/app/Activity;)Z
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->isInSteeringDisplay(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2700(Landroid/view/View;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->startRoadEventsTabRemoveKeep(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$2800(Landroid/view/View;)Ljava/lang/String;
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempViewState(Landroid/view/View;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2900()Z
    .locals 1

    .line 29
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    return v0
.end method

.method static synthetic access$300(Landroid/app/Activity;)Z
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->isActivityLandscape(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3000()I
    .locals 1

    .line 29
    sget v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    return v0
.end method

.method static synthetic access$3100()I
    .locals 1

    .line 29
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    return v0
.end method

.method static synthetic access$3200()I
    .locals 1

    .line 29
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    return v0
.end method

.method static synthetic access$3300(Landroid/view/View;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->resetViewResize(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$3400(Landroid/view/View;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->resetNavBar(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$3500(Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    .line 29
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->applyNavBar(Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$3600(Landroid/view/View;)Z
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->applyNavBarTransform(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3700()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 29
    sget-object v0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRootRef:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$3702(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 29
    sput-object p0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRootRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$3800()Ljava/lang/Runnable;
    .locals 1

    .line 29
    sget-object v0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$3802(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 29
    sput-object p0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$3900(Landroid/view/View;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeRoadEventsTabIfWide(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$400(Landroid/app/Activity;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->rememberMainActivity(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$4000()Ljava/lang/ref/WeakReference;
    .locals 1

    .line 29
    sget-object v0, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRootRef:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$4002(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 29
    sput-object p0, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRootRef:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$4100()Ljava/lang/Runnable;
    .locals 1

    .line 29
    sget-object v0, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$4102(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 29
    sput-object p0, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$4200(Ljava/lang/String;)Z
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->applyDynamicCameraAnchor(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$4300()Z
    .locals 1

    .line 29
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsDebugOverlayEnabled:Z

    return v0
.end method

.method static synthetic access$4302(Z)Z
    .locals 0

    .line 29
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsDebugOverlayEnabled:Z

    return p0
.end method

.method static synthetic access$4400()Z
    .locals 1

    .line 29
    sget-boolean v0, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    return v0
.end method

.method static synthetic access$4500(Landroid/app/Activity;Z)V
    .locals 0

    .line 29
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->setFullscreenEnabled(Landroid/app/Activity;Z)V

    return-void
.end method

.method static synthetic access$500(Landroid/app/Activity;)Ljava/lang/String;
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempActivityName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Landroid/app/Activity;)I
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/app/Activity;)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Landroid/app/Activity;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->applyFullscreenSetting(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$900(Landroid/app/Activity;)V
    .locals 0

    .line 29
    invoke-static {p0}, Lcom/waze/patches/Patches;->attachOrUpdateFullscreenToggle(Landroid/app/Activity;)V

    return-void
.end method

.method public static applyCameraAnchor(Ljava/lang/Object;IIII)V
    .locals 11

    .line 859
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyCameraAnchor IN delegator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " in[t="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " b="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " l="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " r="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "] activeBefore="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v4, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " steer="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v4, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " nav="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v4, Lcom/waze/patches/Patches;->sIsNavigating:Z

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " resizedH="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v4, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " viewH="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v4, Lcom/waze/patches/Patches;->sViewHeight:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " extraBottom="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 866
    invoke-static {}, Lcom/waze/patches/Patches;->getCameraExtraBottomOffsetPx()I

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " etaOrig="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v5, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " etaNew="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v5, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " etaFloor="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 869
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 859
    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 873
    const/4 v0, 0x0

    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    .line 874
    invoke-static {v0, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    .line 875
    add-int/2addr p3, p4

    .line 877
    shr-int/lit8 p4, p3, 0x1

    add-int/2addr p4, v0

    .line 878
    if-gez p4, :cond_0

    .line 879
    move p4, v0

    .line 881
    :cond_0
    if-le p4, p3, :cond_1

    .line 882
    move p4, p3

    .line 885
    :cond_1
    sub-int v6, p3, p4

    .line 887
    invoke-static {}, Lcom/waze/patches/Patches;->isMyCarActive()Z

    move-result v7

    sput-boolean v7, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    .line 888
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 889
    sput v7, Lcom/waze/patches/Patches;->sLastCameraTop:I

    .line 890
    sget-boolean v8, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    const-string v9, " lastTop="

    if-nez v8, :cond_2

    .line 891
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "applyCameraAnchor OUT inactive out[t="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] totalX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    sget v0, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 895
    sput p2, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    .line 896
    sput p4, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    .line 897
    sput v6, Lcom/waze/patches/Patches;->sNewCameraRight:I

    .line 898
    invoke-static {p0}, Lcom/waze/patches/Patches;->rememberCameraDelegator(Ljava/lang/Object;)V

    .line 899
    invoke-static {p0, p1, p2, p4, v6}, Lcom/waze/patches/Patches;->callNativeUpdateMarginsPixels(Ljava/lang/Object;IIII)V

    .line 900
    return-void

    .line 903
    :cond_2
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 904
    add-int p2, v7, p1

    .line 906
    nop

    .line 907
    sget v8, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    if-lez v8, :cond_3

    .line 908
    sget v8, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    int-to-float v8, v8

    const v10, 0x3e19999a    # 0.15f

    mul-float/2addr v8, v10

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    add-int/2addr p1, v8

    .line 910
    :cond_3
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result v8

    invoke-static {p1, v8}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 911
    invoke-static {}, Lcom/waze/patches/Patches;->getCameraExtraBottomOffsetPx()I

    move-result v8

    add-int/2addr p1, v8

    .line 913
    if-gez p1, :cond_4

    .line 914
    goto :goto_0

    .line 913
    :cond_4
    move v0, p1

    .line 917
    :goto_0
    sub-int p1, p2, v0

    invoke-static {v7, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 919
    sput v0, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    .line 920
    sput p4, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    .line 921
    sput v6, Lcom/waze/patches/Patches;->sNewCameraRight:I

    .line 923
    invoke-static {p0}, Lcom/waze/patches/Patches;->rememberCameraDelegator(Ljava/lang/Object;)V

    .line 924
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "applyCameraAnchor OUT active out[t="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] totalY="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " totalX="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    sget p3, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 929
    invoke-static {}, Lcom/waze/patches/Patches;->getCameraExtraBottomOffsetPx()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 930
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 924
    invoke-static {p2}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 931
    invoke-static {p0, p1, v0, p4, v6}, Lcom/waze/patches/Patches;->callNativeUpdateMarginsPixels(Ljava/lang/Object;IIII)V

    .line 932
    return-void
.end method

.method public static applyClusterEtaBarChrome(Landroid/view/View;)V
    .locals 3

    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    const/16 v2, 0x8

    const-string v0, "leftMenuButtonContainer"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    const-string v0, "rightMenuButtonContainer"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    const-string v0, "imgEndNavButton"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    const-string v0, "dragHandle"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    const-string v0, "lblEtaTitle"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    const-string v0, "imgSoundButton"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_5
    const-string v0, "main_bar_content_container"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, -0x3f400000    # -6.0f

    mul-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    :cond_6
    return-void
.end method

.method public static applyClusterEtaSheetShape(Landroidx/compose/ui/Modifier;Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;Landroidx/compose/runtime/Composer;)Landroidx/compose/ui/Modifier;
    .locals 4

    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalView()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-interface {p5, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-interface {p5, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/ui/unit/Density;

    invoke-interface {v0}, Landroidx/compose/ui/unit/Density;->getDensity()F

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    add-int/lit16 v0, v0, -0x230

    if-lez v0, :cond_0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    div-float/2addr v0, v3

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroidx/compose/foundation/layout/PaddingKt;->padding-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;

    move-result-object p0

    const/high16 v0, 0x41a00000    # 20.0f

    invoke-static {v0}, Landroidx/compose/foundation/shape/RoundedCornerShapeKt;->RoundedCornerShape-0680j_4(F)Landroidx/compose/foundation/shape/RoundedCornerShape;

    move-result-object v0

    invoke-static {p0, v0}, Landroidx/compose/ui/draw/ClipKt;->clip(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;)Landroidx/compose/ui/Modifier;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static applyClusterMapViewportHeight(FLandroidx/compose/runtime/Composer;)F
    .locals 2

    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalView()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/ui/unit/Density;

    invoke-interface {v0}, Landroidx/compose/ui/unit/Density;->getDensity()F

    move-result v0

    const/high16 v1, 0x42c00000    # 96.0f

    div-float/2addr v1, v0

    add-float/2addr p0, v1

    :cond_0
    return p0
.end method

.method public static applyClusterMidDriveInsets(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;)Landroidx/compose/ui/Modifier;
    .locals 3

    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalView()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-static {}, Landroidx/compose/ui/platform/CompositionLocalsKt;->getLocalDensity()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/compose/ui/unit/Density;

    invoke-interface {v0}, Landroidx/compose/ui/unit/Density;->getDensity()F

    move-result v0

    const/high16 v2, 0x42c00000    # 96.0f

    div-float/2addr v2, v0

    const/4 v1, 0x0

    invoke-static {p0, v1, v1, v1, v2}, Landroidx/compose/foundation/layout/PaddingKt;->padding-qDBjuR0(Landroidx/compose/ui/Modifier;FFFF)Landroidx/compose/ui/Modifier;

    move-result-object p0

    invoke-static {p0}, Landroidx/compose/ui/draw/ClipKt;->clipToBounds(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static applyClusterNavBarVisibility(Landroid/view/View;)Z
    .locals 3

    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    invoke-static {p0}, Lcom/waze/patches/Patches;->resolveNavBarView(Landroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    const/16 v1, 0x8

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/waze/patches/Patches;->setNavBarExists(Z)V

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static applyClusterSpeedometerVisibility(Landroid/view/View;Landroid/view/View;)V
    .locals 5

    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {}, Lcom/waze/patches/Patches;->isMyCarActive()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    sget v4, Lcom/waze/R$drawable;->report_main_button_shadow:I

    invoke-virtual {p0, v4}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    :goto_1
    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-eq v3, p1, :cond_1

    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private static applyDisplayMetricsOverride(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1

    .line 1806
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lcom/waze/patches/Patches;->updateDisplayMetricsOverride(Landroid/app/Activity;ZLjava/lang/String;)V

    .line 1807
    return-void
.end method

.method private static applyDynamicCameraAnchor(Ljava/lang/String;)Z
    .locals 7

    .line 990
    invoke-static {}, Lcom/waze/patches/Patches;->isMyCarActive()Z

    move-result v0

    sput-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    .line 991
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 992
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dynamicReapply SKIP inactive caller="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 993
    return v1

    .line 996
    :cond_0
    sget-object v0, Lcom/waze/patches/Patches;->sLastCameraDelegatorRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 997
    if-nez v0, :cond_1

    .line 998
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dynamicReapply SKIP noDelegator caller="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 999
    return v1

    .line 1002
    :cond_1
    invoke-static {}, Lcom/waze/patches/Patches;->getDynamicCameraTopMargin()I

    move-result v2

    .line 1003
    invoke-static {}, Lcom/waze/patches/Patches;->getDynamicCameraBottomMargin()I

    move-result v3

    .line 1004
    sget v4, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1005
    sget v5, Lcom/waze/patches/Patches;->sNewCameraRight:I

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1007
    sput v3, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    .line 1008
    sput v4, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    .line 1009
    sput v1, Lcom/waze/patches/Patches;->sNewCameraRight:I

    .line 1010
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dynamicReapply caller="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " delegator="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 1011
    invoke-static {v0}, Lcom/waze/patches/Patches;->tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " out[t="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " b="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " l="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " r="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, "] steer="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v5, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " nav="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v5, Lcom/waze/patches/Patches;->sIsNavigating:Z

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " resizedH="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v5, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " viewH="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v5, Lcom/waze/patches/Patches;->sViewHeight:I

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " extraBottom="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 1018
    invoke-static {}, Lcom/waze/patches/Patches;->getCameraExtraBottomOffsetPx()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v5, " etaFloor="

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 1019
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1010
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1020
    invoke-static {v0, v2, v3, v4, v1}, Lcom/waze/patches/Patches;->callNativeUpdateMarginsPixels(Ljava/lang/Object;IIII)V

    .line 1021
    const/4 p0, 0x1

    return p0
.end method

.method public static applyEtaButtonsLifter(Landroid/view/ViewGroup;)V
    .locals 5

    .line 1338
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    if-nez v0, :cond_0

    return-void

    .line 1339
    :cond_0
    invoke-static {}, Lcom/waze/patches/Patches;->isCurrentActivityWindowMode5Or6()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 1342
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 1343
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_7

    .line 1344
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1345
    if-nez v2, :cond_2

    goto :goto_2

    .line 1347
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 1348
    instance-of v4, v3, Landroid/widget/LinearLayout$LayoutParams;

    if-nez v4, :cond_3

    goto :goto_2

    .line 1350
    :cond_3
    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 1353
    iget v4, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    if-nez v4, :cond_6

    iget v3, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_6

    .line 1354
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1357
    add-int/lit8 v1, v1, 0x1

    if-ge v1, v0, :cond_5

    .line 1358
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    .line 1359
    if-eqz p0, :cond_5

    .line 1360
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1361
    if-eqz v0, :cond_4

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_1

    :cond_4
    const/4 v0, -0x1

    .line 1362
    :goto_1
    if-lez v0, :cond_5

    if-gt v0, v3, :cond_5

    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1367
    :cond_5
    return-void

    .line 1343
    :cond_6
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1373
    :cond_7
    goto :goto_3

    .line 1371
    :catchall_0
    move-exception p0

    .line 1372
    const-string p0, "applyEtaButtonsLifter: failed"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1374
    :goto_3
    return-void
.end method

.method public static applyEtaCollapsedHeight(I)I
    .locals 2

    .line 1243
    sput p0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    .line 1244
    const/4 v0, 0x0

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    .line 1245
    const/4 v0, 0x0

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    .line 1247
    invoke-static {}, Lcom/waze/patches/Patches;->isCurrentActivityWindowMode5Or6()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1248
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    const-string v1, "windowMode5Or6"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1250
    :cond_0
    sget-boolean v0, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/waze/patches/Patches;->isCurrentActivityInSteeringDisplay()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1251
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    const-string v1, "fullscreenMain"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1253
    :cond_1
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    if-nez v0, :cond_2

    .line 1254
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    const-string v1, "inactive"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1256
    :cond_2
    sget v0, Lcom/waze/patches/Patches;->sViewHeight:I

    if-gtz v0, :cond_3

    .line 1257
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyEtaCollapsedHeight: invalid view height "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sViewHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", returning original height"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1258
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    const-string v1, "invalidViewHeight"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1260
    :cond_3
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    if-eqz v0, :cond_6

    .line 1261
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    if-nez v0, :cond_4

    .line 1262
    neg-int v0, p0

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    goto :goto_0

    .line 1264
    :cond_4
    const v0, 0x3e99999a    # 0.3f

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    .line 1265
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    const/high16 v1, 0x42c80000    # 100.0f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_5

    .line 1266
    const v0, 0x3f19999a    # 0.6f

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    .line 1268
    :cond_5
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->increaseHeight(IF)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    .line 1270
    :goto_0
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    const-string v1, "steering"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1275
    :cond_6
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    const/16 v1, 0x78

    if-eqz v0, :cond_8

    .line 1276
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    if-eqz v0, :cond_7

    .line 1277
    const/16 v0, 0xaf

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    goto :goto_1

    .line 1281
    :cond_7
    sput v1, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    .line 1283
    :goto_1
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    const-string v1, "narrow"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1287
    :cond_8
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsLandscape:Z

    if-eqz v0, :cond_a

    .line 1290
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    if-eqz v0, :cond_9

    .line 1291
    const/16 v0, 0xe6

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    goto :goto_2

    .line 1293
    :cond_9
    const/16 v0, 0x96

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    .line 1295
    :goto_2
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    const-string v1, "landscape"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1299
    :cond_a
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsXhdpiEmulationActive:Z

    if-eqz v0, :cond_c

    .line 1301
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->increaseHeight(IF)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    .line 1302
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    if-le v0, v1, :cond_b

    .line 1303
    const/16 v0, 0x15e

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    goto :goto_3

    .line 1305
    :cond_b
    const/16 v0, 0x64

    sput v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    .line 1307
    :goto_3
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const-string v1, "portraitXhdpi"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0

    .line 1311
    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyEtaCollapsedHeight: no conditions matched, returning original height "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " sViewHeight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sViewHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1312
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    const-string v1, "fallback"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->tempEtaHeightReturn(IILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static applyEtaGoClickerOnSetExpanded(Landroid/view/View;Z)V
    .locals 5

    .line 1382
    invoke-static {p0}, Lcom/waze/patches/Patches;->noteEtaGoDisplay(Landroid/view/View;)I

    move-result v0

    .line 1384
    sget-boolean v1, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    if-nez v1, :cond_0

    .line 1385
    const-string p0, "applyEtaGoClickerOnSetExpanded: myCar is not active, skipping"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1386
    return-void

    .line 1389
    :cond_0
    if-nez p1, :cond_2

    .line 1390
    sget-boolean p0, Lcom/waze/patches/Patches;->sIsExpanded:Z

    if-eq p0, p1, :cond_1

    .line 1391
    const-string p0, "applyEtaGoClickerOnSetExpanded: isExpanded=false"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1392
    const/4 p0, 0x0

    sput-boolean p0, Lcom/waze/patches/Patches;->sIsExpanded:Z

    .line 1394
    :cond_1
    return-void

    .line 1396
    :cond_2
    sget-boolean v1, Lcom/waze/patches/Patches;->sIsExpanded:Z

    if-eq v1, p1, :cond_3

    .line 1397
    const-string v1, "applyEtaGoClickerOnSetExpanded: isExpanded=true"

    invoke-static {v1}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1399
    :cond_3
    sput-boolean p1, Lcom/waze/patches/Patches;->sIsExpanded:Z

    .line 1401
    sget-boolean p1, Lcom/waze/patches/Patches;->sIsEtaAutoGoInvoked:Z

    if-eqz p1, :cond_4

    .line 1402
    const-string p0, "applyEtaGoClickerOnSetExpanded: auto-go already invoked, skipping"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1403
    return-void

    .line 1406
    :cond_4
    if-nez p0, :cond_5

    .line 1407
    const-string p0, "applyEtaGoClickerOnSetExpanded: view=null"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1408
    return-void

    .line 1411
    :cond_5
    const-wide/16 v1, 0x32

    sput-wide v1, Lcom/waze/patches/Patches;->sEtaGoDelay:J

    .line 1412
    sget-boolean p1, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    if-nez p1, :cond_6

    .line 1413
    sget-wide v1, Lcom/waze/patches/Patches;->sEtaGoDelay:J

    const-wide/16 v3, 0xa

    mul-long/2addr v1, v3

    sput-wide v1, Lcom/waze/patches/Patches;->sEtaGoDelay:J

    .line 1415
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyEtaGoClickerOnSetExpanded: scheduling auto-go on display "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1416
    new-instance p1, Lcom/waze/patches/Patches$7;

    invoke-direct {p1, p0}, Lcom/waze/patches/Patches$7;-><init>(Landroid/view/View;)V

    sget-wide v0, Lcom/waze/patches/Patches;->sEtaGoDelay:J

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1422
    return-void
.end method

.method private static applyFullscreenSetting(Landroid/app/Activity;)V
    .locals 4

    .line 2068
    if-nez p0, :cond_0

    .line 2069
    return-void

    .line 2073
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 2074
    if-nez p0, :cond_1

    .line 2075
    return-void

    .line 2078
    :cond_1
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 2079
    if-nez v0, :cond_2

    .line 2080
    return-void

    .line 2083
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v1

    .line 2084
    sget-boolean v2, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    const/16 v3, 0x400

    if-eqz v2, :cond_3

    .line 2085
    invoke-virtual {p0, v3}, Landroid/view/Window;->addFlags(I)V

    .line 2086
    or-int/lit16 p0, v1, 0x1606

    invoke-virtual {v0, p0}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    .line 2088
    :cond_3
    invoke-virtual {p0, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 2089
    and-int/lit16 p0, v1, -0x1607

    invoke-virtual {v0, p0}, Landroid/view/View;->setSystemUiVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2092
    :goto_0
    goto :goto_1

    .line 2091
    :catchall_0
    move-exception p0

    .line 2093
    :goto_1
    return-void
.end method

.method private static applyNavBar(Landroid/app/Activity;Landroid/view/View;)V
    .locals 2

    .line 431
    invoke-static {p1}, Lcom/waze/patches/Patches;->resetNavBar(Landroid/view/View;)V

    .line 432
    invoke-static {p0}, Lcom/waze/patches/Patches;->isWindowMode5Or6(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 433
    return-void

    .line 436
    :cond_0
    new-instance p0, Lcom/waze/patches/Patches$4;

    invoke-direct {p0, p1}, Lcom/waze/patches/Patches$4;-><init>(Landroid/view/View;)V

    sput-object p0, Lcom/waze/patches/Patches;->sNavKeepRunnable:Ljava/lang/Runnable;

    .line 444
    sget-object p0, Lcom/waze/patches/Patches;->sNavKeepRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 445
    return-void
.end method

.method private static applyNavBarTransform(Landroid/view/View;)Z
    .locals 14

    invoke-static {p0}, Lcom/waze/patches/Patches;->applyClusterNavBarVisibility(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 451
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->resolveNavBarView(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    .line 452
    const/4 v0, 0x0

    if-nez p0, :cond_1

    .line 453
    invoke-static {v0}, Lcom/waze/patches/Patches;->setNavBarExists(Z)V

    .line 454
    return v0

    .line 457
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 458
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 459
    if-lez v1, :cond_12

    if-gtz v2, :cond_2

    goto/16 :goto_4

    .line 463
    :cond_2
    sget v3, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    const/high16 v4, 0x42c80000    # 100.0f

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_3

    .line 464
    const v3, 0x3f4ccccd    # 0.8f

    sput v3, Lcom/waze/patches/Patches;->NAV_SCALE:F

    .line 466
    :cond_3
    int-to-float v2, v2

    sget v3, Lcom/waze/patches/Patches;->NAV_SCALE:F

    mul-float/2addr v2, v3

    .line 467
    const/high16 v3, 0x3f000000    # 0.5f

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 469
    const/4 v5, 0x2

    new-array v6, v5, [I

    .line 470
    invoke-virtual {p0, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 471
    aget v7, v6, v0

    .line 472
    const/4 v8, 0x1

    aget v6, v6, v8

    .line 474
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v9

    .line 475
    if-nez v9, :cond_4

    .line 476
    invoke-static {v0}, Lcom/waze/patches/Patches;->setNavBarExists(Z)V

    .line 477
    return v0

    .line 480
    :cond_4
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v10

    .line 481
    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v11

    .line 482
    if-lez v10, :cond_11

    if-gtz v11, :cond_5

    goto/16 :goto_3

    .line 487
    :cond_5
    nop

    .line 488
    nop

    .line 489
    if-le v10, v11, :cond_8

    .line 490
    const-string v12, "navBarTop"

    invoke-static {v9, v12}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v13

    .line 491
    if-nez v13, :cond_6

    .line 492
    invoke-static {p0, v12}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v13

    .line 494
    :cond_6
    if-eqz v13, :cond_7

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v12

    goto :goto_0

    :cond_7
    move v12, v0

    .line 495
    :goto_0
    if-lez v12, :cond_8

    if-ge v12, v1, :cond_8

    .line 496
    new-array v1, v5, [I

    .line 497
    invoke-virtual {v13, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 498
    aget v7, v1, v0

    .line 499
    move v1, v12

    .line 502
    :cond_8
    int-to-float v1, v1

    sget v12, Lcom/waze/patches/Patches;->NAV_SCALE:F

    mul-float/2addr v1, v12

    .line 503
    mul-float v12, v1, v3

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v12

    .line 505
    invoke-static {v8}, Lcom/waze/patches/Patches;->setNavBarExists(Z)V

    .line 507
    new-array v5, v5, [I

    .line 508
    invoke-virtual {v9, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 509
    aget v9, v5, v0

    .line 510
    aget v5, v5, v8

    .line 512
    int-to-float v5, v5

    int-to-float v11, v11

    const v13, 0x3dccccd0    # 0.100000024f

    mul-float/2addr v13, v11

    mul-float/2addr v13, v3

    add-float/2addr v5, v13

    const/4 v13, 0x0

    mul-float/2addr v13, v11

    add-float/2addr v5, v13

    .line 516
    int-to-float v13, v10

    mul-float/2addr v13, v3

    invoke-static {v13}, Ljava/lang/Math;->round(F)I

    move-result v3

    add-int/2addr v3, v9

    .line 517
    sget v13, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    if-gez v13, :cond_9

    .line 518
    const/high16 v13, 0x3f800000    # 1.0f

    mul-float/2addr v11, v13

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    sput v11, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    .line 520
    :cond_9
    sget v11, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    int-to-float v11, v11

    const v13, 0x3de147ae    # 0.11f

    mul-float/2addr v11, v13

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    .line 521
    int-to-float v11, v11

    add-float/2addr v5, v11

    .line 522
    add-float/2addr v5, v2

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 524
    sub-int/2addr v3, v12

    .line 525
    sub-int/2addr v2, v4

    .line 526
    add-int/2addr v10, v9

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    sub-int/2addr v10, v1

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 527
    invoke-static {v9, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 529
    sub-int/2addr v1, v7

    .line 530
    sub-int/2addr v2, v6

    .line 532
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v3

    .line 533
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v4

    .line 534
    int-to-float v5, v1

    add-float/2addr v3, v5

    .line 535
    int-to-float v5, v2

    add-float/2addr v4, v5

    .line 537
    invoke-virtual {p0}, Landroid/view/View;->getScaleX()F

    move-result v5

    .line 538
    invoke-virtual {p0}, Landroid/view/View;->getScaleY()F

    move-result v6

    .line 539
    sget v7, Lcom/waze/patches/Patches;->NAV_SCALE:F

    sub-float/2addr v5, v7

    .line 540
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const v7, 0x3a83126f    # 0.001f

    cmpl-float v5, v5, v7

    if-gtz v5, :cond_b

    sget v5, Lcom/waze/patches/Patches;->NAV_SCALE:F

    sub-float/2addr v6, v5

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v5, v5, v7

    if-lez v5, :cond_a

    goto :goto_1

    :cond_a
    move v5, v0

    goto :goto_2

    :cond_b
    :goto_1
    move v5, v8

    .line 541
    :goto_2
    if-nez v1, :cond_c

    if-eqz v2, :cond_d

    :cond_c
    move v0, v8

    .line 543
    :cond_d
    if-nez v5, :cond_e

    if-nez v0, :cond_e

    .line 544
    return v8

    .line 547
    :cond_e
    if-eqz v5, :cond_f

    .line 548
    sget v1, Lcom/waze/patches/Patches;->NAV_SCALE:F

    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 549
    sget v1, Lcom/waze/patches/Patches;->NAV_SCALE:F

    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 552
    :cond_f
    if-eqz v0, :cond_10

    .line 553
    invoke-virtual {p0, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 554
    invoke-virtual {p0, v4}, Landroid/view/View;->setTranslationY(F)V

    .line 557
    :cond_10
    return v8

    .line 483
    :cond_11
    :goto_3
    invoke-static {v0}, Lcom/waze/patches/Patches;->setNavBarExists(Z)V

    .line 484
    return v0

    .line 460
    :cond_12
    :goto_4
    invoke-static {v0}, Lcom/waze/patches/Patches;->setNavBarExists(Z)V

    .line 461
    return v0
.end method

.method public static applyPoweredByTraffisco(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1469
    const-string v0, " (Powered by Traffisco Patches waze-v5.17.10.0.16-prod)"

    .line 1472
    if-nez p0, :cond_0

    .line 1473
    const/4 p0, 0x0

    return-object p0

    .line 1476
    :cond_0
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1477
    return-object p0

    .line 1480
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1481
    return-object p0

    .line 1482
    :catchall_0
    move-exception v0

    .line 1483
    const-string v0, "applyPoweredByTraffisco: failed, returning original"

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1484
    return-object p0
.end method

.method public static applyRelativeViewportOffsetX(Landroid/graphics/Rect;Landroid/graphics/Rect;F)F
    .locals 4

    .line 1157
    invoke-static {}, Lcom/waze/patches/Patches;->shouldNormalizeHorizontalViewport()Z

    move-result v0

    .line 1158
    if-eqz v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    move v1, p2

    .line 1159
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "relativeViewportOffsetX map="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempRectState(Landroid/graphics/Rect;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, " viewport="

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 1160
    invoke-static {p1}, Lcom/waze/patches/Patches;->tempRectState(Landroid/graphics/Rect;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " inOffsetX="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " outOffsetX="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " normalize="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " active="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " landscape="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsLandscape:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " narrow="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " steer="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " display="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p1, Lcom/waze/patches/Patches;->sDisplayId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1159
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1169
    return v1
.end method

.method public static applyRelativeViewportWidth(Landroid/graphics/Rect;Landroid/graphics/Rect;F)F
    .locals 4

    .line 1140
    invoke-static {}, Lcom/waze/patches/Patches;->shouldNormalizeHorizontalViewport()Z

    move-result v0

    .line 1141
    if-eqz v0, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    move v1, p2

    .line 1142
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "relativeViewportWidth map="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempRectState(Landroid/graphics/Rect;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, " viewport="

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 1143
    invoke-static {p1}, Lcom/waze/patches/Patches;->tempRectState(Landroid/graphics/Rect;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " inWidth="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " outWidth="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " normalize="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " active="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " landscape="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsLandscape:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " narrow="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " steer="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " display="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p1, Lcom/waze/patches/Patches;->sDisplayId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1142
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1152
    return v1
.end method

.method public static applyUserLocationOffsetX(Ljava/lang/String;FFZ)F
    .locals 5

    .line 1111
    invoke-static {}, Lcom/waze/patches/Patches;->isMyCarActive()Z

    move-result v0

    .line 1112
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    .line 1114
    sget-object v1, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 1115
    sget-boolean v2, Lcom/waze/patches/Patches;->sIsLandscape:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    sget-boolean v2, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v2, v4

    .line 1116
    :goto_1
    if-eqz v1, :cond_4

    .line 1117
    invoke-static {v1}, Lcom/waze/patches/Patches;->isInSteeringDisplay(Landroid/app/Activity;)Z

    move-result v2

    sput-boolean v2, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    .line 1118
    invoke-static {v1}, Lcom/waze/patches/Patches;->isActivityLandscape(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-boolean v1, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    move v2, v3

    goto :goto_3

    :cond_3
    :goto_2
    move v2, v4

    .line 1121
    :cond_4
    :goto_3
    sget v1, Lcom/waze/patches/Patches;->sDisplayId:I

    if-lez v1, :cond_5

    move v3, v4

    .line 1122
    :cond_5
    if-eqz v3, :cond_6

    const/high16 v1, 0x3f000000    # 0.5f

    goto :goto_4

    :cond_6
    move v1, p1

    .line 1123
    :goto_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "userLocationOffset mapId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v3, " in[x="

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " y="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " anim="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "] outX="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " active="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " landscape="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " narrow="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " steer="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " nav="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p1, Lcom/waze/patches/Patches;->sIsNavigating:Z

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " display="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p1, Lcom/waze/patches/Patches;->sDisplayId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " viewH="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p1, Lcom/waze/patches/Patches;->sViewHeight:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " displayW="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p1, Lcom/waze/patches/Patches;->sDisplayWidthPx:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " displayH="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p1, Lcom/waze/patches/Patches;->sDisplayHeightPx:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1135
    return v1
.end method

.method public static applyUserLocationOffsetY(Ljava/lang/String;FFZ)F
    .locals 1

    invoke-static {}, Lcom/waze/patches/Patches;->shouldNormalizeHorizontalViewport()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x3f4ccccd    # 0.8f

    return v0

    :cond_0
    return p2
.end method

.method public static applyViewResize(Landroid/view/View;)V
    .locals 4

    .line 390
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 391
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 392
    sput v1, Lcom/waze/patches/Patches;->sViewHeight:I

    .line 394
    int-to-float v0, v0

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float v3, v0, v2

    invoke-virtual {p0, v3}, Landroid/view/View;->setPivotX(F)V

    .line 395
    int-to-float v1, v1

    mul-float/2addr v2, v1

    invoke-virtual {p0, v2}, Landroid/view/View;->setPivotY(F)V

    .line 396
    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 397
    invoke-virtual {p0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 398
    const/4 v3, 0x0

    mul-float/2addr v0, v3

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 399
    mul-float/2addr v1, v3

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 400
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    .line 401
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "viewResize APPLY "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempViewState(Landroid/view/View;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " resizedH="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " scale="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 406
    return-void
.end method

.method private static attachConfigChangeListener(Landroid/app/Activity;)V
    .locals 3

    .line 283
    invoke-static {p0}, Lcom/waze/patches/Patches;->isMainActivity(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 284
    return-void

    .line 287
    :cond_0
    sget-object v0, Lcom/waze/patches/Patches;->sConfigCallbackInstalled:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 288
    :try_start_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v2, Lcom/waze/patches/Patches;->sConfigCallbackInstalled:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 289
    monitor-exit v0

    return-void

    .line 291
    :cond_1
    sget-object v1, Lcom/waze/patches/Patches;->sConfigCallbackInstalled:Ljava/util/WeakHashMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    new-instance v0, Lcom/waze/patches/Patches$2;

    invoke-direct {v0, p0}, Lcom/waze/patches/Patches$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 313
    return-void

    .line 292
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static attachOrUpdateDebugOverlay(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 2210
    if-nez p0, :cond_0

    .line 2211
    return-void

    .line 2215
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeDebugOverlay(Landroid/app/Activity;)V

    .line 2216
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeDebugToggleButton(Landroid/app/Activity;)V

    .line 2217
    return-void
.end method

.method private static attachOrUpdateDebugToggleButton(Landroid/app/Activity;Landroid/view/ViewGroup;)V
    .locals 8

    .line 2270
    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto/16 :goto_2

    .line 2279
    :cond_0
    invoke-static {p1}, Lcom/waze/patches/Patches;->findDebugToggleButton(Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object v0

    .line 2280
    const v1, 0x8ffffff

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 2281
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 2282
    const-string v3, "patches_debug_toggle"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2283
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2284
    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 2285
    const/4 v3, 0x2

    const/high16 v5, 0x41400000    # 12.0f

    invoke-virtual {v0, v3, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 2286
    const/16 v3, 0x11

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 2290
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 2291
    const/16 v3, 0xa

    invoke-static {p0, v3}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v5

    const/16 v6, 0x8

    invoke-static {p0, v6}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v7

    invoke-static {p0, v3}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v3

    invoke-static {p0, v6}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v6

    invoke-virtual {v0, v5, v7, v3, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 2292
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setClickable(Z)V

    .line 2293
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setLongClickable(Z)V

    .line 2294
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 2295
    new-instance v3, Lcom/waze/patches/Patches$10;

    invoke-direct {v3, p0}, Lcom/waze/patches/Patches$10;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2303
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 2307
    const v4, 0x800035

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 2308
    const/16 v4, 0x4c

    invoke-static {p0, v4}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 2309
    const/16 v4, 0xe

    invoke-static {p0, v4}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result p0

    iput p0, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 2310
    invoke-virtual {p1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2314
    :cond_1
    sget-boolean p0, Lcom/waze/patches/Patches;->sIsDebugOverlayEnabled:Z

    if-eqz p0, :cond_2

    const-string p0, "DBG ON"

    goto :goto_0

    :cond_2
    const-string p0, "."

    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2315
    sget-boolean p0, Lcom/waze/patches/Patches;->sIsDebugOverlayEnabled:Z

    if-eqz p0, :cond_3

    const v1, -0x7070e

    :cond_3
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2316
    sget-boolean p0, Lcom/waze/patches/Patches;->sIsDebugOverlayEnabled:Z

    if-eqz p0, :cond_4

    const p0, -0x33eba5ce    # -3.8889672E7f

    goto :goto_1

    :cond_4
    const/high16 p0, 0x6000000

    :goto_1
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 2321
    invoke-virtual {v0}, Landroid/widget/TextView;->bringToFront()V

    .line 2322
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2323
    return-void

    .line 2271
    :cond_5
    :goto_2
    return-void
.end method

.method private static attachOrUpdateFullscreenSettingsRow(Landroid/app/Activity;Landroid/view/ViewGroup;)Z
    .locals 24

    .line 2341
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 2345
    :cond_0
    const-string v3, "settingsLinearLayout"

    invoke-static {v1, v3}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    .line 2346
    if-eqz v3, :cond_1

    move-object v4, v3

    goto :goto_0

    :cond_1
    move-object v4, v1

    .line 2347
    :goto_0
    const-string v22, "\u05d4\u05e9\u05d0\u05e8 \u05e6\u05e4\u05d5\u05df \u05dc\u05de\u05e2\u05dc\u05d4"

    const-string v23, "\u05d4\u05e9\u05d0\u05e8 \u05d0\u05ea \u05d4\u05e6\u05e4\u05d5\u05df \u05dc\u05de\u05e2\u05dc\u05d4"

    const-string v5, "Dark mode"

    const-string v6, "\u05de\u05e6\u05d1 \u05db\u05d4\u05d4"

    const-string v7, "\u05de\u05e6\u05d1 \u05d7\u05e9\u05d5\u05da"

    const-string v8, "Map view"

    const-string v9, "Map display"

    const-string v10, "\u05ea\u05e6\u05d5\u05d2\u05ea \u05de\u05e4\u05d4"

    const-string v11, "\u05ea\u05e6\u05d5\u05d2\u05ea \u05d4\u05de\u05e4\u05d4"

    const-string v12, "\u05d4\u05e6\u05d2\u05ea \u05de\u05e4\u05d4"

    const-string v13, "Car icon"

    const-string v14, "\u05e1\u05de\u05dc \u05e8\u05db\u05d1"

    const-string v15, "\u05e1\u05de\u05dc \u05d4\u05e8\u05db\u05d1"

    const-string v16, "Map type"

    const-string v17, "\u05e1\u05d5\u05d2 \u05de\u05e4\u05d4"

    const-string v18, "Auto zoom"

    const-string v19, "\u05d6\u05d5\u05dd \u05d0\u05d5\u05d8\u05d5\u05de\u05d8\u05d9"

    const-string v20, "Keep map north up"

    const-string v21, "\u05e6\u05e4\u05d5\u05df \u05dc\u05de\u05e2\u05dc\u05d4"

    filled-new-array/range {v5 .. v23}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v4, v5}, Lcom/waze/patches/Patches;->findSettingsRowForAnyText(Landroid/app/Activity;Landroid/view/View;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 2356
    if-nez v4, :cond_2

    .line 2357
    return v2

    .line 2360
    :cond_2
    instance-of v5, v3, Landroid/view/ViewGroup;

    if-eqz v5, :cond_4

    .line 2361
    check-cast v3, Landroid/view/ViewGroup;

    invoke-static {v3, v4}, Lcom/waze/patches/Patches;->findDirectChildOf(Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;

    move-result-object v4

    .line 2362
    if-nez v4, :cond_3

    .line 2363
    return v2

    .line 2365
    :cond_3
    nop

    .line 2368
    :cond_4
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 2369
    instance-of v5, v3, Landroid/view/ViewGroup;

    if-nez v5, :cond_5

    .line 2370
    return v2

    .line 2373
    :cond_5
    check-cast v3, Landroid/view/ViewGroup;

    .line 2374
    invoke-static {v1}, Lcom/waze/patches/Patches;->findFullscreenToggle(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 2375
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-eq v5, v3, :cond_6

    .line 2376
    invoke-static {v1}, Lcom/waze/patches/Patches;->removeViewFromParent(Landroid/view/View;)V

    .line 2377
    const/4 v1, 0x0

    .line 2380
    :cond_6
    const/4 v5, 0x1

    if-nez v1, :cond_7

    .line 2381
    invoke-static {v0}, Lcom/waze/patches/Patches;->createFullscreenSettingsRow(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v1

    .line 2382
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v4

    add-int/2addr v4, v5

    .line 2384
    :try_start_0
    invoke-static {v0, v3}, Lcom/waze/patches/Patches;->createFullscreenRowLayoutParams(Landroid/app/Activity;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {v3, v1, v4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2388
    goto :goto_1

    .line 2385
    :catchall_0
    move-exception v0

    .line 2386
    invoke-static {v1}, Lcom/waze/patches/Patches;->removeViewFromParent(Landroid/view/View;)V

    .line 2387
    return v2

    .line 2391
    :cond_7
    :goto_1
    invoke-static {v1}, Lcom/waze/patches/Patches;->updateFullscreenSettingsRow(Landroid/view/View;)V

    .line 2392
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2393
    return v5

    .line 2342
    :cond_8
    :goto_2
    return v2
.end method

.method private static attachOrUpdateFullscreenToggle(Landroid/app/Activity;)V
    .locals 1

    .line 2326
    if-nez p0, :cond_0

    .line 2327
    return-void

    .line 2330
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->getOverlayHost(Landroid/app/Activity;)Landroid/view/ViewGroup;

    move-result-object v0

    .line 2331
    if-nez v0, :cond_1

    .line 2332
    return-void

    .line 2335
    :cond_1
    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->attachOrUpdateFullscreenSettingsRow(Landroid/app/Activity;Landroid/view/ViewGroup;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2336
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeFullscreenToggle(Landroid/app/Activity;)V

    .line 2338
    :cond_2
    return-void
.end method

.method private static attachRootLayoutListener(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    .line 316
    invoke-static {p0}, Lcom/waze/patches/Patches;->isMainActivity(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 318
    return-void

    .line 321
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->getRootView(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    .line 322
    if-nez v0, :cond_1

    .line 323
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "attachRootLayoutListener: view=null called by "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 324
    return-void

    .line 327
    :cond_1
    sget-object p1, Lcom/waze/patches/Patches;->sResizeListenerInstalled:Ljava/util/WeakHashMap;

    monitor-enter p1

    .line 328
    :try_start_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v2, Lcom/waze/patches/Patches;->sResizeListenerInstalled:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 329
    monitor-exit p1

    return-void

    .line 331
    :cond_2
    sget-object v1, Lcom/waze/patches/Patches;->sResizeListenerInstalled:Ljava/util/WeakHashMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 335
    new-instance p1, Lcom/waze/patches/Patches$3;

    invoke-direct {p1, v0, p0}, Lcom/waze/patches/Patches$3;-><init>(Landroid/view/View;Landroid/app/Activity;)V

    invoke-virtual {v0, p1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 383
    return-void

    .line 333
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private static boolFlag(Z)Ljava/lang/String;
    .locals 0

    .line 2876
    if-eqz p0, :cond_0

    const-string p0, "1"

    goto :goto_0

    :cond_0
    const-string p0, "0"

    :goto_0
    return-object p0
.end method

.method private static buildDebugOverlayText(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 2843
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "waze-v5.17.10.0.16-prod\nlicense="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    .line 2845
    invoke-static {v0}, Lcom/waze/patches/Patches;->boolFlag(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " rightRudder="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 2846
    invoke-static {}, Lcom/waze/patches/Patches;->isRightRudder()Z

    move-result v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->boolFlag(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " steer="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    .line 2847
    invoke-static {v0}, Lcom/waze/patches/Patches;->boolFlag(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " navigating="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    .line 2848
    invoke-static {v0}, Lcom/waze/patches/Patches;->boolFlag(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " narrow="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " landscape="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sIsLandscape:Z

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " win5or6="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sIsWindowMode5Or6:Z

    .line 2851
    invoke-static {v0}, Lcom/waze/patches/Patches;->boolFlag(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " full="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    .line 2852
    invoke-static {v0}, Lcom/waze/patches/Patches;->boolFlag(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " xhdpi="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean v0, Lcom/waze/patches/Patches;->sIsXhdpiEmulationActive:Z

    .line 2853
    invoke-static {v0}, Lcom/waze/patches/Patches;->boolFlag(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\ndisplayId="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sDisplayId:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " displayH="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sDisplayHeightPx:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " displayW="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sDisplayWidthPx:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " viewH="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sViewHeight:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\nresizedViewH="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px etaCollapsedH="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px sEtaCollapsedNewHeightPx="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px ("

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v1, Lcom/waze/patches/Patches;->sEtaCollapsedHeightRatio:F

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "%) etaGoDelay="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-wide v1, Lcom/waze/patches/Patches;->sEtaGoDelay:J

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "ms\ncameraOffset: bottom="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sCameraBottomOffsetRatio:F

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "%) extraBottom="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 2866
    invoke-static {}, Lcom/waze/patches/Patches;->getCameraExtraBottomOffsetPx()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px etaFloor="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 2867
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px top="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px newRight="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sNewCameraRight:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px NAV: scale="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->NAV_SCALE:F

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2843
    return-object p0
.end method

.method private static callNativeUpdateMarginsPixels(Ljava/lang/Object;IIII)V
    .locals 2

    .line 1197
    :try_start_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->ensureNativeUpdateMarginsResolved(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1198
    return-void

    .line 1199
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "nativeUpdateMargins INVOKE delegator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " out[t="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " b="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " l="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " r="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1201
    sget-object v0, Lcom/waze/patches/Patches;->sNativeUpdateMarginsPixelsMethod:Ljava/lang/reflect/Method;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    filled-new-array {p1, p2, p3, p4}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1205
    goto :goto_0

    .line 1202
    :catchall_0
    move-exception p0

    .line 1203
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "nativeUpdateMargins FAILED "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1204
    const-string p0, "applyCameraAnchor: invoke failed"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1206
    :goto_0
    return-void
.end method

.method private static clearNavigationBroadcastSnapshot()V
    .locals 4

    .line 1604
    const/4 v0, 0x0

    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastCurrentInstruction:Ljava/lang/String;

    .line 1605
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastNextInstruction:Ljava/lang/String;

    .line 1606
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistance:Ljava/lang/String;

    .line 1607
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnit:Ljava/lang/String;

    .line 1608
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitName:Ljava/lang/String;

    .line 1609
    const/4 v1, -0x1

    sput v1, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitValue:I

    .line 1610
    sput v1, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceMeters:I

    .line 1611
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    sput-wide v2, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceValue:D

    .line 1612
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaTime:Ljava/lang/String;

    .line 1613
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaTimeUnit:Ljava/lang/String;

    .line 1614
    sput v1, Lcom/waze/patches/Patches;->sBroadcastEtaMinutes:I

    .line 1615
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistance:Ljava/lang/String;

    .line 1616
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnit:Ljava/lang/String;

    .line 1617
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitName:Ljava/lang/String;

    .line 1618
    sput v1, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitValue:I

    .line 1619
    sput v1, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceMeters:I

    .line 1620
    sput-wide v2, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceValue:D

    .line 1621
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetName:Ljava/lang/String;

    .line 1622
    sput v1, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetSegmentIdx:I

    .line 1623
    const/4 v2, 0x0

    sput-boolean v2, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetShowHov:Z

    .line 1624
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignText:Ljava/lang/String;

    .line 1625
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignPrimary:Ljava/lang/String;

    .line 1626
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignSecondary:Ljava/lang/String;

    .line 1627
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastNextStreetName:Ljava/lang/String;

    .line 1628
    sput v1, Lcom/waze/patches/Patches;->sBroadcastNextStreetSegmentIdx:I

    .line 1629
    sput-boolean v2, Lcom/waze/patches/Patches;->sBroadcastNextStreetArrowBeforeText:Z

    .line 1630
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignText:Ljava/lang/String;

    .line 1631
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignPrimary:Ljava/lang/String;

    .line 1632
    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignSecondary:Ljava/lang/String;

    .line 1633
    return-void
.end method

.method private static countDescendantsOfClassName(Landroid/view/View;Ljava/lang/String;I)I
    .locals 5

    .line 670
    const/4 v0, 0x0

    if-eqz p0, :cond_6

    if-eqz p1, :cond_6

    if-gtz p2, :cond_0

    goto :goto_1

    .line 674
    :cond_0
    nop

    .line 675
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 676
    nop

    .line 677
    const/4 v1, 0x1

    if-lt v1, p2, :cond_2

    .line 678
    return v1

    .line 675
    :cond_1
    move v1, v0

    .line 682
    :cond_2
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-nez v2, :cond_3

    .line 683
    return v1

    .line 686
    :cond_3
    check-cast p0, Landroid/view/ViewGroup;

    .line 687
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    .line 688
    nop

    :goto_0
    if-ge v0, v2, :cond_5

    .line 689
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    sub-int v4, p2, v1

    invoke-static {v3, p1, v4}, Lcom/waze/patches/Patches;->countDescendantsOfClassName(Landroid/view/View;Ljava/lang/String;I)I

    move-result v3

    add-int/2addr v1, v3

    .line 690
    if-lt v1, p2, :cond_4

    .line 691
    return v1

    .line 688
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 695
    :cond_5
    return v1

    .line 671
    :cond_6
    :goto_1
    return v0
.end method

.method private static createFullscreenRowLayoutParams(Landroid/app/Activity;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .line 2473
    instance-of p1, p1, Landroid/widget/LinearLayout;

    const/16 v0, 0x34

    const/4 v1, -0x1

    if-eqz p1, :cond_0

    .line 2474
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 2476
    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result p0

    invoke-direct {p1, v1, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 2474
    return-object p1

    .line 2480
    :cond_0
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 2482
    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result p0

    invoke-direct {p1, v1, p0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 2480
    return-object p1
.end method

.method private static createFullscreenSettingsRow(Landroid/app/Activity;)Landroid/view/View;
    .locals 9

    .line 2397
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2398
    const-string v1, "patches_fullscreen_toggle"

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 2399
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 2400
    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 2401
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutDirection(I)V

    .line 2402
    const/16 v3, 0x32

    invoke-static {p0, v3}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 2403
    invoke-static {p0, v2}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v3

    invoke-static {p0, v2}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v4

    invoke-virtual {v0, v3, v1, v4, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 2404
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 2405
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    .line 2406
    new-instance v4, Lcom/waze/patches/Patches$11;

    invoke-direct {v4, p0}, Lcom/waze/patches/Patches$11;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2413
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2414
    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 2415
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 2417
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 2418
    const-string v5, "patches_fullscreen_title"

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2419
    const-string v5, "Fullscreen"

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2420
    const/16 v5, 0xd

    invoke-static {p0, v5}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2, v1, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 2421
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 2422
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 2423
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 2425
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 2426
    const-string v6, "patches_fullscreen_subtitle"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2427
    const-string v6, "Hide system bars"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2428
    const/16 v6, 0xa

    invoke-static {p0, v6}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v1, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 2429
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 2430
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 2431
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 2433
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2437
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2442
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 2443
    const-string v5, "patches_fullscreen_state"

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 2444
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2445
    sget-object v5, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v2, v5, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 2446
    const/16 v5, 0xb

    invoke-static {p0, v5}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2, v1, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 2447
    const/16 v5, 0x11

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 2448
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 2449
    const/16 v5, 0x8

    invoke-static {p0, v5}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v6

    invoke-static {p0, v5}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v7

    invoke-virtual {v2, v6, v1, v7, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 2450
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 2451
    const/16 v3, 0x38

    invoke-static {p0, v3}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 2453
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v1, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2458
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 2459
    const/16 v3, 0x3e

    invoke-static {p0, v3}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v3

    .line 2460
    const/16 v4, 0x1c

    invoke-static {p0, v4}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v4

    invoke-direct {v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 2458
    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2464
    :try_start_0
    invoke-static {p0, v5}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setElevation(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2466
    goto :goto_0

    .line 2465
    :catchall_0
    move-exception p0

    .line 2468
    :goto_0
    invoke-static {v0}, Lcom/waze/patches/Patches;->updateFullscreenSettingsRow(Landroid/view/View;)V

    .line 2469
    return-object v0
.end method

.method private static distanceUnitName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 1720
    const-string v0, "getUnit"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 1721
    invoke-static {p0}, Lcom/waze/patches/Patches;->navigationInstructionName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static ensureNativeUpdateMarginsResolved(Ljava/lang/Object;)Z
    .locals 7

    .line 1210
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 1213
    sget-object v1, Lcom/waze/patches/Patches;->sMarginsOwnerClass:Ljava/lang/Class;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    sget-object v1, Lcom/waze/patches/Patches;->sNativeUpdateMarginsPixelsMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_0

    .line 1214
    return v2

    .line 1217
    :cond_0
    const-string v1, "nativeUpdateMarginsPixels"

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1220
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 1222
    sput-object v0, Lcom/waze/patches/Patches;->sMarginsOwnerClass:Ljava/lang/Class;

    .line 1223
    sput-object v1, Lcom/waze/patches/Patches;->sNativeUpdateMarginsPixelsMethod:Ljava/lang/reflect/Method;

    .line 1225
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "nativeUpdateMargins RESOLVED owner="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1226
    return v2

    .line 1228
    :catchall_0
    move-exception v0

    .line 1229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "nativeUpdateMargins RESOLVE_FAILED "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " delegator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1230
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1229
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1231
    const-string p0, "applyCameraAnchor: resolve failed"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1232
    const/4 p0, 0x0

    return p0
.end method

.method private static findDebugOverlay(Landroid/view/ViewGroup;)Landroid/widget/TextView;
    .locals 2

    .line 2603
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2604
    return-object v0

    .line 2607
    :cond_0
    const-string v1, "patches_debug_overlay"

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 2608
    instance-of v1, p0, Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 2609
    check-cast p0, Landroid/widget/TextView;

    return-object p0

    .line 2612
    :cond_1
    return-object v0
.end method

.method private static findDebugToggleButton(Landroid/view/ViewGroup;)Landroid/widget/TextView;
    .locals 2

    .line 2616
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2617
    return-object v0

    .line 2620
    :cond_0
    const-string v1, "patches_debug_toggle"

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 2621
    instance-of v1, p0, Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 2622
    check-cast p0, Landroid/widget/TextView;

    return-object p0

    .line 2625
    :cond_1
    return-object v0
.end method

.method private static findDirectChildOf(Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;
    .locals 3

    .line 2800
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_2

    .line 2804
    :cond_0
    nop

    .line 2805
    const/4 v1, 0x0

    :goto_0
    if-eqz p1, :cond_3

    const/16 v2, 0xc

    if-ge v1, v2, :cond_3

    .line 2806
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 2807
    if-ne v2, p0, :cond_1

    .line 2808
    return-object p1

    .line 2810
    :cond_1
    instance-of p1, v2, Landroid/view/View;

    if-nez p1, :cond_2

    .line 2811
    goto :goto_1

    .line 2813
    :cond_2
    move-object p1, v2

    check-cast p1, Landroid/view/View;

    .line 2805
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2816
    :cond_3
    :goto_1
    return-object v0

    .line 2801
    :cond_4
    :goto_2
    return-object v0
.end method

.method private static findFirstLiveViewOfClass(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/lang/Class<",
            "*>;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 3217
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto :goto_1

    .line 3221
    :cond_0
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Lcom/waze/patches/Patches;->isLiveEtaView(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3222
    return-object p0

    .line 3225
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-nez v1, :cond_2

    .line 3226
    return-object v0

    .line 3229
    :cond_2
    check-cast p0, Landroid/view/ViewGroup;

    .line 3230
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 3231
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    .line 3232
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/waze/patches/Patches;->findFirstLiveViewOfClass(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v3

    .line 3233
    if-eqz v3, :cond_3

    .line 3234
    return-object v3

    .line 3231
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3238
    :cond_4
    return-object v0

    .line 3218
    :cond_5
    :goto_1
    return-object v0
.end method

.method private static findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .locals 3

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const-string v0, "id"

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const/4 v0, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static findFirstViewOfClass(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/lang/Class<",
            "*>;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 609
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto :goto_1

    .line 613
    :cond_0
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 614
    return-object p0

    .line 617
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-nez v1, :cond_2

    .line 618
    return-object v0

    .line 621
    :cond_2
    check-cast p0, Landroid/view/ViewGroup;

    .line 622
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 623
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    .line 624
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/waze/patches/Patches;->findFirstViewOfClass(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v3

    .line 625
    if-eqz v3, :cond_3

    .line 626
    return-object v3

    .line 623
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 629
    :cond_4
    return-object v0

    .line 610
    :cond_5
    :goto_1
    return-object v0
.end method

.method private static findFullscreenStateView(Landroid/view/ViewGroup;)Landroid/widget/TextView;
    .locals 2

    .line 2638
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2639
    return-object v0

    .line 2642
    :cond_0
    const-string v1, "patches_fullscreen_state"

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 2643
    instance-of v1, p0, Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 2644
    check-cast p0, Landroid/widget/TextView;

    return-object p0

    .line 2647
    :cond_1
    return-object v0
.end method

.method private static findFullscreenToggle(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 2629
    if-nez p0, :cond_0

    .line 2630
    const/4 p0, 0x0

    return-object p0

    .line 2633
    :cond_0
    const-string v0, "patches_fullscreen_toggle"

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 2634
    return-object p0
.end method

.method private static findNavBarViewByStructure(Landroid/view/View;)Landroid/view/View;
    .locals 5

    .line 633
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 634
    return-object v0

    .line 637
    :cond_0
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 638
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    .line 639
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    .line 640
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    .line 641
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v4}, Lcom/waze/patches/Patches;->findNavBarViewByStructure(Landroid/view/View;)Landroid/view/View;

    move-result-object v4

    .line 642
    if-eqz v4, :cond_1

    .line 643
    return-object v4

    .line 640
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 648
    :cond_2
    invoke-static {p0}, Lcom/waze/patches/Patches;->looksLikeNavBarContainer(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 649
    return-object p0

    .line 652
    :cond_3
    return-object v0
.end method

.method private static findNearestOpaqueBackgroundColor(Landroid/view/View;)Ljava/lang/Integer;
    .locals 5

    .line 2687
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2688
    return-object v0

    .line 2691
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 2692
    const/4 v1, 0x0

    :goto_0
    instance-of v2, p0, Landroid/view/View;

    if-eqz v2, :cond_2

    const/16 v2, 0x8

    if-ge v1, v2, :cond_2

    .line 2693
    check-cast p0, Landroid/view/View;

    .line 2695
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 2696
    instance-of v3, v2, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v3, :cond_1

    .line 2697
    check-cast v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v2

    .line 2698
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    const/16 v4, 0x80

    if-lt v3, v4, :cond_1

    .line 2699
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 2703
    :cond_1
    goto :goto_1

    .line 2702
    :catchall_0
    move-exception v2

    .line 2705
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 2692
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2708
    :cond_2
    return-object v0
.end method

.method private static findSettingsRowContainer(Landroid/app/Activity;Landroid/view/View;)Landroid/view/View;
    .locals 5

    .line 2771
    if-nez p1, :cond_0

    .line 2772
    const/4 p0, 0x0

    return-object p0

    .line 2775
    :cond_0
    const/16 v0, 0xdc

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v0

    .line 2776
    const/16 v1, 0x20

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result v1

    .line 2777
    const/16 v2, 0x60

    invoke-static {p0, v2}, Lcom/waze/patches/Patches;->toPx(Landroid/app/Activity;I)I

    move-result p0

    .line 2778
    nop

    .line 2780
    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x8

    if-ge v2, v3, :cond_3

    .line 2781
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 2782
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-nez v4, :cond_1

    .line 2783
    goto :goto_1

    .line 2786
    :cond_1
    move-object p1, v3

    check-cast p1, Landroid/view/ViewGroup;

    .line 2787
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    if-lt v3, v0, :cond_2

    .line 2788
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    if-lt v3, v1, :cond_2

    .line 2789
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    if-gt v3, p0, :cond_2

    .line 2790
    return-object p1

    .line 2793
    :cond_2
    nop

    .line 2780
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2796
    :cond_3
    :goto_1
    return-object p1
.end method

.method private static findSettingsRowForAnyText(Landroid/app/Activity;Landroid/view/View;[Ljava/lang/String;)Landroid/view/View;
    .locals 3

    .line 2747
    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 2748
    return-object v0

    .line 2751
    :cond_0
    const/4 v1, 0x0

    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_2

    .line 2752
    aget-object v2, p2, v1

    invoke-static {p0, p1, v2}, Lcom/waze/patches/Patches;->findSettingsRowForText(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 2753
    if-eqz v2, :cond_1

    .line 2754
    return-object v2

    .line 2751
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2758
    :cond_2
    return-object v0
.end method

.method private static findSettingsRowForText(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .locals 0

    .line 2762
    invoke-static {p1, p2}, Lcom/waze/patches/Patches;->findVisibleTextViewWithText(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p1

    .line 2763
    if-nez p1, :cond_0

    .line 2764
    const/4 p0, 0x0

    return-object p0

    .line 2767
    :cond_0
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->findSettingsRowContainer(Landroid/app/Activity;Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private static findTaggedTextView(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 1

    .line 2651
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 2655
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 2656
    instance-of p1, p0, Landroid/widget/TextView;

    if-eqz p1, :cond_1

    .line 2657
    check-cast p0, Landroid/widget/TextView;

    return-object p0

    .line 2660
    :cond_1
    return-object v0

    .line 2652
    :cond_2
    :goto_0
    return-object v0
.end method

.method private static findVisibleTextViewWithText(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    .line 2719
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto :goto_1

    .line 2723
    :cond_0
    instance-of v1, p0, Landroid/widget/TextView;

    if-eqz v1, :cond_1

    invoke-static {p0}, Lcom/waze/patches/Patches;->isActuallyVisible(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2724
    move-object v1, p0

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 2725
    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2726
    return-object v1

    .line 2730
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-nez v1, :cond_2

    .line 2731
    return-object v0

    .line 2734
    :cond_2
    check-cast p0, Landroid/view/ViewGroup;

    .line 2735
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 2736
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    .line 2737
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/waze/patches/Patches;->findVisibleTextViewWithText(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    .line 2738
    if-eqz v3, :cond_3

    .line 2739
    return-object v3

    .line 2736
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2743
    :cond_4
    return-object v0

    .line 2720
    :cond_5
    :goto_1
    return-object v0
.end method

.method private static firstNonEmpty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1725
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 1726
    return-object p0

    .line 1728
    :cond_0
    return-object p1
.end method

.method private static getCameraExtraBottomOffsetPx()I
    .locals 3

    .line 1043
    sget v0, Lcom/waze/patches/Patches;->sDisplayHeightPx:I

    .line 1044
    if-gtz v0, :cond_0

    .line 1045
    sget v0, Lcom/waze/patches/Patches;->sViewHeight:I

    .line 1047
    :cond_0
    if-gtz v0, :cond_1

    .line 1048
    sget v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    .line 1050
    :cond_1
    const/4 v1, 0x0

    if-gtz v0, :cond_2

    .line 1051
    return v1

    .line 1054
    :cond_2
    int-to-float v0, v0

    const v2, 0x3d8f5c29    # 0.07f

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private static getDisplay(Landroid/app/Activity;)Landroid/view/Display;
    .locals 2

    .line 2999
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 3000
    return-object v0

    .line 3004
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3005
    if-eqz v1, :cond_1

    .line 3006
    return-object v1

    .line 3009
    :cond_1
    goto :goto_0

    .line 3008
    :catchall_0
    move-exception v1

    .line 3012
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 3013
    if-nez p0, :cond_2

    .line 3014
    return-object v0

    .line 3017
    :cond_2
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    .line 3018
    if-eqz p0, :cond_3

    .line 3019
    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    .line 3022
    :cond_3
    goto :goto_1

    .line 3021
    :catchall_1
    move-exception p0

    .line 3024
    :goto_1
    return-object v0
.end method

.method private static getDisplayId(Landroid/app/Activity;)I
    .locals 0

    .line 3028
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplay(Landroid/app/Activity;)Landroid/view/Display;

    move-result-object p0

    .line 3029
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    sput p0, Lcom/waze/patches/Patches;->sDisplayId:I

    .line 3030
    sget p0, Lcom/waze/patches/Patches;->sDisplayId:I

    return p0
.end method

.method private static getDisplayId(Landroid/view/View;)I
    .locals 1

    .line 3034
    const/4 v0, -0x1

    if-nez p0, :cond_0

    return v0

    .line 3036
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p0

    .line 3037
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 3039
    :cond_1
    goto :goto_0

    .line 3038
    :catchall_0
    move-exception p0

    .line 3040
    :goto_0
    return v0
.end method

.method private static getDynamicCameraBottomMargin()I
    .locals 3

    .line 1025
    sget v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    if-lez v0, :cond_0

    sget v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/waze/patches/Patches;->sViewHeight:I

    .line 1026
    :goto_0
    nop

    .line 1027
    const/4 v1, 0x0

    if-lez v0, :cond_1

    .line 1028
    int-to-float v0, v0

    const v2, 0x3e19999a    # 0.15f

    mul-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1031
    :cond_1
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {}, Lcom/waze/patches/Patches;->getCameraExtraBottomOffsetPx()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static getDynamicCameraTopMargin()I
    .locals 2

    .line 1035
    const/4 v0, 0x0

    sget v1, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private static getEtaCameraBottomFloor()I
    .locals 2

    .line 1058
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    if-lez v0, :cond_0

    .line 1059
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    return v0

    .line 1062
    :cond_0
    sget v0, Lcom/waze/patches/Patches;->sEtaCollapsedNewHeightPx:I

    const/4 v1, 0x0

    if-gez v0, :cond_1

    .line 1063
    return v1

    .line 1066
    :cond_1
    sget v0, Lcom/waze/patches/Patches;->sEtaHeightCollapsedPx:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private static getEtaGoSearchRoot(Landroid/view/View;)Landroid/view/View;
    .locals 1

    .line 3153
    if-nez p0, :cond_0

    .line 3154
    const/4 p0, 0x0

    return-object p0

    .line 3158
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3159
    if-eqz v0, :cond_1

    .line 3160
    return-object v0

    .line 3163
    :cond_1
    goto :goto_0

    .line 3162
    :catchall_0
    move-exception v0

    .line 3165
    :goto_0
    return-object p0
.end method

.method private static getLiveDisplayMetrics(Landroid/app/Activity;)Landroid/util/DisplayMetrics;
    .locals 4

    .line 1950
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 1951
    return-object v0

    .line 1955
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplay(Landroid/app/Activity;)Landroid/view/Display;

    move-result-object v1

    .line 1956
    if-eqz v1, :cond_1

    .line 1957
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1959
    :try_start_1
    invoke-virtual {v1, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1962
    goto :goto_0

    .line 1960
    :catchall_0
    move-exception v3

    .line 1961
    :try_start_2
    invoke-virtual {v1, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 1964
    :goto_0
    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lez v1, :cond_1

    iget v1, v2, Landroid/util/DisplayMetrics;->heightPixels:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-lez v1, :cond_1

    .line 1965
    return-object v2

    .line 1969
    :cond_1
    goto :goto_1

    .line 1968
    :catchall_1
    move-exception v1

    .line 1972
    :goto_1
    :try_start_3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 1973
    if-eqz p0, :cond_2

    .line 1974
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 1975
    if-eqz p0, :cond_2

    iget v1, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lez v1, :cond_2

    iget v1, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    if-lez v1, :cond_2

    .line 1976
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 1977
    invoke-virtual {v1, p0}, Landroid/util/DisplayMetrics;->setTo(Landroid/util/DisplayMetrics;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1978
    return-object v1

    .line 1982
    :cond_2
    goto :goto_2

    .line 1981
    :catchall_2
    move-exception p0

    .line 1984
    :goto_2
    return-object v0
.end method

.method private static getOverlayHost(Landroid/app/Activity;)Landroid/view/ViewGroup;
    .locals 2

    .line 2582
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2583
    return-object v0

    .line 2587
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 2588
    if-nez p0, :cond_1

    .line 2589
    return-object v0

    .line 2592
    :cond_1
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    .line 2593
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 2594
    check-cast p0, Landroid/view/ViewGroup;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 2597
    :cond_2
    goto :goto_0

    .line 2596
    :catchall_0
    move-exception p0

    .line 2599
    :goto_0
    return-object v0
.end method

.method private static getRootView(Landroid/app/Activity;)Landroid/view/View;
    .locals 2

    .line 2963
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2964
    const-string p0, "getRootView: activity=null"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 2965
    return-object v0

    .line 2968
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 2969
    if-nez p0, :cond_1

    .line 2970
    const-string p0, "getRootView: window=null"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 2971
    return-object v0

    .line 2974
    :cond_1
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    .line 2975
    if-nez p0, :cond_2

    .line 2976
    const-string p0, "getRootView: decorView=null"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 2977
    return-object v0

    .line 2980
    :cond_2
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 2981
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_3

    .line 2982
    const-string v0, "getRootView: android.R.id.content missing or not ViewGroup, using decor"

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 2983
    return-object p0

    .line 2985
    :cond_3
    check-cast v0, Landroid/view/ViewGroup;

    .line 2986
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p0

    .line 2988
    const/4 v1, 0x1

    if-ne p0, v1, :cond_4

    .line 2989
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    .line 2990
    if-eqz p0, :cond_4

    .line 2991
    return-object p0

    .line 2995
    :cond_4
    return-object v0
.end method

.method private static getWindowMode5Or6FromConfigString(Landroid/content/res/Configuration;)I
    .locals 2

    .line 2152
    const/4 v0, -0x1

    if-nez p0, :cond_0

    .line 2153
    return v0

    .line 2157
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/res/Configuration;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2158
    if-nez p0, :cond_1

    .line 2159
    return v0

    .line 2161
    :cond_1
    const-string v1, "mWindowingMode=freeform"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_5

    const-string v1, "windowingMode=5"

    .line 2162
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_5

    const-string v1, "mWindowingMode=5"

    .line 2163
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_2

    goto :goto_1

    .line 2166
    :cond_2
    const-string v1, "mWindowingMode=multi-window"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_4

    const-string v1, "windowingMode=6"

    .line 2167
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_4

    const-string v1, "mWindowingMode=6"

    .line 2168
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ltz p0, :cond_3

    goto :goto_0

    .line 2172
    :cond_3
    goto :goto_2

    .line 2169
    :cond_4
    :goto_0
    const/4 p0, 0x6

    return p0

    .line 2164
    :cond_5
    :goto_1
    const/4 p0, 0x5

    return p0

    .line 2171
    :catchall_0
    move-exception p0

    .line 2173
    :goto_2
    return v0
.end method

.method private static getWindowingMode(Landroid/app/Activity;)I
    .locals 6

    .line 2116
    const/4 v0, -0x1

    if-nez p0, :cond_0

    .line 2117
    return v0

    .line 2121
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 2122
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 2123
    :goto_0
    if-nez p0, :cond_2

    .line 2124
    return v0

    .line 2127
    :cond_2
    invoke-static {p0}, Lcom/waze/patches/Patches;->getWindowMode5Or6FromConfigString(Landroid/content/res/Configuration;)I

    move-result v1

    .line 2128
    if-eq v1, v0, :cond_3

    .line 2129
    return v1

    .line 2132
    :cond_3
    const-class v1, Landroid/content/res/Configuration;

    const-string v2, "windowConfiguration"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 2133
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 2134
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 2135
    if-nez p0, :cond_4

    .line 2136
    return v0

    .line 2139
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "getWindowingMode"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 2140
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 2141
    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 2142
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_5

    .line 2143
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 2146
    :cond_5
    goto :goto_1

    .line 2145
    :catchall_0
    move-exception p0

    .line 2148
    :goto_1
    return v0
.end method

.method private static hasDescendantOfClassName(Landroid/view/View;Ljava/lang/String;)Z
    .locals 1

    .line 666
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/waze/patches/Patches;->countDescendantsOfClassName(Landroid/view/View;Ljava/lang/String;I)I

    move-result p0

    if-lt p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static hasResourceEntryName(Landroid/view/View;Ljava/lang/String;)Z
    .locals 3

    .line 839
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 844
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 845
    :catchall_0
    move-exception p0

    .line 846
    return v0

    .line 840
    :cond_1
    :goto_0
    return v0
.end method

.method private static increaseHeight(IF)I
    .locals 1

    .line 3252
    int-to-float v0, p0

    mul-float/2addr v0, p1

    .line 3253
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    add-int/2addr p1, p0

    .line 3252
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static init(Landroid/app/Application;)V
    .locals 2

    .line 209
    if-eqz p0, :cond_1

    sget-boolean v0, Lcom/waze/patches/Patches;->sInitDone:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 211
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/waze/patches/Patches;->sInitDone:Z

    .line 212
    sput-object p0, Lcom/waze/patches/Patches;->sApplication:Landroid/app/Application;

    .line 213
    invoke-static {p0}, Lcom/waze/patches/Patches;->loadFullscreenEnabled(Landroid/app/Application;)Z

    move-result v0

    sput-boolean v0, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "init version=waze-v5.17.10.0.16-prod fullscreen="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v1, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 218
    new-instance v0, Lcom/waze/patches/Patches$1;

    invoke-direct {v0}, Lcom/waze/patches/Patches$1;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 280
    return-void

    .line 209
    :cond_1
    :goto_0
    return-void
.end method

.method private static invokeBoolean(Ljava/lang/Object;Ljava/lang/String;Z)Z
    .locals 0

    .line 1765
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 1766
    instance-of p1, p0, Ljava/lang/Boolean;

    if-eqz p1, :cond_0

    .line 1767
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    .line 1769
    :cond_0
    return p2
.end method

.method private static invokeDouble(Ljava/lang/Object;Ljava/lang/String;D)D
    .locals 0

    .line 1757
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 1758
    instance-of p1, p0, Ljava/lang/Number;

    if-eqz p1, :cond_0

    .line 1759
    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide p0

    return-wide p0

    .line 1761
    :cond_0
    return-wide p2
.end method

.method public static invokeEtaGo(Landroid/view/View;)V
    .locals 4

    .line 1426
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsEtaAutoGoInvoked:Z

    if-eqz v0, :cond_0

    .line 1427
    const-string p0, "invokeEtaGo: auto-go already invoked, skipping"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1428
    return-void

    .line 1431
    :cond_0
    if-eqz p0, :cond_1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 1432
    new-instance v0, Lcom/waze/patches/Patches$8;

    invoke-direct {v0, p0}, Lcom/waze/patches/Patches$8;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 1438
    return-void

    .line 1441
    :cond_1
    invoke-static {p0}, Lcom/waze/patches/Patches;->resolveLiveEtaControlPanelView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 1442
    if-nez v0, :cond_2

    .line 1443
    const-string p0, "invokeEtaGo: no live EtaControlPanelView"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1444
    return-void

    .line 1447
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lcom/waze/patches/Patches;->resolveEtaGoTapMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1448
    if-nez v1, :cond_3

    .line 1449
    const-string p0, "invokeEtaGo: Go method not found"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1450
    return-void

    .line 1454
    :cond_3
    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_0
    sput-boolean v2, Lcom/waze/patches/Patches;->sIsEtaAutoGoInvoked:Z

    .line 1455
    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1456
    if-eqz p0, :cond_4

    goto :goto_0

    :cond_4
    move-object p0, v0

    :goto_0
    const-string v0, "invokeEtaGo"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->scheduleDynamicCameraAnchorReapply(Landroid/view/View;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1461
    goto :goto_1

    .line 1458
    :catchall_0
    move-exception p0

    .line 1459
    sput-boolean v3, Lcom/waze/patches/Patches;->sIsEtaAutoGoInvoked:Z

    .line 1460
    const-string p0, "invokeEtaGo: invoke failed"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1462
    :goto_1
    return-void
.end method

.method private static invokeInt(Ljava/lang/Object;Ljava/lang/String;I)I
    .locals 0

    .line 1749
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 1750
    instance-of p1, p0, Ljava/lang/Number;

    if-eqz p1, :cond_0

    .line 1751
    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0

    .line 1753
    :cond_0
    return p2
.end method

.method private static invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 4

    .line 1732
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 1733
    return-object v0

    .line 1736
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v1, p1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 1737
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 1738
    :catchall_0
    move-exception p0

    .line 1739
    return-object v0
.end method

.method private static invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1744
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 1745
    if-eqz p0, :cond_0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private static isActivityLandscape(Landroid/app/Activity;)Z
    .locals 6

    .line 3058
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 3059
    return v0

    .line 3062
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplay(Landroid/app/Activity;)Landroid/view/Display;

    move-result-object v1

    .line 3063
    const/4 v2, 0x1

    if-eqz v1, :cond_4

    .line 3065
    :try_start_0
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3067
    :try_start_1
    invoke-virtual {v1, v3}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3070
    goto :goto_0

    .line 3068
    :catchall_0
    move-exception v4

    .line 3069
    :try_start_2
    invoke-virtual {v1, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 3072
    :goto_0
    iget v1, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lez v1, :cond_3

    iget v1, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    if-lez v1, :cond_3

    .line 3073
    iget v1, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v4, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le v1, v4, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    move v1, v0

    .line 3074
    :goto_1
    if-eqz v1, :cond_2

    iget v4, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    const/16 v5, 0x3e8

    if-ge v4, v5, :cond_2

    move v4, v2

    goto :goto_2

    :cond_2
    move v4, v0

    :goto_2
    sput-boolean v4, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    .line 3075
    iget v4, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v4, Lcom/waze/patches/Patches;->sDisplayWidthPx:I

    .line 3076
    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v3, Lcom/waze/patches/Patches;->sDisplayHeightPx:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 3082
    return v1

    .line 3085
    :cond_3
    goto :goto_3

    .line 3084
    :catchall_1
    move-exception v1

    .line 3088
    :cond_4
    :goto_3
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    .line 3089
    if-nez p0, :cond_5

    .line 3090
    return v0

    .line 3093
    :cond_5
    iget v1, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x2

    if-ne v1, v3, :cond_6

    move v0, v2

    .line 3094
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isActivityLandscape: fallback configOrientation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " landscape="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 3098
    return v0
.end method

.method private static isActuallyVisible(Landroid/view/View;)Z
    .locals 1

    .line 2820
    if-eqz p0, :cond_0

    .line 2821
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 2822
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2823
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    .line 2824
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 2820
    :goto_0
    return p0
.end method

.method public static isAutomotiveOSForced()Z
    .locals 1

    .line 1499
    sget-boolean v0, Lcom/waze/patches/Patches;->IS_AUTOMOTIVE_OS:Z

    return v0
.end method

.method private static isCurrentActivityInSteeringDisplay()Z
    .locals 1

    .line 2100
    sget-object v0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 2101
    if-nez v0, :cond_0

    .line 2102
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    return v0

    .line 2105
    :cond_0
    invoke-static {v0}, Lcom/waze/patches/Patches;->isInSteeringDisplay(Landroid/app/Activity;)Z

    move-result v0

    sput-boolean v0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    .line 2106
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    return v0
.end method

.method private static isCurrentActivityWindowMode5Or6()Z
    .locals 1

    .line 2096
    sget-object v0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0}, Lcom/waze/patches/Patches;->isWindowMode5Or6(Landroid/app/Activity;)Z

    move-result v0

    return v0
.end method

.method private static isForcedXhdpiActive(Landroid/content/res/Resources;)Z
    .locals 3

    .line 1939
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 1940
    return v0

    .line 1943
    :cond_0
    sget-object v1, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 1944
    :try_start_0
    sget-object v2, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;

    .line 1945
    if-eqz p0, :cond_1

    iget-boolean v2, p0, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->isApplied:Z

    if-eqz v2, :cond_1

    iget-boolean p0, p0, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->isForcedXhdpiActive:Z

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    monitor-exit v1

    return v0

    .line 1946
    :catchall_0
    move-exception p0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private static isInSteeringDisplay(Landroid/app/Activity;)Z
    .locals 3

    .line 3103
    invoke-static {p0}, Lcom/waze/patches/Patches;->isActivityLandscape(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 3107
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/app/Activity;)I

    move-result p0

    .line 3108
    if-gez p0, :cond_1

    return v1

    .line 3110
    :cond_1
    invoke-static {}, Lcom/waze/patches/Patches;->isRightRudder()Z

    move-result v0

    .line 3112
    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 3113
    if-nez p0, :cond_2

    move v1, v2

    :cond_2
    return v1

    .line 3115
    :cond_3
    if-eqz p0, :cond_4

    move v1, v2

    :cond_4
    return v1
.end method

.method private static isLightColor(I)Z
    .locals 8

    .line 2712
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x406fe00000000000L    # 255.0

    div-double/2addr v0, v2

    .line 2713
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    int-to-double v4, v4

    div-double/2addr v4, v2

    .line 2714
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-double v6, p0

    div-double/2addr v6, v2

    .line 2715
    const-wide v2, 0x3fd322d0e5604189L    # 0.299

    mul-double/2addr v0, v2

    const-wide v2, 0x3fe2c8b439581062L    # 0.587

    mul-double/2addr v4, v2

    add-double/2addr v0, v4

    const-wide v2, 0x3fbd2f1a9fbe76c9L    # 0.114

    mul-double/2addr v6, v2

    add-double/2addr v0, v6

    const-wide v2, 0x3fe199999999999aL    # 0.55

    cmpl-double p0, v0, v2

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isLightFullscreenTheme(Landroid/app/Activity;Landroid/view/View;)Z
    .locals 1

    .line 2664
    invoke-static {p1}, Lcom/waze/patches/Patches;->findNearestOpaqueBackgroundColor(Landroid/view/View;)Ljava/lang/Integer;

    move-result-object p1

    .line 2665
    if-eqz p1, :cond_0

    .line 2666
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->isLightColor(I)Z

    move-result p0

    return p0

    .line 2670
    :cond_0
    const/4 p1, 0x0

    if-eqz p0, :cond_1

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    goto :goto_0

    .line 2680
    :catchall_0
    move-exception p0

    goto :goto_1

    .line 2670
    :cond_1
    const/4 p0, 0x0

    .line 2671
    :goto_0
    if-eqz p0, :cond_3

    .line 2672
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    and-int/lit8 p0, p0, 0x30

    .line 2673
    const/16 v0, 0x20

    if-ne p0, v0, :cond_2

    .line 2674
    return p1

    .line 2676
    :cond_2
    const/16 v0, 0x10

    if-ne p0, v0, :cond_3

    .line 2677
    const/4 p0, 0x1

    return p0

    .line 2681
    :cond_3
    nop

    .line 2683
    :goto_1
    return p1
.end method

.method private static isLiveEtaView(Landroid/view/View;)Z
    .locals 2

    .line 3243
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->isReadyForTransform(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3244
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    .line 3245
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 3243
    :goto_0
    return v0

    .line 3246
    :catchall_0
    move-exception p0

    .line 3247
    return v0
.end method

.method private static isMainActivity(Landroid/app/Activity;)Z
    .locals 1

    .line 2950
    if-nez p0, :cond_0

    .line 2951
    const/4 p0, 0x0

    return p0

    .line 2954
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    .line 2955
    const-string v0, "com.waze.MainActivity"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    .line 2959
    return p0
.end method

.method private static isMyCarActive()Z
    .locals 1

    .line 2027
    invoke-static {}, Lcom/vadimbrk/mycar/MyCarServiceClient;->getInstance()Lcom/vadimbrk/mycar/MyCarServiceClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->isActiveSafe()Z

    move-result v0

    return v0
.end method

.method public static isNavBarExists()Z
    .locals 1

    .line 2189
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavBarExists:Z

    return v0
.end method

.method public static isNavigating()Z
    .locals 1

    .line 1524
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    return v0
.end method

.method private static isReadyForTransform(Landroid/view/View;)Z
    .locals 1

    .line 3120
    if-eqz p0, :cond_0

    .line 3121
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3122
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_0

    .line 3123
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 3120
    :goto_0
    return p0
.end method

.method private static isRightRudder()Z
    .locals 1

    .line 2177
    invoke-static {}, Lcom/vadimbrk/mycar/MyCarServiceClient;->getInstance()Lcom/vadimbrk/mycar/MyCarServiceClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->isRightRudderSafe()Z

    move-result v0

    return v0
.end method

.method private static isWindowMode5Or6(Landroid/app/Activity;)Z
    .locals 1

    .line 2110
    invoke-static {p0}, Lcom/waze/patches/Patches;->getWindowingMode(Landroid/app/Activity;)I

    move-result p0

    .line 2111
    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsWindowMode5Or6:Z

    .line 2112
    sget-boolean p0, Lcom/waze/patches/Patches;->sIsWindowMode5Or6:Z

    return p0
.end method

.method private static loadFullscreenEnabled(Landroid/app/Application;)Z
    .locals 2

    .line 2031
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 2032
    return v0

    .line 2036
    :cond_0
    :try_start_0
    const-string v1, "waze_patches_settings"

    invoke-virtual {p0, v1, v0}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 2037
    if-eqz p0, :cond_1

    const-string v1, "fullscreen"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 2038
    :catchall_0
    move-exception p0

    .line 2039
    return v0
.end method

.method private static logDebug(Ljava/lang/String;)V
    .locals 0

    .line 2900
    return-void
.end method

.method private static looksLikeNavBarContainer(Landroid/view/View;)Z
    .locals 3

    .line 656
    instance-of v0, p0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 657
    return v1

    .line 660
    :cond_0
    const-string v0, "com.waze.navbar.InstructionView"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->hasDescendantOfClassName(Landroid/view/View;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 661
    const-string v0, "com.waze.ui.navbar.LaneGuidanceView"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->hasDescendantOfClassName(Landroid/view/View;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 662
    const-string v0, "com.waze.view.navbar.NavBarText"

    const/4 v2, 0x2

    invoke-static {p0, v0, v2}, Lcom/waze/patches/Patches;->countDescendantsOfClassName(Landroid/view/View;Ljava/lang/String;I)I

    move-result p0

    if-lt p0, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 660
    :goto_0
    return v1
.end method

.method private static navigationInstructionName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 1702
    if-nez p0, :cond_0

    .line 1703
    const/4 p0, 0x0

    return-object p0

    .line 1706
    :cond_0
    :try_start_0
    instance-of v0, p0, Ljava/lang/Enum;

    if-eqz v0, :cond_1

    .line 1707
    move-object v0, p0

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 1710
    :cond_1
    goto :goto_0

    .line 1709
    :catchall_0
    move-exception v0

    .line 1711
    :goto_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static navigationRoadSignText(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1715
    const-string v0, "getTextRepresentation"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "getPrimaryMarkup"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/waze/patches/Patches;->firstNonEmpty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1716
    const-string v1, "getSecondaryMarkup"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/waze/patches/Patches;->firstNonEmpty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static noteActivityDisplay(Landroid/app/Activity;Ljava/lang/String;)I
    .locals 3

    .line 3044
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/app/Activity;)I

    move-result p0

    .line 3045
    sget v0, Lcom/waze/patches/Patches;->sDisplayId:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    sget v0, Lcom/waze/patches/Patches;->sPreviousActivityDisplayId:I

    sget v2, Lcom/waze/patches/Patches;->sDisplayId:I

    if-eq v0, v2, :cond_0

    .line 3046
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "noteActivityDisplay: caller="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " display changed "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget v0, Lcom/waze/patches/Patches;->sPreviousActivityDisplayId:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " -> "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 3050
    sput p0, Lcom/waze/patches/Patches;->sPreviousActivityDisplayId:I

    .line 3051
    sput v1, Lcom/waze/patches/Patches;->sViewHeight:I

    .line 3052
    sput v1, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    .line 3054
    :cond_0
    return p0
.end method

.method private static noteEtaGoDisplay(Landroid/view/View;)I
    .locals 1

    .line 3129
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/view/View;)I

    move-result p0

    .line 3130
    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    sget v0, Lcom/waze/patches/Patches;->sPreviousEtaDisplayId:I

    if-eq v0, p0, :cond_0

    .line 3132
    const/4 v0, 0x0

    sput-boolean v0, Lcom/waze/patches/Patches;->sIsEtaAutoGoInvoked:Z

    .line 3133
    sput p0, Lcom/waze/patches/Patches;->sPreviousEtaDisplayId:I

    .line 3135
    :cond_0
    return p0
.end method

.method public static onCurrentInstructionChanged(Ljava/lang/Object;)V
    .locals 0

    .line 1545
    invoke-static {p0}, Lcom/waze/patches/Patches;->navigationInstructionName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastCurrentInstruction:Ljava/lang/String;

    .line 1546
    const-string p0, "current_instruction"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1547
    return-void
.end method

.method public static onCurrentInstructionDistanceChanged(Ljava/lang/Object;)V
    .locals 3

    .line 1555
    const-string v0, "getValueString"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistance:Ljava/lang/String;

    .line 1556
    const-string v0, "getUnitString"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnit:Ljava/lang/String;

    .line 1557
    invoke-static {p0}, Lcom/waze/patches/Patches;->distanceUnitName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitName:Ljava/lang/String;

    .line 1558
    const-string v0, "getUnitValue"

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->invokeInt(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitValue:I

    .line 1559
    const-string v0, "getRawMeters"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->invokeInt(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceMeters:I

    .line 1560
    const-string v0, "getValue"

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-static {p0, v0, v1, v2}, Lcom/waze/patches/Patches;->invokeDouble(Ljava/lang/Object;Ljava/lang/String;D)D

    move-result-wide v0

    sput-wide v0, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceValue:D

    .line 1561
    const-string p0, "current_instruction_distance"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1562
    return-void
.end method

.method public static onEtaDistanceChanged(Ljava/lang/Object;)V
    .locals 3

    .line 1565
    const-string v0, "getValueString"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistance:Ljava/lang/String;

    .line 1566
    const-string v0, "getUnitString"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnit:Ljava/lang/String;

    .line 1567
    invoke-static {p0}, Lcom/waze/patches/Patches;->distanceUnitName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitName:Ljava/lang/String;

    .line 1568
    const-string v0, "getUnitValue"

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->invokeInt(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitValue:I

    .line 1569
    const-string v0, "getRawMeters"

    invoke-static {p0, v0, v1}, Lcom/waze/patches/Patches;->invokeInt(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceMeters:I

    .line 1570
    const-string v0, "getValue"

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-static {p0, v0, v1, v2}, Lcom/waze/patches/Patches;->invokeDouble(Ljava/lang/Object;Ljava/lang/String;D)D

    move-result-wide v0

    sput-wide v0, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceValue:D

    .line 1571
    const-string p0, "eta_distance"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1572
    return-void
.end method

.method public static onEtaMinutesChanged(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1575
    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastEtaTime:Ljava/lang/String;

    .line 1576
    sput-object p1, Lcom/waze/patches/Patches;->sBroadcastEtaTimeUnit:Ljava/lang/String;

    .line 1577
    sput p2, Lcom/waze/patches/Patches;->sBroadcastEtaMinutes:I

    .line 1578
    const-string p0, "eta_time"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1579
    return-void
.end method

.method public static onMainCanvasDelegatorCreated(Ljava/lang/Object;)V
    .locals 2

    .line 1092
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "delegatorCreated hook delegator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " lastTop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " left="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " right="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraRight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1097
    invoke-static {p0}, Lcom/waze/patches/Patches;->rememberCameraDelegator(Ljava/lang/Object;)V

    .line 1099
    sget-object p0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    .line 1100
    const-string v0, "delegatorCreated"

    if-eqz p0, :cond_0

    .line 1101
    invoke-static {p0}, Lcom/waze/patches/Patches;->isInSteeringDisplay(Landroid/app/Activity;)Z

    move-result v1

    sput-boolean v1, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    .line 1102
    invoke-static {p0}, Lcom/waze/patches/Patches;->getRootView(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->scheduleDynamicCameraAnchorReapply(Landroid/view/View;Ljava/lang/String;)V

    .line 1103
    return-void

    .line 1106
    :cond_0
    invoke-static {v0}, Lcom/waze/patches/Patches;->applyDynamicCameraAnchor(Ljava/lang/String;)Z

    .line 1107
    return-void
.end method

.method public static onNativeNavigationStateChanged(ZI)V
    .locals 2

    .line 1532
    sput p1, Lcom/waze/patches/Patches;->sBroadcastNavigationStateCode:I

    .line 1533
    if-nez p0, :cond_0

    .line 1534
    invoke-static {}, Lcom/waze/patches/Patches;->clearNavigationBroadcastSnapshot()V

    .line 1536
    :cond_0
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    if-eq v0, p0, :cond_1

    .line 1537
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    .line 1538
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onNativeNavigationStateChanged: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " stateCode="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1539
    const-string p0, "onNativeNavigationStateChanged"

    invoke-static {p0}, Lcom/waze/patches/Patches;->updateCurrentDebugOverlay(Ljava/lang/String;)V

    .line 1541
    :cond_1
    const-string p0, "native_navigation_state"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1542
    return-void
.end method

.method public static onNextInstructionChanged(Ljava/lang/Object;)V
    .locals 0

    .line 1550
    invoke-static {p0}, Lcom/waze/patches/Patches;->navigationInstructionName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastNextInstruction:Ljava/lang/String;

    .line 1551
    const-string p0, "next_instruction"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1552
    return-void
.end method

.method public static onNextNameChanged(Ljava/lang/Object;)V
    .locals 3

    .line 1593
    const-string v0, "getRoadSign"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1594
    const-string v1, "getStreetName"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastNextStreetName:Ljava/lang/String;

    .line 1595
    const-string v1, "getSegmentIdx"

    const/4 v2, -0x1

    invoke-static {p0, v1, v2}, Lcom/waze/patches/Patches;->invokeInt(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/waze/patches/Patches;->sBroadcastNextStreetSegmentIdx:I

    .line 1596
    const-string v1, "getDisplayArrowBeforeText"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/waze/patches/Patches;->invokeBoolean(Ljava/lang/Object;Ljava/lang/String;Z)Z

    move-result p0

    sput-boolean p0, Lcom/waze/patches/Patches;->sBroadcastNextStreetArrowBeforeText:Z

    .line 1597
    invoke-static {v0}, Lcom/waze/patches/Patches;->navigationRoadSignText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignText:Ljava/lang/String;

    .line 1598
    const-string p0, "getPrimaryMarkup"

    invoke-static {v0, p0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignPrimary:Ljava/lang/String;

    .line 1599
    const-string p0, "getSecondaryMarkup"

    invoke-static {v0, p0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignSecondary:Ljava/lang/String;

    .line 1600
    const-string p0, "next_street_name"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1601
    return-void
.end method

.method public static onStreetNameChanged(Ljava/lang/Object;)V
    .locals 3

    .line 1582
    const-string v0, "getRoadSign"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->invokeObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1583
    const-string v1, "getStreetName"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetName:Ljava/lang/String;

    .line 1584
    const-string v1, "getSegmentIdx"

    const/4 v2, -0x1

    invoke-static {p0, v1, v2}, Lcom/waze/patches/Patches;->invokeInt(Ljava/lang/Object;Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetSegmentIdx:I

    .line 1585
    const-string v1, "getShowHov"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/waze/patches/Patches;->invokeBoolean(Ljava/lang/Object;Ljava/lang/String;Z)Z

    move-result p0

    sput-boolean p0, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetShowHov:Z

    .line 1586
    invoke-static {v0}, Lcom/waze/patches/Patches;->navigationRoadSignText(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignText:Ljava/lang/String;

    .line 1587
    const-string p0, "getPrimaryMarkup"

    invoke-static {v0, p0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignPrimary:Ljava/lang/String;

    .line 1588
    const-string p0, "getSecondaryMarkup"

    invoke-static {v0, p0}, Lcom/waze/patches/Patches;->invokeString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignSecondary:Ljava/lang/String;

    .line 1589
    const-string p0, "current_street_name"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1590
    return-void
.end method

.method private static persistFullscreenEnabled(Z)V
    .locals 3

    .line 2044
    sget-object v0, Lcom/waze/patches/Patches;->sApplication:Landroid/app/Application;

    .line 2045
    if-nez v0, :cond_0

    .line 2046
    return-void

    .line 2050
    :cond_0
    :try_start_0
    const-string v1, "waze_patches_settings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2051
    if-eqz v0, :cond_1

    .line 2052
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "fullscreen"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2055
    :cond_1
    goto :goto_0

    .line 2054
    :catchall_0
    move-exception p0

    .line 2056
    :goto_0
    return-void
.end method

.method public static reapplyCameraAnchorAfterCameraCall(Ljava/lang/Object;)V
    .locals 2

    .line 1071
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cameraCall hook delegator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " lastTop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " left="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " right="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraRight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1076
    if-eqz p0, :cond_0

    .line 1077
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sLastCameraDelegatorRef:Ljava/lang/ref/WeakReference;

    .line 1080
    :cond_0
    sget-object p0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    .line 1081
    const-string v0, "cameraCall"

    if-eqz p0, :cond_1

    .line 1082
    invoke-static {p0}, Lcom/waze/patches/Patches;->isInSteeringDisplay(Landroid/app/Activity;)Z

    move-result v1

    sput-boolean v1, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    .line 1083
    invoke-static {p0}, Lcom/waze/patches/Patches;->getRootView(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->scheduleDynamicCameraAnchorReapply(Landroid/view/View;Ljava/lang/String;)V

    .line 1084
    return-void

    .line 1087
    :cond_1
    invoke-static {v0}, Lcom/waze/patches/Patches;->applyDynamicCameraAnchor(Ljava/lang/String;)Z

    .line 1088
    return-void
.end method

.method private static rememberCameraDelegator(Ljava/lang/Object;)V
    .locals 2

    .line 935
    if-eqz p0, :cond_0

    .line 936
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sLastCameraDelegatorRef:Ljava/lang/ref/WeakReference;

    .line 937
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "rememberDelegator "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 939
    :cond_0
    return-void
.end method

.method private static rememberMainActivity(Landroid/app/Activity;)V
    .locals 1

    .line 2193
    if-eqz p0, :cond_0

    .line 2194
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    .line 2196
    :cond_0
    return-void
.end method

.method private static removeDebugOverlay(Landroid/app/Activity;)V
    .locals 2

    .line 2543
    invoke-static {p0}, Lcom/waze/patches/Patches;->getOverlayHost(Landroid/app/Activity;)Landroid/view/ViewGroup;

    move-result-object p0

    .line 2544
    if-nez p0, :cond_0

    .line 2545
    return-void

    .line 2548
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->findDebugOverlay(Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object v0

    .line 2549
    if-eqz v0, :cond_2

    .line 2550
    sget-object v1, Lcom/waze/patches/Patches;->sDebugOverlayRefreshRunnable:Ljava/lang/Runnable;

    if-eqz v1, :cond_1

    .line 2551
    sget-object v1, Lcom/waze/patches/Patches;->sDebugOverlayRefreshRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2553
    :cond_1
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 2555
    :cond_2
    return-void
.end method

.method private static removeDebugToggleButton(Landroid/app/Activity;)V
    .locals 1

    .line 2558
    invoke-static {p0}, Lcom/waze/patches/Patches;->getOverlayHost(Landroid/app/Activity;)Landroid/view/ViewGroup;

    move-result-object p0

    .line 2559
    if-nez p0, :cond_0

    .line 2560
    return-void

    .line 2563
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->findDebugToggleButton(Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object v0

    .line 2564
    if-eqz v0, :cond_1

    .line 2565
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 2567
    :cond_1
    return-void
.end method

.method private static removeFullscreenToggle(Landroid/app/Activity;)V
    .locals 0

    .line 2570
    invoke-static {p0}, Lcom/waze/patches/Patches;->getOverlayHost(Landroid/app/Activity;)Landroid/view/ViewGroup;

    move-result-object p0

    .line 2571
    if-nez p0, :cond_0

    .line 2572
    return-void

    .line 2575
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->findFullscreenToggle(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    .line 2576
    if-eqz p0, :cond_1

    .line 2577
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeViewFromParent(Landroid/view/View;)V

    .line 2579
    :cond_1
    return-void
.end method

.method private static removeRoadEventsTabIfWide(Landroid/view/View;)V
    .locals 2

    .line 770
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 774
    :cond_0
    const-string v0, "fragNavListTabs2"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->setPatchGone(Landroid/view/View;)V

    .line 775
    const-string v0, "navListReportsList"

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->setPatchGone(Landroid/view/View;)V

    .line 777
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    shr-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 778
    const-string v1, "laneGuidanceView"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/waze/patches/Patches;->setPatchWidth(Landroid/view/View;I)V

    .line 779
    const-string v1, "navBarContentContainer"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/waze/patches/Patches;->setPatchWidth(Landroid/view/View;I)V

    .line 780
    const-string v1, "navBarTop"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/waze/patches/Patches;->setPatchWidth(Landroid/view/View;I)V

    .line 781
    const-string v1, "navBarBox2"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/waze/patches/Patches;->setPatchWidth(Landroid/view/View;I)V

    .line 782
    const-string v1, "navBarDistanceBox"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/waze/patches/Patches;->setPatchWidth(Landroid/view/View;I)V

    .line 783
    const-string v1, "navBarStreetLine"

    invoke-static {p0, v1}, Lcom/waze/patches/Patches;->findFirstViewByResourceEntryName(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->setPatchWidth(Landroid/view/View;I)V

    .line 784
    return-void

    .line 771
    :cond_1
    :goto_0
    return-void
.end method

.method private static removeViewFromParent(Landroid/view/View;)V
    .locals 2

    .line 2828
    if-nez p0, :cond_0

    .line 2829
    return-void

    .line 2833
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2834
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    .line 2835
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2838
    :cond_1
    goto :goto_0

    .line 2837
    :catchall_0
    move-exception p0

    .line 2839
    :goto_0
    return-void
.end method

.method private static requestRootRelayout(Landroid/app/Activity;)V
    .locals 1

    .line 1988
    if-nez p0, :cond_0

    .line 1989
    return-void

    .line 1993
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->getRootView(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    .line 1994
    if-eqz v0, :cond_1

    .line 1995
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 1996
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1999
    :cond_1
    goto :goto_0

    .line 1998
    :catchall_0
    move-exception v0

    .line 2002
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    .line 2003
    if-eqz p0, :cond_2

    .line 2004
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    .line 2005
    if-eqz p0, :cond_2

    .line 2006
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 2007
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2011
    :cond_2
    goto :goto_1

    .line 2010
    :catchall_1
    move-exception p0

    .line 2012
    :goto_1
    return-void
.end method

.method private static resetNavBar(Landroid/view/View;)V
    .locals 2

    .line 699
    sget-object v0, Lcom/waze/patches/Patches;->sNavKeepRunnable:Ljava/lang/Runnable;

    .line 700
    const/4 v1, 0x0

    sput-object v1, Lcom/waze/patches/Patches;->sNavKeepRunnable:Ljava/lang/Runnable;

    .line 702
    if-eqz p0, :cond_0

    if-eqz v0, :cond_0

    .line 704
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 706
    goto :goto_0

    .line 705
    :catchall_0
    move-exception v0

    .line 709
    :cond_0
    :goto_0
    if-eqz p0, :cond_2

    .line 711
    :try_start_1
    invoke-static {p0}, Lcom/waze/patches/Patches;->resolveNavBarView(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    .line 712
    if-eqz p0, :cond_1

    .line 713
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 714
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 715
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 716
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 719
    :cond_1
    goto :goto_1

    .line 718
    :catchall_1
    move-exception p0

    .line 722
    :cond_2
    :goto_1
    return-void
.end method

.method private static resetViewResize(Landroid/view/View;)V
    .locals 2

    .line 409
    if-eqz p0, :cond_0

    .line 410
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 411
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 412
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 413
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 414
    const/4 v0, -0x1

    sput v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    .line 415
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sViewHeight:I

    .line 416
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "viewResize RESET "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempViewState(Landroid/view/View;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " resizedH="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget v0, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 421
    :cond_0
    return-void
.end method

.method private static resolveEtaControlPanelClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 3169
    sget-object v0, Lcom/waze/patches/Patches;->sEtaControlPanelClass:Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 3170
    sget-object v0, Lcom/waze/patches/Patches;->sEtaControlPanelClass:Ljava/lang/Class;

    return-object v0

    .line 3174
    :cond_0
    :try_start_0
    const-string v0, "com.waze.main_screen.bottom_bars.scrollable_eta.EtaControlPanelView"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sEtaControlPanelClass:Ljava/lang/Class;

    .line 3175
    sget-object v0, Lcom/waze/patches/Patches;->sEtaControlPanelClass:Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 3176
    :catchall_0
    move-exception v0

    .line 3177
    const-string v0, "resolveEtaControlPanelClass: failed"

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 3178
    const/4 v0, 0x0

    return-object v0
.end method

.method private static resolveEtaGoTapMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 3183
    const-string v0, "p"

    const/4 v1, 0x0

    if-nez p0, :cond_0

    .line 3184
    return-object v1

    .line 3187
    :cond_0
    sget-object v2, Lcom/waze/patches/Patches;->sEtaGoTapOwnerClass:Ljava/lang/Class;

    if-ne p0, v2, :cond_1

    sget-object v2, Lcom/waze/patches/Patches;->sEtaGoTapMethod:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_1

    .line 3188
    sget-object p0, Lcom/waze/patches/Patches;->sEtaGoTapMethod:Ljava/lang/reflect/Method;

    return-object p0

    .line 3192
    :cond_1
    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_0
    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {p0, v0, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 3193
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 3194
    sput-object p0, Lcom/waze/patches/Patches;->sEtaGoTapOwnerClass:Ljava/lang/Class;

    .line 3195
    sput-object v4, Lcom/waze/patches/Patches;->sEtaGoTapMethod:Ljava/lang/reflect/Method;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3197
    return-object v4

    .line 3198
    :catchall_0
    move-exception v4

    .line 3199
    const-string v4, "resolveEtaGoTapMethod: getDeclaredMethod failed, trying getMethod"

    invoke-static {v4}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 3203
    :try_start_1
    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {p0, v0, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 3204
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 3205
    sput-object p0, Lcom/waze/patches/Patches;->sEtaGoTapOwnerClass:Ljava/lang/Class;

    .line 3206
    sput-object v0, Lcom/waze/patches/Patches;->sEtaGoTapMethod:Ljava/lang/reflect/Method;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 3208
    return-object v0

    .line 3209
    :catchall_1
    move-exception p0

    .line 3210
    const-string p0, "resolveEtaGoTapMethod: getMethod failed"

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 3213
    return-object v1
.end method

.method private static resolveLiveEtaControlPanelView(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 3139
    invoke-static {}, Lcom/waze/patches/Patches;->resolveEtaControlPanelClass()Ljava/lang/Class;

    move-result-object v0

    .line 3140
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 3141
    return-object v1

    .line 3144
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->getEtaGoSearchRoot(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    .line 3145
    if-nez p0, :cond_1

    .line 3146
    return-object v1

    .line 3149
    :cond_1
    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstLiveViewOfClass(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private static resolveNavBarClass()Ljava/lang/Class;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 561
    sget-object v0, Lcom/waze/patches/Patches;->sNavBarClass:Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 562
    sget-object v0, Lcom/waze/patches/Patches;->sNavBarClass:Ljava/lang/Class;

    return-object v0

    .line 565
    :cond_0
    sget-object v0, Lcom/waze/patches/Patches;->NAV_BAR_CLASS_CANDIDATES:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 567
    :try_start_0
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lcom/waze/patches/Patches;->sNavBarClass:Ljava/lang/Class;

    .line 569
    sput-boolean v2, Lcom/waze/patches/Patches;->sNavBarResolveFailureLogged:Z

    .line 570
    sget-object v0, Lcom/waze/patches/Patches;->sNavBarClass:Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 571
    :catchall_0
    move-exception v4

    .line 565
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 575
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static resolveNavBarView(Landroid/view/View;)Landroid/view/View;
    .locals 2

    .line 579
    invoke-static {}, Lcom/waze/patches/Patches;->resolveNavBarClass()Ljava/lang/Class;

    move-result-object v0

    .line 580
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 581
    invoke-static {p0, v0}, Lcom/waze/patches/Patches;->findFirstViewOfClass(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v0

    .line 582
    if-eqz v0, :cond_0

    .line 583
    sput-boolean v1, Lcom/waze/patches/Patches;->sNavBarResolveFailureLogged:Z

    .line 585
    return-object v0

    .line 590
    :cond_0
    invoke-static {p0}, Lcom/waze/patches/Patches;->findNavBarViewByStructure(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    .line 591
    if-eqz p0, :cond_1

    .line 592
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/waze/patches/Patches;->sNavBarClass:Ljava/lang/Class;

    .line 593
    sput-boolean v1, Lcom/waze/patches/Patches;->sNavBarResolveFailureLogged:Z

    .line 595
    return-object p0

    .line 600
    :cond_1
    sget-boolean p0, Lcom/waze/patches/Patches;->sNavBarResolveFailureLogged:Z

    if-nez p0, :cond_2

    .line 602
    const/4 p0, 0x1

    sput-boolean p0, Lcom/waze/patches/Patches;->sNavBarResolveFailureLogged:Z

    .line 605
    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private static restoreDisplayMetricsOverride(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1

    .line 1810
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/waze/patches/Patches;->updateDisplayMetricsOverride(Landroid/app/Activity;ZLjava/lang/String;)V

    .line 1811
    return-void
.end method

.method private static scheduleDebugOverlayRefresh(Landroid/widget/TextView;)V
    .locals 3

    .line 2518
    if-nez p0, :cond_0

    .line 2519
    return-void

    .line 2522
    :cond_0
    sget-object v0, Lcom/waze/patches/Patches;->sDebugOverlayRefreshRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_1

    .line 2523
    new-instance v0, Lcom/waze/patches/Patches$12;

    invoke-direct {v0}, Lcom/waze/patches/Patches$12;-><init>()V

    sput-object v0, Lcom/waze/patches/Patches;->sDebugOverlayRefreshRunnable:Ljava/lang/Runnable;

    .line 2538
    :cond_1
    sget-object v0, Lcom/waze/patches/Patches;->sDebugOverlayRefreshRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2539
    sget-object v0, Lcom/waze/patches/Patches;->sDebugOverlayRefreshRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v0, v1, v2}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2540
    return-void
.end method

.method private static scheduleDynamicCameraAnchorReapply(Landroid/view/View;Ljava/lang/String;)V
    .locals 4

    .line 942
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "scheduleReapply caller="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " host="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 943
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempViewState(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " hasDelegator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/waze/patches/Patches;->sLastCameraDelegatorRef:Ljava/lang/ref/WeakReference;

    .line 944
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " lastTop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " left="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraLeft:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " right="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraRight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 942
    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 949
    sget-object v0, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRunnable:Ljava/lang/Runnable;

    .line 950
    sget-object v1, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRootRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 951
    const/4 v3, 0x0

    sput-object v3, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRunnable:Ljava/lang/Runnable;

    .line 952
    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 954
    :try_start_0
    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 956
    goto :goto_1

    .line 955
    :catchall_0
    move-exception v0

    .line 959
    :cond_1
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":now"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->applyDynamicCameraAnchor(Ljava/lang/String;)Z

    .line 960
    if-nez p0, :cond_2

    .line 961
    return-void

    .line 964
    :cond_2
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRootRef:Ljava/lang/ref/WeakReference;

    .line 965
    filled-new-array {v2}, [I

    move-result-object v0

    .line 966
    new-instance v1, Lcom/waze/patches/Patches$6;

    invoke-direct {v1, p1, v0}, Lcom/waze/patches/Patches$6;-><init>(Ljava/lang/String;[I)V

    .line 985
    sput-object v1, Lcom/waze/patches/Patches;->sCameraAnchorReapplyRunnable:Ljava/lang/Runnable;

    .line 986
    const-wide/16 v2, 0xfa

    invoke-virtual {p0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 987
    return-void
.end method

.method private static sendNavigationBroadcast(Ljava/lang/String;)V
    .locals 5

    .line 1637
    :try_start_0
    sget-object v0, Lcom/waze/patches/Patches;->sApplication:Landroid/app/Application;

    .line 1638
    if-nez v0, :cond_0

    .line 1639
    return-void

    .line 1642
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.frodrigues.jconfig.WAZE_NAVIGATION_UPDATE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1643
    const-string v2, "com.frodrigues.jconfig"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1644
    const-string v2, "event"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1645
    const-string v2, "is_navigating"

    sget-boolean v3, Lcom/waze/patches/Patches;->sIsNavigating:Z

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1646
    const-string v2, "navigation_state_code"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastNavigationStateCode:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1647
    const-string v2, "current_instruction"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentInstruction:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1648
    const-string v2, "next_instruction"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextInstruction:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1649
    const-string v2, "instruction_distance"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistance:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1650
    const-string v2, "instruction_distance_unit"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnit:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1651
    const-string v2, "instruction_distance_unit_name"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1652
    const-string v2, "instruction_distance_unit_value"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitValue:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1653
    const-string v2, "instruction_distance_meters"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceMeters:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1654
    const-string v2, "instruction_distance_value"

    sget-wide v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceValue:D

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 1655
    const-string v2, "eta_time"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastEtaTime:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1656
    const-string v2, "eta_time_unit"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastEtaTimeUnit:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1657
    const-string v2, "eta_minutes"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastEtaMinutes:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1658
    const-string v2, "eta_distance"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistance:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1659
    const-string v2, "eta_distance_unit"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnit:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1660
    const-string v2, "eta_distance_unit_name"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1661
    const-string v2, "eta_distance_unit_value"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnitValue:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1662
    const-string v2, "eta_distance_meters"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceMeters:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1663
    const-string v2, "eta_distance_value"

    sget-wide v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceValue:D

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 1664
    const-string v2, "current_street_name"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1665
    const-string v2, "current_street_segment_idx"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetSegmentIdx:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1666
    const-string v2, "current_street_show_hov"

    sget-boolean v3, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetShowHov:Z

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1667
    const-string v2, "current_road_sign_text"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignText:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1668
    const-string v2, "current_road_sign_primary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignPrimary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1669
    const-string v2, "current_road_sign_secondary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignSecondary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1670
    const-string v2, "next_street_name"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextStreetName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1671
    const-string v2, "next_street_segment_idx"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastNextStreetSegmentIdx:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1672
    const-string v2, "next_street_arrow_before_text"

    sget-boolean v3, Lcom/waze/patches/Patches;->sBroadcastNextStreetArrowBeforeText:Z

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1673
    const-string v2, "next_road_sign_text"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignText:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1674
    const-string v2, "next_road_sign_primary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignPrimary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1675
    const-string v2, "next_road_sign_secondary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignSecondary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1677
    const-string v2, "active_turn_instruction"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentInstruction:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1678
    const-string v2, "active_turn_distance_meters"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceMeters:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1679
    const-string v2, "active_turn_distance_value"

    sget-wide v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceValue:D

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 1680
    const-string v2, "active_turn_distance_display_value"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistance:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1681
    const-string v2, "active_turn_distance_display_unit"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnit:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1682
    const-string v2, "active_turn_distance_unit_name"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1683
    const-string v2, "active_turn_distance_unit_value"

    sget v3, Lcom/waze/patches/Patches;->sBroadcastInstructionDistanceUnitValue:I

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1684
    const-string v2, "active_turn_street"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentStreetName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1685
    const-string v2, "active_turn_road_sign_text"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignText:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1686
    const-string v2, "active_turn_road_sign_primary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignPrimary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1687
    const-string v2, "active_turn_road_sign_secondary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastCurrentRoadSignSecondary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1688
    const-string v2, "following_turn_instruction"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextInstruction:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1689
    const-string v2, "following_turn_street"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextStreetName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1690
    const-string v2, "following_turn_road_sign_text"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignText:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1691
    const-string v2, "following_turn_road_sign_primary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignPrimary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1692
    const-string v2, "following_turn_road_sign_secondary"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastNextRoadSignSecondary:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1693
    const-string v2, "eta_distance_display_value"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistance:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1694
    const-string v2, "eta_distance_display_unit"

    sget-object v3, Lcom/waze/patches/Patches;->sBroadcastEtaDistanceUnit:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1695
    invoke-virtual {v0, v1}, Landroid/app/Application;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1698
    goto :goto_0

    .line 1696
    :catchall_0
    move-exception v0

    .line 1697
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendNavigationBroadcast failed event="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1699
    :goto_0
    return-void
.end method

.method private static setFullscreenEnabled(Landroid/app/Activity;Z)V
    .locals 0

    .line 2059
    sput-boolean p1, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    .line 2060
    invoke-static {p1}, Lcom/waze/patches/Patches;->persistFullscreenEnabled(Z)V

    .line 2061
    invoke-static {p0}, Lcom/waze/patches/Patches;->applyFullscreenSetting(Landroid/app/Activity;)V

    .line 2062
    invoke-static {p0}, Lcom/waze/patches/Patches;->requestRootRelayout(Landroid/app/Activity;)V

    .line 2063
    invoke-static {p0}, Lcom/waze/patches/Patches;->attachOrUpdateFullscreenToggle(Landroid/app/Activity;)V

    .line 2064
    const-string p0, "fullscreenToggle"

    invoke-static {p0}, Lcom/waze/patches/Patches;->updateCurrentDebugOverlay(Ljava/lang/String;)V

    .line 2065
    return-void
.end method

.method private static setNavBarExists(Z)V
    .locals 1

    .line 2181
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavBarExists:Z

    if-eq v0, p0, :cond_0

    .line 2182
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsNavBarExists:Z

    .line 2184
    const-string p0, "setNavBarExists"

    invoke-static {p0}, Lcom/waze/patches/Patches;->updateCurrentDebugOverlay(Ljava/lang/String;)V

    .line 2186
    :cond_0
    return-void
.end method

.method public static setNavigating(Z)V
    .locals 2

    .line 1507
    sget-boolean v0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    if-eq v0, p0, :cond_1

    .line 1508
    sput-boolean p0, Lcom/waze/patches/Patches;->sIsNavigating:Z

    .line 1509
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setNavigating "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " lastTop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sLastCameraTop:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraBottom:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " right="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/waze/patches/Patches;->sNewCameraRight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " etaFloor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1513
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1509
    invoke-static {v0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1514
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setNavigating: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1515
    if-nez p0, :cond_0

    .line 1516
    invoke-static {}, Lcom/waze/patches/Patches;->clearNavigationBroadcastSnapshot()V

    .line 1518
    :cond_0
    const-string p0, "navigation_state"

    invoke-static {p0}, Lcom/waze/patches/Patches;->sendNavigationBroadcast(Ljava/lang/String;)V

    .line 1519
    const-string p0, "setNavigating"

    invoke-static {p0}, Lcom/waze/patches/Patches;->updateCurrentDebugOverlay(Ljava/lang/String;)V

    .line 1521
    :cond_1
    return-void
.end method

.method private static setPatchGone(Landroid/view/View;)V
    .locals 2

    .line 787
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 788
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 789
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 791
    :cond_0
    return-void
.end method

.method private static setPatchWidth(Landroid/view/View;I)V
    .locals 4

    .line 794
    if-eqz p0, :cond_3

    if-gtz p1, :cond_0

    goto :goto_0

    .line 798
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 799
    if-eqz v0, :cond_1

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v1, p1, :cond_1

    .line 800
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 801
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 804
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 805
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v1

    .line 806
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result v2

    .line 807
    if-le v2, v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v3

    add-int/2addr p1, v0

    if-eq v3, p1, :cond_2

    .line 808
    invoke-virtual {p0, v0, v1, p1, v2}, Landroid/view/View;->layout(IIII)V

    .line 810
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 811
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 812
    return-void

    .line 795
    :cond_3
    :goto_0
    return-void
.end method

.method private static shouldNormalizeHorizontalViewport()Z
    .locals 5

    .line 1173
    invoke-static {}, Lcom/waze/patches/Patches;->isMyCarActive()Z

    move-result v0

    .line 1174
    sput-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    .line 1176
    sget-object v1, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 1177
    sget-boolean v2, Lcom/waze/patches/Patches;->sIsLandscape:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_1

    sget-boolean v2, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    goto :goto_1

    :cond_1
    :goto_0
    move v2, v4

    .line 1178
    :goto_1
    if-eqz v1, :cond_4

    .line 1179
    invoke-static {v1}, Lcom/waze/patches/Patches;->isInSteeringDisplay(Landroid/app/Activity;)Z

    move-result v2

    sput-boolean v2, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    .line 1180
    invoke-static {v1}, Lcom/waze/patches/Patches;->isActivityLandscape(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-boolean v1, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    move v2, v3

    goto :goto_3

    :cond_3
    :goto_2
    move v2, v4

    .line 1183
    :cond_4
    :goto_3
    sget v1, Lcom/waze/patches/Patches;->sDisplayId:I

    if-lez v1, :cond_5

    move v3, v4

    :cond_5
    return v3
.end method

.method private static startRoadEventsTabRemoveKeep(Landroid/view/View;)V
    .locals 3

    .line 725
    if-nez p0, :cond_0

    .line 726
    return-void

    .line 729
    :cond_0
    sget-object v0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRunnable:Ljava/lang/Runnable;

    .line 730
    sget-object v1, Lcom/waze/patches/Patches;->sRoadEventsRemoveRootRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 731
    if-eqz v0, :cond_1

    if-ne v1, p0, :cond_1

    .line 732
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeRoadEventsTabIfWide(Landroid/view/View;)V

    .line 733
    return-void

    .line 736
    :cond_1
    const/4 v2, 0x0

    sput-object v2, Lcom/waze/patches/Patches;->sRoadEventsRemoveRunnable:Ljava/lang/Runnable;

    .line 737
    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 739
    :try_start_0
    invoke-virtual {v1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 741
    goto :goto_0

    .line 740
    :catchall_0
    move-exception v0

    .line 744
    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRootRef:Ljava/lang/ref/WeakReference;

    .line 745
    new-instance v0, Lcom/waze/patches/Patches$5;

    invoke-direct {v0}, Lcom/waze/patches/Patches$5;-><init>()V

    .line 764
    sput-object v0, Lcom/waze/patches/Patches;->sRoadEventsRemoveRunnable:Ljava/lang/Runnable;

    .line 765
    invoke-static {p0}, Lcom/waze/patches/Patches;->removeRoadEventsTabIfWide(Landroid/view/View;)V

    .line 766
    const-wide/16 v1, 0xfa

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 767
    return-void
.end method

.method private static syncDisplayMetricsOverride(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    .line 1777
    if-nez p0, :cond_0

    .line 1778
    return-void

    .line 1781
    :cond_0
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->noteActivityDisplay(Landroid/app/Activity;Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/waze/patches/Patches;->sDisplayId:I

    .line 1782
    invoke-static {}, Lcom/waze/patches/Patches;->isMyCarActive()Z

    move-result v0

    sput-boolean v0, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    .line 1783
    invoke-static {p0}, Lcom/waze/patches/Patches;->isActivityLandscape(Landroid/app/Activity;)Z

    move-result v0

    .line 1784
    sget v1, Lcom/waze/patches/Patches;->sDisplayId:I

    if-nez v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1786
    :goto_0
    if-eqz v0, :cond_2

    .line 1787
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->applyDisplayMetricsOverride(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_1

    .line 1789
    :cond_2
    invoke-static {p0, p1}, Lcom/waze/patches/Patches;->restoreDisplayMetricsOverride(Landroid/app/Activity;Ljava/lang/String;)V

    .line 1792
    :goto_1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0}, Lcom/waze/patches/Patches;->isForcedXhdpiActive(Landroid/content/res/Resources;)Z

    move-result p0

    sput-boolean p0, Lcom/waze/patches/Patches;->sIsXhdpiEmulationActive:Z

    .line 1803
    return-void
.end method

.method private static tempActivityName(Landroid/app/Activity;)Ljava/lang/String;
    .locals 0

    .line 2909
    if-nez p0, :cond_0

    .line 2910
    const-string p0, "activity=null"

    return-object p0

    .line 2914
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 2915
    :catchall_0
    move-exception p0

    .line 2916
    const-string p0, "activity=?"

    return-object p0
.end method

.method private static tempCameraLog(Ljava/lang/String;)V
    .locals 0

    .line 2906
    return-void
.end method

.method private static tempDelegatorName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 2938
    if-nez p0, :cond_0

    .line 2939
    const-string p0, "delegator=null"

    return-object p0

    .line 2943
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 2944
    :catchall_0
    move-exception p0

    .line 2945
    const-string p0, "delegator=?"

    return-object p0
.end method

.method private static tempEtaHeightReturn(IILjava/lang/String;)I
    .locals 2

    .line 1317
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "etaHeight reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " orig="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " result="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " active="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p2, Lcom/waze/patches/Patches;->sIsMyCarActive:Z

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " steer="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p2, Lcom/waze/patches/Patches;->sIsInSteeringDisplay:Z

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " nav="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p2, Lcom/waze/patches/Patches;->sIsNavigating:Z

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " narrow="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p2, Lcom/waze/patches/Patches;->sIsNarrowDisplay:Z

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " landscape="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p2, Lcom/waze/patches/Patches;->sIsLandscape:Z

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " win5or6="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p2, Lcom/waze/patches/Patches;->sIsWindowMode5Or6:Z

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " full="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-boolean p2, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " viewH="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p2, Lcom/waze/patches/Patches;->sViewHeight:I

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " resizedH="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget p2, Lcom/waze/patches/Patches;->sResizedRootHeight:I

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " etaFloor="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 1329
    invoke-static {}, Lcom/waze/patches/Patches;->getEtaCameraBottomFloor()I

    move-result p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1317
    invoke-static {p0}, Lcom/waze/patches/Patches;->tempCameraLog(Ljava/lang/String;)V

    .line 1330
    return p1
.end method

.method private static tempRectState(Landroid/graphics/Rect;)Ljava/lang/String;
    .locals 3

    .line 1187
    if-nez p0, :cond_0

    .line 1188
    const-string p0, "null"

    return-object p0

    .line 1191
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " w="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1192
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " h="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "]"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1191
    return-object p0
.end method

.method private static tempViewState(Landroid/view/View;)Ljava/lang/String;
    .locals 2

    .line 2921
    if-nez p0, :cond_0

    .line 2922
    const-string p0, "view=null"

    return-object p0

    .line 2926
    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "view="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " attached="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2927
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " shown="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2928
    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " w="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2929
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " h="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2930
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " display="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2931
    invoke-static {p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/view/View;)I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2926
    return-object p0

    .line 2932
    :catchall_0
    move-exception p0

    .line 2933
    const-string p0, "view=?"

    return-object p0
.end method

.method private static toDp(II)I
    .locals 1

    .line 2015
    if-lez p0, :cond_1

    if-gtz p1, :cond_0

    goto :goto_0

    .line 2018
    :cond_0
    int-to-float p0, p0

    const/high16 v0, 0x43200000    # 160.0f

    mul-float/2addr p0, v0

    int-to-float p1, p1

    div-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0

    .line 2016
    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private static toPx(Landroid/app/Activity;I)I
    .locals 0

    .line 2880
    if-nez p0, :cond_0

    .line 2881
    return p1

    .line 2884
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 2885
    if-nez p0, :cond_1

    .line 2886
    return p1

    .line 2889
    :cond_1
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 2890
    if-nez p0, :cond_2

    .line 2891
    return p1

    .line 2894
    :cond_2
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static updateCurrentDebugOverlay(Ljava/lang/String;)V
    .locals 0

    .line 2200
    return-void
.end method

.method private static updateDisplayMetricsOverride(Landroid/app/Activity;ZLjava/lang/String;)V
    .locals 19

    .line 1814
    move/from16 v1, p1

    move-object/from16 v2, p2

    if-nez p0, :cond_0

    .line 1815
    return-void

    .line 1819
    :cond_0
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 1820
    if-nez v0, :cond_1

    .line 1821
    return-void

    .line 1824
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/waze/patches/Patches;->getLiveDisplayMetrics(Landroid/app/Activity;)Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 1825
    if-nez v3, :cond_2

    .line 1826
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateDisplayMetricsOverride: liveMetrics=null caller="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1827
    return-void

    .line 1830
    :cond_2
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 1831
    if-nez v4, :cond_3

    .line 1832
    return-void

    .line 1835
    :cond_3
    if-eqz v1, :cond_4

    const/16 v5, 0xf0

    goto :goto_0

    :cond_4
    iget v5, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 1836
    :goto_0
    const/high16 v6, 0x3fc00000    # 1.5f

    if-eqz v1, :cond_5

    move v7, v6

    goto :goto_1

    :cond_5
    iget v7, v3, Landroid/util/DisplayMetrics;->density:F

    .line 1837
    :goto_1
    if-eqz v1, :cond_6

    goto :goto_2

    :cond_6
    iget v6, v3, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 1838
    :goto_2
    const/high16 v8, 0x43700000    # 240.0f

    if-eqz v1, :cond_7

    move v9, v8

    goto :goto_3

    :cond_7
    iget v9, v3, Landroid/util/DisplayMetrics;->xdpi:F

    .line 1839
    :goto_3
    if-eqz v1, :cond_8

    goto :goto_4

    :cond_8
    iget v8, v3, Landroid/util/DisplayMetrics;->ydpi:F

    .line 1841
    :goto_4
    if-gtz v5, :cond_9

    .line 1842
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateDisplayMetricsOverride: invalid targetDensityDpi caller="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1843
    return-void

    .line 1846
    :cond_9
    iget v10, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v10, v5}, Lcom/waze/patches/Patches;->toDp(II)I

    move-result v10

    .line 1847
    iget v11, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v11, v5}, Lcom/waze/patches/Patches;->toDp(II)I

    move-result v11

    .line 1849
    if-lez v10, :cond_a

    if-lez v11, :cond_a

    .line 1850
    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v13

    goto :goto_5

    .line 1851
    :cond_a
    const/4 v13, 0x0

    .line 1853
    :goto_5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v14

    .line 1854
    invoke-static/range {p0 .. p0}, Lcom/waze/patches/Patches;->getDisplayId(Landroid/app/Activity;)I

    move-result v15

    .line 1855
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 1856
    if-eqz v1, :cond_b

    const-string v17, "forced"

    goto :goto_6

    :cond_b
    const-string v17, "native"

    :goto_6
    move-object/from16 v2, v17

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v12, ":"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v12, ":"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v12, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v12, "x"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v12, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v12, ":"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v12, ":"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v12, "x"

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1863
    sget-object v12, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    monitor-enter v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 1864
    :try_start_1
    sget-object v15, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    invoke-virtual {v15, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;

    .line 1865
    if-nez v15, :cond_c

    .line 1866
    new-instance v15, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;

    invoke-direct {v15, v0}, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;-><init>(Landroid/content/res/Resources;)V

    .line 1867
    move/from16 v17, v8

    sget-object v8, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    invoke-virtual {v8, v0, v15}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 1865
    :cond_c
    move/from16 v17, v8

    .line 1869
    :goto_7
    iget-boolean v8, v15, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->isApplied:Z

    move/from16 v18, v8

    if-eqz v18, :cond_10

    iget-object v8, v15, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->appliedState:Ljava/lang/String;

    .line 1871
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    iget-boolean v8, v15, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->isForcedXhdpiActive:Z

    if-ne v8, v1, :cond_10

    if-eqz v14, :cond_10

    iget v8, v14, Landroid/content/res/Configuration;->densityDpi:I

    if-ne v8, v5, :cond_10

    if-lez v10, :cond_d

    iget v8, v14, Landroid/content/res/Configuration;->screenWidthDp:I

    if-ne v8, v10, :cond_10

    :cond_d
    if-lez v11, :cond_e

    iget v8, v14, Landroid/content/res/Configuration;->screenHeightDp:I

    if-ne v8, v11, :cond_10

    :cond_e
    if-lez v13, :cond_f

    iget v8, v14, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    if-ne v8, v13, :cond_10

    :cond_f
    iget v8, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v15, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    if-ne v8, v15, :cond_10

    iget v8, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v15, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ne v8, v15, :cond_10

    iget v8, v4, Landroid/util/DisplayMetrics;->densityDpi:I

    if-ne v8, v5, :cond_10

    const/16 v16, 0x1

    goto :goto_8

    :cond_10
    const/16 v16, 0x0

    .line 1881
    :goto_8
    if-eqz v16, :cond_11

    .line 1882
    monitor-exit v12

    return-void

    .line 1884
    :cond_11
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1886
    :try_start_2
    new-instance v8, Landroid/content/res/Configuration;

    invoke-direct {v8, v14}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 1887
    invoke-virtual {v4, v3}, Landroid/util/DisplayMetrics;->setTo(Landroid/util/DisplayMetrics;)V

    .line 1889
    iput v5, v4, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 1890
    iput v7, v4, Landroid/util/DisplayMetrics;->density:F

    .line 1891
    iput v6, v4, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 1892
    iput v9, v4, Landroid/util/DisplayMetrics;->xdpi:F

    .line 1893
    move/from16 v6, v17

    iput v6, v4, Landroid/util/DisplayMetrics;->ydpi:F

    .line 1895
    iput v5, v8, Landroid/content/res/Configuration;->densityDpi:I

    .line 1896
    if-lez v10, :cond_12

    .line 1897
    iput v10, v8, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 1899
    :cond_12
    if-lez v11, :cond_13

    .line 1900
    iput v11, v8, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 1902
    :cond_13
    if-lez v13, :cond_14

    .line 1903
    iput v13, v8, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 1905
    :cond_14
    nop

    .line 1906
    iget v5, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le v5, v3, :cond_15

    .line 1907
    const/4 v3, 0x2

    goto :goto_9

    .line 1908
    :cond_15
    const/4 v3, 0x1

    :goto_9
    iput v3, v8, Landroid/content/res/Configuration;->orientation:I

    .line 1910
    invoke-virtual {v0, v8, v4}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 1911
    sget-object v3, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    monitor-enter v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1912
    :try_start_3
    sget-object v4, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    invoke-virtual {v4, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;

    .line 1913
    if-nez v4, :cond_16

    .line 1914
    new-instance v4, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;

    invoke-direct {v4, v0}, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;-><init>(Landroid/content/res/Resources;)V

    .line 1915
    sget-object v5, Lcom/waze/patches/Patches;->sDisplayMetricsOverrideState:Ljava/util/WeakHashMap;

    invoke-virtual {v5, v0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1917
    :cond_16
    iput-object v2, v4, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->appliedState:Ljava/lang/String;

    .line 1918
    const/4 v0, 0x1

    iput-boolean v0, v4, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->isApplied:Z

    .line 1919
    iput-boolean v1, v4, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->isForcedXhdpiActive:Z

    .line 1920
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1921
    :try_start_4
    invoke-static/range {p0 .. p0}, Lcom/waze/patches/Patches;->requestRootRelayout(Landroid/app/Activity;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1935
    goto :goto_b

    .line 1920
    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1884
    :catchall_1
    move-exception v0

    :try_start_7
    monitor-exit v12
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 1930
    :catchall_2
    move-exception v0

    .line 1931
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1932
    if-eqz v1, :cond_17

    const-string v1, "applyDisplayMetricsOverride: failed caller="

    goto :goto_a

    :cond_17
    const-string v1, "restoreDisplayMetricsOverride: failed caller="

    :goto_a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v2, p2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1931
    invoke-static {v0}, Lcom/waze/patches/Patches;->logDebug(Ljava/lang/String;)V

    .line 1936
    :goto_b
    return-void
.end method

.method private static updateFullscreenSettingsRow(Landroid/view/View;)V
    .locals 4

    .line 2487
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 2488
    return-void

    .line 2491
    :cond_0
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .line 2492
    sget-object v1, Lcom/waze/patches/Patches;->sCurrentMainActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 2493
    invoke-static {v1, p0}, Lcom/waze/patches/Patches;->isLightFullscreenTheme(Landroid/app/Activity;Landroid/view/View;)Z

    move-result v1

    .line 2495
    const v2, -0xdfdedc

    if-eqz v1, :cond_1

    const v3, -0x60505

    goto :goto_0

    :cond_1
    move v3, v2

    :goto_0
    invoke-virtual {p0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 2497
    const-string p0, "patches_fullscreen_title"

    invoke-static {v0, p0}, Lcom/waze/patches/Patches;->findTaggedTextView(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    .line 2498
    const/4 v3, -0x1

    if-eqz p0, :cond_3

    .line 2499
    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2502
    :cond_3
    const-string p0, "patches_fullscreen_subtitle"

    invoke-static {v0, p0}, Lcom/waze/patches/Patches;->findTaggedTextView(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object p0

    .line 2503
    if-eqz p0, :cond_5

    .line 2504
    if-eqz v1, :cond_4

    const v2, -0xa09c98

    goto :goto_2

    :cond_4
    const v2, -0x47423e

    :goto_2
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2507
    :cond_5
    invoke-static {v0}, Lcom/waze/patches/Patches;->findFullscreenStateView(Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object p0

    .line 2508
    if-eqz p0, :cond_9

    .line 2509
    sget-boolean v0, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    if-eqz v0, :cond_6

    const-string v0, "ON"

    goto :goto_3

    :cond_6
    const-string v0, "OFF"

    :goto_3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2510
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2511
    sget-boolean v0, Lcom/waze/patches/Patches;->sFullscreenEnabled:Z

    if-eqz v0, :cond_7

    .line 2512
    const v0, -0xff601d

    goto :goto_4

    .line 2513
    :cond_7
    if-eqz v1, :cond_8

    const v0, -0x908b86

    goto :goto_4

    :cond_8
    const v0, -0xa29c96

    .line 2511
    :goto_4
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 2515
    :cond_9
    return-void
.end method
