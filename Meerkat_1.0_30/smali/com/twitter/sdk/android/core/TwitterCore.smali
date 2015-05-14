.class public Lcom/twitter/sdk/android/core/TwitterCore;
.super Lio/fabric/sdk/android/Kit;
.source "TwitterCore.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/Kit",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field static final PREF_KEY_ACTIVE_APP_SESSION:Ljava/lang/String; = "active_appsession"

.field static final PREF_KEY_ACTIVE_TWITTER_SESSION:Ljava/lang/String; = "active_twittersession"

.field static final PREF_KEY_APP_SESSION:Ljava/lang/String; = "appsession"

.field static final PREF_KEY_TWITTER_SESSION:Ljava/lang/String; = "twittersession"

.field public static final TAG:Ljava/lang/String; = "Twitter"


# instance fields
.field private final apiClients:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lcom/twitter/sdk/android/core/Session;",
            "Lcom/twitter/sdk/android/core/TwitterApiClient;",
            ">;"
        }
    .end annotation
.end field

.field appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;"
        }
    .end annotation
.end field

.field private final authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

.field sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/internal/SessionMonitor",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;"
        }
    .end annotation
.end field

.field private volatile sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field twitterSessionManager:Lcom/twitter/sdk/android/core/SessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;)V
    .locals 1
    .param p1, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .prologue
    .line 41
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 43
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->apiClients:Ljava/util/concurrent/ConcurrentHashMap;

    .line 44
    return-void
.end method

.method constructor <init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljava/util/concurrent/ConcurrentHashMap;)V
    .locals 0
    .param p1, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/TwitterAuthConfig;",
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lcom/twitter/sdk/android/core/Session;",
            "Lcom/twitter/sdk/android/core/TwitterApiClient;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p2, "apiClients":Ljava/util/concurrent/ConcurrentHashMap;, "Ljava/util/concurrent/ConcurrentHashMap<Lcom/twitter/sdk/android/core/Session;Lcom/twitter/sdk/android/core/TwitterApiClient;>;"
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 49
    iput-object p2, p0, Lcom/twitter/sdk/android/core/TwitterCore;->apiClients:Ljava/util/concurrent/ConcurrentHashMap;

    .line 50
    return-void
.end method

.method private static checkInitialized()V
    .locals 2

    .prologue
    .line 129
    const-class v0, Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-static {v0}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    if-nez v0, :cond_0

    .line 130
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must start Twitter Kit with Fabric.with() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_0
    return-void
.end method

