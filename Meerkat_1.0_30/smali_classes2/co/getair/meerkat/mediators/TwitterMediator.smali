.class public Lco/getair/meerkat/mediators/TwitterMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "TwitterMediator.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 26
    invoke-static {}, Lco/getair/meerkat/mediators/TwitterMediator;->GetMediatorName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 27
    return-void
.end method

.method public static GetMediatorName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    const-string v0, "TwitterMediator"

    return-object v0
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 13
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v12, 0x0

    .line 45
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "eventCommentAdded"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 47
    invoke-static {}, Lco/getair/meerkat/proxies/TwitterProxy;->isCommentsShouldTweet()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 48
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/AddCommentParams;

    .line 49
    .local v0, "addCommentParams":Lco/getair/meerkat/dtos/AddCommentParams;
    new-instance v5, Lco/getair/meerkat/dtos/twitter/ReplyParams;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/AddCommentParams;->getContent()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/AddCommentParams;->getOriginalTweetId()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/AddCommentParams;->getBroadcasterUsername()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v5, v9, v10, v11}, Lco/getair/meerkat/dtos/twitter/ReplyParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .local v5, "replyParams":Lco/getair/meerkat/dtos/twitter/ReplyParams;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/TwitterMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v9

    const-string v10, "commandReplyToTweet"

    invoke-virtual {v9, v10, v5, v12}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    .end local v0    # "addCommentParams":Lco/getair/meerkat/dtos/AddCommentParams;
    .end local v5    # "replyParams":Lco/getair/meerkat/dtos/twitter/ReplyParams;
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "eventStreamLiked"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 56
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 57
    .local v4, "getTweetId":Ljava/lang/String;
    new-instance v3, Lco/getair/meerkat/dtos/twitter/FavoriteParams;

    invoke-direct {v3, v4}, Lco/getair/meerkat/dtos/twitter/FavoriteParams;-><init>(Ljava/lang/String;)V

    .line 58
    .local v3, "favoriteParams":Lco/getair/meerkat/dtos/twitter/FavoriteParams;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/TwitterMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v9

    const-string v10, "commandFavoriteTweet"

    invoke-virtual {v9, v10, v3, v12}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    .end local v3    # "favoriteParams":Lco/getair/meerkat/dtos/twitter/FavoriteParams;
    .end local v4    # "getTweetId":Ljava/lang/String;
    :cond_1
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "eventStreamRestreamed"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "scheduledEventRestreamedCommand"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 63
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 64
    .local v7, "tweetId":Ljava/lang/String;
    new-instance v6, Lco/getair/meerkat/dtos/twitter/RetweetParams;

    invoke-direct {v6, v7}, Lco/getair/meerkat/dtos/twitter/RetweetParams;-><init>(Ljava/lang/String;)V

    .line 65
    .local v6, "retweetParams":Lco/getair/meerkat/dtos/twitter/RetweetParams;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/TwitterMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v9

    const-string v10, "commandRetweetTweet"

    invoke-virtual {v9, v10, v6, v12}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    .end local v6    # "retweetParams":Lco/getair/meerkat/dtos/twitter/RetweetParams;
    .end local v7    # "tweetId":Ljava/lang/String;
    :cond_3
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "scheduledEventSubscribedCommand"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 70
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/dtos/DidSubscribeParams;

    .line 71
    .local v2, "didSubscribeParams":Lco/getair/meerkat/dtos/DidSubscribeParams;
    new-instance v3, Lco/getair/meerkat/dtos/twitter/FavoriteParams;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/DidSubscribeParams;->getTweetId()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v3, v9}, Lco/getair/meerkat/dtos/twitter/FavoriteParams;-><init>(Ljava/lang/String;)V

    .line 72
    .restart local v3    # "favoriteParams":Lco/getair/meerkat/dtos/twitter/FavoriteParams;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/TwitterMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v9

    const-string v10, "commandFavoriteTweet"

    invoke-virtual {v9, v10, v3, v12}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    .end local v2    # "didSubscribeParams":Lco/getair/meerkat/dtos/DidSubscribeParams;
    .end local v3    # "favoriteParams":Lco/getair/meerkat/dtos/twitter/FavoriteParams;
    :cond_4
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "eventBroadcastBegan"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 77
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;

    .line 78
    .local v1, "broadcastBeganParams":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;
    new-instance v8, Lco/getair/meerkat/dtos/twitter/TweetParams;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->getTweetCompletion()Lco/getair/meerkat/utilities/RunnableWithResultObject;

    move-result-object v9

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->getShareText()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lco/getair/meerkat/dtos/twitter/TweetParams;-><init>(Lco/getair/meerkat/utilities/RunnableWithResultObject;Ljava/lang/String;)V

    .line 79
    .local v8, "tweetParams":Lco/getair/meerkat/dtos/twitter/TweetParams;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/TwitterMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v9

    const-string v10, "commandTweet"

    invoke-virtual {v9, v10, v8, v12}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 82
    .end local v1    # "broadcastBeganParams":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;
    .end local v8    # "tweetParams":Lco/getair/meerkat/dtos/twitter/TweetParams;
    :cond_5
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 31
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventCommentAdded"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventStreamLiked"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "eventStreamRestreamed"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "scheduledEventRestreamedCommand"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "scheduledEventSubscribedCommand"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "eventBroadcastBegan"

    aput-object v2, v0, v1

    return-object v0
.end method
