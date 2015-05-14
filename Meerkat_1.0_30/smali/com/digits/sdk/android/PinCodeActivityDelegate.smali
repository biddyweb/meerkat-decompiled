.class Lcom/digits/sdk/android/PinCodeActivityDelegate;
.super Lcom/digits/sdk/android/DigitsActivityDelegateImpl;
.source "PinCodeActivityDelegate.java"


# instance fields
.field controller:Lcom/digits/sdk/android/DigitsController;

.field editText:Landroid/widget/EditText;

.field stateButton:Lcom/digits/sdk/android/StateButton;

.field termsText:Landroid/widget/TextView;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public getLayoutId()I
    .locals 1

    .prologue
    .line 19
    sget v0, Lcom/digits/sdk/android/R$layout;->dgts__activity_pin_code:I

    return v0
.end method

.method public init(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 24
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__confirmationEditText:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->editText:Landroid/widget/EditText;

    .line 25
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__createAccount:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/StateButton;

    iput-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->stateButton:Lcom/digits/sdk/android/StateButton;

    .line 26
    sget v0, Lcom/digits/sdk/android/R$id;->dgts__termsTextCreateAccount:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->termsText:Landroid/widget/TextView;

    .line 28
    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/PinCodeActivityDelegate;->initController(Landroid/os/Bundle;)Lcom/digits/sdk/android/DigitsController;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    .line 30
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->editText:Landroid/widget/EditText;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/PinCodeActivityDelegate;->setUpEditText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/EditText;)V

    .line 31
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->stateButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/PinCodeActivityDelegate;->setUpSendButton(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Lcom/digits/sdk/android/StateButton;)V

    .line 32
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->termsText:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v0, v1}, Lcom/digits/sdk/android/PinCodeActivityDelegate;->setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V

    .line 34
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->editText:Landroid/widget/EditText;

    invoke-static {p1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->openKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 35
    return-void
.end method

.method initController(Landroid/os/Bundle;)Lcom/digits/sdk/android/DigitsController;
    .locals 9
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 38
    new-instance v1, Lcom/digits/sdk/android/PinCodeController;

    const-string v0, "receiver"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/ResultReceiver;

    iget-object v3, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->stateButton:Lcom/digits/sdk/android/StateButton;

    iget-object v4, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->editText:Landroid/widget/EditText;

    const-string v0, "request_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "user_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    const-string v0, "phone_number"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct/range {v1 .. v8}, Lcom/digits/sdk/android/PinCodeController;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Ljava/lang/String;JLjava/lang/String;)V

    return-object v1
.end method

.method public isValid(Landroid/os/Bundle;)Z
    .locals 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 47
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "receiver"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "phone_number"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "request_id"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "user_id"

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Lcom/digits/sdk/android/BundleManager;->assertContains(Landroid/os/Bundle;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeActivityDelegate;->controller:Lcom/digits/sdk/android/DigitsController;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsController;->onResume()V

    .line 55
    return-void
.end method
