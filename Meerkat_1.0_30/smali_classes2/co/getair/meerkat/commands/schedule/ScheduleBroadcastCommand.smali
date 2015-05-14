.class public Lco/getair/meerkat/commands/schedule/ScheduleBroadcastCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "ScheduleBroadcastCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 8
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v7, 0x0

    .line 22
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 24
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    .line 26
    .local v3, "scheduleBroadcastParams":Lco/getair/meerkat/dtos/ScheduleBroadcastParams;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/schedule/ScheduleBroadcastCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "scheduleBroadcastProxy"

    invoke-virtual {v5, v6}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    .line 27
    .local v4, "scheduleBroadcastProxy":Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;
    invoke-virtual {v4, v3}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;->scheduleBroadcast(Lco/getair/meerkat/dtos/ScheduleBroadcastParams;)V

    .line 29
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 31
    .local v2, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v6, "has photo"

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getCoverImage()Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    :goto_0
    invoke-virtual {v2, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 32
    const-string v5, "caption"

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getCaption()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    const-string v5, "future time"

    invoke-virtual {v3}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;->getTimeOfBroadcast()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :goto_1
    new-instance v1, Lco/getair/meerkat/dtos/MixpanelEventParams;

    const-string v5, "schedule"

    invoke-direct {v1, v5, v2}, Lco/getair/meerkat/dtos/MixpanelEventParams;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 39
    .local v1, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    const-string v5, "trackMixpanelEvent"

    invoke-virtual {p0, v5, v1, v7}, Lco/getair/meerkat/commands/schedule/ScheduleBroadcastCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    const-string v5, "incrementPeopleProperty"

    const-string v6, "schedule count"

    invoke-virtual {p0, v5, v6, v7}, Lco/getair/meerkat/commands/schedule/ScheduleBroadcastCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    return-void

    .line 31
    .end local v1    # "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 34
    :catch_0
    move-exception v0

    .line 35
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
