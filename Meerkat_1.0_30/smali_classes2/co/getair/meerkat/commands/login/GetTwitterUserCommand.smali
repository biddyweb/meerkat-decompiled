.class public Lco/getair/meerkat/commands/login/GetTwitterUserCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "GetTwitterUserCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/login/GetTwitterUserCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/GetTwitterUserCommand;

    .prologue
    .line 14
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/GetTwitterUserCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 18
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 20
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/GetTwitterUserCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "twitterProxy"

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/TwitterProxy;

    .line 21
    .local v0, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    new-instance v1, Lco/getair/meerkat/commands/login/GetTwitterUserCommand$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/commands/login/GetTwitterUserCommand$1;-><init>(Lco/getair/meerkat/commands/login/GetTwitterUserCommand;)V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/TwitterProxy;->getTwitterUser(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 29
    return-void
.end method
