.class public Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;
.super Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;
.source "OAuth1aService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;
    }
.end annotation


# static fields
.field private static final CALLBACK_URL:Ljava/lang/String; = "twittersdk://callback"

.field private static final PARAM_SCREEN_NAME:Ljava/lang/String; = "screen_name"

.field private static final PARAM_USER_ID:Ljava/lang/String; = "user_id"

.field private static final RESOURCE_OAUTH:Ljava/lang/String; = "oauth"


# instance fields
.field api:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/TwitterCore;Ljavax/net/ssl/SSLSocketFactory;Lcom/twitter/sdk/android/core/internal/TwitterApi;)V
    .locals 2
    .param p1, "twitterCore"    # Lcom/twitter/sdk/android/core/TwitterCore;
    .param p2, "sslSocketFactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p3, "api"    # Lcom/twitter/sdk/android/core/internal/TwitterApi;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcom/twitter/sdk/android/core/internal/oauth/OAuthService;-><init>(Lcom/twitter/sdk/android/core/TwitterCore;Ljavax/net/ssl/SSLSocketFactory;Lcom/twitter/sdk/android/core/internal/TwitterApi;)V

    .line 57
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getApiAdapter()Lretrofit/RestAdapter;

    move-result-object v0

    const-class v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;

    iput-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->api:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;

    .line 58
    return-void
.end method

.method public static getAuthorizationHeader(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 7
    .param p0, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p1, "authToken"    # Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .param p2, "callback"    # Ljava/lang/String;
    .param p3, "method"    # Ljava/lang/String;
    .param p4, "url"    # Ljava/lang/String;
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
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 151
    .local p5, "postParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aParameters;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aParameters;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 153
    .local v0, "oAuth1aParameters":Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aParameters;
    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aParameters;->getAuthorizationHeader()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static parseAuthResponse(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;
    .locals 8
    .param p0, "response"    # Ljava/lang/String;

    .prologue
    .line 161
    const/4 v6, 0x0

    invoke-static {p0, v6}, Lio/fabric/sdk/android/services/network/UrlUtils;->getQueryParams(Ljava/lang/String;Z)Ljava/util/TreeMap;

    move-result-object v0

    .line 162
    .local v0, "params":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "oauth_token"

    invoke-virtual {v0, v6}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 163
    .local v2, "token":Ljava/lang/String;
    const-string v6, "oauth_token_secret"

    invoke-virtual {v0, v6}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 164
    .local v1, "secret":Ljava/lang/String;
    const-string v6, "screen_name"

    invoke-virtual {v0, v6}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 166
    .local v3, "userName":Ljava/lang/String;
    const-string v6, "user_id"

    invoke-virtual {v0, v6}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 167
    const-string v6, "user_id"

    invoke-virtual {v0, v6}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 171
    .local v4, "userId":J
    :goto_0
    if-eqz v2, :cond_0

    if-nez v1, :cond_2

    .line 172
    :cond_0
    const/4 v6, 0x0

    .line 174
    :goto_1
    return-object v6

    .line 169
    .end local v4    # "userId":J
    :cond_1
    const-wide/16 v4, 0x0

    .restart local v4    # "userId":J
    goto :goto_0

    .line 174
    :cond_2
    new-instance v6, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;

    new-instance v7, Lcom/twitter/sdk/android/core/TwitterAuthToken;

    invoke-direct {v7, v2, v1}, Lcom/twitter/sdk/android/core/TwitterAuthToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v6, v7, v3, v4, v5}, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;J)V

    goto :goto_1
.end method

