.class Lcom/twitter/sdk/android/core/identity/ShareEmailController$1;
.super Lcom/twitter/sdk/android/core/Callback;
.source "ShareEmailController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/identity/ShareEmailController;->newCallback()Lcom/twitter/sdk/android/core/Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/twitter/sdk/android/core/models/User;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/core/identity/ShareEmailController;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/identity/ShareEmailController;)V
    .locals 0

    .prologue
    .line 31
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController$1;->this$0:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 3
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 39
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Twitter"

    const-string v2, "Failed to get email address."

    invoke-interface {v0, v1, v2, p1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController$1;->this$0:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    new-instance v1, Lcom/twitter/sdk/android/core/TwitterException;

    const-string v2, "Failed to get email address."

    invoke-direct {v1, v2}, Lcom/twitter/sdk/android/core/TwitterException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->sendResultCodeError(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 43
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/models/User;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/models/User;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/ShareEmailController$1;->this$0:Lcom/twitter/sdk/android/core/identity/ShareEmailController;

    iget-object v0, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v0, Lcom/twitter/sdk/android/core/models/User;

    invoke-virtual {v1, v0}, Lcom/twitter/sdk/android/core/identity/ShareEmailController;->handleSuccess(Lcom/twitter/sdk/android/core/models/User;)V

    .line 35
    return-void
.end method
