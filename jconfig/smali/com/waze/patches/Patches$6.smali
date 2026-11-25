.class Lcom/waze/patches/Patches$6;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->scheduleDynamicCameraAnchorReapply(Landroid/view/View;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$caller:Ljava/lang/String;

.field final synthetic val$step:[I


# direct methods
.method constructor <init>(Ljava/lang/String;[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 966
    iput-object p1, p0, Lcom/waze/patches/Patches$6;->val$caller:Ljava/lang/String;

    iput-object p2, p0, Lcom/waze/patches/Patches$6;->val$step:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 969
    invoke-static {}, Lcom/waze/patches/Patches;->access$4000()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 970
    if-eqz v0, :cond_4

    invoke-static {}, Lcom/waze/patches/Patches;->access$4100()Ljava/lang/Runnable;

    move-result-object v1

    if-eq v1, p0, :cond_0

    goto :goto_2

    .line 974
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/waze/patches/Patches$6;->val$caller:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":delayed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/waze/patches/Patches;->access$4200(Ljava/lang/String;)Z

    .line 975
    iget-object v1, p0, Lcom/waze/patches/Patches$6;->val$step:[I

    const/4 v2, 0x0

    aget v3, v1, v2

    const/4 v4, 0x1

    add-int/2addr v3, v4

    aput v3, v1, v2

    .line 976
    iget-object v1, p0, Lcom/waze/patches/Patches$6;->val$step:[I

    aget v1, v1, v2

    const/4 v3, 0x4

    if-ge v1, v3, :cond_3

    .line 977
    iget-object v1, p0, Lcom/waze/patches/Patches$6;->val$step:[I

    aget v1, v1, v2

    if-ne v1, v4, :cond_1

    const-wide/16 v1, 0x1f4

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/waze/patches/Patches$6;->val$step:[I

    aget v1, v1, v2

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    const-wide/16 v1, 0x3e8

    goto :goto_0

    :cond_2
    const-wide/16 v1, 0x7d0

    :goto_0
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1

    .line 979
    :cond_3
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/waze/patches/Patches;->access$4102(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 980
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v1}, Lcom/waze/patches/Patches;->access$4002(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 982
    :goto_1
    return-void

    .line 971
    :cond_4
    :goto_2
    return-void
.end method