.method public static signRequest(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/net/HttpURLConnection;Ljava/util/Map;)V
    .locals 7
    .param p0, "config"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p1, "accessToken"    # Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .param p2, "request"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/TwitterAuthConfig;",
            "Lcom/twitter/sdk/android/core/TwitterAuthToken;",
            "Ljava/net/HttpURLConnection;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 131
    .local p3, "postParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x0

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lio/fabric/sdk/android/services/network/HttpMethod;->valueOf(Ljava/lang/String;)Lio/fabric/sdk/android/services/network/HttpMethod;

    move-result-object v0

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/network/HttpMethod;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getAuthorizationHeader(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v6

    .line 134
    .local v6, "authHeader":Ljava/lang/String;
    const-string v0, "Authorization"

    invoke-virtual {p2, v0, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    return-void
.end method


# virtual methods
.method public buildCallbackUrl(Lcom/twitter/sdk/android/core/TwitterAuthConfig;)Ljava/lang/String;
    .locals 3
    .param p1, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .prologue
    .line 85
    const-string v0, "twittersdk://callback"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "version"

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getTwitterCore()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v2

    invoke-virtual {v2}, Lcom/twitter/sdk/android/core/TwitterCore;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "app"

    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/TwitterAuthConfig;->getConsumerKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getAccessTokenUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getApi()Lcom/twitter/sdk/android/core/internal/TwitterApi;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->getBaseHostUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/oauth/access_token"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAuthorizeUrl(Lcom/twitter/sdk/android/core/TwitterAuthToken;)Ljava/lang/String;
    .locals 4
    .param p1, "requestToken"    # Lcom/twitter/sdk/android/core/TwitterAuthToken;

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getApi()Lcom/twitter/sdk/android/core/internal/TwitterApi;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "oauth"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "authorize"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->buildUponBaseHostUrl([Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "oauth_token"

    iget-object v2, p1, Lcom/twitter/sdk/android/core/TwitterAuthToken;->token:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getCallbackWrapper(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;",
            ">;)",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lretrofit/client/Response;",
            ">;"
        }
    .end annotation

    .prologue
    .line 179
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;>;"
    new-instance v0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;

    invoke-direct {v0, p0, p1}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$1;-><init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;Lcom/twitter/sdk/android/core/Callback;)V

    return-object v0
.end method

.method getTempTokenUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getApi()Lcom/twitter/sdk/android/core/internal/TwitterApi;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->getBaseHostUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/oauth/request_token"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public requestAccessToken(Lcom/twitter/sdk/android/core/Callback;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;)V
    .locals 7
    .param p2, "requestToken"    # Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .param p3, "verifier"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;",
            ">;",
            "Lcom/twitter/sdk/android/core/TwitterAuthToken;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;>;"
    const/4 v2, 0x0

    .line 99
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getAccessTokenUrl()Ljava/lang/String;

    move-result-object v4

    .line 100
    .local v4, "url":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getTwitterCore()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getAuthConfig()Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    move-result-object v0

    const-string v3, "POST"

    move-object v1, p2

    move-object v5, v2

    invoke-static/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getAuthorizationHeader(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v6

    .line 104
    .local v6, "authHeader":Ljava/lang/String;
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->api:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;

    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getCallbackWrapper(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;

    move-result-object v1

    invoke-interface {v0, v6, p3, v1}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;->getAccessToken(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 105
    return-void
.end method

.method public requestTempToken(Lcom/twitter/sdk/android/core/Callback;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;>;"
    const/4 v1, 0x0

    .line 66
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getTwitterCore()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v2

    invoke-virtual {v2}, Lcom/twitter/sdk/android/core/TwitterCore;->getAuthConfig()Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    move-result-object v0

    .line 67
    .local v0, "config":Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getTempTokenUrl()Ljava/lang/String;

    move-result-object v4

    .line 69
    .local v4, "url":Ljava/lang/String;
    iget-object v6, p0, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->api:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->buildCallbackUrl(Lcom/twitter/sdk/android/core/TwitterAuthConfig;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "POST"

    move-object v5, v1

    invoke-static/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getAuthorizationHeader(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getCallbackWrapper(Lcom/twitter/sdk/android/core/Callback;)Lcom/twitter/sdk/android/core/Callback;

    move-result-object v2

    invoke-interface {v6, v1, v2}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi;->getTempToken(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 71
    return-void
.end method
