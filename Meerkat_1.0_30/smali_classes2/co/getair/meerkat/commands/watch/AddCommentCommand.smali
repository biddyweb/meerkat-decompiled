.class public Lco/getair/meerkat/commands/watch/AddCommentCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "AddCommentCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/watch/AddCommentCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/watch/AddCommentCommand;

    .prologue
    .line 16
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/AddCommentCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 5
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 19
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 21
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 23
    .local v1, "content":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/AddCommentCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    invoke-static {}, Lco/getair/meerkat/proxies/StreamCommentsProxy;->NAME()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/proxies/StreamCommentsProxy;

    .line 25
    .local v2, "streamCommentsProxy":Lco/getair/meerkat/proxies/StreamCommentsProxy;
    new-instance v0, Lco/getair/meerkat/dtos/AddCommentParams;

    invoke-virtual {v2}, Lco/getair/meerkat/proxies/StreamCommentsProxy;->getBroadcasterName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lco/getair/meerkat/proxies/StreamCommentsProxy;->getTweetId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v1, v4}, Lco/getair/meerkat/dtos/AddCommentParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .local v0, "addCommentParams":Lco/getair/meerkat/dtos/AddCommentParams;
    new-instance v3, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;

    invoke-direct {v3, p0, v0}, Lco/getair/meerkat/commands/watch/AddCommentCommand$1;-><init>(Lco/getair/meerkat/commands/watch/AddCommentCommand;Lco/getair/meerkat/dtos/AddCommentParams;)V

    invoke-virtual {v2, v1, v3}, Lco/getair/meerkat/proxies/StreamCommentsProxy;->addCommentToStream(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 44
    return-void
.end method
