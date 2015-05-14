.class public Lco/getair/meerkat/commands/login/AuthorizeCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "AuthorizeCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/AuthorizeCommand;

    .prologue
    .line 19
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/AuthorizeCommand;

    .prologue
    .line 19
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/AuthorizeCommand;

    .prologue
    .line 19
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/AuthorizeCommand;

    .prologue
    .line 19
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/commands/login/AuthorizeCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/login/AuthorizeCommand;

    .prologue
    .line 19
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 24
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;

    .line 25
    .local v1, "type":Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "authorizeProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/AuthorizeProxy;

    .line 27
    .local v0, "authorizeProxy":Lco/getair/meerkat/proxies/AuthorizeProxy;
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    new-instance v3, Lco/getair/meerkat/commands/login/AuthorizeCommand$1;

    invoke-direct {v3, p0}, Lco/getair/meerkat/commands/login/AuthorizeCommand$1;-><init>(Lco/getair/meerkat/commands/login/AuthorizeCommand;)V

    invoke-virtual {v0, v2, v1, v3}, Lco/getair/meerkat/proxies/AuthorizeProxy;->authorizeWithNewToken(Ljava/lang/Boolean;Lco/getair/meerkat/proxies/AuthorizeProxy$AuthorizeType;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 47
    return-void
.end method
