.class Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;
.super Lcom/digits/sdk/android/DigitsActivityDelegateImpl;
.source "ConfirmationCodeActivityDelegate.java"


# instance fields
.field activity:Landroid/app/Activity;

.field controller:Lcom/digits/sdk/android/DigitsController;

.field editText:Landroid/widget/EditText;

.field receiver:Lcom/digits/sdk/android/SmsBroadcastReceiver;

.field resendText:Landroid/widget/TextView;

.field stateButton:Lcom/digits/sdk/android/StateButton;

.field termsText:Landroid/widget/TextView;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public getLayoutId()I
    .locals 1

    .prologue
    .line 24
    sget v0, Lcom/digits/sdk/android/R$layout;->dgts__activity_confirmation:I

    return v0
.end method

.method public init(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->activity:Landroid/app/Activity;

    .line 36
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__confirmationEditText:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->editText:Landroid/widget/EditText;

    .line 37
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__createAccount:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/StateButton;

    iput-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->stateButton:Lcom/digits/sdk/android/StateButton;

    .line 38
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__termsTextCreateAccount:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->termsText:Landroid/widget/TextView;

    .line 39
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__resendConfirmation:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->resendText:Landroid/widget/TextView;

    .line 41
    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->initController(Landroid/os/Bundle;)Lcom/digits/sdk/android/DigitsController;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    .line 43
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->editText:Landroid/widget/EditText;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->setUpEditText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/EditText;)V

    .line 44
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->stateButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->setUpSendButton(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Lcom/digits/sdk/android/StateButton;)V

    .line 45
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->termsText:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V

    .line 46
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->resendText:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v0}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->setUpResendText(Landroid/app/Activity;Landroid/widget/TextView;)V

    .line 47
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->editText:Landroid/widget/EditText;

    invoke-virtual {p0, p1, v0}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->setUpSmsIntercept(Landroid/app/Activity;Landroid/widget/EditText;)V

    .line 49
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->editText:Landroid/widget/EditText;

    invoke-static {p1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->openKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 50
    return-void
.end method

.method initController(Landroid/os/Bundle;)Lcom/digits/sdk/android/DigitsController;
    .locals 5
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 53
    new-instance v1, Lcom/digits/sdk/android/ConfirmationCodeController;

    const-string v0, "receiver"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    iget-object v2, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->stateButton:Lcom/digits/sdk/android/StateButton;

    iget-object v3, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->editText:Landroid/widget/EditText;

    const-string v4, "phone_number"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/digits/sdk/android/ConfirmationCodeController;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Ljava/lang/String;)V

    return-object v1
.end method

.method public isValid(Landroid/os/Bundle;)Z
    .locals 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 29
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "receiver"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "phone_number"

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Lcom/digits/sdk/android/BundleManager;->assertContains(Landroid/os/Bundle;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->receiver:Lcom/digits/sdk/android/SmsBroadcastReceiver;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->receiver:Lcom/digits/sdk/android/SmsBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 83
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsController;->onResume()V

    .line 76
    return-void
.end method

.method protected setUpResendText(Landroid/app/Activity;Landroid/widget/TextView;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "resendText"    # Landroid/widget/TextView;

    .prologue
    .line 59
    new-instance v0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate$1;

    invoke-direct {v0, p0, p1}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate$1;-><init>(Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;Landroid/app/Activity;)V

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    return-void
.end method

.method protected setUpSmsIntercept(Landroid/app/Activity;Landroid/widget/EditText;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 86
    const-string v1, "android.permission.RECEIVE_SMS"

    invoke-static {p1, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.provider.Telephony.SMS_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 88
    .local v0, "filter":Landroid/content/IntentFilter;
    new-instance v1, Lcom/digits/sdk/android/SmsBroadcastReceiver;

    invoke-direct {v1, p2}, Lcom/digits/sdk/android/SmsBroadcastReceiver;-><init>(Landroid/widget/EditText;)V

    iput-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->receiver:Lcom/digits/sdk/android/SmsBroadcastReceiver;

    .line 89
    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->receiver:Lcom/digits/sdk/android/SmsBroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 91
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_0
    return-void
.end method

.method public setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "controller"    # Lcom/digits/sdk/android/DigitsController;
    .param p3, "termsText"    # Landroid/widget/TextView;

    .prologue
    .line 69
    sget v0, Lcom/digits/sdk/android/R$string;->dgts__terms_text_create:I

    invoke-virtual {p0, p1, v0}, Lcom/digits/sdk/android/ConfirmationCodeActivityDelegate;->getFormattedTerms(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    invoke-super {p0, p1, p2, p3}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl;->setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V

    .line 71
    return-void
.end method
