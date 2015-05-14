.class public Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UserlistStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 67
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private getOwnerActivity()Lco/getair/meerkat/activities/UserListActivity;
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/UserListActivity;

    return-object v0
.end method

.method private registerCommands()V
    .locals 3

    .prologue
    .line 39
    new-instance v0, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/userlist/LoadUserListCommand;-><init>()V

    .line 40
    .local v0, "loadUserListCommand":Lco/getair/meerkat/commands/userlist/LoadUserListCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "userlistLoad"

    invoke-virtual {v1, v2, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 42
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 52
    new-instance v0, Lco/getair/meerkat/mediators/UserlistMediator;

    const-string v1, "userListMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e00bd

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/UserlistMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 54
    .local v0, "userlistMediator":Lco/getair/meerkat/mediators/UserlistMediator;
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getOwnerActivity()Lco/getair/meerkat/activities/UserListActivity;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/activities/UserListActivity;->getListTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/mediators/UserlistMediator;->setTitle(Ljava/lang/String;)V

    .line 55
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getOwnerActivity()Lco/getair/meerkat/activities/UserListActivity;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/activities/UserListActivity;->getShowScore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/mediators/UserlistMediator;->setShowScore(Z)V

    .line 57
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 58
    return-void
.end method

.method private registerProxies()V
    .locals 3

    .prologue
    .line 46
    new-instance v0, Lco/getair/meerkat/proxies/UserlistProxy;

    const-string v1, "userlistProxy"

    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/proxies/UserlistProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 47
    .local v0, "userlistProxy":Lco/getair/meerkat/proxies/UserlistProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 48
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 27
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 29
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->registerCommands()V

    .line 30
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->registerProxies()V

    .line 31
    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->registerMediators()V

    .line 33
    const-string v0, "userlistLoad"

    invoke-direct {p0}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->getOwnerActivity()Lco/getair/meerkat/activities/UserListActivity;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/activities/UserListActivity;->getListSource()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lco/getair/meerkat/commands/userlist/UserlistStartupCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    return-void
.end method
