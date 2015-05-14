.class Lco/getair/meerkat/proxies/FeedProxy$5;
.super Ljava/lang/Object;
.source "FeedProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/FeedProxy;->requestStreamSummary(Lco/getair/meerkat/dtos/feed/FeedStream;Ljava/lang/Class;)V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/FeedProxy;

.field final synthetic val$broadcastClass:Ljava/lang/Class;

.field final synthetic val$feedStream:Lco/getair/meerkat/dtos/feed/FeedStream;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/FeedProxy;Ljava/lang/Class;Lco/getair/meerkat/dtos/feed/FeedStream;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/FeedProxy;

    .prologue
    .line 170
    iput-object p1, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->val$broadcastClass:Ljava/lang/Class;

    iput-object p3, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->val$feedStream:Lco/getair/meerkat/dtos/feed/FeedStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 170
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/FeedProxy$5;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 12
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 174
    :try_start_0
    # getter for: Lco/getair/meerkat/proxies/FeedProxy;->gson:Lcom/google/gson/Gson;
    invoke-static {}, Lco/getair/meerkat/proxies/FeedProxy;->access$000()Lcom/google/gson/Gson;

    move-result-object v2

    const-string v3, "result"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->val$broadcastClass:Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/getair/meerkat/dtos/feed/BroadcastSummary;

    .line 176
    .local v9, "broadcastSummary":Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    new-instance v2, Lco/getair/meerkat/proxies/FeedProxy$5$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/proxies/FeedProxy$5$1;-><init>(Lco/getair/meerkat/proxies/FeedProxy$5;)V

    .line 177
    invoke-virtual {v2}, Lco/getair/meerkat/proxies/FeedProxy$5$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v10

    .line 179
    .local v10, "collectionType":Ljava/lang/reflect/Type;
    # getter for: Lco/getair/meerkat/proxies/FeedProxy;->gson:Lcom/google/gson/Gson;
    invoke-static {}, Lco/getair/meerkat/proxies/FeedProxy;->access$000()Lcom/google/gson/Gson;

    move-result-object v2

    const-string v3, "followupActions"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v10}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    .line 183
    .local v8, "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->getStatus()Ljava/lang/String;

    move-result-object v2

    const-string v3, "live"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 184
    new-instance v1, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;

    const-string v2, "streamFeedItemProxy"

    iget-object v3, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    .line 185
    # getter for: Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;
    invoke-static {v3}, Lco/getair/meerkat/proxies/FeedProxy;->access$300(Lco/getair/meerkat/proxies/FeedProxy;)Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    iget-object v5, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->val$feedStream:Lco/getair/meerkat/dtos/feed/FeedStream;

    .line 187
    invoke-virtual {v5}, Lco/getair/meerkat/dtos/feed/FeedStream;->didIRestream()Z

    move-result v5

    move-object v0, v9

    check-cast v0, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-object v6, v0

    iget-object v7, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->val$feedStream:Lco/getair/meerkat/dtos/feed/FeedStream;

    .line 189
    invoke-virtual {v7}, Lco/getair/meerkat/dtos/feed/FeedStream;->getTopInfluencer()Lco/getair/meerkat/dtos/Influencer;

    move-result-object v7

    invoke-direct/range {v1 .. v8}, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;-><init>(Ljava/lang/String;Landroid/content/Context;IZLco/getair/meerkat/dtos/feed/LiveBroadcastSummary;Lco/getair/meerkat/dtos/Influencer;Ljava/util/HashMap;)V

    .line 191
    .local v1, "result":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    invoke-static {}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->getInstance()Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    move-result-object v3

    move-object v0, v1

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;

    move-object v2, v0

    invoke-virtual {v3, v2}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->storeLive(Lco/getair/meerkat/dtos/feed/StreamFeedLiveItemProxy;)V

    .line 205
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    # invokes: Lco/getair/meerkat/proxies/FeedProxy;->notifyStreamArrived(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V
    invoke-static {v2, v1}, Lco/getair/meerkat/proxies/FeedProxy;->access$100(Lco/getair/meerkat/proxies/FeedProxy;Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V

    .line 209
    .end local v1    # "result":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    .end local v8    # "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "broadcastSummary":Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    .end local v10    # "collectionType":Ljava/lang/reflect/Type;
    :cond_0
    :goto_1
    return-void

    .line 192
    .restart local v8    # "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v9    # "broadcastSummary":Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    .restart local v10    # "collectionType":Ljava/lang/reflect/Type;
    :cond_1
    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->getStatus()Ljava/lang/String;

    move-result-object v2

    const-string v3, "schedule"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 193
    new-instance v1, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    const-string v2, "streamFeedItemProxy"

    iget-object v3, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->this$0:Lco/getair/meerkat/proxies/FeedProxy;

    .line 194
    # getter for: Lco/getair/meerkat/proxies/FeedProxy;->context:Landroid/content/Context;
    invoke-static {v3}, Lco/getair/meerkat/proxies/FeedProxy;->access$300(Lco/getair/meerkat/proxies/FeedProxy;)Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    iget-object v5, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->val$feedStream:Lco/getair/meerkat/dtos/feed/FeedStream;

    .line 196
    invoke-virtual {v5}, Lco/getair/meerkat/dtos/feed/FeedStream;->didIRestream()Z

    move-result v5

    move-object v0, v9

    check-cast v0, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-object v6, v0

    iget-object v7, p0, Lco/getair/meerkat/proxies/FeedProxy$5;->val$feedStream:Lco/getair/meerkat/dtos/feed/FeedStream;

    .line 198
    invoke-virtual {v7}, Lco/getair/meerkat/dtos/feed/FeedStream;->getTopInfluencer()Lco/getair/meerkat/dtos/Influencer;

    move-result-object v7

    invoke-direct/range {v1 .. v8}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;-><init>(Ljava/lang/String;Landroid/content/Context;IZLco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;Lco/getair/meerkat/dtos/Influencer;Ljava/util/HashMap;)V

    .line 200
    .restart local v1    # "result":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    invoke-static {}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->getInstance()Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;

    move-result-object v3

    move-object v0, v1

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    move-object v2, v0

    invoke-virtual {v3, v2}, Lco/getair/meerkat/dtos/feed/StreamsCacheProxy;->storeScheduled(Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 206
    .end local v1    # "result":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    .end local v8    # "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "broadcastSummary":Lco/getair/meerkat/dtos/feed/BroadcastSummary;
    .end local v10    # "collectionType":Ljava/lang/reflect/Type;
    :catch_0
    move-exception v11

    .line 207
    .local v11, "e":Lorg/json/JSONException;
    const-string v2, "FAILED to parse stream info"

    invoke-static {v2}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    goto :goto_1
.end method
