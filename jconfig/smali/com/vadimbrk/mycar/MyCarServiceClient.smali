.class public final Lcom/vadimbrk/mycar/MyCarServiceClient;
.super Ljava/lang/Object;
.source "MyCarServiceClient.java"


# static fields
.field private static final MYCAR_PACKAGE_NAME:Ljava/lang/String; = "com.frodrigues.jconfig"

.field private static final REBIND_COOLDOWN_MS:J = 0xbb8L

.field private static final SILENT_INSTALL_SERVICE_CLASS_NAME:Ljava/lang/String; = "com.frodrigues.jconfig.services.WazeCompatibilityService"

.field private static final isDebug:Z = true

.field private static volatile sInstance:Lcom/vadimbrk/mycar/MyCarServiceClient;

.field private static volatile sIsMyCarActive:Z


# instance fields
.field private mApplicationContext:Landroid/content/Context;

.field private mIsBinding:Z

.field private mIsServiceConnected:Z

.field private mLastBindAttemptUptimeMs:J

.field private mService:Lcom/vadimbrk/mycar/ISilentInstallService;

.field private final mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vadimbrk/mycar/MyCarServiceClient;->sIsMyCarActive:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lcom/vadimbrk/mycar/MyCarServiceClient$1;

    invoke-direct {v0, p0}, Lcom/vadimbrk/mycar/MyCarServiceClient$1;-><init>(Lcom/vadimbrk/mycar/MyCarServiceClient;)V

    iput-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/vadimbrk/mycar/MyCarServiceClient;)Lcom/vadimbrk/mycar/ISilentInstallService;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mService:Lcom/vadimbrk/mycar/ISilentInstallService;

    return-object p0
.end method

.method static synthetic access$002(Lcom/vadimbrk/mycar/MyCarServiceClient;Lcom/vadimbrk/mycar/ISilentInstallService;)Lcom/vadimbrk/mycar/ISilentInstallService;
    .locals 0

    .line 12
    iput-object p1, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mService:Lcom/vadimbrk/mycar/ISilentInstallService;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vadimbrk/mycar/MyCarServiceClient;)Z
    .locals 0

    .line 12
    iget-boolean p0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsServiceConnected:Z

    return p0
.end method

.method static synthetic access$102(Lcom/vadimbrk/mycar/MyCarServiceClient;Z)Z
    .locals 0

    .line 12
    iput-boolean p1, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsServiceConnected:Z

    return p1
.end method

.method static synthetic access$202(Lcom/vadimbrk/mycar/MyCarServiceClient;Z)Z
    .locals 0

    .line 12
    iput-boolean p1, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsBinding:Z

    return p1
.end method

