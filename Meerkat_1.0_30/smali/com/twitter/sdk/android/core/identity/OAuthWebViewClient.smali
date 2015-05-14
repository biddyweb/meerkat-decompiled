.class Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "OAuthWebViewClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;
    }
.end annotation


# instance fields
.field private final completeUrl:Ljava/lang/String;

.field private final listener:Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;)V
    .locals 0
    .param p1, "completeUrl"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;->completeUrl:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;->listener:Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;

    .line 28
    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 33
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;->listener:Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;

    invoke-interface {v0, p1, p2}, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;->listener:Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;

    new-instance v1, Lcom/twitter/sdk/android/core/identity/WebViewException;

    invoke-direct {v1, p2, p3, p4}, Lcom/twitter/sdk/android/core/identity/WebViewException;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;->onError(Lcom/twitter/sdk/android/core/identity/WebViewException;)V

    .line 56
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "handler"    # Landroid/webkit/SslErrorHandler;
    .param p3, "error"    # Landroid/net/http/SslError;

    .prologue
    const/4 v3, 0x0

    .line 60
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 61
    iget-object v0, p0, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;->listener:Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;

    new-instance v1, Lcom/twitter/sdk/android/core/identity/WebViewException;

    invoke-virtual {p3}, Landroid/net/http/SslError;->getPrimaryError()I

    move-result v2

    invoke-direct {v1, v2, v3, v3}, Lcom/twitter/sdk/android/core/identity/WebViewException;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;->onError(Lcom/twitter/sdk/android/core/identity/WebViewException;)V

    .line 62
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 38
    iget-object v4, p0, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;->completeUrl:Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 39
    invoke-static {p2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lio/fabric/sdk/android/services/network/UrlUtils;->getQueryParams(Ljava/net/URI;Z)Ljava/util/TreeMap;

    move-result-object v3

    .line 41
    .local v3, "params":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-virtual {v3}, Ljava/util/TreeMap;->size()I

    move-result v4

    invoke-direct {v0, v4}, Landroid/os/Bundle;-><init>(I)V

    .line 42
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-virtual {v3}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 43
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 45
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    iget-object v4, p0, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient;->listener:Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;

    invoke-interface {v4, v0}, Lcom/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener;->onSuccess(Landroid/os/Bundle;)V

    .line 46
    const/4 v4, 0x1

    .line 48
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "params":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_1
    return v4

    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v4

    goto :goto_1
.end method
