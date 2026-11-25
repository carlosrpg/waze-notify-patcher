.class public final Lcom/waze/patches/ClusterAlertOverlay;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final CENTER_X_FRACTION:F = 0.76f

.field private static final CENTER_Y_FRACTION:F = 0.37f

.field private static final CLUSTER_DISPLAY_ID:I = 0x2

.field private static final CORNER_DP:F = 20.0f

.field private static final ELEVATION_DP:F = 8.0f

.field private static final HANDLER:Landroid/os/Handler;

.field private static final HEARTBEAT_MS:J = 0x3e8L

.field private static final ICON_FRACTION:F = 0.5f

.field private static final INSTANCE:Lcom/waze/patches/ClusterAlertOverlay;

.field private static final LOG_TAG:Ljava/lang/String; = "JconfigWazeAlert"

.field private static final OVERLAY_TAG:Ljava/lang/String; = "patches_cluster_alert"

.field private static final RING_STROKE_DP:F = 4.0f

.field private static final RIPPLE_DURATION_MS:J = 0x4b0L

.field private static final RIPPLE_MAX_SCALE:F = 1.8f

.field private static final RIPPLE_STAGGER_MS:J = 0x258L

.field private static final SIZE_FRACTION:F = 0.236f

.field private static final TEXT_FRACTION:F = 0.2f

.field private static volatile sActive:Z

.field private static sAlarmingColorId:I

.field private static sAnchor:Ljava/lang/ref/WeakReference;

.field private static sAnchorDisplayId:I

.field private static volatile sApproaching:Z

.field private static sBackgroundColorId:I

.field private static sContentColorId:I

.field private static volatile sDistance:Ljava/lang/String;

.field private static volatile sHolder:Ljava/lang/ref/WeakReference;

.field private static volatile sIconRes:I

