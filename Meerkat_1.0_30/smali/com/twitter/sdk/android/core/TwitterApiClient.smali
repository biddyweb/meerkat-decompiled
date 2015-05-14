.class public Lcom/twitter/sdk/android/core/TwitterApiClient;
.super Ljava/lang/Object;
.source "TwitterApiClient.java"


# instance fields
.field final adapter:Lretrofit/RestAdapter;

.field final services:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Class;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/Session;)V
    .locals 6
    .param p1, "session"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 66
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getAuthConfig()Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    move-result-object v1

    new-instance v3, Lcom/twitter/sdk/android/core/internal/TwitterApi;

    invoke-direct {v3}, Lcom/twitter/sdk/android/core/internal/TwitterApi;-><init>()V

    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v4

    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getFabric()Lio/fabric/sdk/android/Fabric;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/Fabric;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    move-object v0, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/core/TwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Lcom/twitter/sdk/android/core/internal/TwitterApi;Ljavax/net/ssl/SSLSocketFactory;Ljava/util/concurrent/ExecutorService;)V

    .line 69
    return-void
.end method

.method constructor <init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Lcom/twitter/sdk/android/core/internal/TwitterApi;Ljavax/net/ssl/SSLSocketFactory;Ljava/util/concurrent/ExecutorService;)V
    .locals 3
    .param p1, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p2, "session"    # Lcom/twitter/sdk/android/core/Session;
    .param p3, "twitterApi"    # Lcom/twitter/sdk/android/core/internal/TwitterApi;
    .param p4, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p5, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    if-nez p2, :cond_0

    .line 39
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Session must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 42
    :cond_0
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/twitter/sdk/android/core/TwitterApiClient;->services:Ljava/util/concurrent/ConcurrentHashMap;

    .line 44
    new-instance v1, Lcom/google/gson/GsonBuilder;

    invoke-direct {v1}, Lcom/google/gson/GsonBuilder;-><init>()V

    new-instance v2, Lcom/twitter/sdk/android/core/models/SafeListAdapter;

    invoke-direct {v2}, Lcom/twitter/sdk/android/core/models/SafeListAdapter;-><init>()V

    invoke-virtual {v1, v2}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    move-result-object v1

    new-instance v2, Lcom/twitter/sdk/android/core/models/SafeMapAdapter;

    invoke-direct {v2}, Lcom/twitter/sdk/android/core/models/SafeMapAdapter;-><init>()V

    invoke-virtual {v1, v2}, Lcom/google/gson/GsonBuilder;->registerTypeAdapterFactory(Lcom/google/gson/TypeAdapterFactory;)Lcom/google/gson/GsonBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    .line 49
    .local v0, "gson":Lcom/google/gson/Gson;
    new-instance v1, Lretrofit/RestAdapter$Builder;

    invoke-direct {v1}, Lretrofit/RestAdapter$Builder;-><init>()V

    new-instance v2, Lcom/twitter/sdk/android/core/AuthenticatedClient;

    invoke-direct {v2, p1, p2, p4}, Lcom/twitter/sdk/android/core/AuthenticatedClient;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Ljavax/net/ssl/SSLSocketFactory;)V

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter$Builder;->setClient(Lretrofit/client/Client;)Lretrofit/RestAdapter$Builder;

    move-result-object v1

    invoke-virtual {p3}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->getBaseHostUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v1

    new-instance v2, Lretrofit/converter/GsonConverter;

    invoke-direct {v2, v0}, Lretrofit/converter/GsonConverter;-><init>(Lcom/google/gson/Gson;)V

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter$Builder;->setConverter(Lretrofit/converter/Converter;)Lretrofit/RestAdapter$Builder;

    move-result-object v1

    new-instance v2, Lretrofit/android/MainThreadExecutor;

    invoke-direct {v2}, Lretrofit/android/MainThreadExecutor;-><init>()V

    invoke-virtual {v1, p5, v2}, Lretrofit/RestAdapter$Builder;->setExecutors(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)Lretrofit/RestAdapter$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/twitter/sdk/android/core/TwitterApiClient;->adapter:Lretrofit/RestAdapter;

    .line 55
    return-void
.end method


# virtual methods
.method public getAccountService()Lcom/twitter/sdk/android/core/services/AccountService;
    .locals 1

    .prologue
    .line 75
    const-class v0, Lcom/twitter/sdk/android/core/services/AccountService;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/TwitterApiClient;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/services/AccountService;

    return-object v0
.end method

.method public getFavoriteService()Lcom/twitter/sdk/android/core/services/FavoriteService;
    .locals 1

    .prologue
    .line 82
    const-class v0, Lcom/twitter/sdk/android/core/services/FavoriteService;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/TwitterApiClient;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/services/FavoriteService;

    return-object v0
.end method

.method public getSearchService()Lcom/twitter/sdk/android/core/services/SearchService;
    .locals 1

    .prologue
    .line 96
    const-class v0, Lcom/twitter/sdk/android/core/services/SearchService;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/TwitterApiClient;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/services/SearchService;

    return-object v0
.end method

.method protected getService(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiClient;->services:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiClient;->services:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Lcom/twitter/sdk/android/core/TwitterApiClient;->adapter:Lretrofit/RestAdapter;

    invoke-virtual {v1, p1}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/TwitterApiClient;->services:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getStatusesService()Lcom/twitter/sdk/android/core/services/StatusesService;
    .locals 1

    .prologue
    .line 89
    const-class v0, Lcom/twitter/sdk/android/core/services/StatusesService;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/TwitterApiClient;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/services/StatusesService;

    return-object v0
.end method
