.class public Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;
.super Landroid/app/Activity;
.source "ShareEmailActivity.java"


# static fields
.field static final EXTRA_RESULT_RECEIVER:Ljava/lang/String; = "result_receiver"

.field static final EXTRA_SESSION_ID:Ljava/lang/String; = "session_id"


# instance fields
.field controller:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

.field private session:Lcom/twitter/sdk/android/core/TwitterSession;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private getResultReceiver(Landroid/content/Intent;)Landroid/os/ResultReceiver;
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 53
    const-string v1, "result_receiver"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/ResultReceiver;

    .line 54
    .local v0, "resultReceiver":Landroid/os/ResultReceiver;
    if-nez v0, :cond_0

    .line 55
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "ResultReceiver must not be null. This activity should not be started directly."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 58
    :cond_0
    return-object v0
.end method

.method private getSession(Landroid/content/Intent;)Lcom/twitter/sdk/android/core/TwitterSession;
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 63
    const-string v1, "session_id"

    const-wide/16 v4, -0x1

    invoke-virtual {p1, v1, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 65
    .local v2, "sessionId":J
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/TwitterCore;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v1

    invoke-interface {v1, v2, v3}, Lcom/twitter/sdk/android/core/SessionManager;->getSession(J)Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/TwitterSession;

    .line 67
    .local v0, "session":Lcom/twitter/sdk/android/core/TwitterSession;
    if-nez v0, :cond_0

    .line 68
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No TwitterSession for id:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 70
    :cond_0
    return-object v0
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->controller:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->cancelRequest()V

    .line 93
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 94
    return-void
.end method

.method public onClickAllow(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->controller:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->executeRequest()V

    .line 87
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->finish()V

    .line 88
    return-void
.end method

.method public onClickNotNow(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->controller:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->cancelRequest()V

    .line 82
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->finish()V

    .line 83
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    sget v4, Lcom/twitter/sdk/android/core/R$layout;->tw__activity_share_email:I

    invoke-virtual {p0, v4}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->setContentView(I)V

    .line 39
    :try_start_0
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 40
    .local v3, "startIntent":Landroid/content/Intent;
    invoke-direct {p0, v3}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->getResultReceiver(Landroid/content/Intent;)Landroid/os/ResultReceiver;

    move-result-object v1

    .line 41
    .local v1, "resultReceiver":Landroid/os/ResultReceiver;
    invoke-direct {p0, v3}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->getSession(Landroid/content/Intent;)Lcom/twitter/sdk/android/core/TwitterSession;

    move-result-object v4

    iput-object v4, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->session:Lcom/twitter/sdk/android/core/TwitterSession;

    .line 42
    new-instance v4, Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    new-instance v5, Lcom/twitter/sdk/android/core/identity/ShareEmailClient;

    iget-object v6, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->session:Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-direct {v5, v6}, Lcom/twitter/sdk/android/core/identity/ShareEmailClient;-><init>(Lcom/twitter/sdk/android/core/TwitterSession;)V

    invoke-direct {v4, v5, v1}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;-><init>(Lcom/twitter/sdk/android/core/identity/ShareEmailClient;Landroid/os/ResultReceiver;)V

    iput-object v4, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->controller:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    .line 44
    sget v4, Lcom/twitter/sdk/android/core/R$id;->tw__share_email_desc:I

    invoke-virtual {p0, v4}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 45
    .local v2, "shareEmailDescView":Landroid/widget/TextView;
    invoke-virtual {p0, p0, v2}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->setUpShareEmailDesc(Landroid/content/Context;Landroid/widget/TextView;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .end local v1    # "resultReceiver":Landroid/os/ResultReceiver;
    .end local v2    # "shareEmailDescView":Landroid/widget/TextView;
    .end local v3    # "startIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v4

    const-string v5, "Twitter"

    const-string v6, "Failed to create ShareEmailActivity."

    invoke-interface {v4, v5, v6, v0}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->finish()V

    goto :goto_0
.end method

.method setUpShareEmailDesc(Landroid/content/Context;Landroid/widget/TextView;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "shareEmailDescView"    # Landroid/widget/TextView;

    .prologue
    .line 74
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 75
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/twitter/sdk/android/core/R$string;->tw__share_email_desc:I

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailActivity;->session:Lcom/twitter/sdk/android/core/TwitterSession;

    invoke-virtual {v5}, Lcom/twitter/sdk/android/core/TwitterSession;->getUserName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    return-void
.end method
