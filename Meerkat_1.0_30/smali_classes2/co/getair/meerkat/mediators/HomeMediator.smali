.class public Lco/getair/meerkat/mediators/HomeMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "HomeMediator.java"


# instance fields
.field private disclaimerTextView:Landroid/widget/TextView;

.field private loginProgressBar:Landroid/widget/ProgressBar;

.field private loginSuccessfulView:Lco/getair/meerkat/views/LoginSuccessfulView;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, p2

    .line 49
    check-cast v0, Landroid/view/View;

    .line 51
    .local v0, "homeView":Landroid/view/View;
    const v1, 0x7f0e0098

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/views/LoginSuccessfulView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/HomeMediator;->loginSuccessfulView:Lco/getair/meerkat/views/LoginSuccessfulView;

    .line 52
    const v1, 0x7f0e0099

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lco/getair/meerkat/mediators/HomeMediator;->loginProgressBar:Landroid/widget/ProgressBar;

    .line 54
    const v1, 0x7f0e0096

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/HomeMediator;->disclaimerTextView:Landroid/widget/TextView;

    .line 55
    return-void
.end method

.method private linkifyTermsOfUse()V
    .locals 11

    .prologue
    .line 99
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/HomeMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v7}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 100
    .local v5, "res":Landroid/content/res/Resources;
    const v7, 0x7f09008e

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 102
    .local v6, "termsOfServiceString":Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 103
    .local v4, "linkableTexts":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "www.meerkatapp.co"

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 107
    .local v3, "linkNamesString":Ljava/lang/StringBuffer;
    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 108
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 109
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    if-lez v8, :cond_0

    .line 110
    const-string v8, "|"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 113
    :cond_0
    const-string v8, "%s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 117
    .end local v1    # "key":Ljava/lang/String;
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 119
    .local v0, "LINK_REGEX_PATTERN":Ljava/util/regex/Pattern;
    iget-object v7, p0, Lco/getair/meerkat/mediators/HomeMediator;->disclaimerTextView:Landroid/widget/TextView;

    const-string v8, "http://"

    const/4 v9, 0x0

    new-instance v10, Lco/getair/meerkat/mediators/HomeMediator$1;

    invoke-direct {v10, p0, v4}, Lco/getair/meerkat/mediators/HomeMediator$1;-><init>(Lco/getair/meerkat/mediators/HomeMediator;Ljava/util/HashMap;)V

    invoke-static {v7, v0, v8, v9, v10}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;Ljava/util/regex/Pattern;Ljava/lang/String;Landroid/text/util/Linkify$MatchFilter;Landroid/text/util/Linkify$TransformFilter;)V

    .line 127
    return-void
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 5
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v4, 0x4

    .line 71
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "eventLoginSequenceStart"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 72
    iget-object v2, p0, Lco/getair/meerkat/mediators/HomeMediator;->loginProgressBar:Landroid/widget/ProgressBar;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 75
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "eventSessionInvalid"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "eventTwitterLoginError"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 78
    :cond_1
    iget-object v2, p0, Lco/getair/meerkat/mediators/HomeMediator;->loginSuccessfulView:Lco/getair/meerkat/views/LoginSuccessfulView;

    invoke-virtual {v2, v4}, Lco/getair/meerkat/views/LoginSuccessfulView;->setVisibility(I)V

    .line 79
    iget-object v2, p0, Lco/getair/meerkat/mediators/HomeMediator;->loginProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 82
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "eventSessionIsValid"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 86
    iget-object v2, p0, Lco/getair/meerkat/mediators/HomeMediator;->loginSuccessfulView:Lco/getair/meerkat/views/LoginSuccessfulView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lco/getair/meerkat/views/LoginSuccessfulView;->setAlpha(F)V

    .line 87
    iget-object v2, p0, Lco/getair/meerkat/mediators/HomeMediator;->loginProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 90
    :cond_3
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "eventAskForPhoneVerification"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 91
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/HomeMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 92
    .local v1, "ownerActivity":Landroid/app/Activity;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/activities/PhoneVerificationActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 95
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "ownerActivity":Landroid/app/Activity;
    :cond_4
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 59
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventLoginSequenceStart"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventSessionInvalid"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "eventSessionIsValid"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "eventTwitterLoginError"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 6

    .prologue
    .line 38
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 40
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/HomeMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 41
    .local v0, "res":Landroid/content/res/Resources;
    const v2, 0x7f09008e

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 42
    .local v1, "termsOfServiceString":Ljava/lang/String;
    iget-object v2, p0, Lco/getair/meerkat/mediators/HomeMediator;->disclaimerTextView:Landroid/widget/TextView;

    const v3, 0x7f09008d

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v0, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    invoke-direct {p0}, Lco/getair/meerkat/mediators/HomeMediator;->linkifyTermsOfUse()V

    .line 44
    return-void
.end method
