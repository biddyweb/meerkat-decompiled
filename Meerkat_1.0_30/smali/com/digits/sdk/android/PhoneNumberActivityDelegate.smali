.class Lcom/digits/sdk/android/PhoneNumberActivityDelegate;
.super Lcom/digits/sdk/android/DigitsActivityDelegateImpl;
.source "PhoneNumberActivityDelegate.java"

# interfaces
.implements Lcom/digits/sdk/android/PhoneNumberTask$Listener;


# instance fields
.field controller:Lcom/digits/sdk/android/PhoneNumberController;

.field countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

.field phoneEditText:Landroid/widget/EditText;

.field sendButton:Lcom/digits/sdk/android/StateButton;

.field termsTextView:Landroid/widget/TextView;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl;-><init>()V

    return-void
.end method

.method private executePhoneNumberTask(Lcom/digits/sdk/android/PhoneNumberUtils;)V
    .locals 3
    .param p1, "phoneNumberUtils"    # Lcom/digits/sdk/android/PhoneNumberUtils;

    .prologue
    .line 55
    new-instance v0, Lcom/digits/sdk/android/PhoneNumberTask;

    invoke-direct {v0, p1, p0}, Lcom/digits/sdk/android/PhoneNumberTask;-><init>(Lcom/digits/sdk/android/PhoneNumberUtils;Lcom/digits/sdk/android/PhoneNumberTask$Listener;)V

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v1

    invoke-virtual {v1}, Lcom/digits/sdk/android/Digits;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/digits/sdk/android/PhoneNumberTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Lio/fabric/sdk/android/services/concurrency/AsyncTask;

    .line 57
    return-void
.end method


# virtual methods
.method public getLayoutId()I
    .locals 1

    .prologue
    .line 22
    sget v0, Lcom/digits/sdk/android/R$layout;->dgts__activity_phone_number:I

    return v0
.end method

.method public init(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 34
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__countryCode:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/CountryListSpinner;

    iput-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

    .line 35
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__sendCodeButton:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/StateButton;

    iput-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->sendButton:Lcom/digits/sdk/android/StateButton;

    .line 36
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__phoneNumberEditText:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->phoneEditText:Landroid/widget/EditText;

    .line 37
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__termsText:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->termsTextView:Landroid/widget/TextView;

    .line 39
    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->initController(Landroid/os/Bundle;)Lcom/digits/sdk/android/PhoneNumberController;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->controller:Lcom/digits/sdk/android/PhoneNumberController;

    .line 41
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->controller:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v1, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->phoneEditText:Landroid/widget/EditText;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->setUpEditText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/EditText;)V

    .line 43
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->controller:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v1, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->setUpSendButton(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Lcom/digits/sdk/android/StateButton;)V

    .line 45
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->controller:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v1, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->termsTextView:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V

    .line 47
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->setUpCountrySpinner(Lcom/digits/sdk/android/CountryListSpinner;)V

    .line 49
    new-instance v0, Lcom/digits/sdk/android/PhoneNumberUtils;

    invoke-static {p1}, Lcom/digits/sdk/android/SimManager;->createSimManager(Landroid/content/Context;)Lcom/digits/sdk/android/SimManager;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/digits/sdk/android/PhoneNumberUtils;-><init>(Lcom/digits/sdk/android/SimManager;)V

    invoke-direct {p0, v0}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->executePhoneNumberTask(Lcom/digits/sdk/android/PhoneNumberUtils;)V

    .line 51
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->phoneEditText:Landroid/widget/EditText;

    invoke-static {p1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->openKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 52
    return-void
.end method

.method initController(Landroid/os/Bundle;)Lcom/digits/sdk/android/PhoneNumberController;
    .locals 5
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 60
    new-instance v1, Lcom/digits/sdk/android/PhoneNumberController;

    const-string v0, "receiver"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->sendButton:Lcom/digits/sdk/android/StateButton;

    iget-object v3, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->phoneEditText:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/digits/sdk/android/PhoneNumberController;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/CountryListSpinner;)V

    return-object v1
.end method

.method public isValid(Landroid/os/Bundle;)Z
    .locals 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 27
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "receiver"

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Lcom/digits/sdk/android/BundleManager;->assertContains(Landroid/os/Bundle;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onLoadComplete(Lcom/digits/sdk/android/PhoneNumber;)V
    .locals 1
    .param p1, "phoneNumber"    # Lcom/digits/sdk/android/PhoneNumber;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->controller:Lcom/digits/sdk/android/PhoneNumberController;

    invoke-virtual {v0, p1}, Lcom/digits/sdk/android/PhoneNumberController;->setPhoneNumber(Lcom/digits/sdk/android/PhoneNumber;)V

    .line 87
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->controller:Lcom/digits/sdk/android/PhoneNumberController;

    invoke-virtual {v0}, Lcom/digits/sdk/android/PhoneNumberController;->onResume()V

    .line 83
    return-void
.end method

.method protected setUpCountrySpinner(Lcom/digits/sdk/android/CountryListSpinner;)V
    .locals 1
    .param p1, "countryCodeSpinner"    # Lcom/digits/sdk/android/CountryListSpinner;

    .prologue
    .line 72
    new-instance v0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate$1;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate$1;-><init>(Lcom/digits/sdk/android/PhoneNumberActivityDelegate;)V

    invoke-virtual {p1, v0}, Lcom/digits/sdk/android/CountryListSpinner;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    return-void
.end method

.method public setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "controller"    # Lcom/digits/sdk/android/DigitsController;
    .param p3, "termsText"    # Landroid/widget/TextView;

    .prologue
    .line 67
    sget v0, Lcom/digits/sdk/android/R$string;->dgts__terms_text:I

    invoke-virtual {p0, p1, v0}, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->getFormattedTerms(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    invoke-super {p0, p1, p2, p3}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl;->setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V

    .line 69
    return-void
.end method
