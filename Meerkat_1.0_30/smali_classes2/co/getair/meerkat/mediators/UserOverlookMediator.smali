.class public Lco/getair/meerkat/mediators/UserOverlookMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "UserOverlookMediator.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "UserOverlookMediator"


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 19
    const-string v0, "UserOverlookMediator"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 20
    return-void
.end method

.method public static getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    const-string v0, "UserOverlookMediator"

    return-object v0
.end method

.method private proceedToNextStep()V
    .locals 4

    .prologue
    .line 44
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/UserOverlookMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/dtos/Session;->loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;

    move-result-object v0

    .line 46
    .local v0, "currentSession":Lco/getair/meerkat/dtos/Session;
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber()Z

    move-result v2

    .line 47
    .local v2, "shouldAskForPhoneNumber":Z
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/Session;->shouldAskForAddressBook()Z

    move-result v1

    .line 49
    .local v1, "shouldAskForAddressBookUpload":Z
    if-eqz v2, :cond_0

    const-string v3, "phoneVerification"

    invoke-static {v3}, Lco/getair/meerkat/FeatureFlag;->isFeatureAvailable(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 50
    const-string v3, "eventAskForPhoneVerification"

    invoke-virtual {p0, v3}, Lco/getair/meerkat/mediators/UserOverlookMediator;->sendNotification(Ljava/lang/String;)V

    .line 56
    :goto_0
    return-void

    .line 51
    :cond_0
    if-eqz v1, :cond_1

    const-string v3, "phoneVerification"

    invoke-static {v3}, Lco/getair/meerkat/FeatureFlag;->isFeatureAvailable(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 52
    const-string v3, "eventAskForAddressBookUpload"

    invoke-virtual {p0, v3}, Lco/getair/meerkat/mediators/UserOverlookMediator;->sendNotification(Ljava/lang/String;)V

    goto :goto_0

    .line 54
    :cond_1
    const-string v3, "eventUserOverlookFlowCompleted"

    invoke-virtual {p0, v3}, Lco/getair/meerkat/mediators/UserOverlookMediator;->sendNotification(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 37
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "eventStartUserOverlook"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "eventDidCompleteStep"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 39
    :cond_0
    invoke-direct {p0}, Lco/getair/meerkat/mediators/UserOverlookMediator;->proceedToNextStep()V

    .line 41
    :cond_1
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 28
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventStartUserOverlook"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventDidCompleteStep"

    aput-object v2, v0, v1

    return-object v0
.end method
