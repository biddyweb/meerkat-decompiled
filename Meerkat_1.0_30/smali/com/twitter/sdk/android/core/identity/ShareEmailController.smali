.class Lcom/twitter/sdk/android/core/identity/ShareEmailController;
.super Ljava/lang/Object;
.source "ShareEmailController.java"


# static fields
.field private static final EMPTY_EMAIL:Ljava/lang/String; = ""


# instance fields
.field private final emailClient:Lcom/twitter/sdk/android/core/identity/ShareEmailClient;

.field private final resultReceiver:Landroid/os/ResultReceiver;


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/identity/ShareEmailClient;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p1, "emailClient"    # Lcom/twitter/sdk/android/core/identity/ShareEmailClient;
    .param p2, "resultReceiver"    # Landroid/os/ResultReceiver;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->emailClient:Lcom/twitter/sdk/android/core/identity/ShareEmailClient;

    .line 23
    iput-object p2, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->resultReceiver:Landroid/os/ResultReceiver;

    .line 24
    return-void
.end method


# virtual methods
.method public cancelRequest()V
    .locals 3

    .prologue
    .line 72
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 73
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "msg"

    const-string v2, "The user chose not to share their email address at this time."

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 75
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->resultReceiver:Landroid/os/ResultReceiver;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 76
    return-void
.end method

.method public executeRequest()V
    .locals 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->emailClient:Lcom/twitter/sdk/android/core/identity/ShareEmailClient;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->newCallback()Lcom/twitter/sdk/android/core/Callback;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/identity/ShareEmailClient;->getEmail(Lcom/twitter/sdk/android/core/Callback;)V

    .line 28
    return-void
.end method

.method handleSuccess(Lcom/twitter/sdk/android/core/models/User;)V
    .locals 2
    .param p1, "user"    # Lcom/twitter/sdk/android/core/models/User;

    .prologue
    .line 48
    iget-object v0, p1, Lcom/twitter/sdk/android/core/models/User;->email:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Lcom/twitter/sdk/android/core/TwitterException;

    const-string v1, "Your application may not have access to email addresses or the user may not have an email address. To request access, please visit https://support.twitter.com/forms/platform."

    invoke-direct {v0, v1}, Lcom/twitter/sdk/android/core/TwitterException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->sendResultCodeError(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 57
    :goto_0
    return-void

    .line 52
    :cond_0
    const-string v0, ""

    iget-object v1, p1, Lcom/twitter/sdk/android/core/models/User;->email:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 53
    new-instance v0, Lcom/twitter/sdk/android/core/TwitterException;

    const-string v1, "This user does not have an email address."

    invoke-direct {v0, v1}, Lcom/twitter/sdk/android/core/TwitterException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->sendResultCodeError(Lcom/twitter/sdk/android/core/TwitterException;)V

    goto :goto_0

    .line 55
    :cond_1
    iget-object v0, p1, Lcom/twitter/sdk/android/core/models/User;->email:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->sendResultCodeOk(Ljava/lang/String;)V

    goto :goto_0
.end method

.method newCallback()Lcom/twitter/sdk/android/core/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/models/User;",
            ">;"
        }
    .end annotation

    .prologue
    .line 31
    new-instance v0, Lcom/twitter/sdk/android/core/identity/ShareEmailController$1;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController$1;-><init>(Lcom/twitter/sdk/android/core/identity/ShareEmailController;)V

    return-object v0
.end method

.method sendResultCodeError(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 3
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 66
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 67
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "error"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 68
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->resultReceiver:Landroid/os/ResultReceiver;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 69
    return-void
.end method

.method sendResultCodeOk(Ljava/lang/String;)V
    .locals 3
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 60
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 61
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "email"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->resultReceiver:Landroid/os/ResultReceiver;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 63
    return-void
.end method
