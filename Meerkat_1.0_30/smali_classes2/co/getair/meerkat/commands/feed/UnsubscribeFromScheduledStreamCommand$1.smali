.class Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;
.super Ljava/lang/Object;
.source "UnsubscribeFromScheduledStreamCommand.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;

.field final synthetic val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;

    .prologue
    .line 34
    iput-object p1, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;

    iput-object p2, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 37
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    # invokes: Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;->unscheduleStreamNotification(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    invoke-static {v8, v9}, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;->access$000(Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V

    .line 39
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v8

    const-string v9, "graphProxy"

    invoke-virtual {v8, v9}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/GraphProxy;

    .line 40
    .local v1, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 42
    .local v3, "params":Lorg/json/JSONObject;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long v4, v8, v10

    .line 43
    .local v4, "now":J
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getEndTime()J

    move-result-wide v8

    sub-long v6, v8, v4

    .line 45
    .local v6, "timeBefore":J
    :try_start_0
    const-string v8, "stream id"

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    const-string v8, "subscribed"

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getSubscribers()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 47
    const-string v8, "is following"

    iget-object v9, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->val$streamFeedItemProxy:Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->getBroadcastSummary()Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Lco/getair/meerkat/proxies/GraphProxy;->amIFollowingUser(Ljava/lang/String;)Z

    move-result v9

    invoke-virtual {v3, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 48
    const-string v8, "time before"

    invoke-virtual {v3, v8, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :goto_0
    new-instance v2, Lco/getair/meerkat/dtos/MixpanelEventParams;

    const-string v8, "unsubscribe"

    invoke-direct {v2, v8, v3}, Lco/getair/meerkat/dtos/MixpanelEventParams;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 54
    .local v2, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;

    const-string v9, "trackMixpanelEvent"

    invoke-virtual {v8, v9, v2, v12}, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    iget-object v8, p0, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand$1;->this$0:Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;

    const-string v9, "decrementPeopleProperty"

    const-string v10, "subscribe count"

    invoke-virtual {v8, v9, v10, v12}, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    return-void

    .line 49
    .end local v2    # "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
