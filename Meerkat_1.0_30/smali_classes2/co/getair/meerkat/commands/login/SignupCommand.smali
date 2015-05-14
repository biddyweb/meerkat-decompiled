.class public Lco/getair/meerkat/commands/login/SignupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "SignupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 19
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 21
    const-string v2, "SignupCommand"

    const-string v3, "start"

    invoke-static {v2, v3}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/models/User;

    .line 24
    .local v1, "twitterUser":Lcom/twitter/sdk/android/core/models/User;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/login/SignupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "sessionProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/SessionProxy;

    .line 25
    .local v0, "sessionProxy":Lco/getair/meerkat/proxies/SessionProxy;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/SessionProxy;->startSignUpFlow(Lcom/twitter/sdk/android/core/models/User;)V

    .line 26
    return-void
.end method
