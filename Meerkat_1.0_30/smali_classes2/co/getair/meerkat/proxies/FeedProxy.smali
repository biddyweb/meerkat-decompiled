.class public Lco/getair/meerkat/proxies/FeedProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "FeedProxy.java"


# static fields
.field private static final gson:Lcom/google/gson/Gson;


# instance fields
.field private final GET_LIVE_STREAMS_URL_KEY:Ljava/lang/String;

.field private final GET_SCHEDULED_STREAMS_URL_KEY:Ljava/lang/String;

.field private context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    sput-object v0, Lco/getair/meerkat/proxies/FeedProxy;->gson:Lcom/google/gson/Gson;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 49
    const-string v0, "liveNow"

    iput-object v0, p0, Lco/getair/meerkat/proxies/FeedProxy;->GET_LIVE_STREAMS_URL_KEY:Ljava/lang/String;

    .line 50
    const-string v0, "scheduledStreams"

    iput-object v0, p0, Lco/getair/meerkat/proxies/FeedProxy;->GET_SCHEDULED_STREAMS_URL_KEY:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;

    .line 56
    return-void
.end method

.method static synthetic access$000()Lcom/google/gson/Gson;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lco/getair/meerkat/proxies/FeedProxy;->gson:Lcom/google/gson/Gson;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/FeedProxy;Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/FeedProxy;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lco/getair/meerkat/proxies/FeedProxy;->notifyStreamArrived(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/FeedProxy;Lco/getair/meerkat/dtos/feed/FeedStream;Ljava/lang/Class;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/FeedProxy;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/FeedStream;
    .param p2, "x2"    # Ljava/lang/Class;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/proxies/FeedProxy;->requestStreamSummary(Lco/getair/meerkat/dtos/feed/FeedStream;Ljava/lang/Class;)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/proxies/FeedProxy;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/FeedProxy;

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;

    return-object v0
.end method

.method private notifyStreamArrived(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V
    .locals 3
    .param p1, "streamFeedItem"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 223
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/FeedProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "newStreamArrived"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 224
    return-void
.end method

.method private requestStreamSummary(Lco/getair/meerkat/dtos/feed/FeedStream;Ljava/lang/Class;)V
    .locals 5
    .param p1, "feedStream"    # Lco/getair/meerkat/dtos/feed/FeedStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/dtos/feed/FeedStream;",
            "Ljava/lang/Class",
            "<+",
            "Lco/getair/meerkat/dtos/feed/BroadcastSummary;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p2, "broadcastClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lco/getair/meerkat/dtos/feed/BroadcastSummary;>;"
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/FeedStream;->getBroadcastSummaryUrl()Ljava/lang/String;

    move-result-object v1

    .line 168
    .local v1, "streamSummaryUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v2, 0x0

    new-instance v3, Lco/getair/meerkat/proxies/FeedProxy$5;

    invoke-direct {v3, p0, p2, p1}, Lco/getair/meerkat/proxies/FeedProxy$5;-><init>(Lco/getair/meerkat/proxies/FeedProxy;Ljava/lang/Class;Lco/getair/meerkat/dtos/feed/FeedStream;)V

    new-instance v4, Lco/getair/meerkat/proxies/FeedProxy$6;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/FeedProxy$6;-><init>(Lco/getair/meerkat/proxies/FeedProxy;)V

    invoke-direct {v0, v2, v1, v3, v4}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 219
    .local v0, "streamSummaryRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v2, p0, Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;

    invoke-static {v2}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v2

    invoke-virtual {v2, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 220
    return-void
.end method


# virtual methods
.method public requestLiveStreams(Z)V
    .locals 6
    .param p1, "shouldFilter"    # Z

    .prologue
    .line 61
    iget-object v1, p0, Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v3, "liveNow"

    invoke-virtual {v1, v3}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 63
    .local v2, "getLiveStreamsUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/FeedProxy$1;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/proxies/FeedProxy$1;-><init>(Lco/getair/meerkat/proxies/FeedProxy;Z)V

    new-instance v5, Lco/getair/meerkat/proxies/FeedProxy$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/FeedProxy$2;-><init>(Lco/getair/meerkat/proxies/FeedProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 107
    .local v0, "liveNowRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 108
    return-void
.end method

.method public requestScheduledStreams(Z)V
    .locals 6
    .param p1, "shouldFilter"    # Z

    .prologue
    .line 112
    iget-object v1, p0, Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v3, "scheduledStreams"

    invoke-virtual {v1, v3}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "getLiveStreamsUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/FeedProxy$3;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/proxies/FeedProxy$3;-><init>(Lco/getair/meerkat/proxies/FeedProxy;Z)V

    new-instance v5, Lco/getair/meerkat/proxies/FeedProxy$4;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/FeedProxy$4;-><init>(Lco/getair/meerkat/proxies/FeedProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 158
    .local v0, "liveNowRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 159
    return-void
.end method
