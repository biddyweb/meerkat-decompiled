.class public Lco/getair/meerkat/commands/feed/GetLiveFeedCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "GetLiveFeedCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 15
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 17
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/commands/feed/GetLiveParams;

    .line 18
    .local v1, "getLiveParams":Lco/getair/meerkat/commands/feed/GetLiveParams;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/GetLiveFeedCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "feedProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/FeedProxy;

    .line 19
    .local v0, "feedProxy":Lco/getair/meerkat/proxies/FeedProxy;
    iget-boolean v2, v1, Lco/getair/meerkat/commands/feed/GetLiveParams;->shouldFilter:Z

    invoke-virtual {v0, v2}, Lco/getair/meerkat/proxies/FeedProxy;->requestLiveStreams(Z)V

    .line 20
    iget-boolean v2, v1, Lco/getair/meerkat/commands/feed/GetLiveParams;->shouldFilter:Z

    invoke-virtual {v0, v2}, Lco/getair/meerkat/proxies/FeedProxy;->requestScheduledStreams(Z)V

    .line 21
    return-void
.end method
