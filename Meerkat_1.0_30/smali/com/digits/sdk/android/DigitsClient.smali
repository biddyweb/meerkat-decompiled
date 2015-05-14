.class public Lcom/digits/sdk/android/DigitsClient;
.super Ljava/lang/Object;
.source "DigitsClient.java"


# static fields
.field public static final EXTRA_FALLBACK_REASON:Ljava/lang/String; = "fallback_reason"

.field public static final EXTRA_PHONE:Ljava/lang/String; = "phone_number"

.field public static final EXTRA_REQUEST_ID:Ljava/lang/String; = "request_id"

.field public static final EXTRA_RESULT_RECEIVER:Ljava/lang/String; = "receiver"

.field public static final EXTRA_USER_ID:Ljava/lang/String; = "user_id"

.field private static final SCRIBE_ACTION:Ljava/lang/String; = "impression"

.field private static final SCRIBE_CLIENT:Ljava/lang/String; = "android"

.field private static final SCRIBE_COMPONENT:Ljava/lang/String; = ""

.field private static final SCRIBE_ELEMENT:Ljava/lang/String; = ""

.field private static final SCRIBE_PAGE:Ljava/lang/String; = "digits"

.field private static final SCRIBE_SECTION:Ljava/lang/String; = ""

.field public static final THIRD_PARTY_CONFIRMATION_CODE:Ljava/lang/String; = "third_party_confirmation_code"


# instance fields
.field private final authService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

.field private final digits:Lcom/digits/sdk/android/Digits;

.field protected digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

.field private final sessionManager:Lcom/twitter/sdk/android/core/SessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;"
        }
    .end annotation
.end field

.field private final twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;


# direct methods
.method constructor <init>()V
    .locals 7

    .prologue
    .line 41
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v1

    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v2

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v3

    new-instance v4, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v5

    invoke-virtual {v5}, Lcom/twitter/sdk/android/core/TwitterCore;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v5

    new-instance v6, Lcom/twitter/sdk/android/core/internal/TwitterApi;

    invoke-direct {v6}, Lcom/twitter/sdk/android/core/internal/TwitterApi;-><init>()V

    invoke-direct {v4, v0, v5, v6}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;-><init>(Lcom/twitter/sdk/android/core/TwitterCore;Ljavax/net/ssl/SSLSocketFactory;Lcom/twitter/sdk/android/core/internal/TwitterApi;)V

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/digits/sdk/android/DigitsClient;-><init>(Lcom/digits/sdk/android/Digits;Lcom/twitter/sdk/android/core/TwitterCore;Lcom/twitter/sdk/android/core/SessionManager;Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;Lcom/digits/sdk/android/DigitsAPIProvider;)V

    .line 44
    return-void
.end method

.method constructor <init>(Lcom/digits/sdk/android/Digits;Lcom/twitter/sdk/android/core/TwitterCore;Lcom/twitter/sdk/android/core/SessionManager;Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;Lcom/digits/sdk/android/DigitsAPIProvider;)V
    .locals 2
    .param p1, "digits"    # Lcom/digits/sdk/android/Digits;
    .param p2, "twitterCore"    # Lcom/twitter/sdk/android/core/TwitterCore;
    .param p4, "authService"    # Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;
    .param p5, "digitsAPIProvider"    # Lcom/digits/sdk/android/DigitsAPIProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/digits/sdk/android/Digits;",
            "Lcom/twitter/sdk/android/core/TwitterCore;",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/digits/sdk/android/DigitsSession;",
            ">;",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;",
            "Lcom/digits/sdk/android/DigitsAPIProvider;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    .local p3, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<Lcom/digits/sdk/android/DigitsSession;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    if-nez p2, :cond_0

    .line 50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "twitter must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    if-nez p1, :cond_1

    .line 53
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "digits must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_1
    if-nez p3, :cond_2

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sessionManager must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_2
    if-nez p4, :cond_3

    .line 59
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "authService must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_3
    iput-object p2, p0, Lcom/digits/sdk/android/DigitsClient;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    .line 63
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsClient;->digits:Lcom/digits/sdk/android/Digits;

    .line 64
    iput-object p3, p0, Lcom/digits/sdk/android/DigitsClient;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 65
    iput-object p4, p0, Lcom/digits/sdk/android/DigitsClient;->authService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

    .line 66
    iput-object p5, p0, Lcom/digits/sdk/android/DigitsClient;->digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

    .line 67
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/DigitsClient;Lcom/twitter/sdk/android/core/Result;)Lcom/digits/sdk/android/DigitsSession;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/DigitsClient;
    .param p1, "x1"    # Lcom/twitter/sdk/android/core/Result;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/DigitsClient;->setSession(Lcom/twitter/sdk/android/core/Result;)Lcom/digits/sdk/android/DigitsSession;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/digits/sdk/android/DigitsClient;)Lcom/twitter/sdk/android/core/TwitterCore;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/DigitsClient;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsClient;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    return-object v0
