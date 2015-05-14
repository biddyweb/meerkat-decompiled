.class public Lco/getair/meerkat/commands/UnfollowUserCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UnfollowUserCommand.java"


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
    .line 16
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 17
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/IUserToFollow;

    .line 18
    .local v1, "user":Lco/getair/meerkat/dtos/IUserToFollow;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/UnfollowUserCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "graphProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/GraphProxy;

    .line 19
    .local v0, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/GraphProxy;->unfollowUser(Lco/getair/meerkat/dtos/IUserToFollow;)V

    .line 20
    return-void
.end method
