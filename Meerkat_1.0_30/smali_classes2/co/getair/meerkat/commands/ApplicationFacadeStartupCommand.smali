.class public Lco/getair/meerkat/commands/ApplicationFacadeStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "ApplicationFacadeStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private registerProxies(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-virtual {p0}, Lco/getair/meerkat/commands/ApplicationFacadeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    .line 32
    .local v0, "facade":Lorg/puremvc/java/multicore/patterns/facade/Facade;
    new-instance v1, Lco/getair/meerkat/proxies/GraphProxy;

    const-string v2, "graphProxy"

    invoke-direct {v1, v2, p1}, Lco/getair/meerkat/proxies/GraphProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 34
    new-instance v1, Lco/getair/meerkat/proxies/InboxProxy;

    const-string v2, "inboxProxy"

    invoke-direct {v1, v2, p1}, Lco/getair/meerkat/proxies/InboxProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 36
    new-instance v1, Lco/getair/meerkat/proxies/TwitterProxy;

    const-string v2, "twitterProxy"

    invoke-direct {v1, v2, p1}, Lco/getair/meerkat/proxies/TwitterProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 38
    new-instance v1, Lco/getair/meerkat/proxies/AuthorizeProxy;

    const-string v2, "authorizeProxy"

    invoke-direct {v1, v2, p1}, Lco/getair/meerkat/proxies/AuthorizeProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 40
    new-instance v1, Lco/getair/meerkat/proxies/ResourcesProxy;

    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->NAME()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lco/getair/meerkat/proxies/ResourcesProxy;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 41
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 1
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 24
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 25
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 26
    .local v0, "context":Landroid/content/Context;
    invoke-direct {p0, v0}, Lco/getair/meerkat/commands/ApplicationFacadeStartupCommand;->registerProxies(Landroid/content/Context;)V

    .line 27
    return-void
.end method
