.class public Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "BroadcastStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 65
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 4

    .prologue
    .line 40
    new-instance v0, Lco/getair/meerkat/commands/watch/AddCommentCommand;

    invoke-direct {v0}, Lco/getair/meerkat/commands/watch/AddCommentCommand;-><init>()V

    .line 41
    .local v0, "addCommentCommand":Lco/getair/meerkat/commands/watch/AddCommentCommand;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "eventAddComment"

    invoke-virtual {v1, v2, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "end"

    new-instance v3, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;

    invoke-direct {v3}, Lco/getair/meerkat/commands/broadcast/BroadcastEndCommand;-><init>()V

    invoke-virtual {v1, v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 45
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "broadcastReceivedCoverImage"

    new-instance v3, Lco/getair/meerkat/commands/broadcast/BroadcastUploadCoverImage;

    invoke-direct {v3}, Lco/getair/meerkat/commands/broadcast/BroadcastUploadCoverImage;-><init>()V

    invoke-virtual {v1, v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 46
    return-void
.end method

.method private registerMediators()V
    .locals 5

    .prologue
    const v4, 0x7f0e006e

    .line 56
    new-instance v1, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;

    const-string v2, "commentsOnVideoMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    .local v1, "commentsOnVideoMediator":Lco/getair/meerkat/mediators/CommentsOnVideoMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 59
    new-instance v0, Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v2}, Lco/getair/meerkat/mediators/BroadcastMediator;-><init>(Ljava/lang/Object;)V

    .line 60
    .local v0, "broadcastMediator":Lco/getair/meerkat/mediators/BroadcastMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 61
    return-void
.end method

.method private registerProxies()V
    .locals 3

    .prologue
    .line 49
    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/activities/BroadcastActivity;

    .line 51
    .local v1, "ownerActivity":Lco/getair/meerkat/activities/BroadcastActivity;
    new-instance v0, Lco/getair/meerkat/proxies/BroadcastProxy;

    const-string v2, "broadcastProxy"

    invoke-direct {v0, v2, v1}, Lco/getair/meerkat/proxies/BroadcastProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 52
    .local v0, "broadcastProxy":Lco/getair/meerkat/proxies/BroadcastProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 53
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 5
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 28
    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->registerCommands()V

    .line 29
    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->registerProxies()V

    .line 30
    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->registerMediators()V

    .line 32
    invoke-direct {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/activities/BroadcastActivity;

    .line 33
    .local v2, "ownerActivity":Lco/getair/meerkat/activities/BroadcastActivity;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/broadcast/BroadcastStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    const-string v4, "broadcastProxy"

    invoke-virtual {v3, v4}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/BroadcastProxy;

    .line 34
    .local v0, "broadcastProxy":Lco/getair/meerkat/proxies/BroadcastProxy;
    invoke-virtual {v2}, Lco/getair/meerkat/activities/BroadcastActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "goLiveParams"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/GoLiveParams;

    .line 36
    .local v1, "goLiveParams":Lco/getair/meerkat/dtos/GoLiveParams;
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/GoLiveParams;->getCaption()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lco/getair/meerkat/proxies/BroadcastProxy;->startGoLiveSequence(Ljava/lang/String;)V

    .line 37
    return-void
.end method
