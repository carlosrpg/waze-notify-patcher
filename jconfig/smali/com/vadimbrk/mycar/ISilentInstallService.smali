.class public interface abstract Lcom/vadimbrk/mycar/ISilentInstallService;
.super Ljava/lang/Object;
.source "ISilentInstallService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vadimbrk/mycar/ISilentInstallService$Stub;
    }
.end annotation


# virtual methods
.method public abstract isAcive()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract isRightRudder()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
