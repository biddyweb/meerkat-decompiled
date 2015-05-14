.class abstract Lcom/digits/sdk/android/DigitsControllerImpl;
.super Ljava/lang/Object;
.source "DigitsControllerImpl.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Lcom/digits/sdk/android/DigitsController;


# static fields
.field public static final MAX_ERRORS:I = 0x5

.field static final POST_DELAY_MS:J = 0x5dcL


# instance fields
.field final activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

.field final digitsClient:Lcom/digits/sdk/android/DigitsClient;

.field final editText:Landroid/widget/EditText;

.field private errorCount:I

.field final errors:Lcom/digits/sdk/android/ErrorCodes;

.field final resultReceiver:Landroid/os/ResultReceiver;

.field final sendButton:Lcom/digits/sdk/android/StateButton;

.field final sessionManager:Lcom/twitter/sdk/android/core/SessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/os/ResultReceiver;Lcom/digits/sdk/android/StateButton;Landroid/widget/EditText;Lcom/digits/sdk/android/DigitsClient;Lcom/digits/sdk/android/ErrorCodes;Lcom/digits/sdk/android/ActivityClassManager;Lcom/twitter/sdk/android/core/SessionManager;)V
    .locals 1
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "stateButton"    # Lcom/digits/sdk/android/StateButton;
    .param p3, "editText"    # Landroid/widget/EditText;
    .param p4, "client"    # Lcom/digits/sdk/android/DigitsClient;
    .param p5, "errors"    # Lcom/digits/sdk/android/ErrorCodes;
    .param p6, "activityClassManager"    # Lcom/digits/sdk/android/ActivityClassManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/ResultReceiver;",
            "Lcom/digits/sdk/android/StateButton;",
            "Landroid/widget/EditText;",
            "Lcom/digits/sdk/android/DigitsClient;",
            "Lcom/digits/sdk/android/ErrorCodes;",
            "Lcom/digits/sdk/android/ActivityClassManager;",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p7, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/digits/sdk/android/DigitsSession;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->resultReceiver:Landroid/os/ResultReceiver;

    .line 36
    iput-object p4, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->digitsClient:Lcom/digits/sdk/android/DigitsClient;

    .line 37
    iput-object p6, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    .line 38
    iput-object p2, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->sendButton:Lcom/digits/sdk/android/StateButton;

    .line 39
    iput-object p3, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->editText:Landroid/widget/EditText;

    .line 40
    iput-object p5, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->errors:Lcom/digits/sdk/android/ErrorCodes;

    .line 41
    iput-object p7, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->errorCount:I

    .line 43
    return-void
.end method

.method private isUnrecoverable(Lcom/digits/sdk/android/DigitsException;)Z
    .locals 2
    .param p1, "exception"    # Lcom/digits/sdk/android/DigitsException;

    .prologue
    .line 64
    iget v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->errorCount:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    instance-of v0, p1, Lcom/digits/sdk/android/UnrecoverableException;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 124
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 114
    return-void
.end method

.method public clearError()V
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->editText:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 89
    return-void
.end method

.method getBundle(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2
    .param p1, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 129
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 130
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "phone_number"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    return-object v0
.end method

.method public getErrorCount()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->errorCount:I

    return v0
.end method

.method public getErrors()Lcom/digits/sdk/android/ErrorCodes;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->errors:Lcom/digits/sdk/android/ErrorCodes;

    return-object v0
.end method

.method abstract getTOSUri()Landroid/net/Uri;
.end method

.method public getTextWatcher()Landroid/text/TextWatcher;
    .locals 0

    .prologue
    .line 108
    return-object p0
.end method

.method public handleError(Landroid/content/Context;Lcom/digits/sdk/android/DigitsException;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "exception"    # Lcom/digits/sdk/android/DigitsException;

    .prologue
    .line 54
    iget v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->errorCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->errorCount:I

    .line 55
    invoke-direct {p0, p2}, Lcom/digits/sdk/android/DigitsControllerImpl;->isUnrecoverable(Lcom/digits/sdk/android/DigitsException;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->resultReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {p0, p1, v0, p2}, Lcom/digits/sdk/android/DigitsControllerImpl;->startFallback(Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/digits/sdk/android/DigitsException;)V

    .line 61
    :goto_0
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->editText:Landroid/widget/EditText;

    invoke-virtual {p2}, Lcom/digits/sdk/android/DigitsException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v0}, Lcom/digits/sdk/android/StateButton;->showError()V

    goto :goto_0
.end method

.method loginSuccess(Landroid/content/Context;Lcom/digits/sdk/android/DigitsSession;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "session"    # Lcom/digits/sdk/android/DigitsSession;
    .param p3, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0, p2}, Lcom/twitter/sdk/android/core/SessionManager;->setActiveSession(Lcom/twitter/sdk/android/core/Session;)V

    .line 137
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v0}, Lcom/digits/sdk/android/StateButton;->showFinish()V

    .line 138
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->editText:Landroid/widget/EditText;

    new-instance v1, Lcom/digits/sdk/android/DigitsControllerImpl$1;

    invoke-direct {v1, p0, p3, p1}, Lcom/digits/sdk/android/DigitsControllerImpl$1;-><init>(Lcom/digits/sdk/android/DigitsControllerImpl;Ljava/lang/String;Landroid/content/Context;)V

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 146
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v0}, Lcom/digits/sdk/android/StateButton;->showStart()V

    .line 104
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsControllerImpl;->clearError()V

    .line 119
    return-void
.end method

.method public showTOS(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 48
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/digits/sdk/android/DigitsControllerImpl;->getTOSUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 49
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 50
    return-void
.end method

.method startActivityForResult(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 68
    const/16 v0, 0x8c

    invoke-virtual {p1, p2, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 69
    return-void
.end method

.method public startFallback(Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/digits/sdk/android/DigitsException;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "receiver"    # Landroid/os/ResultReceiver;
    .param p3, "reason"    # Lcom/digits/sdk/android/DigitsException;

    .prologue
    .line 73
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/digits/sdk/android/DigitsControllerImpl;->activityClassManager:Lcom/digits/sdk/android/ActivityClassManager;

    invoke-interface {v1}, Lcom/digits/sdk/android/ActivityClassManager;->getFailureActivity()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "receiver"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 75
    const-string v1, "fallback_reason"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 77
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 78
    const/16 v1, 0xc8

    invoke-static {p1, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->finishAffinity(Landroid/content/Context;I)V

    .line 79
    return-void
.end method

.method public validateInput(Ljava/lang/CharSequence;)Z
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 83
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
