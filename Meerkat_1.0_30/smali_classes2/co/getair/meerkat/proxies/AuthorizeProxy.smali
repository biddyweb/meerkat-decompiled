.class public Lco/getair/meerkat/proxies/AuthorizeProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "AuthorizeProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 55
    iput-object p2, p0, Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;

    .line 56
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/AuthorizeProxy;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/AuthorizeProxy;

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/AuthorizeProxy;

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/AuthorizeProxy;

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/AuthorizeProxy;

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/proxies/AuthorizeProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/AuthorizeProxy;

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public authorizeWithNewToken(Ljava/lang/Boolean;Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 12
    .param p1, "mustAuthorize"    # Ljava/lang/Boolean;
    .param p2, "type"    # Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;
    .param p3, "completion"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 61
    iget-object v1, p0, Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v4, "authorize"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 65
    .local v2, "authorizeUrl":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 66
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/AuthorizeProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v4, "eventLoginSequenceStart"

    const/4 v5, 0x0

    const/4 v11, 0x0

    invoke-virtual {v1, v4, v5, v11}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 236
    :goto_0
    return-void

    .line 73
    :cond_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 75
    .local v3, "requestBody":Lorg/json/JSONObject;
    new-instance v6, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v1, p0, Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;

    invoke-direct {v6, v1}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 76
    .local v6, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v6}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getNotificationsToken()Ljava/lang/String;

    move-result-object v7

    .line 79
    .local v7, "deviceToken":Ljava/lang/String;
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v4, p0, Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v9

    .line 80
    .local v9, "pInfo":Landroid/content/pm/PackageInfo;
    iget-object v10, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 81
    .local v10, "version":Ljava/lang/String;
    const-string v1, "version"

    invoke-virtual {v3, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    if-eqz v7, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 84
    const-string v1, "notificationId"

    invoke-virtual {v3, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 93
    .end local v9    # "pInfo":Landroid/content/pm/PackageInfo;
    .end local v10    # "version":Ljava/lang/String;
    :cond_1
    :goto_1
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x2

    new-instance v4, Lco/getair/meerkat/proxies/AuthorizeProxy$1;

    invoke-direct {v4, p0, p2, v7, p3}, Lco/getair/meerkat/proxies/AuthorizeProxy$1;-><init>(Lco/getair/meerkat/proxies/AuthorizeProxy;Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/proxies/AuthorizeProxy$2;

    invoke-direct {v5, p0, p3}, Lco/getair/meerkat/proxies/AuthorizeProxy$2;-><init>(Lco/getair/meerkat/proxies/AuthorizeProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 235
    .local v0, "authorizeRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/AuthorizeProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    goto :goto_0

    .line 87
    .end local v0    # "authorizeRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    :catch_0
    move-exception v8

    .line 88
    .local v8, "ex":Lorg/json/JSONException;
    const-string v1, "Error adding data to JSON for authorizing: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v8}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v4, v5

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_1

    .line 89
    .end local v8    # "ex":Lorg/json/JSONException;
    :catch_1
    move-exception v8

    .line 90
    .local v8, "ex":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v1, "Error getting version name for authorize request: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v8}, Landroid/content/pm/PackageManager$NameNotFoundException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v4, v5

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_1
.end method
