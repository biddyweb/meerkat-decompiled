.class Lcom/digits/sdk/android/DigitsClient$1;
.super Lcom/digits/sdk/android/DigitsCallback;
.source "DigitsClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/DigitsClient;->registerDevice(Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/digits/sdk/android/DigitsCallback",
        "<",
        "Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/DigitsClient;

.field final synthetic val$callback:Lcom/twitter/sdk/android/core/Callback;

.field final synthetic val$phoneNumber:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/DigitsClient;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 0
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # Lcom/digits/sdk/android/DigitsController;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsClient$1;->this$0:Lcom/digits/sdk/android/DigitsClient;

    iput-object p4, p0, Lcom/digits/sdk/android/DigitsClient$1;->val$phoneNumber:Ljava/lang/String;

    iput-object p5, p0, Lcom/digits/sdk/android/DigitsClient$1;->val$callback:Lcom/twitter/sdk/android/core/Callback;

    invoke-direct {p0, p2, p3}, Lcom/digits/sdk/android/DigitsCallback;-><init>(Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;>;"
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsClient$1;->this$0:Lcom/digits/sdk/android/DigitsClient;

    invoke-static {v1, p1}, Lcom/digits/sdk/android/DigitsClient;->access$000(Lcom/digits/sdk/android/DigitsClient;Lcom/twitter/sdk/android/core/Result;)Lcom/digits/sdk/android/DigitsSession;

    move-result-object v0

    .line 78
    .local v0, "session":Lcom/digits/sdk/android/DigitsSession;
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsClient$1;->this$0:Lcom/digits/sdk/android/DigitsClient;

    new-instance v2, Lcom/digits/sdk/android/DigitsAPIProvider;

    iget-object v3, p0, Lcom/digits/sdk/android/DigitsClient$1;->this$0:Lcom/digits/sdk/android/DigitsClient;

    invoke-static {v3}, Lcom/digits/sdk/android/DigitsClient;->access$100(Lcom/digits/sdk/android/DigitsClient;)Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v3

    invoke-virtual {v3}, Lcom/twitter/sdk/android/core/TwitterCore;->getAuthConfig()Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    move-result-object v3

    iget-object v4, p0, Lcom/digits/sdk/android/DigitsClient$1;->this$0:Lcom/digits/sdk/android/DigitsClient;

    invoke-static {v4}, Lcom/digits/sdk/android/DigitsClient;->access$100(Lcom/digits/sdk/android/DigitsClient;)Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v4

    invoke-virtual {v4}, Lcom/twitter/sdk/android/core/TwitterCore;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v4

    iget-object v5, p0, Lcom/digits/sdk/android/DigitsClient$1;->this$0:Lcom/digits/sdk/android/DigitsClient;

    invoke-static {v5}, Lcom/digits/sdk/android/DigitsClient;->access$200(Lcom/digits/sdk/android/DigitsClient;)Lcom/digits/sdk/android/Digits;

    move-result-object v5

    invoke-virtual {v5}, Lcom/digits/sdk/android/Digits;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    invoke-direct {v2, v0, v3, v4, v5}, Lcom/digits/sdk/android/DigitsAPIProvider;-><init>(Lcom/digits/sdk/android/DigitsSession;Lcom/twitter/sdk/android/core/TwitterAuthConfig;Ljavax/net/ssl/SSLSocketFactory;Ljava/util/concurrent/ExecutorService;)V

    iput-object v2, v1, Lcom/digits/sdk/android/DigitsClient;->digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

    .line 80
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsClient$1;->this$0:Lcom/digits/sdk/android/DigitsClient;

    iget-object v1, v1, Lcom/digits/sdk/android/DigitsClient;->digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

    invoke-virtual {v1}, Lcom/digits/sdk/android/DigitsAPIProvider;->getDeviceService()Lcom/digits/sdk/android/DigitsAPIProvider$DeviceService;

    move-result-object v1

    iget-object v2, p0, Lcom/digits/sdk/android/DigitsClient$1;->val$phoneNumber:Ljava/lang/String;

    const-string v3, "third_party_confirmation_code"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v5, p0, Lcom/digits/sdk/android/DigitsClient$1;->val$callback:Lcom/twitter/sdk/android/core/Callback;

    invoke-interface {v1, v2, v3, v4, v5}, Lcom/digits/sdk/android/DigitsAPIProvider$DeviceService;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/twitter/sdk/android/core/Callback;)V

    .line 82
    return-void
.end method
