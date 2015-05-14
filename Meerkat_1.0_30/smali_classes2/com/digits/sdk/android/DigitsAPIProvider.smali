.class Lcom/digits/sdk/android/DigitsAPIProvider;
.super Ljava/lang/Object;
.source "DigitsAPIProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;,
        Lcom/digits/sdk/android/DigitsAPIProvider$DeviceService;
    }
.end annotation


# instance fields
.field private final restAdapter:Lretrofit/RestAdapter;

.field private final services:Ljava/util/concurrent/ConcurrentHashMap;
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
.method constructor <init>(Lcom/digits/sdk/android/DigitsSession;Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljavax/net/ssl/SSLSocketFactory;Ljava/util/concurrent/ExecutorService;)V
    .locals 2
    .param p1, "session"    # Lcom/digits/sdk/android/DigitsSession;
    .param p2, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p3, "sslFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p4, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/digits/sdk/android/DigitsAPIProvider;->services:Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    new-instance v0, Lretrofit/RestAdapter$Builder;

    invoke-direct {v0}, Lretrofit/RestAdapter$Builder;-><init>()V

    new-instance v1, Lcom/twitter/sdk/android/core/internal/TwitterApi;

    invoke-direct {v1}, Lcom/twitter/sdk/android/core/internal/TwitterApi;-><init>()V

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->getBaseHostUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    new-instance v1, Lretrofit/android/MainThreadExecutor;

    invoke-direct {v1}, Lretrofit/android/MainThreadExecutor;-><init>()V

    invoke-virtual {v0, p4, v1}, Lretrofit/RestAdapter$Builder;->setExecutors(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    new-instance v1, Lcom/twitter/sdk/android/core/AuthenticatedClient;

    invoke-direct {v1, p2, p1, p3}, Lcom/twitter/sdk/android/core/AuthenticatedClient;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Ljavax/net/ssl/SSLSocketFactory;)V

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter$Builder;->setClient(Lretrofit/client/Client;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/DigitsAPIProvider;->restAdapter:Lretrofit/RestAdapter;

    .line 35
    return-void
.end method

.method private getService(Ljava/lang/Class;)Ljava/lang/Object;
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
    .line 47
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAPIProvider;->services:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAPIProvider;->services:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Lcom/digits/sdk/android/DigitsAPIProvider;->restAdapter:Lretrofit/RestAdapter;

    invoke-virtual {v1, p1}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsAPIProvider;->services:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDeviceService()Lcom/digits/sdk/android/DigitsAPIProvider$DeviceService;
    .locals 1

    .prologue
    .line 43
    const-class v0, Lcom/digits/sdk/android/DigitsAPIProvider$DeviceService;

    invoke-direct {p0, v0}, Lcom/digits/sdk/android/DigitsAPIProvider;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/DigitsAPIProvider$DeviceService;

    return-object v0
.end method

.method public getSdkService()Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;
    .locals 1

    .prologue
    .line 39
    const-class v0, Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;

    invoke-direct {p0, v0}, Lcom/digits/sdk/android/DigitsAPIProvider;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;

    return-object v0
.end method
