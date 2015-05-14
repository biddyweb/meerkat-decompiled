.class Lco/getair/meerkat/proxies/WatchProxy$1;
.super Ljava/lang/Object;
.source "WatchProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/WatchProxy;->addMeAsWatcher()V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/WatchProxy;

.field final synthetic val$addWatcherUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/WatchProxy;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/WatchProxy;

    .prologue
    .line 82
    iput-object p1, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    iput-object p2, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->val$addWatcherUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 82
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/WatchProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 86
    :try_start_0
    const-string v4, "WatchProxy"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 88
    .local v2, "gsonParser":Lcom/google/gson/Gson;
    iget-object v5, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    const-string v4, "followupActions"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    const-class v6, Ljava/util/HashMap;

    invoke-virtual {v2, v4, v6}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    # setter for: Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v5, v4}, Lco/getair/meerkat/proxies/WatchProxy;->access$002(Lco/getair/meerkat/proxies/WatchProxy;Ljava/util/HashMap;)Ljava/util/HashMap;

    .line 91
    const-string v4, "result"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 92
    .local v0, "broadcastJson":Lorg/json/JSONObject;
    const-string v4, "id"

    iget-object v5, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    # getter for: Lco/getair/meerkat/proxies/WatchProxy;->streamId:Ljava/lang/String;
    invoke-static {v5}, Lco/getair/meerkat/proxies/WatchProxy;->access$100(Lco/getair/meerkat/proxies/WatchProxy;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 94
    iget-object v5, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    const-class v6, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    invoke-virtual {v2, v4, v6}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    # setter for: Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    invoke-static {v5, v4}, Lco/getair/meerkat/proxies/WatchProxy;->access$202(Lco/getair/meerkat/proxies/WatchProxy;Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;)Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .line 96
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    # getter for: Lco/getair/meerkat/proxies/WatchProxy;->followupActions:Ljava/util/HashMap;
    invoke-static {v4}, Lco/getair/meerkat/proxies/WatchProxy;->access$000(Lco/getair/meerkat/proxies/WatchProxy;)Ljava/util/HashMap;

    move-result-object v4

    const-string v5, "playlist"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 98
    .local v3, "playlistUrl":Ljava/lang/String;
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    iget-object v5, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->val$addWatcherUrl:Ljava/lang/String;

    # invokes: Lco/getair/meerkat/proxies/WatchProxy;->addProxies(Ljava/lang/String;)V
    invoke-static {v4, v5}, Lco/getair/meerkat/proxies/WatchProxy;->access$300(Lco/getair/meerkat/proxies/WatchProxy;Ljava/lang/String;)V

    .line 99
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    # invokes: Lco/getair/meerkat/proxies/WatchProxy;->addCommands()V
    invoke-static {v4}, Lco/getair/meerkat/proxies/WatchProxy;->access$400(Lco/getair/meerkat/proxies/WatchProxy;)V

    .line 101
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    const-string v5, "commandStartGettingStreamActivities"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lco/getair/meerkat/proxies/WatchProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    const-string v5, "commandStartGettingWatchers"

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lco/getair/meerkat/proxies/WatchProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 103
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    const-string v5, "eventPlaylistArrived"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v3, v6}, Lco/getair/meerkat/proxies/WatchProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    const-string v5, "eventBroadcastInfoArrived"

    iget-object v6, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    # getter for: Lco/getair/meerkat/proxies/WatchProxy;->broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    invoke-static {v6}, Lco/getair/meerkat/proxies/WatchProxy;->access$200(Lco/getair/meerkat/proxies/WatchProxy;)Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lco/getair/meerkat/proxies/WatchProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    const-string v5, "timeEventForMixpanel"

    const-string v6, "watch"

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lco/getair/meerkat/proxies/WatchProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    iget-object v4, p0, Lco/getair/meerkat/proxies/WatchProxy$1;->this$0:Lco/getair/meerkat/proxies/WatchProxy;

    const-string v5, "incrementPeopleProperty"

    const-string v6, "watch count"

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lco/getair/meerkat/proxies/WatchProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .end local v0    # "broadcastJson":Lorg/json/JSONObject;
    .end local v2    # "gsonParser":Lcom/google/gson/Gson;
    .end local v3    # "playlistUrl":Ljava/lang/String;
    :goto_0
    return-void

    .line 108
    :catch_0
    move-exception v1

    .line 109
    .local v1, "exception":Lorg/json/JSONException;
    const-string v4, "WatchProxy"

    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
