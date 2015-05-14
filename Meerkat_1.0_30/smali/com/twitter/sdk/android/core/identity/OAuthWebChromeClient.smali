.class Lcom/twitter/sdk/android/core/identity/OAuthWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "OAuthWebChromeClient.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 1
    .param p1, "consoleMessage"    # Landroid/webkit/ConsoleMessage;

    .prologue
    .line 11
    const/4 v0, 0x1

    return v0
.end method
