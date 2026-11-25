.class Lcom/waze/patches/Patches$10;
.super Ljava/lang/Object;
.source "Patches.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/waze/patches/Patches;->attachOrUpdateDebugToggleButton(Landroid/app/Activity;Landroid/view/ViewGroup;)V
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

    .line 2295
    iput-object p1, p0, Lcom/waze/patches/Patches$10;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 2298
    invoke-static {}, Lcom/waze/patches/Patches;->access$4300()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Lcom/waze/patches/Patches;->access$4302(Z)Z

    .line 2299
    iget-object p1, p0, Lcom/waze/patches/Patches$10;->val$activity:Landroid/app/Activity;

    const-string v0, "toggle"

    invoke-static {p1, v0}, Lcom/waze/patches/Patches;->access$1000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 2300
    return-void
.end method
