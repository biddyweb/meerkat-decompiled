.class Lcom/digits/sdk/android/LoginCodeController;
.super Lcom/digits/sdk/android/DigitsControllerImpl;
.source "LoginCodeController.java"


# instance fields
.field private final phoneNumber:Ljava/lang/String;

.field private final requestId:Ljava/lang/String;

.field private final userId:J


# direct methods
.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/twitter/sdk/android/core/SessionManager;Lcom/digits/sdk/android/DigitsClient;Ljava/lang/String;JLjava/lang/String;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;)V
    .locals 11
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "loginEditText"    # Landroid/widget/EditText;
    .param p5, "client"    # Lcom/digits/sdk/android/DigitsClient;
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
    .line 35
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

    .line 37
    move-object/from16 v0, p6

    iput-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->requestId:Ljava/lang/String;

    .line 38
    move-wide/from16 v0, p7

    iput-wide v0, p0, Lcom/digits/sdk/android/LoginCodeController;->userId:J

    .line 39
    move-object/from16 v0, p9

    iput-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->phoneNumber:Ljava/lang/String;

    .line 40
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
    .line 24
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

    invoke-direct/range {v1 .. v12}, Lcom/digits/sdk/android/LoginCodeController;-><init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/twitter/sdk/android/core/SessionManager;Lcom/digits/sdk/android/DigitsClient;Ljava/lang/String;JLjava/lang/String;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;)V

    .line 28
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/LoginCodeController;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/digits/sdk/android/LoginCodeController;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/LoginCodeController;->startPinCodeActivity(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100(Lcom/digits/sdk/android/LoginCodeController;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/LoginCodeController;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->phoneNumber:Ljava/lang/String;

    return-object v0
.end method

.method private startPinCodeActivity(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/digits/sdk/android/LoginCodeController;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    invoke-interface {v2}, Lcom/digits/sdk/android/ActivityClassManager;->getPinCodeActivity()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 65
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/digits/sdk/android/LoginCodeController;->phoneNumber:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/digits/sdk/android/LoginCodeController;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 66
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "receiver"

    iget-object v3, p0, Lcom/digits/sdk/android/LoginCodeController;->resultReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 67
    const-string v2, "request_id"

    iget-object v3, p0, Lcom/digits/sdk/android/LoginCodeController;->requestId:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v2, "user_id"

    iget-wide v4, p0, Lcom/digits/sdk/android/LoginCodeController;->userId:J

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 69
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 70
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p0, p1, v1}, Lcom/digits/sdk/android/LoginCodeController;->startActivityForResult(Landroid/app/Activity;Landroid/content/Intent;)V

    .line 71
    return-void
.end method


# virtual methods
.method public executeRequest(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/LoginCodeController;->validateInput(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v0}, Lcom/digits/sdk/android/StateButton;->showProgress()V

    .line 47
    iget-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->editText:Landroid/widget/EditText;

    invoke-static {p1, v0}, Lio/fabric/sdk/android/services/common/CommonUtils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 48
    iget-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->editText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 49
    .local v4, "code":Ljava/lang/String;
    iget-object v0, p0, Lcom/digits/sdk/android/LoginCodeController;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    iget-object v1, p0, Lcom/digits/sdk/android/LoginCodeController;->requestId:Ljava/lang/String;

    iget-wide v2, p0, Lcom/digits/sdk/android/LoginCodeController;->userId:J

    new-instance v5, Lcom/digits/sdk/android/LoginCodeController$1;

    invoke-direct {v5, p0, p1, p0, p1}, Lcom/digits/sdk/android/LoginCodeController$1;-><init>(Lcom/digits/sdk/android/LoginCodeController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V

    invoke-virtual/range {v0 .. v5}, Lcom/digits/sdk/android/DigitsClient;->loginDevice(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 61
    .end local v4    # "code":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method getTOSUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 75
    sget-object v0, Lcom/digits/sdk/android/DigitsConstants;->TWITTER_TOS:Landroid/net/Uri;

    return-object v0
.end method