.field private static sOverlay:Ljava/lang/ref/WeakReference;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/waze/patches/ClusterAlertOverlay;

    invoke-direct {v0}, Lcom/waze/patches/ClusterAlertOverlay;-><init>()V

    sput-object v0, Lcom/waze/patches/ClusterAlertOverlay;->INSTANCE:Lcom/waze/patches/ClusterAlertOverlay;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/waze/patches/ClusterAlertOverlay;->HANDLER:Landroid/os/Handler;

    const/4 v0, -0x1

    sput v0, Lcom/waze/patches/ClusterAlertOverlay;->sAnchorDisplayId:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyClusterInsightVisibility(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;)Landroidx/compose/ui/Modifier;
    .locals 3

    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalView()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/ClusterAlertOverlay;->displayIdOf(Landroid/view/View;)I

    move-result v0

    sget-object v1, Lcom/waze/patches/ClusterAlertOverlay;->sAnchor:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_0

    sget v1, Lcom/waze/patches/ClusterAlertOverlay;->sAnchorDisplayId:I

    if-eq v1, v0, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/waze/patches/ClusterAlertOverlay;->sAnchor:Ljava/lang/ref/WeakReference;

    sput v0, Lcom/waze/patches/ClusterAlertOverlay;->sAnchorDisplayId:I

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Lcom/waze/patches/ClusterAlertOverlay;->schedule(J)V

    :cond_1
    const/4 p1, 0x2

    if-eq v0, p1, :cond_2

    return-object p0

    :cond_2
    const/4 p1, 0x0

    invoke-static {p0, p1}, Landroidx/compose/ui/draw/AlphaKt;->alpha(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object p0

    return-object p0
.end method

.method private static bindOverlay(Landroid/widget/FrameLayout;Landroid/content/Context;II)V
    .locals 10

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p3, p3

    const v1, 0x3e71a9fc    # 0.236f

    mul-float/2addr v1, p3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float p2, p2

    const v2, 0x3f428f5c    # 0.76f

    mul-float/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    div-int/lit8 v2, v1, 0x2

    sub-int/2addr p2, v2

    const v3, 0x3ebd70a4    # 0.37f

    mul-float/2addr p3, v3

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    sub-int/2addr p3, v2

    sget-boolean v2, Lcom/waze/patches/ClusterAlertOverlay;->sApproaching:Z

    const v3, -0x1ac6cb

    const/4 v4, 0x2

    invoke-static {p1, v4, v3}, Lcom/waze/patches/ClusterAlertOverlay;->themeColor(Landroid/content/Context;II)I

    move-result v3

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    const/4 v7, 0x3

    if-ge v6, v7, :cond_5

    invoke-virtual {p0, v6}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/widget/FrameLayout$LayoutParams;

    iget v9, v8, Landroid/widget/FrameLayout$LayoutParams;->width:I

    if-ne v9, v1, :cond_0

    iget v9, v8, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    if-ne v9, p2, :cond_0

    iget v9, v8, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    if-eq v9, p3, :cond_1

    :cond_0
    iput v1, v8, Landroid/widget/FrameLayout$LayoutParams;->width:I

    iput v1, v8, Landroid/widget/FrameLayout$LayoutParams;->height:I

    iput p2, v8, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput p3, v8, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    invoke-virtual {v7, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    if-ne v6, v4, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v7}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    check-cast v8, Landroid/graphics/drawable/GradientDrawable;

    const/high16 v9, 0x40800000    # 4.0f

    mul-float/2addr v9, v0

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-virtual {v8, v9, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/animation/ObjectAnimator;

    if-eqz v2, :cond_3

    invoke-virtual {v7, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v8}, Landroid/animation/ObjectAnimator;->isStarted()Z

    move-result v7

    if-nez v7, :cond_4

    invoke-virtual {v8}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_1

    :cond_3
    invoke-virtual {v8}, Landroid/animation/ObjectAnimator;->cancel()V

    const/4 v8, 0x4

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    invoke-virtual {p0, v4}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    check-cast p2, Landroid/graphics/drawable/GradientDrawable;

    const/high16 p3, 0x41a00000    # 20.0f

    mul-float/2addr p3, v0

    invoke-virtual {p2, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 p3, -0x1

    invoke-static {p1, v5, p3}, Lcom/waze/patches/ClusterAlertOverlay;->themeColor(Landroid/content/Context;II)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p2, 0x41000000    # 8.0f

    mul-float/2addr v0, p2

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setElevation(F)V

    invoke-virtual {p0, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    sget p3, Lcom/waze/patches/ClusterAlertOverlay;->sIconRes:I

    invoke-virtual {p2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Ljava/lang/Integer;

    if-eqz v2, :cond_6

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, p3, :cond_8

    :cond_6
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    if-eqz p3, :cond_7

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_3

    :cond_7
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_8
    :goto_3
    const/16 v0, 0x8

    if-eqz p3, :cond_9

    move p3, v5

    goto :goto_4

    :cond_9
    move p3, v0

    :goto_4
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setVisibility(I)V

    int-to-float p3, v1

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v1, p3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {p2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    iget v3, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-eq v3, v1, :cond_a

    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->height:I

    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_a
    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    sget-object v1, Lcom/waze/patches/ClusterAlertOverlay;->sDistance:Ljava/lang/String;

    if-eqz v1, :cond_b

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, -0xdfdedc

    invoke-static {p1, p2, v0}, Lcom/waze/patches/ClusterAlertOverlay;->themeColor(Landroid/content/Context;II)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const p1, 0x3e4ccccd    # 0.2f

    mul-float/2addr p3, p1

    invoke-virtual {p0, v5, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    :cond_b
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method private static buildOverlay(Landroid/content/Context;)Landroid/widget/FrameLayout;
    .locals 10

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const-string v1, "patches_cluster_alert"

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipChildren(Z)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setClipToPadding(Z)V

    move v2, v1

    :goto_0
    const/4 v3, 0x1

    const/4 v4, 0x2

    if-ge v2, v4, :cond_0

    new-instance v5, Landroid/view/View;

    invoke-direct {v5, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v6, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v3, 0x4

    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    new-array v6, v4, [F

    fill-array-data v6, :array_0

    invoke-static {v3, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    sget-object v6, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    new-array v7, v4, [F

    fill-array-data v7, :array_1

    invoke-static {v6, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v6

    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v4, v4, [F

    fill-array-data v4, :array_2

    invoke-static {v7, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    filled-new-array {v3, v6, v4}, [Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    invoke-static {v5, v3}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v3

    const-wide/16 v6, 0x4b0

    invoke-virtual {v3, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    int-to-long v6, v2

    const-wide/16 v8, 0x258

    mul-long/2addr v6, v8

    invoke-virtual {v3, v6, v7}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    invoke-virtual {v5, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v4, 0x11

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    return-object v0

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3fe66666    # 1.8f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3fe66666    # 1.8f
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private static displayIdOf(Landroid/view/View;)I
    .locals 0

    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method static distanceOnly(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-object p0
.end method

.method public static onAlertClosed(Ljava/lang/Object;)V
    .locals 2

    sget-object v0, Lcom/waze/patches/ClusterAlertOverlay;->sHolder:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    sput-boolean p0, Lcom/waze/patches/ClusterAlertOverlay;->sActive:Z

    const/4 v0, 0x0

    sput-object v0, Lcom/waze/patches/ClusterAlertOverlay;->sHolder:Ljava/lang/ref/WeakReference;

    sput p0, Lcom/waze/patches/ClusterAlertOverlay;->sIconRes:I

    sput-object v0, Lcom/waze/patches/ClusterAlertOverlay;->sDistance:Ljava/lang/String;

    sput-boolean p0, Lcom/waze/patches/ClusterAlertOverlay;->sApproaching:Z

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Lcom/waze/patches/ClusterAlertOverlay;->schedule(J)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static onAlertUpdated(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 5

    :try_start_0
    check-cast p1, Lcom/waze/k;

    invoke-virtual {p1}, Lcom/waze/k;->k()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1}, Lcom/waze/k;->m()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/waze/k;->e()Lcom/waze/j;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_0

    invoke-virtual {p1}, Lcom/waze/k;->x()Z

    move-result p1

    if-eqz p1, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_0

    move p1, v3

    goto :goto_0

    :cond_0
    move p1, v4

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :cond_1
    sput v4, Lcom/waze/patches/ClusterAlertOverlay;->sIconRes:I

    if-eqz p1, :cond_2

    invoke-static {v1}, Lcom/waze/patches/ClusterAlertOverlay;->distanceOnly(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    sput-object v0, Lcom/waze/patches/ClusterAlertOverlay;->sDistance:Ljava/lang/String;

    sput-boolean p1, Lcom/waze/patches/ClusterAlertOverlay;->sApproaching:Z

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Lcom/waze/patches/ClusterAlertOverlay;->sHolder:Ljava/lang/ref/WeakReference;

    sput-boolean v3, Lcom/waze/patches/ClusterAlertOverlay;->sActive:Z

    const-wide/16 p0, 0x0

    invoke-static {p0, p1}, Lcom/waze/patches/ClusterAlertOverlay;->schedule(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    const-string p1, "JconfigWazeAlert"

    const-string v0, "alert update failed"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private static removeOverlay(Landroid/widget/FrameLayout;)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/animation/ObjectAnimator;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_2
    const/4 p0, 0x0

    sput-object p0, Lcom/waze/patches/ClusterAlertOverlay;->sOverlay:Ljava/lang/ref/WeakReference;

    const-string p0, "JconfigWazeAlert"

    const-string v0, "hide cluster alert"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static schedule(J)V
    .locals 2

    sget-object v0, Lcom/waze/patches/ClusterAlertOverlay;->HANDLER:Landroid/os/Handler;

    sget-object v1, Lcom/waze/patches/ClusterAlertOverlay;->INSTANCE:Lcom/waze/patches/ClusterAlertOverlay;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private static themeColor(Landroid/content/Context;II)I
    .locals 5

    const/4 v0, 0x1

    if-nez p1, :cond_0

    sget v1, Lcom/waze/patches/ClusterAlertOverlay;->sBackgroundColorId:I

    goto :goto_0

    :cond_0
    if-ne p1, v0, :cond_1

    sget v1, Lcom/waze/patches/ClusterAlertOverlay;->sContentColorId:I

    goto :goto_0

    :cond_1
    sget v1, Lcom/waze/patches/ClusterAlertOverlay;->sAlarmingColorId:I

    :goto_0
    if-nez v1, :cond_7

    if-nez p1, :cond_2

    const-string v1, "background_default"

    goto :goto_1

    :cond_2
    if-ne p1, v0, :cond_3

    const-string v1, "content_default"

    goto :goto_1

    :cond_3
    const-string v1, "alarming"

    :goto_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "color"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_4

    return p2

    :cond_4
    if-nez p1, :cond_5

    sput v1, Lcom/waze/patches/ClusterAlertOverlay;->sBackgroundColorId:I

    goto :goto_2

    :cond_5
    if-ne p1, v0, :cond_6

    sput v1, Lcom/waze/patches/ClusterAlertOverlay;->sContentColorId:I

    goto :goto_2

    :cond_6
    sput v1, Lcom/waze/patches/ClusterAlertOverlay;->sAlarmingColorId:I

    :cond_7
    :goto_2
    invoke-virtual {p0, v1}, Landroid/content/Context;->getColor(I)I

    move-result p0

    return p0
.end method

.method private static update()V
    .locals 6

    sget-object v0, Lcom/waze/patches/ClusterAlertOverlay;->sAnchor:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    goto :goto_1

    :cond_1
    move-object v2, v1

    :goto_1
    sget-object v3, Lcom/waze/patches/ClusterAlertOverlay;->sOverlay:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    goto :goto_2

    :cond_2
    move-object v3, v1

    :goto_2
    if-eqz v3, :cond_4

    if-eqz v2, :cond_3

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eq v4, v2, :cond_4

    :cond_3
    invoke-static {v3}, Lcom/waze/patches/ClusterAlertOverlay;->removeOverlay(Landroid/widget/FrameLayout;)V

    goto :goto_3

    :cond_4
    move-object v1, v3

    :goto_3
    sget-boolean v3, Lcom/waze/patches/ClusterAlertOverlay;->sActive:Z

    if-eqz v3, :cond_7

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_7

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-static {v0}, Lcom/waze/patches/ClusterAlertOverlay;->displayIdOf(Landroid/view/View;)I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_7

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    if-lez v3, :cond_7

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v3

    if-lez v3, :cond_7

    sget v3, Lcom/waze/patches/ClusterAlertOverlay;->sIconRes:I

    if-nez v3, :cond_5

    sget-object v3, Lcom/waze/patches/ClusterAlertOverlay;->sDistance:Ljava/lang/String;

    if-eqz v3, :cond_7

    :cond_5
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v1, :cond_6

    invoke-static {v0}, Lcom/waze/patches/ClusterAlertOverlay;->buildOverlay(Landroid/content/Context;)Landroid/widget/FrameLayout;

    move-result-object v1

    move-object v3, v2

    check-cast v3, Landroid/view/ViewGroup;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v3, Lcom/waze/patches/ClusterAlertOverlay;->sOverlay:Ljava/lang/ref/WeakReference;

    const-string v3, "JconfigWazeAlert"

    const-string v4, "show cluster alert"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-static {v1, v0, v3, v2}, Lcom/waze/patches/ClusterAlertOverlay;->bindOverlay(Landroid/widget/FrameLayout;Landroid/content/Context;II)V

    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Lcom/waze/patches/ClusterAlertOverlay;->schedule(J)V

    return-void

    :cond_7
    if-eqz v1, :cond_8

    invoke-static {v1}, Lcom/waze/patches/ClusterAlertOverlay;->removeOverlay(Landroid/widget/FrameLayout;)V

    :cond_8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    invoke-static {}, Lcom/waze/patches/ClusterAlertOverlay;->update()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    const-string v0, "JconfigWazeAlert"

    const-string v1, "overlay update failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
