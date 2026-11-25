.class Lcom/vadimbrk/mycar/MyCarServiceClient$1;
.super Ljava/lang/Object;
.source "MyCarServiceClient.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vadimbrk/mycar/MyCarServiceClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;


# direct methods
.method constructor <init>(Lcom/vadimbrk/mycar/MyCarServiceClient;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 28
    iput-object p1, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 31
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    invoke-static {p2}, Lcom/vadimbrk/mycar/ISilentInstallService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/vadimbrk/mycar/ISilentInstallService;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$002(Lcom/vadimbrk/mycar/MyCarServiceClient;Lcom/vadimbrk/mycar/ISilentInstallService;)Lcom/vadimbrk/mycar/ISilentInstallService;

    .line 32
    iget-object p2, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$000(Lcom/vadimbrk/mycar/MyCarServiceClient;)Lcom/vadimbrk/mycar/ISilentInstallService;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-static {p2, v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$102(Lcom/vadimbrk/mycar/MyCarServiceClient;Z)Z

    .line 33
    iget-object p2, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    invoke-static {p2, v1}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$202(Lcom/vadimbrk/mycar/MyCarServiceClient;Z)Z

    .line 34
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onServiceConnected: connected="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$100(Lcom/vadimbrk/mycar/MyCarServiceClient;)Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, ", name="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$300(Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    .line 39
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$002(Lcom/vadimbrk/mycar/MyCarServiceClient;Lcom/vadimbrk/mycar/ISilentInstallService;)Lcom/vadimbrk/mycar/ISilentInstallService;

    .line 40
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$102(Lcom/vadimbrk/mycar/MyCarServiceClient;Z)Z

    .line 41
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;->this$0:Lcom/vadimbrk/mycar/MyCarServiceClient;

    invoke-static {v0, v1}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$202(Lcom/vadimbrk/mycar/MyCarServiceClient;Z)Z

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onServiceDisconnected: name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/vadimbrk/mycar/MyCarServiceClient;->access$300(Ljava/lang/String;)V

    .line 43
    return-void
.end method
