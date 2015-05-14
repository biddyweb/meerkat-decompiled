.class public Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;
.super Ljava/lang/Object;
.source "SessionMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/core/internal/SessionMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "AccountServiceProvider"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAccountService(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/services/AccountService;
    .locals 1
    .param p1, "session"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 162
    new-instance v0, Lcom/twitter/sdk/android/core/TwitterApiClient;

    invoke-direct {v0, p1}, Lcom/twitter/sdk/android/core/TwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/Session;)V

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterApiClient;->getAccountService()Lcom/twitter/sdk/android/core/services/AccountService;

    move-result-object v0

    return-object v0
.end method
