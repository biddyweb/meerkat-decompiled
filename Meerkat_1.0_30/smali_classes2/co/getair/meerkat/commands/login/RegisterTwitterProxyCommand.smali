.class public Lco/getair/meerkat/commands/login/RegisterTwitterProxyCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "RegisterTwitterProxyCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 16
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 18
    new-instance v0, Lco/getair/meerkat/proxies/TwitterProxy;

    const-string v1, "twitterProxy"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/proxies/TwitterProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 19
    .local v0, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/RegisterTwitterProxyCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 20
    return-void
.end method
