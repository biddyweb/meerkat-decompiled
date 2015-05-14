.class Lcom/twitter/sdk/android/core/identity/OAuthController$2;
.super Lcom/twitter/sdk/android/core/Callback;
.source "OAuthController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/identity/OAuthController;->newRequestAccessTokenCallback()Lcom/twitter/sdk/android/core/Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/identity/OAuthController;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$2;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 4
    .param p1, "error"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 146
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Twitter"

    const-string v2, "Failed to get access token"

    invoke-interface {v0, v1, v2, p1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 149
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$2;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    const/4 v1, 0x1

    new-instance v2, Lcom/twitter/sdk/android/core/TwitterAuthException;

    const-string v3, "Failed to get access token"

    invoke-direct {v2, v3}, Lcom/twitter/sdk/android/core/TwitterAuthException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/twitter/sdk/android/core/identity/OAuthController;->handleAuthError(ILcom/twitter/sdk/android/core/TwitterAuthException;)V

    .line 151
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 135
    .local v0, "data":Landroid/content/Intent;
    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;

    .line 136
    .local v1, "response":Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;
    const-string v2, "screen_name"

    iget-object v3, v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;->userName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    const-string v2, "user_id"

    iget-wide v4, v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;->userId:J

    invoke-virtual {v0, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 138
    const-string v2, "tk"

    iget-object v3, v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;->authToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/TwitterAuthToken;->token:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    const-string v2, "ts"

    iget-object v3, v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;->authToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/TwitterAuthToken;->secret:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    iget-object v2, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$2;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    iget-object v2, v2, Lcom/twitter/sdk/android/core/identity/OAuthController;->listener:Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;

    const/4 v3, -0x1

    invoke-interface {v2, v3, v0}, Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;->onComplete(ILandroid/content/Intent;)V

    .line 142
    return-void
.end method
