.class public Lco/getair/meerkat/proxies/StreamActivitiesProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "StreamActivitiesProxy.java"


# static fields
.field private static final GET_ACTIVITIES_KEY:Ljava/lang/String; = "activities"

.field private static final LOG_TAG:Ljava/lang/String; = "StreamActivitiesProxy"

.field private static final NAME:Ljava/lang/String; = "StreamActivitiesProxy"


# instance fields
.field private context:Landroid/content/Context;

.field private getActivitiesUrl:Ljava/lang/String;

.field private lastActivitiesCount:I

.field private scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

.field private worker:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p2, "streamActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "StreamActivitiesProxy"

    invoke-direct {p0, v0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->lastActivitiesCount:I

    .line 59
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->context:Landroid/content/Context;

    .line 60
    const-string v0, "activities"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getActivitiesUrl:Ljava/lang/String;

    .line 61
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    .line 62
    return-void
.end method

.method public static NAME()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    const-string v0, "StreamActivitiesProxy"

    return-object v0
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    .prologue
    .line 37
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    .prologue
    .line 37
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/StreamActivitiesProxy;I)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;
    .param p1, "x1"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->reactivateGetActivities(I)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)I
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    .prologue
    .line 37
    iget v0, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->lastActivitiesCount:I

    return v0
.end method

.method static synthetic access$302(Lco/getair/meerkat/proxies/StreamActivitiesProxy;I)I
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;
    .param p1, "x1"    # I

    .prologue
    .line 37
    iput p1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->lastActivitiesCount:I

    return p1
.end method

.method private reactivateGetActivities(I)V
    .locals 5
    .param p1, "delayInSeconds"    # I

    .prologue
    .line 148
    new-instance v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$4;

    invoke-direct {v0, p0}, Lco/getair/meerkat/proxies/StreamActivitiesProxy$4;-><init>(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)V

    .line 154
    .local v0, "task":Ljava/lang/Runnable;
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    .line 155
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 158
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v1

    if-nez v1, :cond_1

    .line 159
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    int-to-long v2, p1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v0, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    .line 161
    :cond_1
    return-void
.end method


# virtual methods
.method public getActivities()V
    .locals 7

    .prologue
    .line 65
    new-instance v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$3;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getActivitiesUrl:Ljava/lang/String;

    const-string v4, ""

    new-instance v5, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;-><init>(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)V

    new-instance v6, Lco/getair/meerkat/proxies/StreamActivitiesProxy$2;

    invoke-direct {v6, p0}, Lco/getair/meerkat/proxies/StreamActivitiesProxy$2;-><init>(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)V

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lco/getair/meerkat/proxies/StreamActivitiesProxy$3;-><init>(Lco/getair/meerkat/proxies/StreamActivitiesProxy;ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 144
    .local v0, "getActivitiesRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 145
    return-void
.end method

.method public onRemove()V
    .locals 3

    .prologue
    .line 168
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    .line 169
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 172
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_1

    .line 173
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    :cond_1
    :goto_0
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;->onRemove()V

    .line 181
    return-void

    .line 176
    :catch_0
    move-exception v0

    .line 177
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
