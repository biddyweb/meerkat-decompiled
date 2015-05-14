.class public Lco/getair/meerkat/commands/profile/ProfileStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "ProfileStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/profile/ProfileStartupCommand;)Lco/getair/meerkat/facades/BaseFacade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/profile/ProfileStartupCommand;

    .prologue
    .line 24
    invoke-direct {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    return-object v0
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 4

    .prologue
    .line 39
    new-instance v0, Lco/getair/meerkat/commands/login/LogoutCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/login/LogoutCommand;-><init>()V

    .line 40
    .local v0, "logoutCommand":Lco/getair/meerkat/commands/login/LogoutCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "userLogout"

    invoke-virtual {v2, v3, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 42
    new-instance v1, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;

    invoke-direct {v1}, Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;-><init>()V

    .line 43
    .local v1, "updateFollowingFollowers":Lco/getair/meerkat/commands/profile/ProfileUpdateFollowingFollowers;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "profileUserLoaded"

    invoke-virtual {v2, v3, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 44
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 63
    new-instance v0, Lco/getair/meerkat/mediators/ProfileMediator;

    const-string v1, "feedMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e00aa

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/ProfileMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 64
    .local v0, "profileMediator":Lco/getair/meerkat/mediators/ProfileMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 65
    return-void
.end method

.method private registerProxies()V
    .locals 5

    .prologue
    .line 48
    new-instance v1, Lco/getair/meerkat/proxies/ProfileProxy;

    const-string v3, "profileProxy"

    invoke-direct {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lco/getair/meerkat/proxies/ProfileProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 49
    .local v1, "profileProxy":Lco/getair/meerkat/proxies/ProfileProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 51
    invoke-direct {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v0

    .line 52
    .local v0, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v3, "sessionProxy"

    new-instance v4, Lco/getair/meerkat/commands/profile/ProfileStartupCommand$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand$1;-><init>(Lco/getair/meerkat/commands/profile/ProfileStartupCommand;)V

    invoke-virtual {v0, v3, v4}, Lco/getair/meerkat/ApiProxy;->retrieveProxy(Ljava/lang/String;Ljava/util/concurrent/Callable;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/proxies/SessionProxy;

    .line 58
    .local v2, "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 59
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v2, 0x0

    .line 28
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 30
    invoke-direct {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->registerCommands()V

    .line 31
    invoke-direct {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->registerProxies()V

    .line 32
    invoke-direct {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->registerMediators()V

    .line 34
    invoke-virtual {p0}, Lco/getair/meerkat/commands/profile/ProfileStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "profileUserLoaded"

    invoke-virtual {v0, v1, v2, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    return-void
.end method
