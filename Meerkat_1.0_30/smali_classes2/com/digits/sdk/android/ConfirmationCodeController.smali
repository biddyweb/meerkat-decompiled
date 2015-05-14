.class Lcom/digits/sdk/android/ConfirmationCodeController;
.super Lcom/digits/sdk/android/DigitsControllerImpl;
.source "ConfirmationCodeController.java"


# instance fields
.field private final phoneNumber:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Ljava/lang/String;)V
    .locals 9
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "phoneEditText"    # Landroid/widget/EditText;
    .param p4, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v5

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getDigitsClient()Lcom/digits/sdk/android/DigitsClient;

    move-result-object v6

    new-instance v7, Lcom/digits/sdk/android/ConfirmationErrorCodes;

    invoke-virtual {p2}, Lcom/digits/sdk/android/StateButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/digits/sdk/android/ConfirmationErrorCodes;-><init>(Landroid/content/res/Resources;)V

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getActivityClassManager()Lcom/digits/sdk/android/ActivityClassManager;

    move-result-object v8

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v8}, Lcom/digits/sdk/android/ConfirmationCodeController;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Ljava/lang/String;Lcom/twitter/sdk/android/core/SessionManager;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;)V

    .line 23
    return-void
.end method

.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Ljava/lang/String;Lcom/twitter/sdk/android/core/SessionManager;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;)V
    .locals 8
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "phoneEditText"    # Landroid/widget/EditText;
    .param p4, "phoneNumber"    # Ljava/lang/String;
    .param p6, "client"    # Lcom/digits/sdk/android/DigitsClient;
    .param p7, "errors"    # Lcom/digits/sdk/android/ErrorCodes;
    .param p8, "activityClassManager"    # Lcom/digits/sdk/android/ActivityClassManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/ResultReceiver;",
            "Lcom/digits/sdk/android/StateButton;",
            "Landroid/widget/EditText;",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;",
            "Lcom/digits/sdk/android/DigitsClient;",
            "Lcom/digits/sdk/android/ErrorCodes;",
            "Lcom/digits/sdk/android/ActivityClassManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 32
    .local p5, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/digits/sdk/android/DigitsSession;>;"
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p6

    move-object v5, p7

    move-object/from16 v6, p8

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/digits/sdk/android/DigitsControllerImpl;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;Lcom/twitter/sdk/android/core/SessionManager;)V

    .line 34
    iput-object p4, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->phoneNumber:Ljava/lang/String;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/ConfirmationCodeController;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/ConfirmationCodeController;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public executeRequest(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/ConfirmationCodeController;->validateInput(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v1}, Lcom/digits/sdk/android/StateButton;->showProgress()V

    .line 41
    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->editText:Landroid/widget/EditText;

    invoke-static {p1, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 42
    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 43
    .local v0, "code":Ljava/lang/String;
    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    iget-object v2, p0, Lcom/digits/sdk/android/ConfirmationCodeController;->phoneNumber:Ljava/lang/String;

    new-instance v3, Lcom/digits/sdk/android/ConfirmationCodeController$1;

    invoke-direct {v3, p0, p1, p0, p1}, Lcom/digits/sdk/android/ConfirmationCodeController$1;-><init>(Lcom/digits/sdk/android/ConfirmationCodeController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V

    invoke-virtual {v1, v0, v2, v3}, Lcom/digits/sdk/android/DigitsClient;->createAccount(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 53
    .end local v0    # "code":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method getTOSUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lcom/digits/sdk/android/DigitsConstants;->TWITTER_TOS:Landroid/net/Uri;

    return-object v0
.end method
