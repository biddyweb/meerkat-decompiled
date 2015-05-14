.class Lco/getair/meerkat/proxies/BroadcastProxy$3$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "BroadcastProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/BroadcastProxy$3;->onResponse(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/BroadcastProxy$3;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/proxies/BroadcastProxy$3;

    .prologue
    .line 209
    iput-object p1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 212
    iget-boolean v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->success:Z

    if-eqz v1, :cond_0

    .line 213
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;

    iget-object v4, v1, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->resultObject:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    # setter for: Lco/getair/meerkat/proxies/BroadcastProxy;->tweetId:Ljava/lang/String;
    invoke-static {v4, v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$902(Lco/getair/meerkat/proxies/BroadcastProxy;Ljava/lang/String;)Ljava/lang/String;

    .line 214
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 217
    .local v3, "updateBroadcastParams":Lorg/json/JSONObject;
    :try_start_0
    new-instance v8, Ljava/net/URI;

    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;

    iget-object v1, v1, Lco/getair/meerkat/proxies/BroadcastProxy$3;->val$createBroadcastUrl:Ljava/lang/String;

    invoke-direct {v8, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 218
    .local v8, "updateBroadcastUri":Ljava/net/URI;
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;

    iget-object v1, v1, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$200(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/util/HashMap;

    move-result-object v1

    const-string v4, "broadcast"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 220
    .local v7, "updateBroadcastRelativeUrl":Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    .line 222
    .local v2, "updateBroadcastUrl":Ljava/lang/String;
    const-string v1, "tweetId"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;

    iget-object v4, v4, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->tweetId:Ljava/lang/String;
    invoke-static {v4}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$900(Lco/getair/meerkat/proxies/BroadcastProxy;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 223
    const-string v1, "auth"

    iget-object v4, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;

    iget-object v4, v4, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;
    invoke-static {v4}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$500(Lco/getair/meerkat/proxies/BroadcastProxy;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/Session;->getAuthToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 225
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x2

    new-instance v4, Lco/getair/meerkat/proxies/BroadcastProxy$3$1$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/BroadcastProxy$3$1$1;-><init>(Lco/getair/meerkat/proxies/BroadcastProxy$3$1;)V

    new-instance v5, Lco/getair/meerkat/proxies/BroadcastProxy$3$1$2;

    invoke-direct {v5, p0}, Lco/getair/meerkat/proxies/BroadcastProxy$3$1$2;-><init>(Lco/getair/meerkat/proxies/BroadcastProxy$3$1;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 237
    .local v0, "updateBroadcastRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    iget-object v1, p0, Lco/getair/meerkat/proxies/BroadcastProxy$3$1;->this$1:Lco/getair/meerkat/proxies/BroadcastProxy$3;

    iget-object v1, v1, Lco/getair/meerkat/proxies/BroadcastProxy$3;->this$0:Lco/getair/meerkat/proxies/BroadcastProxy;

    # getter for: Lco/getair/meerkat/proxies/BroadcastProxy;->context:Landroid/content/Context;
    invoke-static {v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->access$500(Lco/getair/meerkat/proxies/BroadcastProxy;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    .end local v0    # "updateBroadcastRequest":Lcom/android/volley/toolbox/JsonObjectRequest;
    .end local v2    # "updateBroadcastUrl":Ljava/lang/String;
    .end local v3    # "updateBroadcastParams":Lorg/json/JSONObject;
    .end local v7    # "updateBroadcastRelativeUrl":Ljava/lang/String;
    .end local v8    # "updateBroadcastUri":Ljava/net/URI;
    :cond_0
    :goto_0
    return-void

    .line 239
    .restart local v3    # "updateBroadcastParams":Lorg/json/JSONObject;
    :catch_0
    move-exception v6

    .line 240
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
