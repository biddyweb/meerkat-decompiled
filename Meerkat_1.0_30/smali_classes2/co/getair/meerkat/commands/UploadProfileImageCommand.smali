.class public Lco/getair/meerkat/commands/UploadProfileImageCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UploadProfileImageCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/UploadProfileImageCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/UploadProfileImageCommand;

    .prologue
    .line 18
    invoke-virtual {p0}, Lco/getair/meerkat/commands/UploadProfileImageCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 24
    invoke-virtual {p0}, Lco/getair/meerkat/commands/UploadProfileImageCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "twitterProxy"

    invoke-virtual {v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/TwitterProxy;

    .line 26
    .local v0, "twitterProxy":Lco/getair/meerkat/proxies/TwitterProxy;
    new-instance v1, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;

    invoke-direct {v1, p0, v0}, Lco/getair/meerkat/commands/UploadProfileImageCommand$1;-><init>(Lco/getair/meerkat/commands/UploadProfileImageCommand;Lco/getair/meerkat/proxies/TwitterProxy;)V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/TwitterProxy;->getTwitterUser(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 54
    return-void
.end method
