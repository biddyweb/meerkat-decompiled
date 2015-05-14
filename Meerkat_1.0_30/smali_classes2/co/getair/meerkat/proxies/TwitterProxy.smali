.class public Lco/getair/meerkat/proxies/TwitterProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "TwitterProxy.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "TwitterProxy"

.field private static final TWEET_COMMENTS_KEY:Ljava/lang/String; = "tweetCommentsKey"

.field private static final commentsState:Lcom/google/common/cache/Cache;
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
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 41
    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    const-wide/16 v2, 0x18

    sget-object v1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 42
    invoke-virtual {v0, v2, v3, v1}, Lcom/google/common/cache/CacheBuilder;->expireAfterWrite(JLjava/util/concurrent/TimeUnit;)Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->build()Lcom/google/common/cache/Cache;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/proxies/TwitterProxy;->commentsState:Lcom/google/common/cache/Cache;

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    iput-object p2, p0, Lco/getair/meerkat/proxies/TwitterProxy;->context:Landroid/content/Context;

    .line 49
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/TwitterProxy;JLjava/util/ArrayList;)V
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/TwitterProxy;
    .param p1, "x1"    # J
    .param p3, "x2"    # Ljava/util/ArrayList;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/proxies/TwitterProxy;->getUserFrindsIdsForPage(JLjava/util/ArrayList;)V

    return-void
.end method

