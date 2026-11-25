.class Lcom/waze/patches/Patches$5;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->startRoadEventsTabRemoveKeep(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 745
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 748
    invoke-static {}, Lcom/waze/patches/Patches;->access$3700()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 749
    if-eqz v0, :cond_2

    invoke-static {}, Lcom/waze/patches/Patches;->access$3800()Ljava/lang/Runnable;

    move-result-object v1

    if-eq v1, p0, :cond_0

    goto :goto_0

    .line 753
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    if-gt v1, v2, :cond_1

    .line 754
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/waze/patches/Patches;->access$3802(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 755
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v1}, Lcom/waze/patches/Patches;->access$3702(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 756
    return-void

    .line 759
    :cond_1
    invoke-static {v0}, Lcom/waze/patches/Patches;->access$3900(Landroid/view/View;)V

    .line 760
    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 761
    return-void

    .line 750
    :cond_2
    :goto_0
    return-void
.end method
