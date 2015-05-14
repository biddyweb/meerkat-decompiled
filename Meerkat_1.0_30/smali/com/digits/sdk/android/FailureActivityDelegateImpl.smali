.class Lcom/digits/sdk/android/FailureActivityDelegateImpl;
.super Ljava/lang/Object;
.source "FailureActivityDelegateImpl.java"

# interfaces
.implements Lcom/digits/sdk/android/FailureActivityDelegate;


# instance fields
.field final activity:Landroid/app/Activity;

.field final controller:Lcom/digits/sdk/android/FailureController;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 19
    new-instance v0, Lcom/digits/sdk/android/FailureControllerImpl;

    invoke-direct {v0}, Lcom/digits/sdk/android/FailureControllerImpl;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;-><init>(Landroid/app/Activity;Lcom/digits/sdk/android/FailureController;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/digits/sdk/android/FailureController;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "controller"    # Lcom/digits/sdk/android/FailureController;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    .line 24
    iput-object p2, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->controller:Lcom/digits/sdk/android/FailureController;

    .line 25
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/FailureActivityDelegateImpl;)Landroid/os/ResultReceiver;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->getBundleResultReceiver()Landroid/os/ResultReceiver;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/digits/sdk/android/FailureActivityDelegateImpl;)Lcom/digits/sdk/android/DigitsException;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->getBundleException()Lcom/digits/sdk/android/DigitsException;

    move-result-object v0

    return-object v0
.end method

.method private getBundleException()Lcom/digits/sdk/android/DigitsException;
    .locals 2

    .prologue
    .line 96
    iget-object v1, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 97
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "fallback_reason"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/digits/sdk/android/DigitsException;

    return-object v1
.end method

.method private getBundleResultReceiver()Landroid/os/ResultReceiver;
    .locals 2

    .prologue
    .line 91
    iget-object v1, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 92
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "receiver"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/ResultReceiver;

    return-object v1
.end method


# virtual methods
.method public init()V
    .locals 3

    .prologue
    .line 28
    iget-object v1, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 29
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->isBundleValid(Landroid/os/Bundle;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 30
    invoke-virtual {p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->setContentView()V

    .line 31
    invoke-virtual {p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->setUpViews()V

    .line 32
    invoke-virtual {p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->setErrorText()V

    .line 36
    return-void

    .line 34
    :cond_0
    new-instance v1, Ljava/lang/IllegalAccessError;

    const-string v2, "This activity can only be started from Digits"

    invoke-direct {v1, v2}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected isBundleValid(Landroid/os/Bundle;)Z
    .locals 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 39
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "receiver"

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Lcom/digits/sdk/android/BundleManager;->assertContains(Landroid/os/Bundle;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected setContentView()V
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v1, Lcom/digits/sdk/android/R$layout;->dgts__activity_failure:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(I)V

    .line 59
    return-void
.end method

.method protected setErrorText()V
    .locals 3

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->getBundleException()Lcom/digits/sdk/android/DigitsException;

    move-result-object v0

    .line 44
    .local v0, "reason":Lcom/digits/sdk/android/DigitsException;
    invoke-virtual {v0}, Lcom/digits/sdk/android/DigitsException;->getErrorCode()I

    move-result v1

    const/16 v2, 0x10d

    if-ne v1, v2, :cond_0

    .line 45
    sget v1, Lcom/digits/sdk/android/R$string;->dgts__associated_with_twitter_error:I

    sget v2, Lcom/digits/sdk/android/R$string;->dgts__associated_with_twitter_error_alternative:I

    invoke-virtual {p0, v1, v2}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->setErrorText(II)V

    .line 48
    :cond_0
    return-void
.end method

.method protected setErrorText(II)V
    .locals 4
    .param p1, "titleId"    # I
    .param p2, "textId"    # I

    .prologue
    .line 51
    iget-object v2, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v3, Lcom/digits/sdk/android/R$id;->dgts__error_title:I

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 52
    .local v1, "title":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v3, Lcom/digits/sdk/android/R$id;->dgts__error_text:I

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 53
    .local v0, "text":Landroid/widget/TextView;
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 54
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 55
    return-void
.end method

.method protected setUpDismissButton(Landroid/widget/Button;)V
    .locals 1
    .param p1, "button"    # Landroid/widget/Button;

    .prologue
    .line 71
    new-instance v0, Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;-><init>(Lcom/digits/sdk/android/FailureActivityDelegateImpl;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    return-void
.end method

.method protected setUpTryAnotherPhoneButton(Landroid/widget/TextView;)V
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 81
    new-instance v0, Lcom/digits/sdk/android/FailureActivityDelegateImpl$2;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl$2;-><init>(Lcom/digits/sdk/android/FailureActivityDelegateImpl;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    return-void
.end method

.method protected setUpViews()V
    .locals 4

    .prologue
    .line 62
    iget-object v2, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v3, Lcom/digits/sdk/android/R$id;->dgts__dismiss_button:I

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 63
    .local v0, "dismissButton":Landroid/widget/Button;
    iget-object v2, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v3, Lcom/digits/sdk/android/R$id;->dgts__try_another_phone:I

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 66
    .local v1, "tryAnotherNumberButton":Landroid/widget/TextView;
    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->setUpDismissButton(Landroid/widget/Button;)V

    .line 67
    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->setUpTryAnotherPhoneButton(Landroid/widget/TextView;)V

    .line 68
    return-void
.end method
