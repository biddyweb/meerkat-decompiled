.class public Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "StreamsCacheProxy.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "StreamsCacheProxy"

.field private static instance:Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

.field private static final streamsTinyCache:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache",
            "<",
            "Ljava/lang/String;",
            "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 18
    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    const-wide/16 v2, 0x1e

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 19
    invoke-virtual {v0, v2, v3, v1}, Lcom/google/common/cache/CacheBuilder;->expireAfterWrite(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->build()Lcom/google/common/cache/Cache;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->streamsTinyCache:Lcom/google/common/cache/Cache;

    .line 18
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "proxyName"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public static declared-synchronized getInstance()Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;
    .locals 3

    .prologue
    .line 23
    const-class v1, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->instance:Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    const-string v2, "StreamsCacheProxy"

    invoke-direct {v0, v2}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;-><init>(Ljava/lang/String;)V

    sput-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->instance:Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    .line 27
    :cond_0
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->instance:Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 23
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    const-string v0, "StreamsCacheProxy"

    return-object v0
.end method


# virtual methods
.method public getLiveStreamById(Ljava/lang/String;)Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 46
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->streamsTinyCache:Lcom/google/common/cache/Cache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "live_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;

    return-object v0
.end method

.method public getScheduledStreamById(Ljava/lang/String;)Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 56
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->streamsTinyCache:Lcom/google/common/cache/Cache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "scheduled_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    return-object v0
.end method

.method public invalidateScheduledStream(Ljava/lang/String;)V
    .locals 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 61
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->streamsTinyCache:Lcom/google/common/cache/Cache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "scheduled_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/Cache;->invalidate(Ljava/lang/Object;)V

    .line 62
    return-void
.end method

.method public storeLive(Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;)V
    .locals 3
    .param p1, "liveItemProxy"    # Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;

    .prologue
    .line 41
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->streamsTinyCache:Lcom/google/common/cache/Cache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "live_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 42
    return-void
.end method

.method public storeScheduled(Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)V
    .locals 3
    .param p1, "scheduledItemProxy"    # Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .prologue
    .line 51
    sget-object v0, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->streamsTinyCache:Lcom/google/common/cache/Cache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "scheduled_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    return-void
.end method
