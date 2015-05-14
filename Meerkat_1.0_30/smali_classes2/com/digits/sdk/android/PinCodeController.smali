.class Lcom/digits/sdk/android/PinCodeController;
.super Lcom/digits/sdk/android/DigitsControllerImpl;
.source "PinCodeController.java"


# instance fields
.field private final phoneNumber:Ljava/lang/String;

.field private final requestId:Ljava/lang/String;

.field private final userId:J


# direct methods
.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/twitter/sdk/android/core/SessionManager;Lcom/digits/sdk/android/DigitsClient;Ljava/lang/String;JLjava/lang/String;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;)V
    .locals 11
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "phoneEditText"    # Landroid/widget/EditText;
    .param p5, "digitsClient"    # Lcom/digits/sdk/android/DigitsClient;
    .param p6, "requestId"    # Ljava/lang/String;
    .param p7, "userId"    # J
    .param p9, "phoneNumber"    # Ljava/lang/String;
    .param p10, "errors"    # Lcom/digits/sdk/android/ErrorCodes;
    .param p11, "activityClassManager"    # Lcom/digits/sdk/android/ActivityClassManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/ResultReceiver;",
            "Lcom/digits/sdk/android/StateButton;",
            "Landroid/widget/EditText;",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;",
            "Lcom/digits/sdk/android/DigitsClient;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Lcom/digits/sdk/android/ErrorCodes;",
            "Lcom/digits/sdk/android/ActivityClassManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 32
    .local p4, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/digits/sdk/android/DigitsSession;>;"
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p5

    move-object/from16 v7, p10

    move-object/from16 v8, p11

    move-object v9, p4

    invoke-direct/range {v2 .. v9}, Lcom/digits/sdk/android/DigitsControllerImpl;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;Lcom/twitter/sdk/android/core/SessionManager;)V

    .line 34
    move-object/from16 v0, p6

    iput-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->requestId:Ljava/lang/String;

    .line 35
    move-wide/from16 v0, p7

    iput-wide v0, p0, Lcom/digits/sdk/android/PinCodeController;->userId:J

    .line 36
    move-object/from16 v0, p9

    iput-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->phoneNumber:Ljava/lang/String;

    .line 37
    return-void
.end method

.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Ljava/lang/String;JLjava/lang/String;)V
    .locals 13
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "phoneEditText"    # Landroid/widget/EditText;
    .param p4, "requestId"    # Ljava/lang/String;
    .param p5, "userId"    # J
    .param p7, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v5

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getDigitsClient()Lcom/digits/sdk/android/DigitsClient;

    move-result-object v6

    new-instance v11, Lcom/digits/sdk/android/ConfirmationErrorCodes;

    invoke-virtual {p2}, Lcom/digits/sdk/android/StateButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {v11, v0}, Lcom/digits/sdk/android/ConfirmationErrorCodes;-><init>(Landroid/content/res/Resources;)V

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getActivityClassManager()Lcom/digits/sdk/android/ActivityClassManager;

    move-result-object v12

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v7, p4

    move-wide/from16 v8, p5

    move-object/from16 v10, p7

    invoke-direct/range {v1 .. v12}, Lcom/digits/sdk/android/PinCodeController;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/twitter/sdk/android/core/SessionManager;Lcom/digits/sdk/android/DigitsClient;Ljava/lang/String;JLjava/lang/String;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;)V

    .line 25
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/PinCodeController;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/PinCodeController;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public executeRequest(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/PinCodeController;->validateInput(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v0}, Lcom/digits/sdk/android/StateButton;->showProgress()V

    .line 53
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->editText:Landroid/widget/EditText;

    invoke-static {p1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 54
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 55
    .local v4, "code":Ljava/lang/String;
    iget-object v0, p0, Lcom/digits/sdk/android/PinCodeController;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    iget-object v1, p0, Lcom/digits/sdk/android/PinCodeController;->requestId:Ljava/lang/String;

    iget-wide v2, p0, Lcom/digits/sdk/android/PinCodeController;->userId:J

    new-instance v5, Lcom/digits/sdk/android/PinCodeController$1;

    invoke-direct {v5, p0, p1, p0, p1}, Lcom/digits/sdk/android/PinCodeController$1;-><init>(Lcom/digits/sdk/android/PinCodeController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V

    invoke-virtual/range {v0 .. v5}, Lcom/digits/sdk/android/DigitsClient;->verifyPin(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 64
    .end local v4    # "code":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method getTOSUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    return-object v0
.end method

.method public showTOS(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    return-void
.end method
