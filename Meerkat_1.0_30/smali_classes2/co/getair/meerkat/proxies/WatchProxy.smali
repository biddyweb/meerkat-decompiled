.class public Lco/getair/meerkat/proxies/WatchProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "WatchProxy.java"


# static fields
.field private static final COMMENTS_KEY:Ljava/lang/String; = "comments"

.field private static final LIKE_STREAM_KEY:Ljava/lang/String; = "likes"

.field private static final LOG_TAG:Ljava/lang/String; = "WatchProxy"

.field private static final PLAYLIST_KEY:Ljava/lang/String; = "playlist"

.field private static final REPORTS_KEY:Ljava/lang/String; = "reports"

.field private static final RESTREAM_KEY:Ljava/lang/String; = "restreams"

.field private static final broadcastStateCache:Lcom/google/common/cache/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/Cache",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

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

.field private streamId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 48
    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    const-wide/16 v2, 0x18

    sget-object v1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 49
    invoke-virtual {v0, v2, v3, v1}, Lcom/google/common/cache/CacheBuilder;->expireAfterWrite(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->build()Lcom/google/common/cache/Cache;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastStateCache:Lcom/google/common/cache/Cache;

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "streamId"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 60
    iput-object p3, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    .line 61
    iput-object p2, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    .line 62
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/WatchProxy;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/WatchProxy;

    .prologue
    .line 39
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$002(Lco/getair/meerkat/proxies/WatchProxy;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/WatchProxy;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 39
    iput-object p1, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/WatchProxy;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/WatchProxy;

    .prologue
    .line 39
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/WatchProxy;)Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/WatchProxy;

    .prologue
    .line 39
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    return-object v0
.end method

.method static synthetic access$202(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;)Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/WatchProxy;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .prologue
    .line 39
    iput-object p1, p0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    return-object p1
.end method

.method static synthetic access$300(Lco/getair/meerkat/proxies/WatchProxy;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/WatchProxy;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lco/getair/meerkat/proxies/WatchProxy;->addProxies(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lco/getair/meerkat/proxies/WatchProxy;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/WatchProxy;

    .prologue
    .line 39
    invoke-direct {p0}, Lco/getair/meerkat/proxies/WatchProxy;->addCommands()V

    return-void
.end method

.method private addCommands()V
    .locals 3

    .prologue
    .line 134
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandStartGettingStreamActivities"

    new-instance v2, Lco/getair/meerkat/commands/stream_participation/StartGettingActivitiesCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/stream_participation/StartGettingActivitiesCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 135
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandStartGettingWatchers"

    new-instance v2, Lco/getair/meerkat/commands/stream_participation/StartGettingWatchersCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/stream_participation/StartGettingWatchersCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 136
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandStopGettingWatchers"

    new-instance v2, Lco/getair/meerkat/commands/stream_participation/StopGettingWatchersCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/stream_participation/StopGettingWatchersCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 137
    return-void
.end method

.method private addProxies(Ljava/lang/String;)V
    .locals 8
    .param p1, "baseUrl"    # Ljava/lang/String;

    .prologue
    .line 123
    new-instance v6, Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    iget-object v2, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    invoke-direct {v6, v1, v2}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;-><init>(Landroid/content/Context;Ljava/util/HashMap;)V

    .line 124
    .local v6, "streamActivitiesProxy":Lco/getair/meerkat/proxies/StreamActivitiesProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v6}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 126
    new-instance v7, Lco/getair/meerkat/proxies/StreamWatchersProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    iget-object v2, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    invoke-direct {v7, v1, v2}, Lco/getair/meerkat/proxies/StreamWatchersProxy;-><init>(Landroid/content/Context;Ljava/util/HashMap;)V

    .line 127
    .local v7, "streamWatchersProxy":Lco/getair/meerkat/proxies/StreamWatchersProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v7}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 129
    new-instance v0, Lco/getair/meerkat/proxies/StreamCommentsProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getTweetId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getBroadcasterUsername()Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/proxies/StreamCommentsProxy;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .local v0, "streamCommentsProxy":Lco/getair/meerkat/proxies/StreamCommentsProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 131
    return-void
.end method

.method private getCommentsCacheKey()Ljava/lang/String;
    .locals 4

    .prologue
    .line 296
    const-string v0, "comment-%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getLikeCacheKey()Ljava/lang/String;
    .locals 4

    .prologue
    .line 288
    const-string v0, "like-%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getRestreamCacheKey()Ljava/lang/String;
    .locals 4

    .prologue
    .line 292
    const-string v0, "restream-%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addMeAsWatcher()V
    .locals 8

    .prologue
    .line 77
    new-instance v7, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v7, v1}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 78
    .local v7, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getAddWatcherTemplate()Ljava/lang/String;

    move-result-object v6

    .line 80
    .local v6, "addWatcherTemplate":Ljava/lang/String;
    const-string v1, "{broadcastId}"

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    invoke-virtual {v6, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "addWatcherUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/WatchProxy$1;

    invoke-direct {v4, p0, v2}, Lco/getair/meerkat/proxies/WatchProxy$1;-><init>(Lco/getair/meerkat/proxies/WatchProxy;Ljava/lang/String;)V

    new-instance v5, Lco/getair/meerkat/proxies/WatchProxy$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/WatchProxy$2;-><init>(Lco/getair/meerkat/proxies/WatchProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 119
    .local v0, "addWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 120
    return-void
.end method

.method public didComment()Z
    .locals 2

    .prologue
    .line 219
    sget-object v0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastStateCache:Lcom/google/common/cache/Cache;

    .line 220
    invoke-direct {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getCommentsCacheKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 221
    invoke-virtual {v0, v1}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public didLikeStream()Z
    .locals 2

    .prologue
    .line 207
    sget-object v0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastStateCache:Lcom/google/common/cache/Cache;

    .line 208
    invoke-direct {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getLikeCacheKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 209
    invoke-virtual {v0, v1}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public didRestream()Z
    .locals 2

    .prologue
    .line 213
    sget-object v0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastStateCache:Lcom/google/common/cache/Cache;

    .line 214
    invoke-direct {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getRestreamCacheKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 215
    invoke-virtual {v0, v1}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    return-object v0
.end method

.method public getBroadcasterUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v0

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getUsername()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTweetId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getTweetId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public likeStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 9
    .param p1, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    const/4 v1, 0x1

    const/4 v8, 0x0

    .line 180
    sget-object v3, Lco/getair/meerkat/proxies/WatchProxy;->broadcastStateCache:Lcom/google/common/cache/Cache;

    invoke-direct {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getLikeCacheKey()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v3, v4, v5}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 183
    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v3}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v3

    const-string v4, "addWatcherTemplate"

    invoke-virtual {v3, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 185
    .local v6, "followUpTemplate":Ljava/lang/String;
    const-string v3, "/broadcasts"

    invoke-virtual {v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v6, v8, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 186
    .local v7, "rootPath":Ljava/lang/String;
    const-string v3, "%s%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v7, v4, v8

    iget-object v5, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    const-string v8, "likes"

    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "likeUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/WatchProxy$5;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/proxies/WatchProxy$5;-><init>(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/proxies/WatchProxy$6;

    invoke-direct {v5, p0, p1}, Lco/getair/meerkat/proxies/WatchProxy$6;-><init>(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 203
    .local v0, "addWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 204
    return-void
.end method

.method public onRemove()V
    .locals 11

    .prologue
    .line 254
    :try_start_0
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 255
    .local v9, "endWatchEventProperties":Lorg/json/JSONObject;
    const-string v1, "stream id"

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 256
    const-string v1, "broadcaster id"

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 257
    const-string v1, "did like"

    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->didLikeStream()Z

    move-result v3

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 258
    const-string v1, "did restream"

    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->didRestream()Z

    move-result v3

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 259
    const-string v1, "did comment"

    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->didComment()Z

    move-result v3

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 261
    new-instance v10, Lco/getair/meerkat/dtos/MixpanelEventParams;

    const-string v1, "watch"

    invoke-direct {v10, v1, v9}, Lco/getair/meerkat/dtos/MixpanelEventParams;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 262
    .local v10, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v3, "trackMixpanelEvent"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v10, v4}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 264
    new-instance v7, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v7, v1}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 265
    .local v7, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getAddWatcherTemplate()Ljava/lang/String;

    move-result-object v6

    .line 266
    .local v6, "addWatcherTemplate":Ljava/lang/String;
    const-string v1, "{broadcastId}"

    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;

    invoke-virtual {v6, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 268
    .local v2, "removeWatcherUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x3

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/WatchProxy$9;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/WatchProxy$9;-><init>(Lco/getair/meerkat/proxies/WatchProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/WatchProxy$10;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/WatchProxy$10;-><init>(Lco/getair/meerkat/proxies/WatchProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 279
    .local v0, "removeWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .end local v0    # "removeWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    .end local v2    # "removeWatcherUrl":Ljava/lang/String;
    .end local v6    # "addWatcherTemplate":Ljava/lang/String;
    .end local v7    # "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    .end local v9    # "endWatchEventProperties":Lorg/json/JSONObject;
    .end local v10    # "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    :goto_0
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;->onRemove()V

    .line 285
    return-void

    .line 280
    :catch_0
    move-exception v8

    .line 281
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public reportStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 9
    .param p1, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 227
    iget-object v3, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v3}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v3

    const-string v4, "addWatcherTemplate"

    invoke-virtual {v3, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 229
    .local v6, "followUpTemplate":Ljava/lang/String;
    const-string v3, "/broadcasts"

    invoke-virtual {v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v6, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 230
    .local v7, "rootPath":Ljava/lang/String;
    const-string v3, "%s%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v7, v4, v5

    iget-object v5, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    const-string v8, "reports"

    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 232
    .local v2, "reportsUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/WatchProxy$7;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/proxies/WatchProxy$7;-><init>(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/proxies/WatchProxy$8;

    invoke-direct {v5, p0, p1}, Lco/getair/meerkat/proxies/WatchProxy$8;-><init>(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 247
    .local v0, "addWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 248
    return-void
.end method

.method public restreamVideo(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 9
    .param p1, "broadcastId"    # Ljava/lang/String;
    .param p2, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 141
    sget-object v1, Lco/getair/meerkat/proxies/WatchProxy;->broadcastStateCache:Lcom/google/common/cache/Cache;

    invoke-direct {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getRestreamCacheKey()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, v4, v5}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 144
    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v4, "addWatcherTemplate"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 146
    .local v7, "followUpTemplate":Ljava/lang/String;
    const/4 v1, 0x0

    const-string v4, "/broadcasts"

    invoke-virtual {v7, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v7, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 147
    .local v8, "rootPath":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;

    const-string v5, "restreams"

    .line 149
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 150
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 152
    .local v2, "restreamUrl":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 154
    .local v3, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "type"

    const-string v4, "restream and retweet"

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    :goto_0
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    new-instance v4, Lco/getair/meerkat/proxies/WatchProxy$3;

    invoke-direct {v4, p0, p2}, Lco/getair/meerkat/proxies/WatchProxy$3;-><init>(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/proxies/WatchProxy$4;

    invoke-direct {v5, p0, p2}, Lco/getair/meerkat/proxies/WatchProxy$4;-><init>(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 174
    .local v0, "addWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/WatchProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 175
    return-void

    .line 155
    .end local v0    # "addWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    :catch_0
    move-exception v6

    .line 156
    .local v6, "ex":Lorg/json/JSONException;
    const-string v1, "Error adding type to restream JSON request"

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setStreamCommented()V
    .locals 3

    .prologue
    .line 300
    sget-object v0, Lco/getair/meerkat/proxies/WatchProxy;->broadcastStateCache:Lcom/google/common/cache/Cache;

    invoke-direct {p0}, Lco/getair/meerkat/proxies/WatchProxy;->getCommentsCacheKey()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 301
    return-void
.end method
