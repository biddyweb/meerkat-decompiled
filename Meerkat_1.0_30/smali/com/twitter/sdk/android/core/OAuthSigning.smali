.class public Lcom/twitter/sdk/android/core/OAuthSigning;
.super Ljava/lang/Object;
.source "OAuthSigning.java"


# static fields
.field static final HEADER_AUTH_CREDENTIALS:Ljava/lang/String; = "X-Verify-Credentials-Authorization"

.field static final HEADER_AUTH_SERVICE_PROVIDER:Ljava/lang/String; = "X-Auth-Service-Provider"

.field static final VERIFY_CREDENTIALS_URL:Ljava/lang/String; = "https://api.twitter.com/1.1/account/verify_credentials.json"


# instance fields
.field private final authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

.field private final authToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;)V
    .locals 2
    .param p1, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p2, "authToken"    # Lcom/twitter/sdk/android/core/TwitterAuthToken;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    if-nez p1, :cond_0

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "authConfig must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_0
    if-nez p2, :cond_1

    .line 34
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "authToken must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_1
    iput-object p1, p0, Lcom/twitter/sdk/android/core/OAuthSigning;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 38
    iput-object p2, p0, Lcom/twitter/sdk/android/core/OAuthSigning;->authToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    .line 39
    return-void
.end method


# virtual methods
.method getOAuthEchoHeaders(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
    .locals 3
    .param p1, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p2, "authToken"    # Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .param p3, "callback"    # Ljava/lang/String;
    .param p4, "method"    # Ljava/lang/String;
    .param p5, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/TwitterAuthConfig;",
            "Lcom/twitter/sdk/android/core/TwitterAuthToken;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    .local p6, "postParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 84
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static/range {p1 .. p6}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getAuthorizationHeader(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "authorizationHeader":Ljava/lang/String;
    const-string v2, "X-Verify-Credentials-Authorization"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const-string v2, "X-Auth-Service-Provider"

    invoke-interface {v1, v2, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    return-object v1
.end method

.method public getOAuthEchoHeaders(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;
    .locals 7
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    .local p3, "postParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/core/OAuthSigning;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    iget-object v2, p0, Lcom/twitter/sdk/android/core/OAuthSigning;->authToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    const/4 v3, 0x0

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/twitter/sdk/android/core/OAuthSigning;->getOAuthEchoHeaders(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthEchoHeadersForVerifyCredentials()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 67
    iget-object v1, p0, Lcom/twitter/sdk/android/core/OAuthSigning;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    iget-object v2, p0, Lcom/twitter/sdk/android/core/OAuthSigning;->authToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    sget-object v0, Lio/fabric/sdk/android/services/network/HttpMethod;->GET:Lio/fabric/sdk/android/services/network/HttpMethod;

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/network/HttpMethod;->name()Ljava/lang/String;

    move-result-object v4

    const-string v5, "https://api.twitter.com/1.1/account/verify_credentials.json"

    move-object v0, p0

    move-object v6, v3

    invoke-virtual/range {v0 .. v6}, Lcom/twitter/sdk/android/core/OAuthSigning;->getOAuthEchoHeaders(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
