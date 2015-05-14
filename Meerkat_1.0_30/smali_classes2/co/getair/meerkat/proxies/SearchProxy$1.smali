.class Lco/getair/meerkat/proxies/SearchProxy$1;
.super Ljava/lang/Object;
.source "SearchProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SearchProxy;->searchForUser(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/SearchProxy;

.field final synthetic val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SearchProxy;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/SearchProxy;

    .prologue
    .line 52
    iput-object p1, p0, Lco/getair/meerkat/proxies/SearchProxy$1;->this$0:Lco/getair/meerkat/proxies/SearchProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/SearchProxy$1;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 52
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/SearchProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 56
    :try_start_0
    const-string v4, "SearchProxy"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string v4, "result"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 58
    .local v2, "result":Lorg/json/JSONArray;
    new-instance v4, Lco/getair/meerkat/proxies/SearchProxy$1$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/proxies/SearchProxy$1$1;-><init>(Lco/getair/meerkat/proxies/SearchProxy$1;)V

    invoke-virtual {v4}, Lco/getair/meerkat/proxies/SearchProxy$1$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 59
    .local v0, "collectionType":Ljava/lang/reflect/Type;
    new-instance v4, Lcom/google/gson/Gson;

    invoke-direct {v4}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 60
    .local v3, "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v4, p0, Lco/getair/meerkat/proxies/SearchProxy$1;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    iput-object v3, v4, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 61
    new-instance v4, Ljava/lang/Thread;

    iget-object v5, p0, Lco/getair/meerkat/proxies/SearchProxy$1;->val$completion:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .end local v0    # "collectionType":Ljava/lang/reflect/Type;
    .end local v2    # "result":Lorg/json/JSONArray;
    .end local v3    # "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_0
    return-void

    .line 62
    :catch_0
    move-exception v1

    .line 63
    .local v1, "exception":Lorg/json/JSONException;
    const-string v4, "SearchProxy"

    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
