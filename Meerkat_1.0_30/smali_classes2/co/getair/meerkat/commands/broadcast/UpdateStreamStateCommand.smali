.class public Lco/getair/meerkat/commands/broadcast/UpdateStreamStateCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UpdateStreamStateCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 17
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 19
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;

    .line 20
    .local v1, "streamStats":Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/UpdateStreamStateCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "broadcastProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/BroadcastProxy;

    .line 21
    .local v0, "broadcastProxy":Lco/getair/meerkat/proxies/BroadcastProxy;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/BroadcastProxy;->updateStreamStats(Lco/getair/meerkat/dtos/watch_broadcast/StreamStats;)V

    .line 22
    return-void
.end method
