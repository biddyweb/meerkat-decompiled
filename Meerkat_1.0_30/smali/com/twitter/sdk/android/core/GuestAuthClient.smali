.class Lcom/twitter/sdk/android/core/GuestAuthClient;
.super Ljava/lang/Object;
.source "GuestAuthClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;
    }
.end annotation


# instance fields
.field private final service:Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;)V
    .locals 2
    .param p1, "service"    # Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    if-nez p1, :cond_0

    .line 19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "OAuth2Service must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_0
    iput-object p1, p0, Lcom/twitter/sdk/android/core/GuestAuthClient;->service:Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

    .line 22
    return-void
.end method


# virtual methods
.method authorize(Lcom/twitter/sdk/android/core/SessionManager;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 2
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
    .line 30
    .local p1, "appSessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/twitter/sdk/android/core/AppSession;>;"
    .local p2, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/AppSession;>;"
    if-nez p1, :cond_0

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SessionManager must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/core/GuestAuthClient;->service:Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

    new-instance v1, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;

    invoke-direct {v1, p0, p1, p2}, Lcom/twitter/sdk/android/core/GuestAuthClient$CallbackWrapper;-><init>(Lcom/twitter/sdk/android/core/GuestAuthClient;Lcom/twitter/sdk/android/core/SessionManager;Lcom/twitter/sdk/android/core/Callback;)V

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;->requestGuestOrAppAuthToken(Lcom/twitter/sdk/android/core/Callback;)V

    .line 34
    return-void
.end method
