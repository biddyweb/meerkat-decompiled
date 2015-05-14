.class public Lcom/instabug/library/network/InstabugNetworkReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InstabugNetworkReceiver.java"


# static fields
.field private static a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-boolean v0, Lcom/instabug/library/network/InstabugNetworkReceiver;->a:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 19
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 20
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    sget-boolean v0, Lcom/instabug/library/network/InstabugNetworkReceiver;->a:Z

    if-nez v0, :cond_0

    .line 23
    sput-boolean v3, Lcom/instabug/library/network/InstabugNetworkReceiver;->a:Z

    .line 24
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/instabug/library/network/InstabugNetworkReceiver;

    invoke-direct {v0, p1, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 27
    const/4 v2, 0x2

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 28
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/instabug/library/network/UploadCacheService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 34
    :cond_0
    :goto_0
    return-void

    .line 32
    :cond_1
    const/4 v0, 0x0

    sput-boolean v0, Lcom/instabug/library/network/InstabugNetworkReceiver;->a:Z

    goto :goto_0
.end method
