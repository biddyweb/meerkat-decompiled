.class public Lco/getair/meerkat/mediators/PhoneVerificationMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "PhoneVerificationMediator.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "PhoneVerificationMediator"


# instance fields
.field private continueButton:Landroid/widget/Button;

.field private errorTextView:Landroid/widget/TextView;

.field private inputView:Landroid/view/View;

.field private mobileNumberEditText:Landroid/widget/EditText;

.field private openCountryPickerButton:Landroid/widget/Button;

.field private progressBar:Landroid/widget/ProgressBar;

.field private rootView:Landroid/view/View;

.field private selectedCountryCode:Ljava/lang/String;

.field private selectedCountryDialCode:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->rootView:Landroid/view/View;

    .line 60
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00a4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->inputView:Landroid/view/View;

    .line 61
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00a9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->progressBar:Landroid/widget/ProgressBar;

    .line 62
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00a5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->openCountryPickerButton:Landroid/widget/Button;

    .line 63
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00a8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->continueButton:Landroid/widget/Button;

    .line 64
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00a6

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->mobileNumberEditText:Landroid/widget/EditText;

    .line 65
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e00a7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->errorTextView:Landroid/widget/TextView;

    .line 67
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->openCountryPickerButton:Landroid/widget/Button;

    new-instance v1, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator$1;-><init>(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->continueButton:Landroid/widget/Button;

    new-instance v1, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator$2;-><init>(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->openCountryPickerButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryCode:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lco/getair/meerkat/mediators/PhoneVerificationMediator;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryCode:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryDialCode:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lco/getair/meerkat/mediators/PhoneVerificationMediator;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->selectedCountryDialCode:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/support/v4/app/FragmentActivity;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->getOwnerActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->mobileNumberEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->promptInvalidNumberMessage()V

    return-void
.end method

.method static synthetic access$600(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->inputView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$700(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method public static getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    const-string v0, "PhoneVerificationMediator"

    return-object v0
.end method

.method private getOwnerActivity()Landroid/support/v4/app/FragmentActivity;
    .locals 1

    .prologue
    .line 156
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/FragmentActivity;

    return-object v0
.end method

.method private phoneNumberSent(Ljava/lang/String;)V
    .locals 3
    .param p1, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 184
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 185
    .local v1, "ownerActivity":Landroid/app/Activity;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 186
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "phoneNumberBundleKey"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 187
    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 188
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 189
    return-void
.end method

.method private promptInvalidNumberMessage()V
    .locals 4

    .prologue
    .line 162
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 163
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Invalid Phone Number"

    .line 164
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Please double check that you have entered your number correctly."

    .line 165
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Ok"

    new-instance v3, Lco/getair/meerkat/mediators/PhoneVerificationMediator$3;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator$3;-><init>(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V

    .line 166
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 170
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 171
    return-void
.end method

.method private showError()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 176
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->inputView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 177
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 178
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->errorTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 179
    return-void
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 144
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "eventSendPhoneNumberForVerificationFailed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->showError()V

    .line 149
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "eventPhoneNumberSentForVerification"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 151
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lco/getair/meerkat/mediators/PhoneVerificationMediator;->phoneNumberSent(Ljava/lang/String;)V

    .line 153
    :cond_1
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 134
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventSendPhoneNumberForVerificationFailed"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventPhoneNumberSentForVerification"

    aput-object v2, v0, v1

    return-object v0
.end method
