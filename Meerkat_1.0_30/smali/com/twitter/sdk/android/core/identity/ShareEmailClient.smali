.class Lcom/twitter/sdk/android/core/identity/ShareEmailClient;
.super Lcom/twitter/sdk/android/core/TwitterApiClient;
.source "ShareEmailClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/identity/ShareEmailClient$EmailService;
    }
.end annotation


# static fields
.field static final RESULT_CODE_CANCELED:I = 0x0

.field static final RESULT_CODE_ERROR:I = 0x1

.field static final RESULT_CODE_OK:I = -0x1

.field static final RESULT_DATA_EMAIL:Ljava/lang/String; = "email"

.field static final RESULT_DATA_ERROR:Ljava/lang/String; = "error"

.field static final RESULT_DATA_MSG:Ljava/lang/String; = "msg"


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/TwitterSession;)V
    .locals 0
    .param p1, "session"    # Lcom/twitter/sdk/android/core/TwitterSession;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/twitter/sdk/android/core/TwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/Session;)V

    .line 24
    return-void
.end method


# virtual methods
.method protected getEmail(Lcom/twitter/sdk/android/core/Callback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/models/User;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/models/User;>;"
    const/4 v2, 0x1

    .line 32
    const-class v0, Lcom/twitter/sdk/android/core/identity/ShareEmailClient$EmailService;

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailClient;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/identity/ShareEmailClient$EmailService;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2, p1}, Lcom/twitter/sdk/android/core/identity/ShareEmailClient$EmailService;->verifyCredentials(Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/twitter/sdk/android/core/Callback;)V

    .line 33
    return-void
.end method
