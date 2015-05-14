.class public Lco/getair/meerkat/commands/feed/FeedStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "FeedStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/feed/FeedStartupCommand;)Lco/getair/meerkat/facades/BaseFacade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/feed/FeedStartupCommand;

    .prologue
    .line 25
    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    return-object v0
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 93
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 3

    .prologue
    .line 45
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    .line 47
    .local v0, "facade":Lorg/puremvc/java/multicore/patterns/facade/Facade;
    const-string v1, "feedGetLive"

    new-instance v2, Lco/getair/meerkat/commands/feed/GetLiveFeedCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/feed/GetLiveFeedCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 49
    const-string v1, "commandGoogleServicesApkAvailable"

    new-instance v2, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;

    invoke-direct {v2}, Lco/getair/meerkat/notifications/RegisterForNotificationsCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 51
    const-string v1, "scheduledEventSubscribeCommand"

    new-instance v2, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/feed/SubscribeToScheduledStreamCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 53
    const-string v1, "scheduledEventUnsubscribeCommand"

    new-instance v2, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/feed/UnsubscribeFromScheduledStreamCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 55
    const-string v1, "searchForUserCommand"

    new-instance v2, Lco/getair/meerkat/commands/feed/SearchForUserCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/feed/SearchForUserCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 57
    const-string v1, "commandGoLive"

    new-instance v2, Lco/getair/meerkat/commands/feed/GoLiveCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/feed/GoLiveCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 59
    const-string v1, "scheduledEventRestreamCommand"

    new-instance v2, Lco/getair/meerkat/commands/feed/RestreamScheduledStreamCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/feed/RestreamScheduledStreamCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 61
    const-string v1, "scheduledEventUnrestreamCommand"

    new-instance v2, Lco/getair/meerkat/commands/feed/UnrestreamScheduledStreamCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/feed/UnrestreamScheduledStreamCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 62
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 86
    new-instance v0, Lco/getair/meerkat/mediators/FeedMediator;

    const-string v1, "feedMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e008f

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/FeedMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    .local v0, "feedMediator":Lco/getair/meerkat/mediators/FeedMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 88
    return-void
.end method

.method private registerProxies()V
    .locals 6

    .prologue
    .line 66
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    .line 69
    .local v1, "facade":Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v0

    .line 71
    .local v0, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v4, "feedProxy"

    new-instance v5, Lco/getair/meerkat/commands/feed/FeedStartupCommand$1;

    invoke-direct {v5, p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand$1;-><init>(Lco/getair/meerkat/commands/feed/FeedStartupCommand;)V

    invoke-virtual {v0, v4, v5}, Lco/getair/meerkat/ApiProxy;->retrieveProxy(Ljava/lang/String;Ljava/util/concurrent/Callable;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/proxies/FeedProxy;

    .line 78
    .local v2, "feedProxy":Lco/getair/meerkat/proxies/FeedProxy;
    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 80
    new-instance v3, Lco/getair/meerkat/proxies/SearchProxy;

    const-string v4, "searchProxy"

    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lco/getair/meerkat/proxies/SearchProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 81
    .local v3, "searchProxy":Lco/getair/meerkat/proxies/SearchProxy;
    invoke-virtual {v1, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 82
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 30
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 32
    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->registerCommands()V

    .line 33
    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->registerProxies()V

    .line 34
    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->registerMediators()V

    .line 36
    new-instance v0, Lco/getair/meerkat/commands/feed/GetLiveParams;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lco/getair/meerkat/commands/feed/GetLiveParams;-><init>(Z)V

    .line 37
    .local v0, "getLiveParams":Lco/getair/meerkat/commands/feed/GetLiveParams;
    const-string v2, "feedGetLive"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v0, v3}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    new-instance v1, Lco/getair/meerkat/notifications/RegisterForNotificationsParams;

    invoke-direct {p0}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lco/getair/meerkat/notifications/RegisterForNotificationsParams;-><init>(Landroid/app/Activity;)V

    .line 40
    .local v1, "registerForNotificationsParams":Lco/getair/meerkat/notifications/RegisterForNotificationsParams;
    const-string v2, "commandGoogleServicesApkAvailable"

    invoke-virtual {p0, v2, v1}, Lco/getair/meerkat/commands/feed/FeedStartupCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    return-void
.end method
