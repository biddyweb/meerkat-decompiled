.class public Lco/getair/meerkat/commands/mixpanel/TrackEventCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "TrackEventCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 18
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 20
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/MixpanelEventParams;

    .line 22
    .local v0, "mixpanelEventParams":Lco/getair/meerkat/dtos/MixpanelEventParams;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/mixpanel/TrackEventCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "mixpanelProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/MixpanelProxy;

    .line 23
    .local v1, "mixpanelProxy":Lco/getair/meerkat/proxies/MixpanelProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/MixpanelEventParams;->getEventName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/MixpanelEventParams;->getEventProperties()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/proxies/MixpanelProxy;->trackEvent(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 24
    return-void
.end method
