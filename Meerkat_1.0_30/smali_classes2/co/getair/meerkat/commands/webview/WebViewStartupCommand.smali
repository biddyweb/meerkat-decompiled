.class public Lco/getair/meerkat/commands/webview/WebViewStartupCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "WebViewStartupCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method private getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;
    .locals 1

    .prologue
    .line 49
    invoke-virtual {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    return-object v0
.end method

.method private registerCommands()V
    .locals 3

    .prologue
    .line 34
    invoke-virtual {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "webviewOpen"

    new-instance v2, Lco/getair/meerkat/commands/webview/WebViewOpenUrlCommand;

    invoke-direct {v2}, Lco/getair/meerkat/commands/webview/WebViewOpenUrlCommand;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerCommand(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/ICommand;)V

    .line 35
    return-void
.end method

.method private registerMediators()V
    .locals 4

    .prologue
    .line 38
    new-instance v0, Lco/getair/meerkat/mediators/WebViewMediator;

    const-string v1, "webviewMediator"

    invoke-direct {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0e00dc

    invoke-virtual {v2, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/mediators/WebViewMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    .local v0, "mediator":Lco/getair/meerkat/mediators/WebViewMediator;
    invoke-virtual {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 40
    return-void
.end method

.method private registerProxies()V
    .locals 0

    .prologue
    .line 44
    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 3
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 19
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 21
    invoke-direct {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->registerCommands()V

    .line 22
    invoke-direct {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->registerProxies()V

    .line 23
    invoke-direct {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->registerMediators()V

    .line 25
    const-string v0, "webviewOpen"

    .line 26
    invoke-direct {p0}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->getBaseFacade()Lco/getair/meerkat/facades/BaseFacade;

    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 28
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const/4 v2, 0x0

    .line 25
    invoke-virtual {p0, v0, v1, v2}, Lco/getair/meerkat/commands/webview/WebViewStartupCommand;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    return-void
.end method
