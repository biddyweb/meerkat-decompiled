.class public Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeSubmissionCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "PhoneActivationCodeSubmissionCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 17
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 19
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/ActivationCodeParams;

    .line 20
    .local v0, "activationCodeParams":Lco/getair/meerkat/dtos/ActivationCodeParams;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeSubmissionCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "phoneVerificationProxy"

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    .line 21
    .local v1, "phoneProxy":Lco/getair/meerkat/proxies/PhoneVerificationProxy;
    invoke-virtual {v1, v0}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;->verifyActivationCode(Lco/getair/meerkat/dtos/ActivationCodeParams;)V

    .line 22
    return-void
.end method
