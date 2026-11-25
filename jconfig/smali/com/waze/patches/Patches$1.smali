.class Lcom/waze/patches/Patches$1;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->init(Landroid/app/Application;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    .line 222
    invoke-static {}, Lcom/waze/patches/Patches;->access$100()Z

    move-result p2

    invoke-static {p2}, Lcom/waze/patches/Patches;->access$002(Z)Z

    .line 223
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$300(Landroid/app/Activity;)Z

    move-result p2

    invoke-static {p2}, Lcom/waze/patches/Patches;->access$202(Z)Z

    .line 224
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$400(Landroid/app/Activity;)V

    .line 225
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "lifecycle created "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$500(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " active="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 226
    invoke-static {}, Lcom/waze/patches/Patches;->access$000()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " landscape="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 227
    invoke-static {}, Lcom/waze/patches/Patches;->access$200()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " display="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 228
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$600(Landroid/app/Activity;)I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 225
    invoke-static {p2}, Lcom/waze/patches/Patches;->access$700(Ljava/lang/String;)V

    .line 229
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$800(Landroid/app/Activity;)V

    .line 230
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$900(Landroid/app/Activity;)V

    .line 231
    const-string p2, "onActivityCreated"

    invoke-static {p1, p2}, Lcom/waze/patches/Patches;->access$1000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 2

    .line 269
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lifecycle destroyed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$500(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " display="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 270
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$600(Landroid/app/Activity;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 269
    invoke-static {v0}, Lcom/waze/patches/Patches;->access$700(Ljava/lang/String;)V

    .line 271
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$1900(Landroid/app/Activity;)V

    .line 272
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2000(Landroid/app/Activity;)V

    .line 273
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2100(Landroid/app/Activity;)V

    .line 274
    invoke-static {}, Lcom/waze/patches/Patches;->access$2200()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 275
    if-ne v0, p1, :cond_0

    .line 276
    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2202(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 278
    :cond_0
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    .line 262
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    .line 247
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$400(Landroid/app/Activity;)V

    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lifecycle resumed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$500(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " display="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 249
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$600(Landroid/app/Activity;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " lastTop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 250
    invoke-static {}, Lcom/waze/patches/Patches;->access$1100()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 251
    invoke-static {}, Lcom/waze/patches/Patches;->access$1200()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " right="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 252
    invoke-static {}, Lcom/waze/patches/Patches;->access$1300()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 248
    invoke-static {v0}, Lcom/waze/patches/Patches;->access$700(Ljava/lang/String;)V

    .line 253
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$800(Landroid/app/Activity;)V

    .line 254
    const-string v0, "onActivityResumed"

    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1600(Landroid/app/Activity;Ljava/lang/String;)V

    .line 255
    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1700(Landroid/app/Activity;Ljava/lang/String;)V

    .line 256
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$1800(Landroid/app/Activity;)V

    .line 257
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$1400(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/waze/patches/Patches;->access$1500(Landroid/view/View;Ljava/lang/String;)V

    .line 258
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$900(Landroid/app/Activity;)V

    .line 259
    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 260
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 266
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 2

    .line 235
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$400(Landroid/app/Activity;)V

    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lifecycle started "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$500(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " display="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 237
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$600(Landroid/app/Activity;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " lastTop="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 238
    invoke-static {}, Lcom/waze/patches/Patches;->access$1100()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bottom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 239
    invoke-static {}, Lcom/waze/patches/Patches;->access$1200()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " right="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 240
    invoke-static {}, Lcom/waze/patches/Patches;->access$1300()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 236
    invoke-static {v0}, Lcom/waze/patches/Patches;->access$700(Ljava/lang/String;)V

    .line 241
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$800(Landroid/app/Activity;)V

    .line 242
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$1400(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p1

    const-string v0, "onActivityStarted"

    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1500(Landroid/view/View;Ljava/lang/String;)V

    .line 243
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 264
    return-void
.end method
