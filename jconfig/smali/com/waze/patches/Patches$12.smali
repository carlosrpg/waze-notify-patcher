.class Lcom/waze/patches/Patches$12;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->scheduleDebugOverlayRefresh(Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 2526
    invoke-static {}, Lcom/waze/patches/Patches;->access$4300()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2527
    return-void

    .line 2530
    :cond_0
    invoke-static {}, Lcom/waze/patches/Patches;->access$2200()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 2531
    if-eqz v0, :cond_1

    .line 2532
    const-string v1, "refresh"

    invoke-static {v0, v1}, Lcom/waze/patches/Patches;->access$1000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 2534
    :cond_1
    return-void
.end method
