.class Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;
.super Lco/getair/meerkat/utilities/RunnableWithResultObject;
.source "SubscribeToScheduledStreamCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

.field final synthetic val$didSubscribeParams:Lco/getair/meerkat/dtos/DidSubscribeParams;

.field final synthetic val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;Lco/getair/meerkat/dtos/DidSubscribeParams;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

    .prologue
    .line 40
    iput-object p1, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

    iput-object p2, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$didSubscribeParams:Lco/getair/meerkat/dtos/DidSubscribeParams;

    iput-object p3, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-direct {p0}, Lco/getair/meerkat/utilities/RunnableWithResultObject;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 43
    iget-boolean v8, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->success:Z

    if-eqz v8, :cond_0

    .line 44
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

    const-string v9, "scheduledEventSubscribedCommand"

    iget-object v10, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$didSubscribeParams:Lco/getair/meerkat/dtos/DidSubscribeParams;

    invoke-virtual {v8, v9, v10, v12}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    # invokes: Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->scheduleStreamNotification(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    invoke-static {v8, v9}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->access$000(Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V

    .line 47
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v8

    const-string v9, "graphProxy"

    invoke-virtual {v8, v9}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/GraphProxy;

    .line 48
    .local v1, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 50
    .local v3, "params":Lorg/json/JSONObject;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long v4, v8, v10

    .line 51
    .local v4, "now":J
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v8

    sub-long v6, v8, v4

    .line 53
    .local v6, "timeBefore":J
    :try_start_0
    const-string v8, "stream id"

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 54
    const-string v8, "subscribed"

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getSubscribers()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 55
    const-string v8, "is following"

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Lco/getair/meerkat/proxies/GraphProxy;->amIFollowingUser(Ljava/lang/String;)Z

    move-result v9

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 56
    const-string v8, "time before"

    invoke-virtual {v3, v8, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :goto_0
    new-instance v2, Lco/getair/meerkat/dtos/MixpanelEventParams;

    const-string v8, "subscribe"

    invoke-direct {v2, v8, v3}, Lco/getair/meerkat/dtos/MixpanelEventParams;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 62
    .local v2, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

    const-string v9, "trackMixpanelEvent"

    invoke-virtual {v8, v9, v2, v12}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

    const-string v9, "incrementPeopleProperty"

    const-string v10, "subscribe count"

    invoke-virtual {v8, v9, v10, v12}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    .end local v1    # "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    .end local v2    # "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    .end local v3    # "params":Lorg/json/JSONObject;
    .end local v4    # "now":J
    .end local v6    # "timeBefore":J
    :cond_0
    return-void

    .line 57
    .restart local v1    # "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    .restart local v3    # "params":Lorg/json/JSONObject;
    .restart local v4    # "now":J
    .restart local v6    # "timeBefore":J
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
