.class public Lco/getair/meerkat/proxies/SearchProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "SearchProxy.java"


# instance fields
.field private final LOG_TAG:Ljava/lang/String;

.field private final SEARCH_URL_KEY:Ljava/lang/String;

.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 32
    const-string v0, "SearchProxy"

    iput-object v0, p0, Lco/getair/meerkat/proxies/SearchProxy;->LOG_TAG:Ljava/lang/String;

    .line 33
    const-string v0, "search"

    iput-object v0, p0, Lco/getair/meerkat/proxies/SearchProxy;->SEARCH_URL_KEY:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lco/getair/meerkat/proxies/SearchProxy;->context:Landroid/content/Context;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/proxies/SearchProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/proxies/SearchProxy;

    .prologue
    .line 30
    invoke-virtual {p0}, Lco/getair/meerkat/proxies/SearchProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public searchForUser(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 7
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "completion"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 43
    iget-object v1, p0, Lco/getair/meerkat/proxies/SearchProxy;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v4, "search"

    invoke-virtual {v1, v4}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 45
    .local v2, "searchUserUrl":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 47
    .local v3, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "username"

    invoke-virtual {v3, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :goto_0
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x2

    new-instance v4, Lco/getair/meerkat/proxies/SearchProxy$1;

    invoke-direct {v4, p0, p2}, Lco/getair/meerkat/proxies/SearchProxy$1;-><init>(Lco/getair/meerkat/proxies/SearchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/proxies/SearchProxy$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/SearchProxy$2;-><init>(Lco/getair/meerkat/proxies/SearchProxy;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 77
    .local v0, "getInboxRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/SearchProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 78
    return-void

    .line 48
    .end local v0    # "getInboxRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    :catch_0
    move-exception v6

    .line 49
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
