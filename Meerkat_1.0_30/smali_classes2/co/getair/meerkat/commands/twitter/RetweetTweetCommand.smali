.class public Lco/getair/meerkat/commands/twitter/RetweetTweetCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "RetweetTweetCommand.java"


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

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/twitter/RetweetParams;

    .line 20
    .local v0, "retweetParams":Lco/getair/meerkat/dtos/twitter/RetweetParams;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/twitter/RetweetTweetCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "twitterProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/TwitterProxy;

    .line 21
    .local v1, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/twitter/RetweetParams;->getTweetId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/proxies/TwitterProxy;->retweetTweet(Ljava/lang/String;)V

    .line 22
    return-void
.end method