.method static synthetic access$300(Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-static {p0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    return-void
.end method

.method private ensureBound()V
    .locals 6

    .line 110
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mService:Lcom/vadimbrk/mycar/ISilentInstallService;

    if-eqz v0, :cond_0

    .line 112
    return-void

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mApplicationContext:Landroid/content/Context;

    if-nez v0, :cond_1

    .line 115
    const-string v0, "mApplicationContext is null"

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 116
    return-void

    .line 118
    :cond_1
    iget-boolean v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsBinding:Z

    if-eqz v0, :cond_2

    .line 119
    const-string v0, "Already binding in progress"

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 120
    return-void

    .line 122
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 123
    iget-wide v2, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mLastBindAttemptUptimeMs:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    iget-wide v2, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mLastBindAttemptUptimeMs:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    .line 124
    return-void

    .line 130
    :cond_3
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    new-instance v3, Landroid/content/ComponentName;

    const-string v4, "com.frodrigues.jconfig"

    const-string v5, "com.frodrigues.jconfig.services.WazeCompatibilityService"

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v2

    .line 132
    iget-object v3, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mApplicationContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v3

    if-nez v3, :cond_4

    .line 133
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Service not found: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 134
    iput-wide v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mLastBindAttemptUptimeMs:J

    .line 135
    return-void

    .line 138
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Waze Binding to service: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 140
    iget-boolean v3, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsServiceConnected:Z

    if-eqz v3, :cond_5

    .line 141
    const-string v0, "Already connected to service"

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 142
    return-void

    .line 145
    :cond_5
    const/4 v3, 0x1

    :try_start_0
    iput-boolean v3, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsBinding:Z

    .line 146
    iput-wide v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mLastBindAttemptUptimeMs:J

    .line 147
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mApplicationContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v2, v1, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 148
    if-nez v0, :cond_6

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to bind to service: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 150
    iput-boolean v4, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsBinding:Z

    .line 151
    return-void

    .line 153
    :cond_6
    const-string v0, "Bind requested"

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    goto :goto_0

    .line 154
    :catchall_0
    move-exception v0

    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception when trying to bind: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 156
    iput-boolean v4, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsBinding:Z

    .line 158
    :goto_0
    return-void
.end method

.method public static getInstance()Lcom/vadimbrk/mycar/MyCarServiceClient;
    .locals 2

    .line 50
    sget-object v0, Lcom/vadimbrk/mycar/MyCarServiceClient;->sInstance:Lcom/vadimbrk/mycar/MyCarServiceClient;

    if-nez v0, :cond_1

    .line 51
    const-class v0, Lcom/vadimbrk/mycar/MyCarServiceClient;

    monitor-enter v0

    .line 52
    :try_start_0
    sget-object v1, Lcom/vadimbrk/mycar/MyCarServiceClient;->sInstance:Lcom/vadimbrk/mycar/MyCarServiceClient;

    if-nez v1, :cond_0

    .line 53
    new-instance v1, Lcom/vadimbrk/mycar/MyCarServiceClient;

    invoke-direct {v1}, Lcom/vadimbrk/mycar/MyCarServiceClient;-><init>()V

    sput-object v1, Lcom/vadimbrk/mycar/MyCarServiceClient;->sInstance:Lcom/vadimbrk/mycar/MyCarServiceClient;

    .line 55
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 57
    :cond_1
    :goto_0
    sget-object v0, Lcom/vadimbrk/mycar/MyCarServiceClient;->sInstance:Lcom/vadimbrk/mycar/MyCarServiceClient;

    return-object v0
.end method

.method private static logDebug(Ljava/lang/String;)V
    .locals 1

    .line 161
    const-string v0, "vadim : MyCarServiceClient"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    return-void
.end method


# virtual methods
.method public getService()Lcom/vadimbrk/mycar/ISilentInstallService;
    .locals 1

    .line 68
    invoke-direct {p0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->ensureBound()V

    .line 69
    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mService:Lcom/vadimbrk/mycar/ISilentInstallService;

    return-object v0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 61
    if-nez p1, :cond_0

    .line 62
    return-void

    .line 63
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mApplicationContext:Landroid/content/Context;

    .line 64
    invoke-direct {p0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->ensureBound()V

    .line 65
    return-void
.end method

.method public isActiveSafe()Z
    .locals 4

    .line 78
    invoke-virtual {p0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->getService()Lcom/vadimbrk/mycar/ISilentInstallService;

    move-result-object v0

    .line 79
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 80
    const-string v0, "isActiveSafe: service is null"

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 81
    return v1

    .line 85
    :cond_0
    :try_start_0
    invoke-interface {v0}, Lcom/vadimbrk/mycar/ISilentInstallService;->isAcive()Z

    move-result v0

    .line 86
    sget-boolean v2, Lcom/vadimbrk/mycar/MyCarServiceClient;->sIsMyCarActive:Z

    if-eq v0, v2, :cond_1

    .line 87
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isActiveSafe: service.isAcive()="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 88
    sput-boolean v0, Lcom/vadimbrk/mycar/MyCarServiceClient;->sIsMyCarActive:Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :cond_1
    return v0

    .line 91
    :catch_0
    move-exception v0

    .line 92
    const-string v0, "isActiveSafe: RemoteException"

    invoke-static {v0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->logDebug(Ljava/lang/String;)V

    .line 93
    return v1
.end method

.method public isRightRudderSafe()Z
    .locals 2

    .line 98
    invoke-virtual {p0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->getService()Lcom/vadimbrk/mycar/ISilentInstallService;

    move-result-object v0

    .line 99
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 100
    return v1

    .line 103
    :cond_0
    :try_start_0
    invoke-interface {v0}, Lcom/vadimbrk/mycar/ISilentInstallService;->isRightRudder()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 104
    :catch_0
    move-exception v0

    .line 105
    return v1
.end method

.method public isServiceConnected()Z
    .locals 1

    .line 73
    invoke-direct {p0}, Lcom/vadimbrk/mycar/MyCarServiceClient;->ensureBound()V

    .line 74
    iget-boolean v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mIsServiceConnected:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vadimbrk/mycar/MyCarServiceClient;->mService:Lcom/vadimbrk/mycar/ISilentInstallService;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
