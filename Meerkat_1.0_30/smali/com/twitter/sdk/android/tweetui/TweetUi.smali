.class public Lcom/twitter/sdk/android/tweetui/TweetUi;
.super Lio/fabric/sdk/android/Kit;
.source "TweetUi.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/Kit",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lio/fabric/sdk/android/services/concurrency/DependsOn;
    value = {
        Lcom/twitter/sdk/android/core/TwitterCore;
    }
.end annotation


# static fields
.field private static final KIT_SCRIBE_NAME:Ljava/lang/String; = "TweetUi"

.field static final LOGTAG:Ljava/lang/String; = "TweetUi"

.field static final NOT_STARTED_ERROR:Ljava/lang/String; = "Must start TweetUi Kit in Fabric.with()."


# instance fields
.field activeSessionProvider:Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

.field advertisingId:Ljava/lang/String;

.field private final gsonRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/google/gson/Gson;",
            ">;"
        }
    .end annotation
.end field

.field private imageLoader:Lcom/squareup/picasso/Picasso;

.field private metricsManager:Lcom/twitter/cobalt/metrics/MetricsManager;

.field private queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

.field scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

.field sessionManagers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;"
        }
    .end annotation
.end field

.field private tweetRepository:Lcom/twitter/sdk/android/tweetui/TweetRepository;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->gsonRef:Ljava/util/concurrent/atomic/AtomicReference;

    .line 48
    return-void
.end method

.method private static checkInitialized()V
    .locals 2

    .prologue
    .line 110
    const-class v0, Lcom/twitter/sdk/android/tweetui/TweetUi;

    invoke-static {v0}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    if-nez v0, :cond_0

    .line 111
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must start TweetUi Kit in Fabric.with()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/twitter/sdk/android/tweetui/TweetUi;
    .locals 1

    .prologue
    .line 55
    invoke-static {}, Lcom/twitter/sdk/android/tweetui/TweetUi;->checkInitialized()V

    .line 56
    const-class v0, Lcom/twitter/sdk/android/tweetui/TweetUi;

    invoke-static {v0}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/tweetui/TweetUi;

    return-object v0
.end method

.method private setUpScribeClient()V
    .locals 6

    .prologue
    .line 116
    new-instance v0, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    const-string v2, "TweetUi"

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->gsonRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/gson/Gson;

    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->sessionManagers:Ljava/util/List;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;-><init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Lcom/google/gson/Gson;Ljava/util/List;Lio/fabric/sdk/android/services/common/IdManager;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    .line 118
    return-void
.end method


# virtual methods
.method clearAppSession(J)V
    .locals 1
    .param p1, "sessionId"    # J

    .prologue
    .line 177
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getAppSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/twitter/sdk/android/core/SessionManager;->clearSession(J)V

    .line 178
    return-void
.end method

