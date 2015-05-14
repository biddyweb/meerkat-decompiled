.class public Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;
.super Ljava/lang/Object;
.source "ActiveSessionProvider.java"


# instance fields
.field private final sessionManagers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<+",
            "Lcom/twitter/sdk/android/core/Session;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p1, "sessionManagers":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;->sessionManagers:Ljava/util/List;

    .line 22
    return-void
.end method


# virtual methods
.method public getActiveSession()Lcom/twitter/sdk/android/core/Session;
    .locals 4

    .prologue
    .line 25
    const/4 v1, 0x0

    .line 26
    .local v1, "session":Lcom/twitter/sdk/android/core/Session;
    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;->sessionManagers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/SessionManager;

    .line 27
    .local v2, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;"
    invoke-interface {v2}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v1

    .line 28
    if-eqz v1, :cond_0

    .line 32
    .end local v2    # "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<+Lcom/twitter/sdk/android/core/Session;>;"
    :cond_1
    return-object v1
.end method
