.class public Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "AddressbookUploadStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 43
    invoke-virtual {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 3

    .prologue
    .line 28
    invoke-virtual {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandUploadContacts"

    new-instance v2, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 29
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 36
    new-instance v0, Lco/getair/meerkat/mediators/AddressbookUploadMediator;

    invoke-static {}, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e0069

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/AddressbookUploadMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 37
    .local v0, "addressbookUploadMediator":Lco/getair/meerkat/mediators/AddressbookUploadMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 38
    return-void
.end method

.method private registerProxies()V
    .locals 3

    .prologue
    .line 32
    invoke-virtual {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    invoke-direct {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lco/getair/meerkat/proxies/AddressbookUploadProxy;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerProxy(Lorg/puremvc/java/multicore/interfaces/IProxy;)V

    .line 33
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 0
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 20
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 22
    invoke-direct {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->registerCommands()V

    .line 23
    invoke-direct {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->registerProxies()V

    .line 24
    invoke-direct {p0}, Lco/getair/meerkat/commands/addressbook_upload/AddressbookUploadStartupCommand;->registerMediators()V

    .line 25
    return-void
.end method
