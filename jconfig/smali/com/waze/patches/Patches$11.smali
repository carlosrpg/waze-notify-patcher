.class Lcom/waze/patches/Patches$11;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->createFullscreenSettingsRow(Landroid/app/Activity;)Landroid/view/View;
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

    .line 2406
    iput-object p1, p0, Lcom/waze/patches/Patches$11;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 2409
    iget-object p1, p0, Lcom/waze/patches/Patches$11;->val$activity:Landroid/app/Activity;

    invoke-static {}, Lcom/waze/patches/Patches;->access$4400()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$4500(Landroid/app/Activity;Z)V

    .line 2410
    return-void
.end method
