.class Lco/getair/meerkat/proxies/TwitterProxy$6;
.super Lcom/twitter/sdk/android/core/Callback;
.source "TwitterProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/TwitterProxy;->getUserFrindsIdsForPage(JLjava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/google/gson/JsonObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/TwitterProxy;

.field final synthetic val$accumulatedFriendsIds:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/TwitterProxy;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/TwitterProxy;

    .prologue
    .line 181
    iput-object p1, p0, Lco/getair/meerkat/proxies/TwitterProxy$6;->this$0:Lco/getair/meerkat/proxies/TwitterProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/TwitterProxy$6;->val$accumulatedFriendsIds:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 0
    .param p1, "e"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 209
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "jsonObjectResult":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/google/gson/JsonObject;>;"
    const-string v2, "TwitterProxy"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const-string v3, "TwitterProxy"

    iget-object v2, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v2, Lcom/google/gson/JsonObject;

    invoke-virtual {v2}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    :try_start_0
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    iget-object v3, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-class v4, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;

    invoke-virtual {v2, v3, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;

    .line 191
    .local v1, "getTwitterFrindsIdsResponseObject":Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->getIds()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 192
    iget-object v2, p0, Lco/getair/meerkat/proxies/TwitterProxy$6;->val$accumulatedFriendsIds:Ljava/util/ArrayList;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->getIds()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 195
    :cond_0
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->getPrevious_cursor()J

    move-result-wide v2

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->getNext_cursor()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 196
    iget-object v2, p0, Lco/getair/meerkat/proxies/TwitterProxy$6;->this$0:Lco/getair/meerkat/proxies/TwitterProxy;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->getNext_cursor()J

    move-result-wide v4

    iget-object v3, p0, Lco/getair/meerkat/proxies/TwitterProxy$6;->val$accumulatedFriendsIds:Ljava/util/ArrayList;

    # invokes: Lco/getair/meerkat/proxies/TwitterProxy;->getUserFrindsIdsForPage(JLjava/util/ArrayList;)V
    invoke-static {v2, v4, v5, v3}, Lco/getair/meerkat/proxies/TwitterProxy;->access$000(Lco/getair/meerkat/proxies/TwitterProxy;JLjava/util/ArrayList;)V

    .line 204
    .end local v1    # "getTwitterFrindsIdsResponseObject":Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;
    :goto_0
    return-void

    .line 198
    .restart local v1    # "getTwitterFrindsIdsResponseObject":Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;
    :cond_1
    iget-object v2, p0, Lco/getair/meerkat/proxies/TwitterProxy$6;->this$0:Lco/getair/meerkat/proxies/TwitterProxy;

    const-string v3, "eventTwitterFriendsListArrived"

    iget-object v4, p0, Lco/getair/meerkat/proxies/TwitterProxy$6;->val$accumulatedFriendsIds:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lco/getair/meerkat/proxies/TwitterProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 201
    .end local v1    # "getTwitterFrindsIdsResponseObject":Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
