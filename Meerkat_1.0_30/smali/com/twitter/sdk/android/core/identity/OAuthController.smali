.class Lcom/twitter/sdk/android/core/identity/OAuthController;
.super Ljava/lang/Object;
.source "OAuthController.java"

# interfaces
.implements Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;
    }
.end annotation


# instance fields
.field private final authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

.field final listener:Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;

.field private final oAuth1aService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

.field requestToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

.field private final spinner:Landroid/widget/ProgressBar;

.field private final webView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Landroid/widget/ProgressBar;Landroid/webkit/WebView;Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;)V
    .locals 0
    .param p1, "spinner"    # Landroid/widget/ProgressBar;
    .param p2, "webView"    # Landroid/webkit/WebView;
    .param p3, "authConfig"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .param p4, "oAuth1aService"    # Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;
    .param p5, "listener"    # Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->spinner:Landroid/widget/ProgressBar;

    .line 43
    iput-object p2, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->webView:Landroid/webkit/WebView;

    .line 44
    iput-object p3, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .line 45
    iput-object p4, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->oAuth1aService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

    .line 46
    iput-object p5, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->listener:Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/twitter/sdk/android/core/identity/OAuthController;)Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;
    .locals 1
    .param p0, "x0"    # Lcom/twitter/sdk/android/core/identity/OAuthController;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->oAuth1aService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

    return-object v0
.end method

.method static synthetic access$100(Lcom/twitter/sdk/android/core/identity/OAuthController;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/twitter/sdk/android/core/identity/OAuthController;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->webView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/twitter/sdk/android/core/identity/OAuthController;)Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    .locals 1
    .param p0, "x0"    # Lcom/twitter/sdk/android/core/identity/OAuthController;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->authConfig:Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    return-object v0
.end method

.method private dismissSpinner()V
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->spinner:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 168
    return-void
.end method

.method private dismissWebView()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 163
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/identity/OAuthController;->dismissSpinner()V

    .line 164
    return-void
.end method

.method private handleWebViewError(Lcom/twitter/sdk/android/core/identity/WebViewException;)V
    .locals 3
    .param p1, "error"    # Lcom/twitter/sdk/android/core/identity/WebViewException;

    .prologue
    .line 156
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Twitter"

    const-string v2, "OAuth web view completed with an error"

    invoke-interface {v0, v1, v2, p1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 157
    const/4 v0, 0x1

    new-instance v1, Lcom/twitter/sdk/android/core/TwitterAuthException;

    const-string v2, "OAuth web view completed with an error"

    invoke-direct {v1, v2}, Lcom/twitter/sdk/android/core/TwitterAuthException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/twitter/sdk/android/core/identity/OAuthController;->handleAuthError(ILcom/twitter/sdk/android/core/TwitterAuthException;)V

    .line 159
    return-void
.end method

.method private handleWebViewSuccess(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 107
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Twitter"

    const-string v3, "OAuth web view completed successfully"

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    if-eqz p1, :cond_0

    .line 109
    const-string v1, "oauth_verifier"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, "verifier":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 112
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Twitter"

    const-string v3, "Converting the request token to an access token."

    invoke-interface {v1, v2, v3}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->oAuth1aService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/OAuthController;->newRequestAccessTokenCallback()Lcom/twitter/sdk/android/core/Callback;

    move-result-object v2

    iget-object v3, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->requestToken:Lcom/twitter/sdk/android/core/TwitterAuthToken;

    invoke-virtual {v1, v2, v3, v0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->requestAccessToken(Lcom/twitter/sdk/android/core/Callback;Lcom/twitter/sdk/android/core/TwitterAuthToken;Ljava/lang/String;)V

    .line 125
    .end local v0    # "verifier":Ljava/lang/String;
    :goto_0
    return-void

    .line 121
    :cond_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v1

    const-string v2, "Twitter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get authorization, bundle incomplete "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, v4}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 123
    const/4 v1, 0x1

    new-instance v2, Lcom/twitter/sdk/android/core/TwitterAuthException;

    const-string v3, "Failed to get authorization, bundle incomplete"

    invoke-direct {v2, v3}, Lcom/twitter/sdk/android/core/TwitterAuthException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v2}, Lcom/twitter/sdk/android/core/identity/OAuthController;->handleAuthError(ILcom/twitter/sdk/android/core/TwitterAuthException;)V

    goto :goto_0
.end method


# virtual methods
.method protected handleAuthError(ILcom/twitter/sdk/android/core/TwitterAuthException;)V
    .locals 2
    .param p1, "resultCode"    # I
    .param p2, "error"    # Lcom/twitter/sdk/android/core/TwitterAuthException;

    .prologue
    .line 85
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 86
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "auth_error"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 87
    iget-object v1, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->listener:Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;

    invoke-interface {v1, p1, v0}, Lcom/twitter/sdk/android/core/identity/OAuthController$Listener;->onComplete(ILandroid/content/Intent;)V

    .line 88
    return-void
.end method

.method newRequestAccessTokenCallback()Lcom/twitter/sdk/android/core/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 131
    new-instance v0, Lcom/twitter/sdk/android/core/identity/OAuthController$2;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/core/identity/OAuthController$2;-><init>(Lcom/twitter/sdk/android/core/identity/OAuthController;)V

    return-object v0
.end method

.method newRequestTempTokenCallback()Lcom/twitter/sdk/android/core/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuthResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Lcom/twitter/sdk/android/core/identity/OAuthController$1;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/core/identity/OAuthController$1;-><init>(Lcom/twitter/sdk/android/core/identity/OAuthController;)V

    return-object v0
.end method

.method public onError(Lcom/twitter/sdk/android/core/identity/WebViewException;)V
    .locals 0
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/identity/WebViewException;

    .prologue
    .line 184
    invoke-direct {p0, p1}, Lcom/twitter/sdk/android/core/identity/OAuthController;->handleWebViewError(Lcom/twitter/sdk/android/core/identity/WebViewException;)V

    .line 185
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/identity/OAuthController;->dismissWebView()V

    .line 186
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/identity/OAuthController;->dismissSpinner()V

    .line 173
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 174
    return-void
.end method

.method public onSuccess(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 178
    invoke-direct {p0, p1}, Lcom/twitter/sdk/android/core/identity/OAuthController;->handleWebViewSuccess(Landroid/os/Bundle;)V

    .line 179
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/identity/OAuthController;->dismissWebView()V

    .line 180
    return-void
.end method

.method setUpWebView(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;Ljava/lang/String;Landroid/webkit/WebChromeClient;)V
    .locals 2
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "webViewClient"    # Landroid/webkit/WebViewClient;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "webChromeClient"    # Landroid/webkit/WebChromeClient;

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 96
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 97
    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 98
    invoke-virtual {p1, v1}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 99
    invoke-virtual {p1, v1}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 100
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 101
    invoke-virtual {p1, p3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 102
    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 103
    invoke-virtual {p1, p4}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 104
    return-void
.end method

.method startAuth()V
    .locals 3

    .prologue
    .line 51
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v0

    const-string v1, "Twitter"

    const-string v2, "Obtaining request token to start the sign in flow"

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthController;->oAuth1aService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/identity/OAuthController;->newRequestTempTokenCallback()Lcom/twitter/sdk/android/core/Callback;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth1aService;->requestTempToken(Lcom/twitter/sdk/android/core/Callback;)V

    .line 53
    return-void
.end method
