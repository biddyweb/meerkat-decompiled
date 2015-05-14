.class abstract Lcom/digits/sdk/android/DigitsActivityDelegateImpl;
.super Ljava/lang/Object;
.source "DigitsActivityDelegateImpl.java"

# interfaces
.implements Lcom/digits/sdk/android/DigitsActivityDelegate;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected getFormattedTerms(Landroid/app/Activity;I)Ljava/lang/String;
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "termsResId"    # I

    .prologue
    .line 59
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "\""

    aput-object v2, v0, v1

    invoke-virtual {p1, p2, v0}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 17
    return-void
.end method

.method public setUpEditText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/EditText;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "controller"    # Lcom/digits/sdk/android/DigitsController;
    .param p3, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 33
    new-instance v0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;

    invoke-direct {v0, p0, p2, p1}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;-><init>(Lcom/digits/sdk/android/DigitsActivityDelegateImpl;Lcom/digits/sdk/android/DigitsController;Landroid/app/Activity;)V

    invoke-virtual {p3, v0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 44
    invoke-interface {p2}, Lcom/digits/sdk/android/DigitsController;->getTextWatcher()Landroid/text/TextWatcher;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 45
    return-void
.end method

.method public setUpSendButton(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Lcom/digits/sdk/android/StateButton;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "controller"    # Lcom/digits/sdk/android/DigitsController;
    .param p3, "stateButton"    # Lcom/digits/sdk/android/StateButton;

    .prologue
    .line 21
    new-instance v0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;

    invoke-direct {v0, p0, p2, p1}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;-><init>(Lcom/digits/sdk/android/DigitsActivityDelegateImpl;Lcom/digits/sdk/android/DigitsController;Landroid/app/Activity;)V

    invoke-virtual {p3, v0}, Lcom/digits/sdk/android/StateButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    return-void
.end method

.method public setUpTermsText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/TextView;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "controller"    # Lcom/digits/sdk/android/DigitsController;
    .param p3, "termsText"    # Landroid/widget/TextView;

    .prologue
    .line 49
    new-instance v0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$3;

    invoke-direct {v0, p0, p2, p1}, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$3;-><init>(Lcom/digits/sdk/android/DigitsActivityDelegateImpl;Lcom/digits/sdk/android/DigitsController;Landroid/app/Activity;)V

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    return-void
.end method
