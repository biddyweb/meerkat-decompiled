.class abstract Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;
.super Ljava/lang/Object;
.source "OAuthService.java"


# static fields
.field private static final CLIENT_NAME:Ljava/lang/String; = "TwitterAndroidSDK"


# instance fields
.field private final api:Lcom/twitter/sdk/android/core/internal/TwitterApi;

.field private final apiAdapter:Lretrofit/RestAdapter;

.field private final sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field private final twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/TwitterCore;Ljavax/net/ssl/SSLSocketFactory;Lcom/twitter/sdk/android/core/internal/TwitterApi;)V
    .locals 3
    .param p1, "twitterCore"    # Lcom/twitter/sdk/android/core/TwitterCore;
    .param p2, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p3, "api"    # Lcom/twitter/sdk/android/core/internal/TwitterApi;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    .line 29
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 30
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->api:Lcom/twitter/sdk/android/core/internal/TwitterApi;

    .line 31
    const-string v0, "TwitterAndroidSDK"

    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterCore;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->buildUserAgent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->userAgent:Ljava/lang/String;

    .line 34
    new-instance v0, Lretrofit/RestAdapter$Builder;

    invoke-direct {v0}, Lretrofit/RestAdapter$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->getApi()Lcom/twitter/sdk/android/core/internal/TwitterApi;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->getBaseHostUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    new-instance v1, Lcom/twitter/sdk/android/core/DefaultClient;

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-direct {v1, v2}, Lcom/twitter/sdk/android/core/DefaultClient;-><init>(Ljavax/net/ssl/SSLSocketFactory;)V

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter$Builder;->setClient(Lretrofit/client/Client;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    new-instance v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService$1;

    invoke-direct {v1, p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService$1;-><init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;)V

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter$Builder;->setRequestInterceptor(Lretrofit/RequestInterceptor;)Lretrofit/RestAdapter$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->apiAdapter:Lretrofit/RestAdapter;

    .line 44
    return-void
.end method


# virtual methods
.method protected getApi()Lcom/twitter/sdk/android/core/internal/TwitterApi;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->api:Lcom/twitter/sdk/android/core/internal/TwitterApi;

    return-object v0
.end method

.method protected getApiAdapter()Lretrofit/RestAdapter;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->apiAdapter:Lretrofit/RestAdapter;

    return-object v0
.end method

.method protected getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method protected getTwitterCore()Lcom/twitter/sdk/android/core/TwitterCore;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    return-object v0
.end method

.method protected getUserAgent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;->userAgent:Ljava/lang/String;

    return-object v0
.end method
