.class public Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "BroadcastEndCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 20
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 22
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "broadcastProxy"

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->removeProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    .line 23
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "mixpanelProxy"

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->removeProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    .line 24
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/mediators/BroadcastMediator;->NAME()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->removeMediator(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IMediator;

    .line 25
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commentsOnVideoMediator"

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->removeCommand(Ljava/lang/String;)V

    .line 26
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "gpsProxy"

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->removeProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    .line 28
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->NAME()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->removeProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    .line 29
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->NAME()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->removeProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    .line 31
    const-string v0, "BroadcastActivity"

    invoke-static {v0}, Lco/getair/meerkat/facades/BroadcastActivityFacade;->removeCore(Ljava/lang/String;)V

    .line 32
    return-void
.end method