.method private getUserFrindsIdsForPage(JLjava/util/ArrayList;)V
    .locals 9
    .param p1, "cursor"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p3, "accumulatedFriendsIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v7, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-direct {v7, v1}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/TwitterSession;)V

    .line 179
    .local v7, "meerkatTwitterApiClient":Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserId()J

    move-result-wide v2

    .line 181
    .local v2, "id":J
    :try_start_0
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;->getCustomService()Lco/getair/meerkat/utilities/CustomService;

    move-result-object v1

    new-instance v6, Lco/getair/meerkat/proxies/TwitterProxy$6;

    invoke-direct {v6, p0, p3}, Lco/getair/meerkat/proxies/TwitterProxy$6;-><init>(Lco/getair/meerkat/proxies/TwitterProxy;Ljava/util/ArrayList;)V

    move-wide v4, p1

    invoke-interface/range {v1 .. v6}, Lco/getair/meerkat/utilities/CustomService;->getFriendsIds(JJLcom/twitter/sdk/android/core/Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    :goto_0
    return-void

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "exception":Ljava/lang/Exception;
    const-string v1, "TwitterProxy"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static isCommentsShouldTweet()Z
    .locals 2

    .prologue
    .line 233
    sget-object v0, Lco/getair/meerkat/proxies/TwitterProxy;->commentsState:Lcom/google/common/cache/Cache;

    const-string v1, "tweetCommentsKey"

    .line 234
    invoke-interface {v0, v1}, Lcom/google/common/cache/Cache;->getIfPresent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 235
    invoke-virtual {v0, v1}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static setCommentsShouldTweetState(Z)V
    .locals 3
    .param p0, "state"    # Z

    .prologue
    .line 239
    sget-object v0, Lco/getair/meerkat/proxies/TwitterProxy;->commentsState:Lcom/google/common/cache/Cache;

    const-string v1, "tweetCommentsKey"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/common/cache/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 240
    return-void
.end method


# virtual methods
.method public favoriteTweet(Ljava/lang/String;)V
    .locals 3
    .param p1, "tweetId"    # Ljava/lang/String;

    .prologue
    .line 137
    new-instance v0, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-direct {v0, v1}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/TwitterSession;)V

    .line 139
    .local v0, "meerkatTwitterApiClient":Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;->getCustomService()Lco/getair/meerkat/utilities/CustomService;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/proxies/TwitterProxy$4;

    invoke-direct {v2, p0, p1}, Lco/getair/meerkat/proxies/TwitterProxy$4;-><init>(Lco/getair/meerkat/proxies/TwitterProxy;Ljava/lang/String;)V

    invoke-interface {v1, p1, v2}, Lco/getair/meerkat/utilities/CustomService;->favoriteTweet(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 151
    return-void
.end method

.method public getTwitterUser(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 6
    .param p1, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 56
    new-instance v1, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-direct {v1, v2}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/TwitterSession;)V

    .line 59
    .local v1, "meerkatTwitterApiClient":Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;
    :try_start_0
    invoke-virtual {v1}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;->getCustomService()Lco/getair/meerkat/utilities/CustomService;

    move-result-object v3

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v2}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserId()J

    move-result-wide v4

    new-instance v2, Lco/getair/meerkat/proxies/TwitterProxy$1;

    invoke-direct {v2, p0, p1}, Lco/getair/meerkat/proxies/TwitterProxy$1;-><init>(Lco/getair/meerkat/proxies/TwitterProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-interface {v3, v4, v5, v2}, Lco/getair/meerkat/utilities/CustomService;->show(JLcom/twitter/sdk/android/core/Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :goto_0
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "exception":Ljava/lang/Exception;
    const/4 v2, 0x0

    iput-boolean v2, p1, Lco/getair/meerkat/utilities/RunnableWithResultObject;->success:Z

    .line 82
    invoke-virtual {p1}, Lco/getair/meerkat/utilities/RunnableWithResultObject;->run()V

    .line 83
    const-string v2, "TwitterProxy"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getUserFriendsIds()V
    .locals 3

    .prologue
    .line 172
    const-wide/16 v0, -0x1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lco/getair/meerkat/proxies/TwitterProxy;->getUserFrindsIdsForPage(JLjava/util/ArrayList;)V

    .line 174
    return-void
.end method

.method public getUserProfileImage(Lcom/twitter/sdk/android/core/models/User;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 7
    .param p1, "twitterUser"    # Lcom/twitter/sdk/android/core/models/User;
    .param p2, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 217
    iget-object v2, p1, Lcom/twitter/sdk/android/core/models/User;->profileImageUrl:Ljava/lang/String;

    const-string v4, "_normal"

    const-string v6, ""

    invoke-virtual {v2, v4, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 218
    .local v1, "bigProfileImageUrl":Ljava/lang/String;
    new-instance v0, Lcom/android/volley/toolbox/ImageRequest;

    new-instance v2, Lco/getair/meerkat/proxies/TwitterProxy$7;

    invoke-direct {v2, p0, p2}, Lco/getair/meerkat/proxies/TwitterProxy$7;-><init>(Lco/getair/meerkat/proxies/TwitterProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    move v4, v3

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/android/volley/toolbox/ImageRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;IILandroid/graphics/Bitmap$Config;Lcom/android/volley/Response$ErrorListener;)V

    .line 228
    .local v0, "imageRequest":Lcom/android/volley/toolbox/ImageRequest;
    iget-object v2, p0, Lco/getair/meerkat/proxies/TwitterProxy;->context:Landroid/content/Context;

    invoke-static {v2}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v2

    invoke-virtual {v2, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 229
    return-void
.end method

.method public logout()V
    .locals 0

    .prologue
    .line 52
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->logOut()V

    .line 53
    return-void
.end method

.method public replyTweet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "replyText"    # Ljava/lang/String;
    .param p2, "originalTweeterUsername"    # Ljava/lang/String;
    .param p3, "originalTweetId"    # Ljava/lang/String;

    .prologue
    .line 113
    new-instance v1, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-direct {v1, v2}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/TwitterSession;)V

    .line 116
    .local v1, "meerkatTwitterApiClient":Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "atReplyText":Ljava/lang/String;
    invoke-virtual {v1}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;->getCustomService()Lco/getair/meerkat/utilities/CustomService;

    move-result-object v2

    new-instance v3, Lco/getair/meerkat/proxies/TwitterProxy$3;

    invoke-direct {v3, p0, p1, p3, p2}, Lco/getair/meerkat/proxies/TwitterProxy$3;-><init>(Lco/getair/meerkat/proxies/TwitterProxy;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v0, p3, v3}, Lco/getair/meerkat/utilities/CustomService;->replyTweet(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .end local v0    # "atReplyText":Ljava/lang/String;
    :goto_0
    return-void

    .line 131
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public retweetTweet(Ljava/lang/String;)V
    .locals 3
    .param p1, "tweetId"    # Ljava/lang/String;

    .prologue
    .line 154
    new-instance v0, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-direct {v0, v1}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/TwitterSession;)V

    .line 156
    .local v0, "meerkatTwitterApiClient":Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;->getCustomService()Lco/getair/meerkat/utilities/CustomService;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/proxies/TwitterProxy$5;

    invoke-direct {v2, p0, p1}, Lco/getair/meerkat/proxies/TwitterProxy$5;-><init>(Lco/getair/meerkat/proxies/TwitterProxy;Ljava/lang/String;)V

    invoke-interface {v1, p1, v2}, Lco/getair/meerkat/utilities/CustomService;->retweet(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 168
    return-void
.end method

.method public tweet(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 3
    .param p1, "tweetText"    # Ljava/lang/String;
    .param p2, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 88
    new-instance v0, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-direct {v0, v1}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/TwitterSession;)V

    .line 91
    .local v0, "meerkatTwitterApiClient":Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;
    :try_start_0
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;->getCustomService()Lco/getair/meerkat/utilities/CustomService;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/proxies/TwitterProxy$2;

    invoke-direct {v2, p0, p2}, Lco/getair/meerkat/proxies/TwitterProxy$2;-><init>(Lco/getair/meerkat/proxies/TwitterProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-interface {v1, p1, v2}, Lco/getair/meerkat/utilities/CustomService;->tweet(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :goto_0
    return-void

    .line 107
    :catch_0
    move-exception v1

    goto :goto_0
.end method
