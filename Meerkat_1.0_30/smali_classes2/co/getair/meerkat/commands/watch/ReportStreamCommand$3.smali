.class Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "ReportStreamCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/watch/ReportStreamCommand;->report()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/watch/ReportStreamCommand;

.field final synthetic val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/watch/ReportStreamCommand;Lco/getair/meerkat/proxies/WatchProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    .prologue
    .line 53
    iput-object p1, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->this$0:Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    iput-object p2, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 56
    iget-boolean v3, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->success:Z

    if-eqz v3, :cond_0

    .line 57
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 60
    .local v2, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "stream id"

    iget-object v4, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;

    invoke-virtual {v4}, Lco/getair/meerkat/proxies/WatchProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    const-string v3, "type"

    const-string v4, "broadcast"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    const-string v3, "streamer id"

    iget-object v4, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->val$watchProxy:Lco/getair/meerkat/proxies/WatchProxy;

    invoke-virtual {v4}, Lco/getair/meerkat/proxies/WatchProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_0
    new-instance v1, Lco/getair/meerkat/dtos/MixpanelEventParams;

    const-string v3, "report"

    invoke-direct {v1, v3, v2}, Lco/getair/meerkat/dtos/MixpanelEventParams;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 68
    .local v1, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    iget-object v3, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->this$0:Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    const-string v4, "trackMixpanelEvent"

    invoke-virtual {v3, v4, v1, v5}, Lco/getair/meerkat/commands/watch/ReportStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 70
    iget-object v3, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->this$0:Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    const-string v4, "eventStreamReported"

    invoke-virtual {v3, v4, v5, v5}, Lco/getair/meerkat/commands/watch/ReportStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    .end local v1    # "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    .end local v2    # "params":Lorg/json/JSONObject;
    :goto_1
    return-void

    .line 63
    .restart local v2    # "params":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 72
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "params":Lorg/json/JSONObject;
    :cond_0
    iget-object v3, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$3;->this$0:Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    const-string v4, "eventStreamReportedError"

    invoke-virtual {v3, v4, v5, v5}, Lco/getair/meerkat/commands/watch/ReportStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1
.end method
