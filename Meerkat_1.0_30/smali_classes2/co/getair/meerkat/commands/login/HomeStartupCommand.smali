.class public Lco/getair/meerkat/commands/login/HomeStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "HomeStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/login/HomeStartupCommand;)Lco/getair/meerkat/facades/BaseFacade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/HomeStartupCommand;

    .prologue
    .line 23
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    return-object v0
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 81
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 8

    .prologue
    .line 36
    new-instance v5, Lco/getair/meerkat/commands/ValidateSessionCommand;

    invoke-direct {v5}, Lco/getair/meerkat/commands/ValidateSessionCommand;-><init>()V

    .line 37
    .local v5, "validateSessionCommand":Lco/getair/meerkat/commands/ValidateSessionCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v6

    const-string v7, "validateSession"

    invoke-virtual {v6, v7, v5}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 39
    new-instance v1, Lco/getair/meerkat/commands/login/LoginCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/login/LoginCommand;-><init>()V

    .line 40
    .local v1, "loginCommand":Lco/getair/meerkat/commands/login/LoginCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v6

    const-string v7, "startLoginSequenceCommand"

    invoke-virtual {v6, v7, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 42
    new-instance v0, Lco/getair/meerkat/commands/login/GetTwitterUserCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/login/GetTwitterUserCommand;-><init>()V

    .line 43
    .local v0, "getTwitterUserCommand":Lco/getair/meerkat/commands/login/GetTwitterUserCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v6

    const-string v7, "getTwitterUser"

    invoke-virtual {v6, v7, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 45
    new-instance v2, Lco/getair/meerkat/commands/login/SignupCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/login/SignupCommand;-><init>()V

    .line 46
    .local v2, "signupCommand":Lco/getair/meerkat/commands/login/SignupCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v6

    const-string v7, "startSignupSequenceCommand"

    invoke-virtual {v6, v7, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 48
    new-instance v3, Lco/getair/meerkat/commands/UploadProfileImageCommand;

    invoke-direct {v3}, Lco/getair/meerkat/commands/UploadProfileImageCommand;-><init>()V

    .line 49
    .local v3, "uploadProfileImageCommand":Lco/getair/meerkat/commands/UploadProfileImageCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v6

    const-string v7, "uploadProfileImage"

    invoke-virtual {v6, v7, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 51
    new-instance v4, Lco/getair/meerkat/commands/login/UploadTwitterFriendsListCommand;

    invoke-direct {v4}, Lco/getair/meerkat/commands/login/UploadTwitterFriendsListCommand;-><init>()V

    .line 52
    .local v4, "uploadTwitterFriendsListCommand":Lco/getair/meerkat/commands/login/UploadTwitterFriendsListCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v6

    const-string v7, "uploadTwitterFriendsList"

    invoke-virtual {v6, v7, v4}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 53
    return-void
.end method

.method private registerMediators()V
    .locals 5

    .prologue
    .line 71
    new-instance v1, Lco/getair/meerkat/mediators/LoginMediator;

    const-string v2, "loginMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0e0097

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lco/getair/meerkat/mediators/LoginMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .local v1, "loginMediator":Lco/getair/meerkat/mediators/LoginMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 74
    new-instance v0, Lco/getair/meerkat/mediators/HomeMediator;

    const-string v2, "homeMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0e0093

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lco/getair/meerkat/mediators/HomeMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .local v0, "homeMediator":Lco/getair/meerkat/mediators/HomeMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 76
    return-void
.end method

.method private registerProxies()V
    .locals 4

    .prologue
    .line 58
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v0

    .line 60
    .local v0, "apiProxy":Lco/getair/meerkat/ApiProxy;
    const-string v2, "sessionProxy"

    new-instance v3, Lco/getair/meerkat/commands/login/HomeStartupCommand$1;

    invoke-direct {v3, p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand$1;-><init>(Lco/getair/meerkat/commands/login/HomeStartupCommand;)V

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/ApiProxy;->retrieveProxy(Ljava/lang/String;Ljava/util/concurrent/Callable;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/SessionProxy;

    .line 66
    .local v1, "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 68
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v1, 0x0

    .line 27
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 29
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->registerCommands()V

    .line 30
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->registerProxies()V

    .line 31
    invoke-direct {p0}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->registerMediators()V

    .line 32
    const-string v0, "validateSession"

    invoke-virtual {p0, v0, v1, v1}, Lco/getair/meerkat/commands/login/HomeStartupCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    return-void
.end method
