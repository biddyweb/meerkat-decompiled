.class public Lco/getair/meerkat/commands/login/LandingStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "LandingStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/login/LandingStartupCommand;)Lco/getair/meerkat/facades/BaseFacade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/LandingStartupCommand;

    .prologue
    .line 26
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    return-object v0
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 74
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 4

    .prologue
    .line 43
    new-instance v1, Lco/getair/meerkat/commands/ValidateSessionCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/ValidateSessionCommand;-><init>()V

    .line 44
    .local v1, "validateSessionCommand":Lco/getair/meerkat/commands/ValidateSessionCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "validateSession"

    invoke-virtual {v2, v3, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 46
    new-instance v0, Lco/getair/meerkat/commands/login/LoginCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/login/LoginCommand;-><init>()V

    .line 47
    .local v0, "loginCommand":Lco/getair/meerkat/commands/login/LoginCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "startLoginSequenceCommand"

    invoke-virtual {v2, v3, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 48
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 65
    new-instance v0, Lco/getair/meerkat/mediators/LandingMediator;

    const-string v1, "landingMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e009a

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/LandingMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    .local v0, "landingMediator":Lco/getair/meerkat/mediators/LandingMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 68
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/mediators/UserOverlookMediator;

    invoke-direct {v2}, Lco/getair/meerkat/mediators/UserOverlookMediator;-><init>()V

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 69
    return-void
.end method

.method private registerProxies()V
    .locals 4

    .prologue
    .line 53
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v0

    .line 55
    .local v0, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v2, "sessionProxy"

    new-instance v3, Lco/getair/meerkat/commands/login/LandingStartupCommand$1;

    invoke-direct {v3, p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand$1;-><init>(Lco/getair/meerkat/commands/login/LandingStartupCommand;)V

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/ApiProxy;->retrieveProxy(Ljava/lang/String;Ljava/util/concurrent/Callable;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/SessionProxy;

    .line 61
    .local v1, "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 62
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v2, 0x0

    .line 30
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 32
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->registerCommands()V

    .line 33
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->registerProxies()V

    .line 34
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->registerMediators()V

    .line 35
    const-string v1, "validateSession"

    invoke-virtual {p0, v1, v2, v2}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/LandingStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/notifications/PendingNotificationsManager;

    move-result-object v0

    .line 38
    .local v0, "pendingNotificationsManager":Lco/getair/meerkat/notifications/PendingNotificationsManager;
    invoke-virtual {v0}, Lco/getair/meerkat/notifications/PendingNotificationsManager;->cleanNotificationCenter()V

    .line 39
    return-void
.end method
