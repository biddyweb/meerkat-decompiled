.class public Lco/getair/meerkat/commands/watch/WatchStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "WatchStartupCommand.java"


# static fields
.field public static final OPEN_SESSION_FOR_WATCHER:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/watch/WatchStartupCommand;)Lco/getair/meerkat/facades/BaseFacade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/watch/WatchStartupCommand;

    .prologue
    .line 33
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    return-object v0
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 100
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 7

    .prologue
    .line 54
    new-instance v4, Lco/getair/meerkat/commands/watch/WatcherEndCommand;

    invoke-direct {v4}, Lco/getair/meerkat/commands/watch/WatcherEndCommand;-><init>()V

    .line 55
    .local v4, "watcherEndCommand":Lco/getair/meerkat/commands/watch/WatcherEndCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "end"

    invoke-virtual {v5, v6, v4}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 57
    new-instance v3, Lco/getair/meerkat/commands/watch/RestreamCommand;

    invoke-direct {v3}, Lco/getair/meerkat/commands/watch/RestreamCommand;-><init>()V

    .line 58
    .local v3, "restreamCommand":Lco/getair/meerkat/commands/watch/RestreamCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "eventRestreamGotClicked"

    invoke-virtual {v5, v6, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 60
    new-instance v1, Lco/getair/meerkat/commands/watch/LikeStreamCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/watch/LikeStreamCommand;-><init>()V

    .line 61
    .local v1, "likeStreamCommand":Lco/getair/meerkat/commands/watch/LikeStreamCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "eventLikeGotClicked"

    invoke-virtual {v5, v6, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 63
    new-instance v2, Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/watch/ReportStreamCommand;-><init>()V

    .line 64
    .local v2, "reportStreamCommand":Lco/getair/meerkat/commands/watch/ReportStreamCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "eventReportGotClicked"

    invoke-virtual {v5, v6, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 66
    new-instance v0, Lco/getair/meerkat/commands/watch/AddCommentCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/watch/AddCommentCommand;-><init>()V

    .line 67
    .local v0, "addCommentCommand":Lco/getair/meerkat/commands/watch/AddCommentCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v5

    const-string v6, "eventAddComment"

    invoke-virtual {v5, v6, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 68
    return-void
.end method

.method private registerMediators()V
    .locals 5

    .prologue
    const v4, 0x7f0e00c0

    .line 71
    new-instance v1, Lco/getair/meerkat/mediators/WatchMediator;

    const-string v2, "watchMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lco/getair/meerkat/mediators/WatchMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .local v1, "watchMediator":Lco/getair/meerkat/mediators/WatchMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 74
    new-instance v0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;

    const-string v2, "commentsOnVideoMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .local v0, "commentsOnVideoMediator":Lco/getair/meerkat/mediators/CommentsOnVideoMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 76
    return-void
.end method

.method private registerProxies()V
    .locals 6

    .prologue
    .line 80
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/activities/WatchActivity;

    .line 83
    .local v1, "ownerActivity":Lco/getair/meerkat/activities/WatchActivity;
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v0

    .line 85
    .local v0, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v4, "sessionProxy"

    new-instance v5, Lco/getair/meerkat/commands/watch/WatchStartupCommand$1;

    invoke-direct {v5, p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand$1;-><init>(Lco/getair/meerkat/commands/watch/WatchStartupCommand;)V

    invoke-virtual {v0, v4, v5}, Lco/getair/meerkat/ApiProxy;->retrieveProxy(Ljava/lang/String;Ljava/util/concurrent/Callable;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/proxies/SessionProxy;

    .line 91
    .local v2, "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 93
    new-instance v3, Lco/getair/meerkat/proxies/WatchProxy;

    const-string v4, "watchProxy"

    iget-object v5, v1, Lco/getair/meerkat/activities/WatchActivity;->streamId:Ljava/lang/String;

    invoke-direct {v3, v4, v1, v5}, Lco/getair/meerkat/proxies/WatchProxy;-><init>(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V

    .line 94
    .local v3, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    invoke-virtual {v4, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 95
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 40
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 42
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->registerCommands()V

    .line 43
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->registerProxies()V

    .line 44
    invoke-direct {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->registerMediators()V

    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "twitterProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/TwitterProxy;

    .line 47
    .local v0, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Lco/getair/meerkat/proxies/TwitterProxy;->setCommentsShouldTweetState(Z)V

    .line 49
    invoke-virtual {p0}, Lco/getair/meerkat/commands/watch/WatchStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "watchProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/WatchProxy;

    .line 50
    .local v1, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    invoke-virtual {v1}, Lco/getair/meerkat/proxies/WatchProxy;->addMeAsWatcher()V

    .line 51
    return-void
.end method
