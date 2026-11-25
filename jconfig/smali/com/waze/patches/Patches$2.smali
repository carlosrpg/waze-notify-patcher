.class Lcom/waze/patches/Patches$2;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Landroid/content/ComponentCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->attachConfigChangeListener(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 294
    iput-object p1, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 297
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "configChanged "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/waze/patches/Patches;->access$500(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " display="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    .line 298
    invoke-static {v0}, Lcom/waze/patches/Patches;->access$600(Landroid/app/Activity;)I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " lastTop="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 299
    invoke-static {}, Lcom/waze/patches/Patches;->access$1100()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " bottom="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 300
    invoke-static {}, Lcom/waze/patches/Patches;->access$1200()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " right="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 301
    invoke-static {}, Lcom/waze/patches/Patches;->access$1300()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 297
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$700(Ljava/lang/String;)V

    .line 302
    iget-object p1, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$800(Landroid/app/Activity;)V

    .line 303
    iget-object p1, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    const-string v0, "onConfigurationChanged"

    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1600(Landroid/app/Activity;Ljava/lang/String;)V

    .line 304
    iget-object p1, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$300(Landroid/app/Activity;)Z

    move-result p1

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$202(Z)Z

    .line 305
    iget-object p1, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$1400(Landroid/app/Activity;)Landroid/view/View;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1500(Landroid/view/View;Ljava/lang/String;)V

    .line 306
    iget-object p1, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$900(Landroid/app/Activity;)V

    .line 307
    iget-object p1, p0, Lcom/waze/patches/Patches$2;->val$activity:Landroid/app/Activity;

    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 308
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 311
    return-void
.end method
