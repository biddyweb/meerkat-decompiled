.class Lcom/digits/sdk/android/LoginResultReceiver;
.super Landroid/os/ResultReceiver;
.source "LoginResultReceiver.java"


# static fields
.field static final KEY_ERROR:Ljava/lang/String; = "login_error"

.field static final RESULT_ERROR:I = 0x190

.field static final RESULT_OK:I = 0xc8


# instance fields
.field final callback:Lcom/digits/sdk/android/AuthCallback;

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
.method constructor <init>(Lcom/digits/sdk/android/AuthCallback;Lcom/twitter/sdk/android/core/SessionManager;)V
    .locals 1
    .param p1, "callback"    # Lcom/digits/sdk/android/AuthCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/digits/sdk/android/AuthCallback;",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p2, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/digits/sdk/android/DigitsSession;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 21
    iput-object p1, p0, Lcom/digits/sdk/android/LoginResultReceiver;->callback:Lcom/digits/sdk/android/AuthCallback;

    .line 22
    iput-object p2, p0, Lcom/digits/sdk/android/LoginResultReceiver;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 23
    return-void
.end method


# virtual methods
.method public onReceiveResult(ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "resultCode"    # I
    .param p2, "resultData"    # Landroid/os/Bundle;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/digits/sdk/android/LoginResultReceiver;->callback:Lcom/digits/sdk/android/AuthCallback;

    if-eqz v0, :cond_0

    .line 28
    const/16 v0, 0xc8

    if-ne p1, v0, :cond_1

    .line 29
    iget-object v1, p0, Lcom/digits/sdk/android/LoginResultReceiver;->callback:Lcom/digits/sdk/android/AuthCallback;

    iget-object v0, p0, Lcom/digits/sdk/android/LoginResultReceiver;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v0}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/DigitsSession;

    const-string v2, "phone_number"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/digits/sdk/android/AuthCallback;->success(Lcom/digits/sdk/android/DigitsSession;Ljava/lang/String;)V

    .line 35
    :cond_0
    :goto_0
    return-void

    .line 31
    :cond_1
    const/16 v0, 0x190

    if-ne p1, v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/digits/sdk/android/LoginResultReceiver;->callback:Lcom/digits/sdk/android/AuthCallback;

    new-instance v1, Lcom/digits/sdk/android/DigitsException;

    const-string v2, "login_error"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/digits/sdk/android/DigitsException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/digits/sdk/android/AuthCallback;->failure(Lcom/digits/sdk/android/DigitsException;)V

    goto :goto_0
.end method