.method protected doInBackground()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/picasso/Picasso;->with(Landroid/content/Context;)Lcom/squareup/picasso/Picasso;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->imageLoader:Lcom/squareup/picasso/Picasso;

    .line 94
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->activeSessionProvider:Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->sessionRestored(Lcom/twitter/sdk/android/core/Session;)V

    .line 98
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->initGson()V

    .line 99
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->initMetricsManager()V

    .line 100
    invoke-direct {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->setUpScribeClient()V

    .line 101
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/common/IdManager;->getAdvertisingId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->advertisingId:Ljava/lang/String;

    .line 102
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->doInBackground()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    const-string v0, "com.twitter.sdk.android:tweet-ui"

    return-object v0
.end method

.method getImageLoader()Lcom/squareup/picasso/Picasso;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->imageLoader:Lcom/squareup/picasso/Picasso;

    return-object v0
.end method

.method getMetricsManager()Lcom/twitter/cobalt/metrics/MetricsManager;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->metricsManager:Lcom/twitter/cobalt/metrics/MetricsManager;

    return-object v0
.end method

.method getTweetRepository()Lcom/twitter/sdk/android/tweetui/TweetRepository;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->tweetRepository:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    const-string v0, "1.0.6.37"

    return-object v0
.end method

.method initGson()V
    .locals 3

    .prologue
    .line 139
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->gsonRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 140
    new-instance v1, Lcom/google/gson/GsonBuilder;

    invoke-direct {v1}, Lcom/google/gson/GsonBuilder;-><init>()V

    sget-object v2, Lcom/google/gson/FieldNamingPolicy;->LOWER_CASE_WITH_UNDERSCORES:Lcom/google/gson/FieldNamingPolicy;

    invoke-virtual {v1, v2}, Lcom/google/gson/GsonBuilder;->setFieldNamingPolicy(Lcom/google/gson/FieldNamingPolicy;)Lcom/google/gson/GsonBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    .line 144
    .local v0, "gson":Lcom/google/gson/Gson;
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->gsonRef:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .end local v0    # "gson":Lcom/google/gson/Gson;
    :cond_0
    return-void
.end method

.method initMetricsManager()V
    .locals 2

    .prologue
    .line 149
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/twitter/cobalt/metrics/MetricsManager;->initialize(Landroid/content/Context;)V

    .line 150
    invoke-static {}, Lcom/twitter/cobalt/metrics/MetricsManager;->getInstance()Lcom/twitter/cobalt/metrics/MetricsManager;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->metricsManager:Lcom/twitter/cobalt/metrics/MetricsManager;

    .line 151
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->metricsManager:Lcom/twitter/cobalt/metrics/MetricsManager;

    new-instance v1, Lcom/twitter/cobalt/metrics/ConsoleReporter;

    invoke-direct {v1}, Lcom/twitter/cobalt/metrics/ConsoleReporter;-><init>()V

    invoke-virtual {v0, v1}, Lcom/twitter/cobalt/metrics/MetricsManager;->addReporter(Lcom/twitter/cobalt/metrics/MetricsReporter;)V

    .line 152
    return-void
.end method

.method protected onPreExecute()Z
    .locals 5

    .prologue
    .line 71
    invoke-super {p0}, Lio/fabric/sdk/android/Kit;->onPreExecute()Z

    .line 72
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    .line 75
    .local v0, "twitterCore":Lcom/twitter/sdk/android/core/TwitterCore;
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->sessionManagers:Ljava/util/List;

    .line 76
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->sessionManagers:Ljava/util/List;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->sessionManagers:Ljava/util/List;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getAppSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    new-instance v1, Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->sessionManagers:Ljava/util/List;

    invoke-direct {v1, v2}, Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;-><init>(Ljava/util/List;)V

    iput-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->activeSessionProvider:Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

    .line 80
    new-instance v1, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->activeSessionProvider:Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

    invoke-direct {v1, v0, v2}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;-><init>(Lcom/twitter/sdk/android/core/TwitterCore;Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;)V

    iput-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    .line 81
    new-instance v1, Lcom/twitter/sdk/android/tweetui/TweetRepository;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v2

    invoke-virtual {v2}, Lio/fabric/sdk/android/Fabric;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v3

    invoke-virtual {v3}, Lio/fabric/sdk/android/Fabric;->getMainHandler()Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->queue:Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    invoke-direct {v1, p0, v2, v3, v4}, Lcom/twitter/sdk/android/tweetui/TweetRepository;-><init>(Lcom/twitter/sdk/android/tweetui/TweetUi;Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)V

    iput-object v1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->tweetRepository:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    .line 84
    const/4 v1, 0x1

    return v1
.end method

.method varargs scribe([Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;)V
    .locals 9
    .param p1, "namespaces"    # [Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    .prologue
    .line 121
    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    if-nez v5, :cond_1

    .line 135
    :cond_0
    return-void

    .line 123
    :cond_1
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetUi;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget-object v5, v5, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, "language":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 131
    .local v6, "timestamp":J
    move-object v0, p1

    .local v0, "arr$":[Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v4, v0, v1

    .line 132
    .local v4, "ns":Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->scribeClient:Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;

    iget-object v8, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->advertisingId:Ljava/lang/String;

    invoke-static {v4, v6, v7, v2, v8}, Lcom/twitter/sdk/android/tweetui/ScribeEventFactory;->newScribeEvent(Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;JLjava/lang/String;Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;

    move-result-object v8

    invoke-virtual {v5, v8}, Lcom/twitter/sdk/android/core/internal/scribe/DefaultScribeClient;->scribe(Lcom/twitter/sdk/android/core/internal/scribe/ScribeEvent;)V

    .line 131
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method setImageLoader(Lcom/squareup/picasso/Picasso;)V
    .locals 0
    .param p1, "imageLoader"    # Lcom/squareup/picasso/Picasso;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->imageLoader:Lcom/squareup/picasso/Picasso;

    .line 174
    return-void
.end method

.method setTweetRepository(Lcom/twitter/sdk/android/tweetui/TweetRepository;)V
    .locals 0
    .param p1, "tweetRepository"    # Lcom/twitter/sdk/android/tweetui/TweetRepository;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetUi;->tweetRepository:Lcom/twitter/sdk/android/tweetui/TweetRepository;

    .line 165
    return-void
.end method
