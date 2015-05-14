.class public Lco/getair/meerkat/proxies/StreamWatchersProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "StreamWatchersProxy.java"


# static fields
.field private static final GET_WATCHERS_KEY:Ljava/lang/String; = "watchers"

.field private static final LOG_TAG:Ljava/lang/String; = "StreamWatchersProxy"

.field private static final NAME:Ljava/lang/String; = "StreamWatchersProxy"


# instance fields
.field private context:Landroid/content/Context;

.field private getWatchersUrl:Ljava/lang/String;

.field private scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

.field private streamHasEnded:Z

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
    .line 52
    .local p2, "streamActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "StreamWatchersProxy"

    invoke-direct {p0, v0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->streamHasEnded:Z

    .line 54
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->context:Landroid/content/Context;

    .line 55
    const-string v0, "watchers"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->getWatchersUrl:Ljava/lang/String;

    .line 56
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    .line 57
    return-void
.end method

.method public static NAME()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    const-string v0, "StreamWatchersProxy"

    return-object v0
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/StreamWatchersProxy;)Z
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamWatchersProxy;

    .prologue
    .line 33
    iget-boolean v0, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->streamHasEnded:Z

    return v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/StreamWatchersProxy;I)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamWatchersProxy;
    .param p1, "x1"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->reactivateGetWatchers(I)V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/StreamWatchersProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/StreamWatchersProxy;

    .prologue
    .line 33
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method private reactivateGetWatchers(I)V
    .locals 5
    .param p1, "delayInSeconds"    # I

    .prologue
    .line 97
    new-instance v0, Lco/getair/meerkat/proxies/StreamWatchersProxy$3;

    invoke-direct {v0, p0}, Lco/getair/meerkat/proxies/StreamWatchersProxy$3;-><init>(Lco/getair/meerkat/proxies/StreamWatchersProxy;)V

    .line 103
    .local v0, "task":Ljava/lang/Runnable;
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    .line 104
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 107
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v1

    if-nez v1, :cond_1

    .line 108
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    int-to-long v2, p1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v0, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    .line 110
    :cond_1
    return-void
.end method


# virtual methods
.method public getWatchers()V
    .locals 6

    .prologue
    .line 61
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    iget-object v2, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->getWatchersUrl:Ljava/lang/String;

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/StreamWatchersProxy$1;-><init>(Lco/getair/meerkat/proxies/StreamWatchersProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/StreamWatchersProxy$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/StreamWatchersProxy$2;-><init>(Lco/getair/meerkat/proxies/StreamWatchersProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 93
    .local v0, "getWatchersRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 94
    return-void
.end method

.method public onRemove()V
    .locals 3

    .prologue
    .line 121
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    .line 122
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->scheduledFuture:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 125
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v1, :cond_1

    .line 126
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :cond_1
    :goto_0
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;->onRemove()V

    .line 134
    return-void

    .line 129
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy;->streamHasEnded:Z

    .line 114
    return-void
.end method
