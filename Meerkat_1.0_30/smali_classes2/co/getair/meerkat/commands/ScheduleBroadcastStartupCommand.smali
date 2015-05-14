.class public Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "ScheduleBroadcastStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 66
    invoke-virtual {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private getOwnerActivity()Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v0

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    return-object v0
.end method

.method private registerCommands()V
    .locals 3

    .prologue
    .line 41
    invoke-virtual {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "scheduleBroadcastStartedScheduling"

    new-instance v2, Lco/getair/meerkat/commands/schedule/ScheduleBroadcastCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/schedule/ScheduleBroadcastCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 42
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 55
    new-instance v0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    const-string v1, "scheduleBroadcastMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e00b5

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    .local v0, "scheduleBroadcastMediator":Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 57
    return-void
.end method

.method private registerProxies()V
    .locals 3

    .prologue
    .line 47
    invoke-direct {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    .line 49
    .local v0, "ownerActivity":Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    new-instance v1, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;

    const-string v2, "scheduleBroadcastProxy"

    invoke-direct {v1, v2, v0}, Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 50
    .local v1, "scheduleBroadcastProxy":Lco/getair/meerkat/proxies/ScheduleBroadcastProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 51
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 0
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 32
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 34
    invoke-direct {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->registerCommands()V

    .line 35
    invoke-direct {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->registerProxies()V

    .line 36
    invoke-direct {p0}, Lco/getair/meerkat/commands/ScheduleBroadcastStartupCommand;->registerMediators()V

    .line 37
    return-void
.end method
