.class public Lco/getair/meerkat/commands/stream_participation/StopGettingWatchersCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "StopGettingWatchersCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 15
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 17
    invoke-virtual {p0}, Lco/getair/meerkat/commands/stream_participation/StopGettingWatchersCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-static {}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->NAME()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/StreamWatchersProxy;

    .line 18
    .local v0, "streamWatchersProxy":Lco/getair/meerkat/proxies/StreamWatchersProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->stop()V

    .line 19
    return-void
.end method
