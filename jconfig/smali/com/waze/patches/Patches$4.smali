.class Lcom/waze/patches/Patches$4;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->applyNavBar(Landroid/app/Activity;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$searchRoot:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 436
    iput-object p1, p0, Lcom/waze/patches/Patches$4;->val$searchRoot:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 439
    iget-object v0, p0, Lcom/waze/patches/Patches$4;->val$searchRoot:Landroid/view/View;

    invoke-static {v0}, Lcom/waze/patches/Patches;->access$3600(Landroid/view/View;)Z

    .line 440
    iget-object v0, p0, Lcom/waze/patches/Patches$4;->val$searchRoot:Landroid/view/View;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 441
    return-void
.end method
