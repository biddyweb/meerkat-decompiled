.class Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;
.super Ljava/lang/Object;
.source "StreamActivitiesProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getActivities()V
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
.field final synthetic this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    .prologue
    .line 65
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 65
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 27
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 69
    :try_start_0
    const-string v23, "StreamActivitiesProxy"

    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const-string v23, "result"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v17

    .line 73
    .local v17, "result":Lorg/json/JSONObject;
    const-string v23, "activitiesCount"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 74
    .local v5, "activitiesCount":I
    const-string v23, "expiry"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    .line 75
    .local v10, "delayInSeconds":I
    const-string v23, "activities"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 76
    .local v4, "activities":Lorg/json/JSONArray;
    const-string v23, "status"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 78
    .local v18, "status":Ljava/lang/String;
    const-string v23, "watchersCount"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    .line 79
    .local v9, "currentWatchersCount":I
    const-string v23, "webWatchersCount"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v22

    .line 80
    .local v22, "webWatchersCount":I
    const-string v23, "totalWatchersCount"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v20

    .line 81
    .local v20, "totalWatchersCount":I
    const-string v23, "commentsCount"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 82
    .local v8, "commentsCount":I
    const-string v23, "likesCount"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    .line 83
    .local v13, "likesCount":I
    const-string v23, "restreamsCount"

    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v16

    .line 85
    .local v16, "restreamsCount":I
    new-instance v19, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    move-object/from16 v0, v19

    move/from16 v1, v16

    move/from16 v2, v20

    invoke-direct {v0, v8, v13, v1, v2}, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;-><init>(IIII)V

    .line 86
    .local v19, "streamStats":Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    const-string v24, "commandStreamStatsUpdate"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v19

    move-object/from16 v3, v25

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    new-instance v21, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;

    add-int v23, v9, v22

    move-object/from16 v0, v21

    move/from16 v1, v23

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;-><init>(II)V

    .line 89
    .local v21, "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    const-string v24, "eventStreamWatchersCountUpdated"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v21

    move-object/from16 v3, v25

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    const-string v23, "ended"

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 92
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    # invokes: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static/range {v23 .. v23}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$000(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v23

    const-string v24, "eventStreamHasEnded"

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-virtual/range {v23 .. v26}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    # invokes: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static/range {v23 .. v23}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$100(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v23

    const-string v24, "commandStopGettingWatchers"

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-virtual/range {v23 .. v26}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    .end local v4    # "activities":Lorg/json/JSONArray;
    .end local v5    # "activitiesCount":I
    .end local v8    # "commentsCount":I
    .end local v9    # "currentWatchersCount":I
    .end local v10    # "delayInSeconds":I
    .end local v13    # "likesCount":I
    .end local v16    # "restreamsCount":I
    .end local v17    # "result":Lorg/json/JSONObject;
    .end local v18    # "status":Ljava/lang/String;
    .end local v19    # "streamStats":Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;
    .end local v20    # "totalWatchersCount":I
    .end local v21    # "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    .end local v22    # "webWatchersCount":I
    :cond_0
    :goto_0
    return-void

    .line 96
    .restart local v4    # "activities":Lorg/json/JSONArray;
    .restart local v5    # "activitiesCount":I
    .restart local v8    # "commentsCount":I
    .restart local v9    # "currentWatchersCount":I
    .restart local v10    # "delayInSeconds":I
    .restart local v13    # "likesCount":I
    .restart local v16    # "restreamsCount":I
    .restart local v17    # "result":Lorg/json/JSONObject;
    .restart local v18    # "status":Ljava/lang/String;
    .restart local v19    # "streamStats":Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;
    .restart local v20    # "totalWatchersCount":I
    .restart local v21    # "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    .restart local v22    # "webWatchersCount":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    # invokes: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->reactivateGetActivities(I)V
    invoke-static {v0, v10}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$200(Lco/getair/meerkat/proxies/StreamActivitiesProxy;I)V

    .line 98
    move-object v15, v4

    .line 99
    .local v15, "relevantActivities":Lorg/json/JSONArray;
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v23

    if-lez v23, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    # getter for: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->lastActivitiesCount:I
    invoke-static/range {v23 .. v23}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$300(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)I

    move-result v23

    move/from16 v0, v23

    if-le v5, v0, :cond_0

    .line 100
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    # getter for: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->lastActivitiesCount:I
    invoke-static/range {v23 .. v23}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$300(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)I

    move-result v23

    sub-int v14, v5, v23

    .line 101
    .local v14, "newActivitiesCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    # setter for: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->lastActivitiesCount:I
    invoke-static {v0, v5}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$302(Lco/getair/meerkat/proxies/StreamActivitiesProxy;I)I

    .line 103
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v23

    move/from16 v0, v23

    if-ge v14, v0, :cond_2

    .line 104
    new-instance v15, Lorg/json/JSONArray;

    .end local v15    # "relevantActivities":Lorg/json/JSONArray;
    invoke-direct {v15}, Lorg/json/JSONArray;-><init>()V

    .line 105
    .restart local v15    # "relevantActivities":Lorg/json/JSONArray;
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v23

    sub-int v12, v23, v14

    .local v12, "i":I
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v23

    move/from16 v0, v23

    if-ge v12, v0, :cond_2

    .line 106
    invoke-virtual {v4, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 105
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 110
    .end local v12    # "i":I
    :cond_2
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_2
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v23

    move/from16 v0, v23

    if-ge v12, v0, :cond_0

    .line 111
    invoke-virtual {v15, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 112
    .local v6, "activity":Lorg/json/JSONObject;
    new-instance v23, Lcom/google/gson/Gson;

    invoke-direct/range {v23 .. v23}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    const-class v25, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;

    invoke-virtual/range {v23 .. v25}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;

    .line 113
    .local v7, "broadcastActivity":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    const-string v24, "eventActivityArrived"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v7, v2}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 118
    .end local v4    # "activities":Lorg/json/JSONArray;
    .end local v5    # "activitiesCount":I
    .end local v6    # "activity":Lorg/json/JSONObject;
    .end local v7    # "broadcastActivity":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;
    .end local v8    # "commentsCount":I
    .end local v9    # "currentWatchersCount":I
    .end local v10    # "delayInSeconds":I
    .end local v12    # "i":I
    .end local v13    # "likesCount":I
    .end local v14    # "newActivitiesCount":I
    .end local v15    # "relevantActivities":Lorg/json/JSONArray;
    .end local v16    # "restreamsCount":I
    .end local v17    # "result":Lorg/json/JSONObject;
    .end local v18    # "status":Ljava/lang/String;
    .end local v19    # "streamStats":Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;
    .end local v20    # "totalWatchersCount":I
    .end local v21    # "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    .end local v22    # "webWatchersCount":I
    :catch_0
    move-exception v11

    .line 119
    .local v11, "exception":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$1;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    move-object/from16 v23, v0

    const/16 v24, 0xa

    # invokes: Lco/getair/meerkat/proxies/StreamActivitiesProxy;->reactivateGetActivities(I)V
    invoke-static/range {v23 .. v24}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->access$200(Lco/getair/meerkat/proxies/StreamActivitiesProxy;I)V

    .line 120
    const-string v23, "StreamActivitiesProxy"

    invoke-virtual {v11}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v23 .. v24}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
