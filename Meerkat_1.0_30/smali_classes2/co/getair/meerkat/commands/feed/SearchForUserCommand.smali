.class public Lco/getair/meerkat/commands/feed/SearchForUserCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "SearchForUserCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/feed/SearchForUserCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/feed/SearchForUserCommand;

    .prologue
    .line 21
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/SearchForUserCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 25
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 27
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 28
    .local v1, "username":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/feed/SearchForUserCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "searchProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/SearchProxy;

    .line 29
    .local v0, "searchProxy":Lco/getair/meerkat/proxies/SearchProxy;
    new-instance v2, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/commands/feed/SearchForUserCommand$1;-><init>(Lco/getair/meerkat/commands/feed/SearchForUserCommand;)V

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/proxies/SearchProxy;->searchForUser(Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 54
    return-void
.end method
