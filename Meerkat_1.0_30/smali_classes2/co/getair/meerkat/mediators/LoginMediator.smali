.class public Lco/getair/meerkat/mediators/LoginMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "LoginMediator.java"


# instance fields
.field private twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    check-cast p2, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    .line 33
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    new-instance v1, Lco/getair/meerkat/mediators/LoginMediator$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/LoginMediator$1;-><init>(Lco/getair/meerkat/mediators/LoginMediator;)V

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    new-instance v1, Lco/getair/meerkat/mediators/LoginMediator$2;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/LoginMediator$2;-><init>(Lco/getair/meerkat/mediators/LoginMediator;)V

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setCallback(Lcom/twitter/sdk/android/core/Callback;)V

    .line 56
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/LoginMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/LoginMediator;

    .prologue
    .line 25
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/LoginMediator;)Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/LoginMediator;

    .prologue
    .line 25
    iget-object v0, p0, Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/LoginMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/LoginMediator;

    .prologue
    .line 25
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/LoginMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/LoginMediator;

    .prologue
    .line 25
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 8
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v7, 0x0

    .line 73
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventTwitterLoginDone"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 75
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/OnActivityResultParams;

    .line 76
    .local v1, "onActivityResultParams":Lco/getair/meerkat/dtos/OnActivityResultParams;
    iget-object v3, p0, Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/OnActivityResultParams;->getRequestCode()I

    move-result v4

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/OnActivityResultParams;->getResultCode()I

    move-result v5

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/OnActivityResultParams;->getData()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->onActivityResult(IILandroid/content/Intent;)V

    .line 79
    .end local v1    # "onActivityResultParams":Lco/getair/meerkat/dtos/OnActivityResultParams;
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventSessionInvalid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 81
    iget-object v3, p0, Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setVisibility(I)V

    .line 84
    :cond_1
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventSessionIsValid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 87
    iget-object v3, p0, Lco/getair/meerkat/mediators/LoginMediator;->twitterLoginButton:Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lcom/twitter/sdk/android/core/identity/TwitterLoginButton;->setVisibility(I)V

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    .line 90
    .local v2, "ownerActivity":Landroid/app/Activity;
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lco/getair/meerkat/activities/FeedActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 91
    .local v0, "feedActivityIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 92
    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 95
    .end local v0    # "feedActivityIntent":Landroid/content/Intent;
    .end local v2    # "ownerActivity":Landroid/app/Activity;
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "userDoesNotExist"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 97
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    const-string v4, "getTwitterUser"

    invoke-virtual {v3, v4, v7, v7}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    :cond_3
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventTwitterUserArrived"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 102
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    const-string v4, "startSignupSequenceCommand"

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v7}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    :cond_4
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventTwitterFriendsListArrived"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 107
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/LoginMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    const-string v4, "uploadTwitterFriendsList"

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v7}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    :cond_5
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 60
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventTwitterLoginDone"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventSessionInvalid"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "eventSessionIsValid"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "eventTwitterUserArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "userDoesNotExist"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "eventTwitterFriendsListArrived"

    aput-object v2, v0, v1

    return-object v0
.end method
