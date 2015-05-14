.class public Lco/getair/meerkat/mediators/LandingMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "LandingMediator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    }
.end annotation


# instance fields
.field rootView:Landroid/view/View;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/LandingMediator;->rootView:Landroid/view/View;

    .line 35
    return-void
.end method

.method private parseCallingIntentExtras(Landroid/os/Bundle;)Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    .locals 2
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 122
    const-string v1, "broadcastId"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "broadcastId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 124
    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->WATCH:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    .line 126
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->FEED:Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    goto :goto_0
.end method

.method private pushFeedActivity()V
    .locals 3

    .prologue
    .line 103
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LandingMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 104
    .local v1, "ownerActivity":Landroid/app/Activity;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/activities/FeedActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 105
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 106
    return-void
.end method

.method private pushPhoneVerificationActivity()V
    .locals 3

    .prologue
    .line 116
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LandingMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 117
    .local v1, "ownerActivity":Landroid/app/Activity;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/activities/PhoneVerificationActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 118
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 119
    return-void
.end method

.method private pushWatchActivity(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 109
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LandingMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 110
    .local v1, "ownerActivity":Landroid/app/Activity;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/activities/WatchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 111
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 112
    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 113
    return-void
.end method

.method private redirectToIntentActivity(Landroid/content/Intent;)V
    .locals 5
    .param p1, "callingIntent"    # Landroid/content/Intent;

    .prologue
    .line 83
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 84
    .local v1, "extras":Landroid/os/Bundle;
    invoke-direct {p0, v1}, Lco/getair/meerkat/mediators/LandingMediator;->parseCallingIntentExtras(Landroid/os/Bundle;)Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;

    move-result-object v2

    .line 86
    .local v2, "screenToOpen":Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    sget-object v3, Lco/getair/meerkat/mediators/LandingMediator$1;->$SwitchMap$co$getair$meerkat$mediators$LandingMediator$ScreenToOpen:[I

    invoke-virtual {v2}, Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 100
    .end local v1    # "extras":Landroid/os/Bundle;
    .end local v2    # "screenToOpen":Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    :goto_0
    return-void

    .line 88
    .restart local v1    # "extras":Landroid/os/Bundle;
    .restart local v2    # "screenToOpen":Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    :pswitch_0
    invoke-direct {p0}, Lco/getair/meerkat/mediators/LandingMediator;->pushFeedActivity()V

    .line 89
    invoke-direct {p0, v1}, Lco/getair/meerkat/mediators/LandingMediator;->pushWatchActivity(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 97
    .end local v1    # "extras":Landroid/os/Bundle;
    .end local v2    # "screenToOpen":Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    invoke-direct {p0}, Lco/getair/meerkat/mediators/LandingMediator;->pushFeedActivity()V

    goto :goto_0

    .line 93
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "extras":Landroid/os/Bundle;
    .restart local v2    # "screenToOpen":Lco/getair/meerkat/mediators/LandingMediator$ScreenToOpen;
    :pswitch_1
    :try_start_1
    invoke-direct {p0}, Lco/getair/meerkat/mediators/LandingMediator;->pushFeedActivity()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 86
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 6
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 52
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LandingMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    .line 54
    .local v3, "ownerActivity":Landroid/app/Activity;
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "eventSessionInvalid"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 57
    new-instance v1, Landroid/content/Intent;

    const-class v4, Lco/getair/meerkat/activities/HomeActivity;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 58
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {v3, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 61
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "eventSessionIsValid"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 63
    const-string v4, "eventStartUserOverlook"

    invoke-virtual {p0, v4}, Lco/getair/meerkat/mediators/LandingMediator;->sendNotification(Ljava/lang/String;)V

    .line 66
    :cond_1
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "eventAskForPhoneVerification"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 67
    invoke-direct {p0}, Lco/getair/meerkat/mediators/LandingMediator;->pushPhoneVerificationActivity()V

    .line 70
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "eventUserOverlookFlowCompleted"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 72
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LandingMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/LandingActivityFacade;

    .line 73
    .local v2, "landingActivityFacade":Lco/getair/meerkat/facades/LandingActivityFacade;
    invoke-virtual {v2}, Lco/getair/meerkat/facades/LandingActivityFacade;->getCallingIntent()Landroid/content/Intent;

    move-result-object v0

    .line 75
    .local v0, "callingIntent":Landroid/content/Intent;
    invoke-direct {p0, v0}, Lco/getair/meerkat/mediators/LandingMediator;->redirectToIntentActivity(Landroid/content/Intent;)V

    .line 78
    .end local v0    # "callingIntent":Landroid/content/Intent;
    .end local v2    # "landingActivityFacade":Lco/getair/meerkat/facades/LandingActivityFacade;
    :cond_3
    invoke-virtual {v3}, Landroid/app/Activity;->finish()V

    .line 79
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 39
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventSessionInvalid"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventSessionIsValid"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "eventAskForPhoneVerification"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "eventAskForAddressBookUpload"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "eventUserOverlookFlowCompleted"

    aput-object v2, v0, v1

    return-object v0
.end method
