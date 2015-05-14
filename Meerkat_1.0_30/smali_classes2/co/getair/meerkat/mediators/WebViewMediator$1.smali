.class Lco/getair/meerkat/mediators/WebViewMediator$1;
.super Landroid/webkit/WebViewClient;
.source "WebViewMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/WebViewMediator;->onRegister()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/WebViewMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/WebViewMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/WebViewMediator;

    .prologue
    .line 56
    iput-object p1, p0, Lco/getair/meerkat/mediators/WebViewMediator$1;->this$0:Lco/getair/meerkat/mediators/WebViewMediator;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 59
    const/4 v0, 0x0

    return v0
.end method
