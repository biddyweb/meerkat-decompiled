.class public Lco/getair/meerkat/commands/twitter/TweetCommad;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "TweetCommad.java"


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
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 19
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 21
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/twitter/TweetParams;

    .line 23
    .local v0, "tweetParams":Lco/getair/meerkat/dtos/twitter/TweetParams;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/twitter/TweetCommad;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "twitterProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/TwitterProxy;

    .line 24
    .local v1, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/twitter/TweetParams;->getTweetText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/twitter/TweetParams;->getCompletion()Lco/getair/meerkat/utilities/RunnableWithResultObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/proxies/TwitterProxy;->tweet(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 25
    return-void
.end method
