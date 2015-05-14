.class Lcom/digits/sdk/android/FailureControllerImpl;
.super Ljava/lang/Object;
.source "FailureControllerImpl.java"

# interfaces
.implements Lcom/digits/sdk/android/FailureController;


# instance fields
.field final classManager:Lcom/digits/sdk/android/ActivityClassManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getActivityClassManager()Lcom/digits/sdk/android/ActivityClassManager;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/digits/sdk/android/FailureControllerImpl;-><init>(Lcom/digits/sdk/android/ActivityClassManager;)V

    .line 15
    return-void
.end method

.method public constructor <init>(Lcom/digits/sdk/android/ActivityClassManager;)V
    .locals 0
    .param p1, "classManager"    # Lcom/digits/sdk/android/ActivityClassManager;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/digits/sdk/android/FailureControllerImpl;->classManager:Lcom/digits/sdk/android/ActivityClassManager;

    .line 19
    return-void
.end method


# virtual methods
.method getFlags()I
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 38
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 39
    const v0, 0x10008000

    .line 41
    :goto_0
    return v0

    :cond_0
    const/high16 v0, 0x14000000

    goto :goto_0
.end method

.method public sendFailure(Landroid/os/ResultReceiver;Ljava/lang/Exception;)V
    .locals 3
    .param p1, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p2, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 31
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 32
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "login_error"

    invoke-virtual {p2}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    const/16 v1, 0x190

    invoke-virtual {p1, v1, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 34
    return-void
.end method

.method public tryAnotherNumber(Landroid/app/Activity;Landroid/os/ResultReceiver;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "resultReceiver"    # Landroid/os/ResultReceiver;

    .prologue
    .line 22
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/digits/sdk/android/FailureControllerImpl;->classManager:Lcom/digits/sdk/android/ActivityClassManager;

    invoke-interface {v2}, Lcom/digits/sdk/android/ActivityClassManager;->getPhoneNumberActivity()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 23
    .local v1, "intent":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 24
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "receiver"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 25
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 26
    invoke-virtual {p0}, Lcom/digits/sdk/android/FailureControllerImpl;->getFlags()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 27
    invoke-virtual {p1, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 28
    return-void
.end method
