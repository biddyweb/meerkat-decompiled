.class public Lco/getair/meerkat/facades/ApplicationFacade;
.super Lorg/puremvc/java/multicore/patterns/facade/Facade;
.source "ApplicationFacade.java"


# instance fields
.field private doAuthorize:Landroid/content/BroadcastReceiver;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;-><init>(Ljava/lang/String;)V

    .line 23
    new-instance v0, Lco/getair/meerkat/facades/ApplicationFacade$1;

    invoke-direct {v0, p0}, Lco/getair/meerkat/facades/ApplicationFacade$1;-><init>(Lco/getair/meerkat/facades/ApplicationFacade;)V

    iput-object v0, p0, Lco/getair/meerkat/facades/ApplicationFacade;->doAuthorize:Landroid/content/BroadcastReceiver;

    .line 32
    return-void
.end method

.method public static getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;
    .locals 2
    .param p0, "multitonKey"    # Ljava/lang/String;

    .prologue
    .line 36
    sget-object v0, Lco/getair/meerkat/facades/ApplicationFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 37
    sget-object v0, Lco/getair/meerkat/facades/ApplicationFacade;->instanceMap:Ljava/util/Map;

    new-instance v1, Lco/getair/meerkat/facades/ApplicationFacade;

    invoke-direct {v1, p0}, Lco/getair/meerkat/facades/ApplicationFacade;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    :cond_0
    sget-object v0, Lco/getair/meerkat/facades/ApplicationFacade;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/ApplicationFacade;

    return-object v0
.end method


# virtual methods
.method protected initializeController()V
    .locals 2

    .prologue
    .line 45
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->initializeController()V

    .line 47
    const-string v0, "startupApplicationFacade"

    new-instance v1, Lco/getair/meerkat/commands/ApplicationFacadeStartupCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/ApplicationFacadeStartupCommand;-><init>()V

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 49
    const-string v0, "commandGetInbox"

    new-instance v1, Lco/getair/meerkat/commands/GetInboxCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/GetInboxCommand;-><init>()V

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 50
    const-string v0, "followUserCommand"

    new-instance v1, Lco/getair/meerkat/commands/FollowUserCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/FollowUserCommand;-><init>()V

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 51
    const-string v0, "unfollowUserCommand"

    new-instance v1, Lco/getair/meerkat/commands/UnfollowUserCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/UnfollowUserCommand;-><init>()V

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 54
    const-string v0, "authorizationStart"

    new-instance v1, Lco/getair/meerkat/commands/login/AuthorizeCommand;

    invoke-direct {v1}, Lco/getair/meerkat/commands/login/AuthorizeCommand;-><init>()V

    invoke-virtual {p0, v0, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 56
    return-void
.end method

.method public startup(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/facades/ApplicationFacade;->doAuthorize:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "notificationDoAuthorize"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 63
    const-string v0, "startupApplicationFacade"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lco/getair/meerkat/facades/ApplicationFacade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    return-void
.end method