.method private declared-synchronized createSSLSocketFactory()V
    .locals 4

    .prologue
    .line 83
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 85
    :try_start_1
    new-instance v1, Lcom/twitter/sdk/android/core/TwitterPinningInfoProvider;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/twitter/sdk/android/core/TwitterPinningInfoProvider;-><init>(Landroid/content/Context;)V

    invoke-static {v1}, Lio/fabric/sdk/android/services/network/NetworkUtils;->getSSLSocketFactory(Lio/fabric/sdk/android/services/network/PinningInfoProvider;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 87
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Twitter"

    const-string v3, "Custom SSL pinning enabled"

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Twitter"

    const-string v3, "Exception setting up custom SSL pinning"

    invoke-interface {v1, v2, v3, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 83
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private getActiveSession()Lcom/twitter/sdk/android/core/Session;
    .locals 2

    .prologue
    .line 212
    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->twitterSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    .line 213
    .local v0, "session":Lcom/twitter/sdk/android/core/Session;
    if-nez v0, :cond_0

    .line 214
    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    .line 216
    :cond_0
    return-object v0
.end method

.method public static getInstance()Lcom/twitter/sdk/android/core/TwitterCore;
    .locals 1

    .prologue
    .line 53
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 54
    const-class v0, Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-static {v0}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/TwitterCore;

    return-object v0
.end method

.method private initializeScribeClient()V
    .locals 2

    .prologue
    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v0, "sessionManagers":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->twitterSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/twitter/sdk/android/core/internal/scribe/TwitterCoreScribeClientHolder;->initialize(Lcom/twitter/sdk/android/core/TwitterCore;Ljava/util/List;Lio/fabric/sdk/android/services/common/IdManager;)V

    .line 139
    return-void
.end method


# virtual methods
.method protected doInBackground()Ljava/lang/Boolean;
    .locals 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->twitterSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    .line 113
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    .line 114
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 115
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->initializeScribeClient()V

    .line 116
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->triggerVerificationIfNecessary()V

    .line 119
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v1

    invoke-virtual {v1}, Lio/fabric/sdk/android/Fabric;->getActivityLifecycleManager()Lio/fabric/sdk/android/ActivityLifecycleManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->monitorActivityLifecycle(Lio/fabric/sdk/android/ActivityLifecycleManager;)V

    .line 120
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->doInBackground()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getApiClient()Lcom/twitter/sdk/android/core/TwitterApiClient;
    .locals 3

    .prologue
    .line 229
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 230
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    .line 231
    .local v0, "session":Lcom/twitter/sdk/android/core/Session;
    if-nez v0, :cond_0

    .line 232
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Must have valid session. Did you authenticate with Twitter?"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 236
    :cond_0
    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getApiClient(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/TwitterApiClient;

    move-result-object v1

    return-object v1
.end method

.method public getApiClient(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/TwitterApiClient;
    .locals 2
    .param p1, "session"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 250
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 251
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->apiClients:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->apiClients:Ljava/util/concurrent/ConcurrentHashMap;

    new-instance v1, Lcom/twitter/sdk/android/core/TwitterApiClient;

    invoke-direct {v1, p1}, Lcom/twitter/sdk/android/core/TwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/Session;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->apiClients:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/TwitterApiClient;

    return-object v0
.end method

.method public getAppSessionManager()Lcom/twitter/sdk/android/core/SessionManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 206
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 207
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    return-object v0
.end method

.method public getAuthConfig()Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    const-string v0, "com.twitter.sdk.android:twitter-core"

    return-object v0
.end method

.method public getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    .prologue
    .line 74
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 76
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v0, :cond_0

    .line 77
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->createSSLSocketFactory()V

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 196
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->twitterSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    const-string v0, "1.3.1.37"

    return-object v0
.end method

.method public logIn(Landroid/app/Activity;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p2, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/TwitterSession;>;"
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 156
    new-instance v0, Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;

    invoke-direct {v0}, Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;-><init>()V

    invoke-virtual {v0, p1, p2}, Lcom/twitter/sdk/android/core/identity/TwitterAuthClient;->authorize(Landroid/app/Activity;Lcom/twitter/sdk/android/core/Callback;)V

    .line 157
    return-void
.end method

.method public logInGuest(Lcom/twitter/sdk/android/core/Callback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 168
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/AppSession;>;"
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 169
    new-instance v0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

    const/4 v1, 0x0

    new-instance v2, Lcom/twitter/sdk/android/core/internal/TwitterApi;

    invoke-direct {v2}, Lcom/twitter/sdk/android/core/internal/TwitterApi;-><init>()V

    invoke-direct {v0, p0, v1, v2}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;-><init>(Lcom/twitter/sdk/android/core/TwitterCore;Ljavax/net/ssl/SSLSocketFactory;Lcom/twitter/sdk/android/core/internal/TwitterApi;)V

    .line 170
    .local v0, "service":Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;
    new-instance v1, Lcom/twitter/sdk/android/core/GuestAuthClient;

    invoke-direct {v1, v0}, Lcom/twitter/sdk/android/core/GuestAuthClient;-><init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;)V

    iget-object v2, p0, Lcom/twitter/sdk/android/core/TwitterCore;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-virtual {v1, v2, p1}, Lcom/twitter/sdk/android/core/GuestAuthClient;->authorize(Lcom/twitter/sdk/android/core/SessionManager;Lcom/twitter/sdk/android/core/Callback;)V

    .line 171
    return-void
.end method

.method public logOut()V
    .locals 1

    .prologue
    .line 181
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->checkInitialized()V

    .line 182
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v0

    .line 183
    .local v0, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/twitter/sdk/android/core/TwitterSession;>;"
    if-eqz v0, :cond_0

    .line 184
    invoke-interface {v0}, Lcom/twitter/sdk/android/core/SessionManager;->clearActiveSession()V

    .line 186
    :cond_0
    return-void
.end method

.method protected onPreExecute()Z
    .locals 5

    .prologue
    .line 96
    new-instance v0, Lcom/twitter/sdk/android/core/PersistedSessionManager;

    new-instance v1, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;

    invoke-direct {v1, p0}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    new-instance v2, Lcom/twitter/sdk/android/core/TwitterSession$Serializer;

    invoke-direct {v2}, Lcom/twitter/sdk/android/core/TwitterSession$Serializer;-><init>()V

    const-string v3, "active_twittersession"

    const-string v4, "twittersession"

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/twitter/sdk/android/core/PersistedSessionManager;-><init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->twitterSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 100
    new-instance v0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterCore;->twitterSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v2

    invoke-virtual {v2}, Lio/fabric/sdk/android/Fabric;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;-><init>(Lcom/twitter/sdk/android/core/SessionManager;Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->sessionMonitor:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    .line 103
    new-instance v0, Lcom/twitter/sdk/android/core/PersistedSessionManager;

    new-instance v1, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;

    invoke-direct {v1, p0}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    new-instance v2, Lcom/twitter/sdk/android/core/AppSession$Serializer;

    invoke-direct {v2}, Lcom/twitter/sdk/android/core/AppSession$Serializer;-><init>()V

    const-string v3, "active_appsession"

    const-string v4, "appsession"

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/twitter/sdk/android/core/PersistedSessionManager;-><init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/TwitterCore;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 106
    const/4 v0, 0x1

    return v0
.end method
