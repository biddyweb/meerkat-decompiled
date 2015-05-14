.class public Lco/getair/meerkat/mediators/WebViewMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "WebViewMediator.java"


# instance fields
.field private final navigationBar:Lco/getair/meerkat/views/NavigationBar;

.field private final webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, p2

    .line 35
    check-cast v0, Landroid/view/View;

    .line 37
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f0e00de

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->webView:Landroid/webkit/WebView;

    .line 38
    const v1, 0x7f0e00dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/views/NavigationBar;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    .line 39
    return-void
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 73
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "webviewOpen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 77
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    const-string v2, "title"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/views/NavigationBar;->setTitle(Ljava/lang/String;)V

    .line 79
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->webView:Landroid/webkit/WebView;

    const-string v2, "url"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 81
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 66
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "webviewOpen"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 43
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 45
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lco/getair/meerkat/views/NavigationBar;->setTitle(Ljava/lang/String;)V

    .line 46
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/views/NavigationBar;->setProfileInfoVisible(Ljava/lang/Boolean;)V

    .line 47
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/views/NavigationBar;->setLeaderboardVisible(Ljava/lang/Boolean;)V

    .line 48
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/views/NavigationBar;->setLogoVisible(Ljava/lang/Boolean;)V

    .line 49
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/views/NavigationBar;->setSearchVisible(Ljava/lang/Boolean;)V

    .line 50
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WebViewMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/views/NavigationBar;->setFacade(Lorg/puremvc/java/multicore/patterns/facade/Facade;)V

    .line 52
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->webView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 53
    .local v0, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 54
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 56
    iget-object v1, p0, Lco/getair/meerkat/mediators/WebViewMediator;->webView:Landroid/webkit/WebView;

    new-instance v2, Lco/getair/meerkat/mediators/WebViewMediator$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WebViewMediator$1;-><init>(Lco/getair/meerkat/mediators/WebViewMediator;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 62
    return-void
.end method