.end method

.method static synthetic access$200(Lcom/digits/sdk/android/DigitsClient;)Lcom/digits/sdk/android/Digits;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/DigitsClient;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsClient;->digits:Lcom/digits/sdk/android/Digits;

    return-object v0
.end method

.method private scribeImpression()V
    .locals 4

    .prologue
    .line 138
    new-instance v1, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    invoke-direct {v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;-><init>()V

    const-string v2, "android"

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setClient(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v1

    const-string v2, "digits"

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setPage(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setSection(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setComponent(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setElement(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v1

    const-string v2, "impression"

    invoke-virtual {v1, v2}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->setAction(Ljava/lang/String;)Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;->builder()Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    move-result-object v0

    .line 147
    .local v0, "ns":Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsClient;->digits:Lcom/digits/sdk/android/Digits;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/digits/sdk/android/Digits;->scribe([Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;)V

    .line 148
    return-void
.end method

.method private setSession(Lcom/twitter/sdk/android/core/Result;)Lcom/digits/sdk/android/DigitsSession;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;",
            ">;)",
            "Lcom/digits/sdk/android/DigitsSession;"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;>;"
    new-instance v0, Lcom/digits/sdk/android/DigitsSession;

    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;

    invoke-direct {v0, v1}, Lcom/digits/sdk/android/DigitsSession;-><init>(Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Token;)V

    .line 89
    .local v0, "session":Lcom/digits/sdk/android/DigitsSession;
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsClient;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    const-wide/16 v2, 0x0

    invoke-interface {v1, v2, v3, v0}, Lcom/twitter/sdk/android/core/SessionManager;->setSession(JLcom/twitter/sdk/android/core/Session;)V

    .line 90
    return-object v0
.end method

.method private startPhoneNumberActivity(Lcom/digits/sdk/android/AuthCallback;Landroid/content/Context;)V
    .locals 5
    .param p1, "callback"    # Lcom/digits/sdk/android/AuthCallback;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 112
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/digits/sdk/android/DigitsClient;->digits:Lcom/digits/sdk/android/Digits;

    invoke-virtual {v2}, Lcom/digits/sdk/android/Digits;->getActivityClassManager()Lcom/digits/sdk/android/ActivityClassManager;

    move-result-object v2

    invoke-interface {v2}, Lcom/digits/sdk/android/ActivityClassManager;->getPhoneNumberActivity()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p2, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 114
    .local v1, "intent":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 115
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "receiver"

    new-instance v3, Lcom/digits/sdk/android/LoginResultReceiver;

    iget-object v4, p0, Lcom/digits/sdk/android/DigitsClient;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-direct {v3, p1, v4}, Lcom/digits/sdk/android/LoginResultReceiver;-><init>(Lcom/digits/sdk/android/AuthCallback;Lcom/twitter/sdk/android/core/SessionManager;)V

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 117
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 118
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 119
    invoke-virtual {p2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    return-void
.end method


# virtual methods
.method protected authDevice(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 1
    .param p1, "phoneNumber"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/AuthResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p2, "listener":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/digits/sdk/android/AuthResponse;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsClient;->digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

    invoke-virtual {v0}, Lcom/digits/sdk/android/DigitsAPIProvider;->getSdkService()Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;->auth(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 129
    return-void
.end method

.method protected createAccount(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 1
    .param p1, "pin"    # Ljava/lang/String;
    .param p2, "phoneNumber"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/DigitsUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p3, "listener":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/digits/sdk/android/DigitsUser;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsClient;->digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

    invoke-virtual {v0}, Lcom/digits/sdk/android/DigitsAPIProvider;->getSdkService()Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;

    move-result-object v0

    invoke-interface {v0, p2, p1, p3}, Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;->account(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 95
    return-void
.end method

.method protected loginDevice(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "userId"    # J
    .param p4, "code"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/DigitsSessionResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p5, "digitsCallback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/digits/sdk/android/DigitsSessionResponse;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsClient;->digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

    invoke-virtual {v0}, Lcom/digits/sdk/android/DigitsAPIProvider;->getSdkService()Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;

    move-result-object v0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;->login(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 125
    return-void
.end method

.method protected registerDevice(Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/digits/sdk/android/DigitsController;
    .param p3, "phoneNumber"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/digits/sdk/android/DigitsController;",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lretrofit/client/Response;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p4, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lretrofit/client/Response;>;"
    iget-object v6, p0, Lcom/digits/sdk/android/DigitsClient;->authService:Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;

    new-instance v0, Lcom/digits/sdk/android/DigitsClient$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/digits/sdk/android/DigitsClient$1;-><init>(Lcom/digits/sdk/android/DigitsClient;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    invoke-virtual {v6, v0}, Lcom/twitter/sdk/android/core/internal/oauth/OAuth2Service;->requestGuestOrAppAuthToken(Lcom/twitter/sdk/android/core/Callback;)V

    .line 85
    return-void
.end method

.method protected startSignUp(Lcom/digits/sdk/android/AuthCallback;)V
    .locals 1
    .param p1, "callback"    # Lcom/digits/sdk/android/AuthCallback;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsClient;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/digits/sdk/android/DigitsClient;->startSignUp(Lcom/digits/sdk/android/AuthCallback;Landroid/content/Context;)V

    .line 99
    return-void
.end method

.method startSignUp(Lcom/digits/sdk/android/AuthCallback;Landroid/content/Context;)V
    .locals 2
    .param p1, "callback"    # Lcom/digits/sdk/android/AuthCallback;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/digits/sdk/android/DigitsClient;->scribeImpression()V

    .line 103
    iget-object v1, p0, Lcom/digits/sdk/android/DigitsClient;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v1}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/DigitsSession;

    .line 104
    .local v0, "session":Lcom/digits/sdk/android/DigitsSession;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/digits/sdk/android/DigitsSession;->isLoggedOutUser()Z

    move-result v1

    if-nez v1, :cond_0

    .line 105
    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Lcom/digits/sdk/android/AuthCallback;->success(Lcom/digits/sdk/android/DigitsSession;Ljava/lang/String;)V

    .line 109
    :goto_0
    return-void

    .line 107
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/digits/sdk/android/DigitsClient;->startPhoneNumberActivity(Lcom/digits/sdk/android/AuthCallback;Landroid/content/Context;)V

    goto :goto_0
.end method

.method protected verifyPin(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "userId"    # J
    .param p4, "pin"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/digits/sdk/android/DigitsSessionResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p5, "digitsCallback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/digits/sdk/android/DigitsSessionResponse;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsClient;->digitsAPIProvider:Lcom/digits/sdk/android/DigitsAPIProvider;

    invoke-virtual {v0}, Lcom/digits/sdk/android/DigitsAPIProvider;->getSdkService()Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;

    move-result-object v0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/digits/sdk/android/DigitsAPIProvider$SdkService;->verifyPin(Ljava/lang/String;JLjava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V

    .line 134
    return-void
.end method
