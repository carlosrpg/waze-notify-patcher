.class Lcom/waze/patches/Patches$8;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->invokeEtaGo(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$anchorView:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1432
    iput-object p1, p0, Lcom/waze/patches/Patches$8;->val$anchorView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1435
    iget-object v0, p0, Lcom/waze/patches/Patches$8;->val$anchorView:Landroid/view/View;

    invoke-static {v0}, Lcom/waze/patches/Patches;->invokeEtaGo(Landroid/view/View;)V

    .line 1436
    return-void
.end method
