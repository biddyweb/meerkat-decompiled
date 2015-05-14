.class public Lco/getair/meerkat/proxies/BroadcastProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "BroadcastProxy.java"


# instance fields
.field private final CREATE_BROADCAST_URL_KEY:Ljava/lang/String;

.field private final LOCATION_TIMEOUT:I

.field private final LOG_TAG:Ljava/lang/String;

.field private final MEDIA_SERVER_URL_KEY:Ljava/lang/String;

.field private final PARAM_CAPTION:Ljava/lang/String;

.field private final PARAM_LOCATION:Ljava/lang/String;

.field private final PARAM_PLACE:Ljava/lang/String;

.field private final PLACEHOLDER_CAPTION:Ljava/lang/String;

.field private final PLACEHOLDER_PAGE:Ljava/lang/String;

.field private final UPDATE_BROADCAST_URL_KEY:Ljava/lang/String;

.field private caption:Ljava/lang/String;

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

.field private id:Ljava/lang/String;

.field private mMessageReceiver:Landroid/content/BroadcastReceiver;

.field private streamStats:Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

.field private tweetId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    const/16 v0, 0xbb8

    iput v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->LOCATION_TIMEOUT:I

    .line 55
    const-string v0, "newBroadcast"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->CREATE_BROADCAST_URL_KEY:Ljava/lang/String;

    .line 56
    const-string v0, "place"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->PARAM_PLACE:Ljava/lang/String;

    .line 57
    const-string v0, "location"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->PARAM_LOCATION:Ljava/lang/String;

    .line 58
    const-string v0, "caption"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->PARAM_CAPTION:Ljava/lang/String;

    .line 60
    const-string v0, "{caption}"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->PLACEHOLDER_CAPTION:Ljava/lang/String;

    .line 61
    const-string v0, "{page}"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->PLACEHOLDER_PAGE:Ljava/lang/String;

    .line 63
    const-string v0, "broadcast"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->UPDATE_BROADCAST_URL_KEY:Ljava/lang/String;

    .line 64
    const-string v0, "media"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->MEDIA_SERVER_URL_KEY:Ljava/lang/String;

    .line 66
    const-string v0, "BroadcastProxy"

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->LOG_TAG:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->id:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->caption:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->tweetId:Ljava/lang/String;

    .line 75
    new-instance v0, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    invoke-direct {v0}, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->streamStats:Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    .line 77
    new-instance v0, Lco/getair/meerkat/proxies/BroadcastProxy$1;

    invoke-direct {v0, p0}, Lco/getair/meerkat/proxies/BroadcastProxy$1;-><init>(Lco/getair/meerkat/proxies/BroadcastProxy;)V

    iput-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->mMessageReceiver:Landroid/content/BroadcastReceiver;

    .line 92
    iput-object p2, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;

    .line 93
    invoke-static {p2}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->mMessageReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "LocationReceived"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 96
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/BroadcastProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/BroadcastProxy;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    invoke-direct {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->goLive()V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$202(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;
    .param p1, "x1"    # Ljava/util/HashMap;

    .prologue
    .line 51
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;

    return-object p1
.end method

.method static synthetic access$302(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->id:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->caption:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lco/getair/meerkat/proxies/BroadcastProxy;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$600(Lco/getair/meerkat/proxies/BroadcastProxy;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/proxies/BroadcastProxy;->addProxies(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lco/getair/meerkat/proxies/BroadcastProxy;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    invoke-direct {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->addCommands()V

    return-void
.end method

.method static synthetic access$800(Lco/getair/meerkat/proxies/BroadcastProxy;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    invoke-direct {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->startBroadcastMixpanelTrack()V

    return-void
.end method

.method static synthetic access$900(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;

    .prologue
    .line 51
    iget-object v0, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->tweetId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$902(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/BroadcastProxy;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->tweetId:Ljava/lang/String;

    return-object p1
.end method

.method private addCommands()V
    .locals 3

    .prologue
    .line 289
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandStartGettingStreamActivities"

    new-instance v2, Lco/getair/meerkat/commands/stream_participation/StartGettingActivitiesCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/stream_participation/StartGettingActivitiesCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 290
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandStartGettingWatchers"

    new-instance v2, Lco/getair/meerkat/commands/stream_participation/StartGettingWatchersCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/stream_participation/StartGettingWatchersCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 291
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandStopGettingWatchers"

    new-instance v2, Lco/getair/meerkat/commands/stream_participation/StopGettingWatchersCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/stream_participation/StopGettingWatchersCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 292
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandStreamStatsUpdate"

    new-instance v2, Lco/getair/meerkat/commands/broadcast/UpdateStreamStateCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/broadcast/UpdateStreamStateCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 293
    return-void
.end method

.method private addProxies(Landroid/content/Context;Ljava/lang/String;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "baseUrl"    # Ljava/lang/String;

    .prologue
    .line 275
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v1

    const-string v2, "graphProxy"

    invoke-virtual {v1, v2}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/proxies/GraphProxy;

    .line 276
    .local v6, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v6}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v9

    .line 278
    .local v9, "user":Lco/getair/meerkat/dtos/User;
    new-instance v7, Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;

    invoke-direct {v7, p1, v1}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;-><init>(Landroid/content/Context;Ljava/util/HashMap;)V

    .line 279
    .local v7, "streamActivitiesProxy":Lco/getair/meerkat/proxies/StreamActivitiesProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v7}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 281
    new-instance v8, Lco/getair/meerkat/proxies/StreamWatchersProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;

    invoke-direct {v8, p1, v1}, Lco/getair/meerkat/proxies/StreamWatchersProxy;-><init>(Landroid/content/Context;Ljava/util/HashMap;)V

    .line 282
    .local v8, "streamWatchersProxy":Lco/getair/meerkat/proxies/StreamWatchersProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v8}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 284
    new-instance v0, Lco/getair/meerkat/proxies/StreamCommentsProxy;

    iget-object v3, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;

    const-string v4, ""

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v5

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/proxies/StreamCommentsProxy;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    .local v0, "streamCommentsProxy":Lco/getair/meerkat/proxies/StreamCommentsProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 286
    return-void
.end method

.method private goLive()V
    .locals 13

    .prologue
    .line 145
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v4, "gpsProxy"

    invoke-virtual {v1, v4}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v10

    check-cast v10, Lco/getair/meerkat/utilities/GPSHandlerProxy;

    .line 147
    .local v10, "gpsHandlerProxy":Lco/getair/meerkat/utilities/GPSHandlerProxy;
    invoke-virtual {v10}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCity()Ljava/lang/String;

    move-result-object v7

    .line 148
    .local v7, "cityName":Ljava/lang/String;
    invoke-virtual {v10}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCountry()Ljava/lang/String;

    move-result-object v8

    .line 150
    .local v8, "countryName":Ljava/lang/String;
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v4, "newBroadcast"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 152
    .local v2, "createBroadcastUrl":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 153
    .local v3, "params":Lorg/json/JSONObject;
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    .line 154
    .local v12, "placeParam":Lorg/json/JSONObject;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 155
    .local v6, "captionParam":Lorg/json/JSONObject;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 159
    .local v11, "locationParam":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "id"

    const-string v4, ""

    invoke-virtual {v12, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    const-string v1, "name"

    const-string v4, ""

    invoke-virtual {v12, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 162
    const-string v1, "content"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->caption:Ljava/lang/String;

    invoke-virtual {v6, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    const-string v1, "place"

    invoke-virtual {v3, v1, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 166
    const-string v1, "caption"

    invoke-virtual {v3, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    const-string v1, ""

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, ""

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 169
    :cond_0
    const-string v1, "city"

    invoke-virtual {v11, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 170
    const-string v1, "country"

    invoke-virtual {v11, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    const-string v1, "location"

    invoke-virtual {v3, v1, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 174
    :cond_1
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    new-instance v4, Lco/getair/meerkat/proxies/BroadcastProxy$3;

    invoke-direct {v4, p0, v2, v10}, Lco/getair/meerkat/proxies/BroadcastProxy$3;-><init>(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/lang/String;Lco/getair/meerkat/utilities/GPSHandlerProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/BroadcastProxy$4;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/BroadcastProxy$4;-><init>(Lco/getair/meerkat/proxies/BroadcastProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 258
    .local v0, "createBroadcastRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    .end local v0    # "createBroadcastRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    :goto_0
    return-void

    .line 260
    :catch_0
    move-exception v9

    .line 261
    .local v9, "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private startBroadcastMixpanelTrack()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 270
    const-string v0, "incrementPeopleProperty"

    const-string v1, "stream count"

    invoke-virtual {p0, v0, v1, v2}, Lco/getair/meerkat/proxies/BroadcastProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 271
    const-string v0, "timeEventForMixpanel"

    const-string v1, "stream"

    invoke-virtual {p0, v0, v1, v2}, Lco/getair/meerkat/proxies/BroadcastProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    return-void
.end method


# virtual methods
.method public onRemove()V
    .locals 6

    .prologue
    .line 299
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 300
    .local v1, "endStreamEventProperties":Lorg/json/JSONObject;
    const-string v3, "caption"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->caption:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 301
    const-string v3, "stream id"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->id:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 302
    const-string v3, "comments"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->streamStats:Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->getCommentsCount()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 303
    const-string v3, "restreams"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->streamStats:Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->getRestreamsCount()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 304
    const-string v3, "likes"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->streamStats:Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->getLikesCount()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 305
    const-string v3, "watchers"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->streamStats:Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;->getWatchersCount()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 307
    new-instance v2, Lco/getair/meerkat/dtos/MixpanelEventParams;

    const-string v3, "stream"

    invoke-direct {v2, v3, v1}, Lco/getair/meerkat/dtos/MixpanelEventParams;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 308
    .local v2, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    const-string v4, "trackMixpanelEvent"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v2, v5}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 310
    iget-object v3, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v3

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->mMessageReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    .end local v1    # "endStreamEventProperties":Lorg/json/JSONObject;
    .end local v2    # "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    :goto_0
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;->onRemove()V

    .line 316
    return-void

    .line 311
    :catch_0
    move-exception v0

    .line 312
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public startGoLiveSequence(Ljava/lang/String;)V
    .locals 3
    .param p1, "caption"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->caption:Ljava/lang/String;

    .line 135
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/BroadcastProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "gpsProxy"

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/utilities/GPSHandlerProxy;

    .line 136
    .local v0, "gpsHandlerProxy":Lco/getair/meerkat/utilities/GPSHandlerProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 137
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->stop()V

    .line 140
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->start(Landroid/content/Context;)V

    .line 141
    return-void
.end method

.method public updateStreamStats(Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;)V
    .locals 0
    .param p1, "updatedStreamStats"    # Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    .prologue
    .line 266
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy;->streamStats:Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    .line 267
    return-void
.end method

.method public uploadCoverImage(Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "coverImage"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v3, 0x0

    .line 101
    new-instance v0, Lco/getair/meerkat/proxies/BroadcastProxy$2;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/proxies/BroadcastProxy$2;-><init>(Lco/getair/meerkat/proxies/BroadcastProxy;Landroid/graphics/Bitmap;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    .line 126
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/BroadcastProxy$2;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 127
    return-void
.end method
