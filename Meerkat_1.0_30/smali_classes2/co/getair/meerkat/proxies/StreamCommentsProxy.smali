.class public Lco/getair/meerkat/proxies/StreamCommentsProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "StreamCommentsProxy.java"


# static fields
.field private static final ADD_COMMENT_URL_KEY:Ljava/lang/String; = "comments"

.field private static final NAME:Ljava/lang/String; = "CommentsOnVideoProxy"


# instance fields
.field private addCommentUrl:Ljava/lang/String;

.field private broadcasterName:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private tweetId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "baseUrl"    # Ljava/lang/String;
    .param p4, "tweetId"    # Ljava/lang/String;
    .param p5, "broadcasterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p3, "streamActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lco/getair/meerkat/proxies/StreamCommentsProxy;->NAME()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 32
    const-string v3, ""

    iput-object v3, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->addCommentUrl:Ljava/lang/String;

    .line 34
    const-string v3, ""

    iput-object v3, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->broadcasterName:Ljava/lang/String;

    .line 35
    const-string v3, ""

    iput-object v3, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->tweetId:Ljava/lang/String;

    .line 40
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->context:Landroid/content/Context;

    .line 41
    iput-object p5, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->broadcasterName:Ljava/lang/String;

    .line 42
    iput-object p4, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->tweetId:Ljava/lang/String;

    .line 45
    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 46
    .local v1, "addCommentUri":Ljava/net/URI;
    const-string v3, "comments"

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 47
    .local v0, "addCommentRelativeUrl":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->addCommentUrl:Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .end local v0    # "addCommentRelativeUrl":Ljava/lang/String;
    .end local v1    # "addCommentUri":Ljava/net/URI;
    :goto_0
    return-void

    .line 48
    :catch_0
    move-exception v2

    .line 49
    .local v2, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v2}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_0
.end method

.method public static NAME()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string v0, "CommentsOnVideoProxy"

    return-object v0
.end method


# virtual methods
.method public addCommentToStream(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 7
    .param p1, "comment"    # Ljava/lang/String;
    .param p2, "runnableWithResultObject"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 72
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 75
    .local v3, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "body"

    invoke-virtual {v3, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    const-string v1, "auth"

    new-instance v2, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v4, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->context:Landroid/content/Context;

    invoke-direct {v2, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getAuthToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    :goto_0
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x1

    iget-object v2, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->addCommentUrl:Ljava/lang/String;

    new-instance v4, Lco/getair/meerkat/proxies/StreamCommentsProxy$1;

    invoke-direct {v4, p0, p2}, Lco/getair/meerkat/proxies/StreamCommentsProxy$1;-><init>(Lco/getair/meerkat/proxies/StreamCommentsProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/proxies/StreamCommentsProxy$2;

    invoke-direct {v5, p0, p2}, Lco/getair/meerkat/proxies/StreamCommentsProxy$2;-><init>(Lco/getair/meerkat/proxies/StreamCommentsProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 96
    .local v0, "addWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    .line 97
    return-void

    .line 77
    .end local v0    # "addWatcherRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    :catch_0
    move-exception v6

    .line 79
    .local v6, "ex":Lorg/json/JSONException;
    const-string v1, "Error adding type to restream JSON request"

    invoke-static {v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getBroadcasterName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->broadcasterName:Ljava/lang/String;

    return-object v0
.end method

.method public getTweetId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->tweetId:Ljava/lang/String;

    return-object v0
.end method

.method public setTweetId(Ljava/lang/String;)V
    .locals 0
    .param p1, "tweetId"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamCommentsProxy;->tweetId:Ljava/lang/String;

    .line 56
    return-void
.end method
