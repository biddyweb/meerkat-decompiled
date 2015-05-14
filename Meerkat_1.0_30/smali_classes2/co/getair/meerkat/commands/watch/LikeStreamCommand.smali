.class public Lco/getair/meerkat/commands/watch/LikeStreamCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "LikeStreamCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 18
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 20
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/LikeStreamCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/WatchActivityFacade;

    .line 21
    .local v0, "watchActivityFacade":Lco/getair/meerkat/facades/WatchActivityFacade;
    const-string v2, "watchProxy"

    invoke-virtual {v0, v2}, Lco/getair/meerkat/facades/WatchActivityFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/WatchProxy;

    .line 23
    .local v1, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    new-instance v2, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;

    invoke-direct {v2, p0, v1}, Lco/getair/meerkat/commands/watch/LikeStreamCommand$1;-><init>(Lco/getair/meerkat/commands/watch/LikeStreamCommand;Lco/getair/meerkat/proxies/WatchProxy;)V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/proxies/WatchProxy;->likeStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 33
    return-void
.end method
