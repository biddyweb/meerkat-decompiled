.class Lcom/twitter/sdk/android/core/identity/OAuthController$1;
.super Lcom/twitter/sdk/android/core/Callback;
.source "OAuthController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/identity/OAuthController;->newRequestTempTokenCallback()Lcom/twitter/sdk/android/core/Callback;
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
    .line 59
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 4
    .param p1, "error"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 74
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Twitter"

    const-string v2, "Failed to get request token"

    invoke-interface {v0, v1, v2, p1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    const/4 v1, 0x1

    new-instance v2, Lcom/twitter/sdk/android/core/TwitterAuthException;

    const-string v3, "Failed to get request token"

    invoke-direct {v2, v3}, Lcom/twitter/sdk/android/core/TwitterAuthException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/twitter/sdk/android/core/identity/OAuthController;->handleAuthError(ILcom/twitter/sdk/android/core/TwitterAuthException;)V

    .line 80
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
    .line 62
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;>;"
    iget-object v2, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;

    iget-object v1, v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;->authToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    iput-object v1, v2, Lcom/twitter/sdk/android/core/identity/OAuthController;->requestToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    .line 63
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    # getter for: Lcom/twitter/sdk/android/core/identity/OAuthController;->oAuth1aService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;
    invoke-static {v1}, Lcom/twitter/sdk/android/core/identity/OAuthController;->access$000(Lcom/twitter/sdk/android/core/identity/OAuthController;)Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

    move-result-object v1

    iget-object v2, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    iget-object v2, v2, Lcom/twitter/sdk/android/core/identity/OAuthController;->requestToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->getAuthorizeUrl(Lcom/twitter/sdk/android/core/TwitterAuthToken;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "authorizeUrl":Ljava/lang/String;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Twitter"

    const-string v3, "Redirecting user to web view to complete authorization flow"

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    iget-object v2, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    # getter for: Lcom/twitter/sdk/android/core/identity/OAuthController;->webView:Landroid/webkit/WebView;
    invoke-static {v2}, Lcom/twitter/sdk/android/core/identity/OAuthController;->access$100(Lcom/twitter/sdk/android/core/identity/OAuthController;)Landroid/webkit/WebView;

    move-result-object v2

    new-instance v3, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;

    iget-object v4, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    # getter for: Lcom/twitter/sdk/android/core/identity/OAuthController;->oAuth1aService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;
    invoke-static {v4}, Lcom/twitter/sdk/android/core/identity/OAuthController;->access$000(Lcom/twitter/sdk/android/core/identity/OAuthController;)Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

    move-result-object v4

    iget-object v5, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    # getter for: Lcom/twitter/sdk/android/core/identity/OAuthController;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    invoke-static {v5}, Lcom/twitter/sdk/android/core/identity/OAuthController;->access$200(Lcom/twitter/sdk/android/core/identity/OAuthController;)Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->buildCallbackUrl(Lcom/twitter/sdk/android/core/TwitterAuthConfig;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;->this$0:Lcom/twitter/sdk/android/core/identity/OAuthController;

    invoke-direct {v3, v4, v5}, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;-><init>(Ljava/lang/String;Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;)V

    new-instance v4, Lcom/twitter/sdk/android/core/identity/OAuthWebChromeClient;

    invoke-direct {v4}, Lcom/twitter/sdk/android/core/identity/OAuthWebChromeClient;-><init>()V

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/twitter/sdk/android/core/identity/OAuthController;->setUpWebView(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;Ljava/lang/String;Landroid/webkit/WebChromeClient;)V

    .line 70
    return-void
.end method
