.class Lcom/digits/sdk/android/PhoneNumberController;
.super Lcom/digits/sdk/android/DigitsControllerImpl;
.source "PhoneNumberController.java"


# instance fields
.field final countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

.field phoneNumber:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/CountryListSpinner;)V
    .locals 9
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "phoneEditText"    # Landroid/widget/EditText;
    .param p4, "countryCodeSpinner"    # Lcom/digits/sdk/android/CountryListSpinner;

    .prologue
    .line 25
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getDigitsClient()Lcom/digits/sdk/android/DigitsClient;

    move-result-object v5

    new-instance v6, Lcom/digits/sdk/android/PhoneNumberErrorCodes;

    invoke-virtual {p2}, Lcom/digits/sdk/android/StateButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {v6, v0}, Lcom/digits/sdk/android/PhoneNumberErrorCodes;-><init>(Landroid/content/res/Resources;)V

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getActivityClassManager()Lcom/digits/sdk/android/ActivityClassManager;

    move-result-object v7

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v8

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v8}, Lcom/digits/sdk/android/PhoneNumberController;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/CountryListSpinner;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;Lcom/twitter/sdk/android/core/SessionManager;)V

    .line 30
    return-void
.end method

.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/CountryListSpinner;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;Lcom/twitter/sdk/android/core/SessionManager;)V
    .locals 8
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "phoneEditText"    # Landroid/widget/EditText;
    .param p4, "countryCodeSpinner"    # Lcom/digits/sdk/android/CountryListSpinner;
    .param p5, "client"    # Lcom/digits/sdk/android/DigitsClient;
    .param p6, "errors"    # Lcom/digits/sdk/android/ErrorCodes;
    .param p7, "activityClassManager"    # Lcom/digits/sdk/android/ActivityClassManager;
    .param p8, "sessionManager"    # Lcom/twitter/sdk/android/core/SessionManager;

    .prologue
    .line 40
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move-object v5, p6

    move-object v6, p7

    move-object/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Lcom/digits/sdk/android/DigitsControllerImpl;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;Lcom/twitter/sdk/android/core/SessionManager;)V

    .line 42
    iput-object p4, p0, Lcom/digits/sdk/android/PhoneNumberController;->countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

    .line 43
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/PhoneNumberController;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/digits/sdk/android/PhoneNumberController;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/PhoneNumberController;->startNextStep(Landroid/content/Context;)V

    return-void
.end method

.method private getBundle()Landroid/os/Bundle;
    .locals 3

    .prologue
    .line 119
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 120
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "phone_number"

    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    const-string v1, "receiver"

    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->resultReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 122
    return-object v0
.end method

.method private getNumber(JLjava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "countryCode"    # J
    .param p3, "numberTextView"    # Ljava/lang/String;

    .prologue
    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "+"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private startNextStep(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 112
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/digits/sdk/android/PhoneNumberController;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    invoke-interface {v1}, Lcom/digits/sdk/android/ActivityClassManager;->getConfirmationActivity()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 113
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0}, Lcom/digits/sdk/android/PhoneNumberController;->getBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 114
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p0, p1, v0}, Lcom/digits/sdk/android/PhoneNumberController;->startActivityForResult(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 115
    return-void
.end method


# virtual methods
.method public executeRequest(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->editText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/digits/sdk/android/PhoneNumberController;->validateInput(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 58
    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v2}, Lcom/digits/sdk/android/StateButton;->showProgress()V

    .line 59
    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->editText:Landroid/widget/EditText;

    invoke-static {p1, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 60
    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

    invoke-virtual {v2}, Lcom/digits/sdk/android/CountryListSpinner;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 61
    .local v0, "code":I
    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->editText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 62
    .local v1, "number":Ljava/lang/String;
    int-to-long v2, v0

    invoke-direct {p0, v2, v3, v1}, Lcom/digits/sdk/android/PhoneNumberController;->getNumber(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->phoneNumber:Ljava/lang/String;

    .line 63
    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    iget-object v3, p0, Lcom/digits/sdk/android/PhoneNumberController;->phoneNumber:Ljava/lang/String;

    new-instance v4, Lcom/digits/sdk/android/PhoneNumberController$1;

    invoke-direct {v4, p0, p1, p0, p1}, Lcom/digits/sdk/android/PhoneNumberController$1;-><init>(Lcom/digits/sdk/android/PhoneNumberController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V

    invoke-virtual {v2, p1, p0, v3, v4}, Lcom/digits/sdk/android/DigitsClient;->registerDevice(Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 79
    .end local v0    # "code":I
    .end local v1    # "number":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method getTOSUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 99
    sget-object v0, Lcom/digits/sdk/android/DigitsConstants;->DIGITS_TOS:Landroid/net/Uri;

    return-object v0
.end method

.method public handleError(Landroid/content/Context;Lcom/digits/sdk/android/DigitsException;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "digitsException"    # Lcom/digits/sdk/android/DigitsException;

    .prologue
    .line 83
    instance-of v0, p2, Lcom/digits/sdk/android/AlreadyRegisteredException;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    iget-object v1, p0, Lcom/digits/sdk/android/PhoneNumberController;->phoneNumber:Ljava/lang/String;

    new-instance v2, Lcom/digits/sdk/android/PhoneNumberController$2;

    invoke-direct {v2, p0, p1, p0, p1}, Lcom/digits/sdk/android/PhoneNumberController$2;-><init>(Lcom/digits/sdk/android/PhoneNumberController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V

    invoke-virtual {v0, v1, v2}, Lcom/digits/sdk/android/DigitsClient;->authDevice(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 95
    :goto_0
    return-void

    .line 93
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/digits/sdk/android/DigitsControllerImpl;->handleError(Landroid/content/Context;Lcom/digits/sdk/android/DigitsException;)V

    goto :goto_0
.end method

.method public setPhoneNumber(Lcom/digits/sdk/android/PhoneNumber;)V
    .locals 4
    .param p1, "phoneNumber"    # Lcom/digits/sdk/android/PhoneNumber;

    .prologue
    .line 46
    invoke-static {p1}, Lcom/digits/sdk/android/PhoneNumber;->isValid(Lcom/digits/sdk/android/PhoneNumber;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController;->editText:Landroid/widget/EditText;

    invoke-virtual {p1}, Lcom/digits/sdk/android/PhoneNumber;->getPhoneNumber()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 48
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController;->editText:Landroid/widget/EditText;

    invoke-virtual {p1}, Lcom/digits/sdk/android/PhoneNumber;->getPhoneNumber()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 49
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController;->countryCodeSpinner:Lcom/digits/sdk/android/CountryListSpinner;

    new-instance v1, Ljava/util/Locale;

    const-string v2, ""

    invoke-virtual {p1}, Lcom/digits/sdk/android/PhoneNumber;->getCountryIso()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/util/Locale;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/digits/sdk/android/PhoneNumber;->getCountryCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/digits/sdk/android/CountryListSpinner;->setSelectedForCountry(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    :cond_0
    return-void
.end method

.method startSignIn(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "userId"    # J

    .prologue
    .line 103
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    invoke-interface {v2}, Lcom/digits/sdk/android/ActivityClassManager;->getLoginCodeActivity()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 104
    .local v1, "intent":Landroid/content/Intent;
    invoke-direct {p0}, Lcom/digits/sdk/android/PhoneNumberController;->getBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 105
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "request_id"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    const-string v2, "user_id"

    invoke-virtual {v0, v2, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 107
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 108
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p0, p1, v1}, Lcom/digits/sdk/android/PhoneNumberController;->startActivityForResult(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 109
    return-void
.end method
