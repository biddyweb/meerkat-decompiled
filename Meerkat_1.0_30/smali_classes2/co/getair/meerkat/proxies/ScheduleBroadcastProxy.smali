.class public Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "ScheduleBroadcastProxy.java"


# instance fields
.field private context:Landroid/content/Context;

.field private followupActions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 50
    iput-object p2, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->context:Landroid/content/Context;

    .line 51
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->followupActions:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$002(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 42
    iput-object p1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->followupActions:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/util/HashMap;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->tweetBroadcast(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->scheduleBroadcastReminder(Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .prologue
    .line 42
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method private scheduleBroadcastReminder(Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V
    .locals 8
    .param p1, "scheduleBroadcastParams"    # Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    .prologue
    const/4 v6, 0x0

    .line 216
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    .line 218
    .local v0, "activity":Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lco/getair/meerkat/ScheduledBroadcastReceiver;

    invoke-direct {v2, v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 219
    .local v2, "intent":Landroid/content/Intent;
    const-string v4, "broadcastIdNameKey"

    invoke-virtual {v0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->getBroadcastName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 220
    const-string v4, "broadcastNameKey"

    const-string v5, ""

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 222
    invoke-static {v0, v6, v2, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 224
    .local v3, "pendingIntent":Landroid/app/PendingIntent;
    const-string v4, "alarm"

    invoke-virtual {v0, v4}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    .line 225
    .local v1, "alarmManager":Landroid/app/AlarmManager;
    const/4 v4, 0x1

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getTimeOfBroadcast()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v1, v4, v6, v7, v3}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 226
    return-void
.end method

.method private tweetBroadcast(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 3
    .param p1, "tweetFormat"    # Ljava/lang/String;
    .param p2, "followUpActions"    # Ljava/util/HashMap;
    .param p3, "scheduleId"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "twitterProxy"

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/TwitterProxy;

    .line 165
    .local v0, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    new-instance v1, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;

    invoke-direct {v1, p0, p2}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$4;-><init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Ljava/util/HashMap;)V

    invoke-virtual {v0, p1, v1}, Lco/getair/meerkat/proxies/TwitterProxy;->tweet(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 210
    return-void
.end method


# virtual methods
.method public scheduleBroadcast(Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V
    .locals 12
    .param p1, "scheduleBroadcastParams"    # Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    .prologue
    .line 85
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v6

    .line 86
    .local v6, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v1, "schedules"

    invoke-virtual {v6, v1}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 88
    .local v2, "scheduleUrl":Ljava/lang/String;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 89
    .local v7, "caption":Ljava/util/HashMap;
    const-string v1, "content"

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getCaption()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 92
    .local v9, "params":Ljava/util/HashMap;
    const-string v1, "time"

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getTimeOfBroadcast()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    const-wide/16 v10, 0x3e8

    div-long/2addr v4, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v1, "caption"

    invoke-virtual {v9, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    new-instance v8, Lcom/google/gson/Gson;

    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V

    .line 96
    .local v8, "gson":Lcom/google/gson/Gson;
    invoke-virtual {v8, v9}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 98
    .local v3, "paramsString":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    new-instance v4, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$2;-><init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V

    new-instance v5, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$3;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$3;-><init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 158
    .local v0, "followUserRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 159
    return-void
.end method

.method public uploadCoverImage(Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "coverImage"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v3, 0x0

    .line 56
    new-instance v0, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;-><init>(Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;Landroid/graphics/Bitmap;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    .line 79
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 80
    return-void
.end method
