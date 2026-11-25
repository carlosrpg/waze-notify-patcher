.class final Lcom/waze/patches/Patches$DisplayMetricsOverrideState;
.super Ljava/lang/Object;
.source "Patches.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/waze/patches/Patches;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DisplayMetricsOverrideState"
.end annotation


# instance fields
.field appliedState:Ljava/lang/String;

.field isApplied:Z

.field isForcedXhdpiActive:Z

.field final originalConfig:Landroid/content/res/Configuration;

.field final originalMetrics:Landroid/util/DisplayMetrics;


# direct methods
.method constructor <init>(Landroid/content/res/Resources;)V
    .locals 2

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->originalMetrics:Landroid/util/DisplayMetrics;

    .line 195
    iget-object v0, p0, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->originalMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/DisplayMetrics;->setTo(Landroid/util/DisplayMetrics;)V

    .line 196
    new-instance v0, Landroid/content/res/Configuration;

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    iput-object v0, p0, Lcom/waze/patches/Patches$DisplayMetricsOverrideState;->originalConfig:Landroid/content/res/Configuration;

    .line 197
    return-void
.end method
