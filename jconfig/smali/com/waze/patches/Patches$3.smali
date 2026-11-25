.class Lcom/waze/patches/Patches$3;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->attachRootLayoutListener(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 335
    iput-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    iput-object p2, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 343
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2300(Landroid/view/View;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 344
    const-string p1, "onLayoutChange: view not ready"

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2400(Ljava/lang/String;)V

    .line 345
    return-void

    .line 348
    :cond_0
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$800(Landroid/app/Activity;)V

    .line 349
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    const-string p2, "onLayoutChange"

    invoke-static {p1, p2}, Lcom/waze/patches/Patches;->access$1600(Landroid/app/Activity;Ljava/lang/String;)V

    .line 350
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$300(Landroid/app/Activity;)Z

    move-result p1

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$202(Z)Z

    .line 351
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2600(Landroid/app/Activity;)Z

    move-result p1

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2502(Z)Z

    .line 352
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$2700(Landroid/view/View;)V

    .line 353
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "layout "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p3, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    invoke-static {p3}, Lcom/waze/patches/Patches;->access$500(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p3, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    .line 354
    invoke-static {p3}, Lcom/waze/patches/Patches;->access$2800(Landroid/view/View;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " active="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 355
    invoke-static {}, Lcom/waze/patches/Patches;->access$000()Z

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " steer="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 356
    invoke-static {}, Lcom/waze/patches/Patches;->access$2500()Z

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " nav="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 357
    invoke-static {}, Lcom/waze/patches/Patches;->access$2900()Z

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " resizedH="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 358
    invoke-static {}, Lcom/waze/patches/Patches;->access$3000()I

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " etaOrig="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 359
    invoke-static {}, Lcom/waze/patches/Patches;->access$3100()I

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " etaNew="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 360
    invoke-static {}, Lcom/waze/patches/Patches;->access$3200()I

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " lastTop="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 361
    invoke-static {}, Lcom/waze/patches/Patches;->access$1100()I

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " bottom="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 362
    invoke-static {}, Lcom/waze/patches/Patches;->access$1200()I

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " right="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 363
    invoke-static {}, Lcom/waze/patches/Patches;->access$1300()I

    move-result p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 353
    invoke-static {p1}, Lcom/waze/patches/Patches;->access$700(Ljava/lang/String;)V

    .line 365
    invoke-static {}, Lcom/waze/patches/Patches;->access$000()Z

    move-result p1

    if-nez p1, :cond_1

    .line 366
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$3300(Landroid/view/View;)V

    .line 367
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$3400(Landroid/view/View;)V

    goto :goto_0

    .line 369
    :cond_1
    invoke-static {}, Lcom/waze/patches/Patches;->access$2500()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 370
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/Patches;->applyViewResize(Landroid/view/View;)V

    .line 371
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    iget-object p3, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1, p3}, Lcom/waze/patches/Patches;->access$3500(Landroid/app/Activity;Landroid/view/View;)V

    goto :goto_0

    .line 373
    :cond_2
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$3300(Landroid/view/View;)V

    .line 374
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$3400(Landroid/view/View;)V

    .line 378
    :goto_0
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$view:Landroid/view/View;

    invoke-static {p1, p2}, Lcom/waze/patches/Patches;->access$1500(Landroid/view/View;Ljava/lang/String;)V

    .line 379
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$900(Landroid/app/Activity;)V

    .line 380
    iget-object p1, p0, Lcom/waze/patches/Patches$3;->val$activity:Landroid/app/Activity;

    invoke-static {p1, p2}, Lcom/waze/patches/Patches;->access$1000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 381
    return-void
.end method
