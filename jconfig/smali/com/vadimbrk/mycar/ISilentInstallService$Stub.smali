.class public abstract Lcom/vadimbrk/mycar/ISilentInstallService$Stub;
.super Ljava/lang/Object;
.source "ISilentInstallService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vadimbrk/mycar/ISilentInstallService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vadimbrk/mycar/ISilentInstallService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.vadimbrk.mycar.ISilentInstallService"

.field static final TRANSACTION_isAcive:I = 0x5

.field static final TRANSACTION_isRightRudder:I = 0x6


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/vadimbrk/mycar/ISilentInstallService;
    .locals 1

    .line 21
    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 22
    :cond_0
    new-instance v0, Lcom/vadimbrk/mycar/ISilentInstallService$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/vadimbrk/mycar/ISilentInstallService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method
