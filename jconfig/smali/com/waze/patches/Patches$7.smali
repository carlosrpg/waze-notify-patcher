.class Lcom/waze/patches/Patches$7;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->applyEtaGoClickerOnSetExpanded(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$etaMainBarView:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1416
    iput-object p1, p0, Lcom/waze/patches/Patches$7;->val$etaMainBarView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1419
    iget-object v0, p0, Lcom/waze/patches/Patches$7;->val$etaMainBarView:Landroid/view/View;

    invoke-static {v0}, Lcom/waze/patches/Patches;->invokeEtaGo(Landroid/view/View;)V

    .line 1420
    return-void
.end method
