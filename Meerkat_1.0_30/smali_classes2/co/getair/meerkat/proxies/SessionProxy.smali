.class public Lco/getair/meerkat/proxies/SessionProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "SessionProxy.java"


# static fields
.field private static final LOG_OUT_URL_KEY:Ljava/lang/String; = "signOut"

.field private static final LOG_TAG:Ljava/lang/String; = "SessionProxy"


# instance fields
.field private final context:Landroid/content/Context;

.field private final iAmAliveUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 49
    const-string v0, "https://social.meerkatapp.co/users/i-am-alive?v=1"

    iput-object v0, p0, Lco/getair/meerkat/proxies/SessionProxy;->iAmAliveUrl:Ljava/lang/String;

    .line 58
    iput-object p2, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    .line 59
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/SessionProxy;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 46
    iget-object v0, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/SessionProxy;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 46
    invoke-direct {p0}, Lco/getair/meerkat/proxies/SessionProxy;->signInWithTwitter()V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/SessionProxy;Lcom/twitter/sdk/android/core/models/User;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SessionProxy;
    .param p1, "x1"    # Lcom/twitter/sdk/android/core/models/User;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lco/getair/meerkat/proxies/SessionProxy;->signUpWithTwitter(Lcom/twitter/sdk/android/core/models/User;)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/proxies/SessionProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/proxies/SessionProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lco/getair/meerkat/proxies/SessionProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lco/getair/meerkat/proxies/SessionProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SessionProxy;

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method private signInWithTwitter()V
    .locals 12

    .prologue
    .line 171
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v4, "signIn"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, "signInUrl":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 176
    .local v3, "requestBody":Lorg/json/JSONObject;
    :try_start_0
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v11

    check-cast v11, Lcom/twitter/sdk/android/core/TwitterSession;

    .line 177
    .local v11, "twitterSession":Lcom/twitter/sdk/android/core/TwitterSession;
    invoke-virtual {v11}, Lcom/twitter/sdk/android/core/TwitterSession;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v6

    check-cast v6, Lcom/twitter/sdk/android/core/TwitterAuthToken;

    .line 178
    .local v6, "authToken":Lcom/twitter/sdk/android/core/TwitterAuthToken;
    iget-object v9, v6, Lcom/twitter/sdk/android/core/TwitterAuthToken;->token:Ljava/lang/String;

    .line 179
    .local v9, "token":Ljava/lang/String;
    iget-object v8, v6, Lcom/twitter/sdk/android/core/TwitterAuthToken;->secret:Ljava/lang/String;

    .line 181
    .local v8, "secret":Ljava/lang/String;
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 182
    .local v10, "twitterParams":Lorg/json/JSONObject;
    const-string v1, "id"

    invoke-virtual {v11}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserId()J

    move-result-wide v4

    invoke-virtual {v10, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 183
    const-string v1, "token"

    invoke-virtual {v10, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 184
    const-string v1, "tokenSecret"

    invoke-virtual {v10, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 186
    const-string v1, "twitterSignin"

    invoke-virtual {v3, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x2

    new-instance v4, Lco/getair/meerkat/proxies/SessionProxy$5;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/SessionProxy$5;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/SessionProxy$6;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/SessionProxy$6;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 210
    .local v0, "signUpRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
    .end local v0    # "signUpRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    .end local v6    # "authToken":Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .end local v8    # "secret":Ljava/lang/String;
    .end local v9    # "token":Ljava/lang/String;
    .end local v10    # "twitterParams":Lorg/json/JSONObject;
    .end local v11    # "twitterSession":Lcom/twitter/sdk/android/core/TwitterSession;
    :goto_0
    return-void

    .line 211
    :catch_0
    move-exception v7

    .line 212
    .local v7, "e":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private signUpWithTwitter(Lcom/twitter/sdk/android/core/models/User;)V
    .locals 13
    .param p1, "twitterUser"    # Lcom/twitter/sdk/android/core/models/User;

    .prologue
    .line 218
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v4, "signUp"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 220
    .local v2, "signUpUrl":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 223
    .local v3, "requestBody":Lorg/json/JSONObject;
    :try_start_0
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v12

    check-cast v12, Lcom/twitter/sdk/android/core/TwitterSession;

    .line 224
    .local v12, "twitterSession":Lcom/twitter/sdk/android/core/TwitterSession;
    invoke-virtual {v12}, Lcom/twitter/sdk/android/core/TwitterSession;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v6

    check-cast v6, Lcom/twitter/sdk/android/core/TwitterAuthToken;

    .line 225
    .local v6, "authToken":Lcom/twitter/sdk/android/core/TwitterAuthToken;
    iget-object v10, v6, Lcom/twitter/sdk/android/core/TwitterAuthToken;->token:Ljava/lang/String;

    .line 226
    .local v10, "token":Ljava/lang/String;
    iget-object v9, v6, Lcom/twitter/sdk/android/core/TwitterAuthToken;->secret:Ljava/lang/String;

    .line 228
    .local v9, "secret":Ljava/lang/String;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 229
    .local v11, "twitterAuth":Lorg/json/JSONObject;
    const-string v1, "id"

    invoke-virtual {v12}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserId()J

    move-result-wide v4

    invoke-virtual {v11, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 230
    const-string v4, "bio"

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/User;->description:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/User;->description:Ljava/lang/String;

    :goto_0
    invoke-virtual {v11, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 231
    const-string v1, "website"

    const-string v4, ""

    invoke-virtual {v11, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    const-string v4, "fullname"

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/User;->name:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/User;->name:Ljava/lang/String;

    :goto_1
    invoke-virtual {v11, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 233
    const-string v1, "token"

    invoke-virtual {v11, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 234
    const-string v1, "tokenSecret"

    invoke-virtual {v11, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "android_id"

    invoke-static {v1, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 239
    .local v7, "deviceId":Ljava/lang/String;
    const-string v1, "username"

    invoke-virtual {v12}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 240
    const-string v1, "email"

    const-string v4, ""

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 241
    const-string v1, "deviceId"

    invoke-virtual {v3, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 242
    const-string v1, "twitterAuth"

    invoke-virtual {v3, v1, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 244
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    new-instance v4, Lco/getair/meerkat/proxies/SessionProxy$7;

    invoke-direct {v4, p0, v12, p1}, Lco/getair/meerkat/proxies/SessionProxy$7;-><init>(Lco/getair/meerkat/proxies/SessionProxy;Lcom/twitter/sdk/android/core/TwitterSession;Lcom/twitter/sdk/android/core/models/User;)V

    new-instance v5, Lco/getair/meerkat/proxies/SessionProxy$8;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/SessionProxy$8;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 282
    .local v0, "signUpRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 286
    .end local v0    # "signUpRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    .end local v6    # "authToken":Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .end local v7    # "deviceId":Ljava/lang/String;
    .end local v9    # "secret":Ljava/lang/String;
    .end local v10    # "token":Ljava/lang/String;
    .end local v11    # "twitterAuth":Lorg/json/JSONObject;
    .end local v12    # "twitterSession":Lcom/twitter/sdk/android/core/TwitterSession;
    :goto_2
    return-void

    .line 230
    .restart local v6    # "authToken":Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .restart local v9    # "secret":Ljava/lang/String;
    .restart local v10    # "token":Ljava/lang/String;
    .restart local v11    # "twitterAuth":Lorg/json/JSONObject;
    .restart local v12    # "twitterSession":Lcom/twitter/sdk/android/core/TwitterSession;
    :cond_0
    const-string v1, ""

    goto :goto_0

    .line 232
    :cond_1
    const-string v1, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 283
    .end local v6    # "authToken":Lcom/twitter/sdk/android/core/TwitterAuthToken;
    .end local v9    # "secret":Ljava/lang/String;
    .end local v10    # "token":Ljava/lang/String;
    .end local v11    # "twitterAuth":Lorg/json/JSONObject;
    .end local v12    # "twitterSession":Lcom/twitter/sdk/android/core/TwitterSession;
    :catch_0
    move-exception v8

    .line 284
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method


# virtual methods
.method public isSessoinValid(Lco/getair/meerkat/dtos/Session;)Ljava/lang/Boolean;
    .locals 8
    .param p1, "session"    # Lco/getair/meerkat/dtos/Session;

    .prologue
    .line 89
    const/4 v3, 0x0

    .line 92
    .local v3, "tokenIsValid":Z
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 94
    :cond_0
    const/4 v3, 0x0

    .line 123
    :cond_1
    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    return-object v4

    .line 100
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/Session;->getExpirationTime()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 105
    :try_start_0
    iget-object v4, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    iget-object v5, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 106
    .local v2, "pInfo":Landroid/content/pm/PackageInfo;
    iget v0, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 108
    .local v0, "currentAppVersionCode":I
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/Session;->getAppVersionCode()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-ne v4, v0, :cond_1

    .line 110
    const/4 v3, 0x1

    goto :goto_0

    .line 113
    .end local v0    # "currentAppVersionCode":I
    .end local v2    # "pInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v1

    .line 115
    .local v1, "ex":Ljava/lang/Exception;
    const-string v4, "Error retrieving version code"

    invoke-static {v4}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 116
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 117
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public logout()V
    .locals 13

    .prologue
    .line 347
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v3, "signOut"

    invoke-virtual {v1, v3}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 349
    .local v2, "logoutUrl":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x3

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/SessionProxy$11;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/SessionProxy$11;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/SessionProxy$12;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/SessionProxy$12;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 358
    .local v0, "logoutRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 361
    new-instance v10, Lco/getair/meerkat/dtos/Session;

    const/4 v1, 0x0

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    invoke-direct {v10, v1, v4, v5, v3}, Lco/getair/meerkat/dtos/Session;-><init>(Ljava/lang/String;JZ)V

    .line 362
    .local v10, "invalidSession":Lco/getair/meerkat/dtos/Session;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-virtual {v10, v1}, Lco/getair/meerkat/dtos/Session;->saveSession(Landroid/content/Context;)V

    .line 364
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v6

    .line 366
    .local v6, "applicationFacade":Lco/getair/meerkat/facades/ApplicationFacade;
    const-string v1, "graphProxy"

    invoke-virtual {v6, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/proxies/GraphProxy;

    .line 367
    .local v7, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v7}, Lco/getair/meerkat/proxies/GraphProxy;->deleteMyUser()V

    .line 369
    const-string v1, "inboxProxy"

    invoke-virtual {v6, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/proxies/InboxProxy;

    .line 370
    .local v8, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    invoke-virtual {v8}, Lco/getair/meerkat/proxies/InboxProxy;->clearInbox()V

    .line 372
    const-string v1, "twitterProxy"

    invoke-virtual {v6, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v12

    check-cast v12, Lco/getair/meerkat/proxies/TwitterProxy;

    .line 373
    .local v12, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    invoke-virtual {v12}, Lco/getair/meerkat/proxies/TwitterProxy;->logout()V

    .line 375
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v11

    .line 376
    .local v11, "ownerActivity":Landroid/app/Activity;
    new-instance v9, Landroid/content/Intent;

    const-class v1, Lco/getair/meerkat/activities/HomeActivity;

    invoke-direct {v9, v11, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 377
    .local v9, "intent":Landroid/content/Intent;
    const/high16 v1, 0x4000000

    invoke-virtual {v9, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 378
    invoke-virtual {v11, v9}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 381
    return-void
.end method

.method public startLoginFlow()V
    .locals 6

    .prologue
    .line 127
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    const-string v2, "https://social.meerkatapp.co/users/i-am-alive?v=1"

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/SessionProxy$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/SessionProxy$1;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/SessionProxy$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/SessionProxy$2;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 144
    .local v0, "iAmAliveRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 145
    return-void
.end method

.method public startSignUpFlow(Lcom/twitter/sdk/android/core/models/User;)V
    .locals 6
    .param p1, "twitterUser"    # Lcom/twitter/sdk/android/core/models/User;

    .prologue
    .line 149
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    const-string v2, "https://social.meerkatapp.co/users/i-am-alive?v=1"

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/proxies/SessionProxy$3;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/proxies/SessionProxy$3;-><init>(Lco/getair/meerkat/proxies/SessionProxy;Lcom/twitter/sdk/android/core/models/User;)V

    new-instance v5, Lco/getair/meerkat/proxies/SessionProxy$4;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/SessionProxy$4;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 165
    .local v0, "iAmAliveRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 167
    return-void
.end method

.method public uploadProfileImage(Landroid/graphics/Bitmap;)V
    .locals 8
    .param p1, "imageBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 291
    :try_start_0
    iget-object v6, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v6}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v6

    const-string v7, "updateImage"

    invoke-virtual {v6, v7}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 293
    .local v5, "updateImageUrl":Ljava/lang/String;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 294
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x46

    invoke-virtual {p1, v6, v7, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 296
    new-instance v3, Lco/getair/meerkat/utilities/MultipartUtility;

    const-string v6, "UTF-8"

    invoke-direct {v3, v5, v6}, Lco/getair/meerkat/utilities/MultipartUtility;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .local v3, "multipart":Lco/getair/meerkat/utilities/MultipartUtility;
    const-string v6, "User-Agent"

    const-string v7, "Meerkat Android"

    invoke-virtual {v3, v6, v7}, Lco/getair/meerkat/utilities/MultipartUtility;->addHeaderField(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 301
    .local v0, "byteArrayInputStream":Ljava/io/ByteArrayInputStream;
    const-string v6, "imageFile"

    const-string v7, "profileImage.jpg"

    invoke-virtual {v3, v6, v7, v0}, Lco/getair/meerkat/utilities/MultipartUtility;->addFilePart(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 303
    invoke-virtual {v3}, Lco/getair/meerkat/utilities/MultipartUtility;->finish()Ljava/util/List;

    move-result-object v4

    .line 305
    .local v4, "response":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v6, "SessionProxy"

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    .end local v0    # "byteArrayInputStream":Ljava/io/ByteArrayInputStream;
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "multipart":Lco/getair/meerkat/utilities/MultipartUtility;
    .end local v4    # "response":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "updateImageUrl":Ljava/lang/String;
    :goto_0
    return-void

    .line 306
    :catch_0
    move-exception v2

    .line 307
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public uploadTwitterFrindsList(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 313
    .local p1, "friendsIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 316
    .local v3, "requestBody":Lorg/json/JSONObject;
    :try_start_0
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6, p1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 318
    .local v6, "array":Lorg/json/JSONArray;
    const-string v1, "linkTo"

    invoke-virtual {v3, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 319
    const-string v1, "type"

    const-string v4, "follow"

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 320
    const-string v1, "name"

    const-string v4, ""

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 321
    const-string v1, "platform"

    const-string v4, "twitter"

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 323
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v4, "twitterFriendsSignUp"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 324
    .local v2, "socialLinksUrl":Ljava/lang/String;
    const-string v1, "https"

    const-string v4, "http"

    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 326
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    new-instance v4, Lco/getair/meerkat/proxies/SessionProxy$9;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/SessionProxy$9;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    new-instance v5, Lco/getair/meerkat/proxies/SessionProxy$10;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/SessionProxy$10;-><init>(Lco/getair/meerkat/proxies/SessionProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 337
    .local v0, "sendTwitterFriendsRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 344
    .end local v0    # "sendTwitterFriendsRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    .end local v2    # "socialLinksUrl":Ljava/lang/String;
    .end local v6    # "array":Lorg/json/JSONArray;
    :goto_0
    return-void

    .line 339
    :catch_0
    move-exception v7

    .line 340
    .local v7, "e":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public validateSession()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 63
    iget-object v2, p0, Lco/getair/meerkat/proxies/SessionProxy;->context:Landroid/content/Context;

    invoke-static {v2}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v0

    .line 64
    .local v0, "currentSession":Lco/getair/meerkat/dtos/Session;
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "graphProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/GraphProxy;

    .line 65
    .local v1, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {p0, v0}, Lco/getair/meerkat/proxies/SessionProxy;->isSessoinValid(Lco/getair/meerkat/dtos/Session;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 70
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "eventSessionIsValid"

    invoke-virtual {v2, v3, v5, v5}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    :goto_0
    return-void

    .line 77
    :cond_0
    if-eqz v0, :cond_1

    .line 79
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "authorizationStart"

    sget-object v4, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;->PERIODIC:Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    invoke-virtual {v2, v3, v4, v5}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    .line 81
    :cond_1
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SessionProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "eventSessionInvalid"

    invoke-virtual {v2, v3, v5, v5}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
