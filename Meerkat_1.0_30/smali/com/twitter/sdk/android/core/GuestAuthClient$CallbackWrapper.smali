.class Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;
.super Lcom/twitter/sdk/android/core/Callback;
.source "GuestAuthClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/core/GuestAuthClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CallbackWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;",
        ">;"
    }
.end annotation


# instance fields
.field private final appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;"
        }
    .end annotation
.end field

.field private final callback:Lcom/twitter/sdk/android/core/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/twitter/sdk/android/core/GuestAuthClient;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/GuestAuthClient;Lcom/twitter/sdk/android/core/SessionManager;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "appSessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/twitter/sdk/android/core/AppSession;>;"
    .local p3, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/AppSession;>;"
    iput-object p1, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->this$0:Lcom/twitter/sdk/android/core/GuestAuthClient;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    .line 45
    iput-object p2, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 46
    iput-object p3, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->callback:Lcom/twitter/sdk/android/core/Callback;

    .line 47
    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 1
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->callback:Lcom/twitter/sdk/android/core/Callback;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->callback:Lcom/twitter/sdk/android/core/Callback;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/core/Callback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V

    .line 64
    :cond_0
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 4
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
    .line 51
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;>;"
    new-instance v0, Lcom/twitter/sdk/android/core/AppSession;

    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;

    invoke-direct {v0, v1}, Lcom/twitter/sdk/android/core/AppSession;-><init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;)V

    .line 53
    .local v0, "session":Lcom/twitter/sdk/android/core/AppSession;
    iget-object v1, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->appSessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/AppSession;->getId()J

    move-result-wide v2

    invoke-interface {v1, v2, v3, v0}, Lcom/twitter/sdk/android/core/SessionManager;->setSession(JLcom/twitter/sdk/android/core/Session;)V

    .line 54
    iget-object v1, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->callback:Lcom/twitter/sdk/android/core/Callback;

    if-eqz v1, :cond_0

    .line 55
    iget-object v1, p0, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;->callback:Lcom/twitter/sdk/android/core/Callback;

    new-instance v2, Lcom/twitter/sdk/android/core/Result;

    iget-object v3, p1, Lcom/twitter/sdk/android/core/Result;->response:Lretrofit/client/Response;

    invoke-direct {v2, v0, v3}, Lcom/twitter/sdk/android/core/Result;-><init>(Ljava/lang/Object;Lretrofit/client/Response;)V

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/Callback;->success(Lcom/twitter/sdk/android/core/Result;)V

    .line 57
    :cond_0
    return-void
.end method
