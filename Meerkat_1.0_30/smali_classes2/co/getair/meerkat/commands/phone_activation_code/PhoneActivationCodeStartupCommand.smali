.class public Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "PhoneActivationCodeStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 45
    invoke-virtual {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 3

    .prologue
    .line 30
    invoke-virtual {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "eventSendActivationCode"

    new-instance v2, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeSubmissionCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeSubmissionCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 31
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 38
    new-instance v0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    invoke-static {}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e009b

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    .local v0, "phoneActivationCodeMediator":Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 40
    return-void
.end method

.method private registerProxies()V
    .locals 4

    .prologue
    .line 34
    invoke-virtual {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/proxies/PhoneVerificationProxy;

    const-string v2, "phoneVerificationProxy"

    invoke-direct {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lco/getair/meerkat/proxies/PhoneVerificationProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 35
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 0
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 24
    invoke-direct {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->registerCommands()V

    .line 25
    invoke-direct {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->registerProxies()V

    .line 26
    invoke-direct {p0}, Lco/getair/meerkat/commands/phone_activation_code/PhoneActivationCodeStartupCommand;->registerMediators()V

    .line 27
    return-void
.end method
