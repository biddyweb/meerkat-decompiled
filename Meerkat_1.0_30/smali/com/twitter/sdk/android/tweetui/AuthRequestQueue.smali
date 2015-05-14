.class Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;
.super Ljava/lang/Object;
.source "AuthRequestQueue.java"


# instance fields
.field private final activeSessionProvider:Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

.field final awaitingSession:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterApiClient;",
            ">;>;"
        }
    .end annotation
.end field

.field private final twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/TwitterCore;Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;)V
    .locals 2
    .param p1, "twitterCore"    # Lcom/twitter/sdk/android/core/TwitterCore;
    .param p2, "activeSessionProvider"    # Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    .line 36
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->activeSessionProvider:Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

    .line 37
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    .line 38
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->awaitingSession:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)Lcom/twitter/sdk/android/core/TwitterCore;
    .locals 1
    .param p0, "x0"    # Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    return-object v0
.end method


# virtual methods
.method protected declared-synchronized addRequest(Lcom/twitter/sdk/android/core/Callback;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterApiClient;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/TwitterApiClient;>;"
    const/4 v1, 0x1

    .line 54
    monitor-enter p0

    if-nez p1, :cond_0

    const/4 v1, 0x0

    .line 69
    :goto_0
    monitor-exit p0

    return v1

    .line 57
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->awaitingSession:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_2

    .line 58
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->getValidSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    .line 59
    .local v0, "session":Lcom/twitter/sdk/android/core/Session;
    if-eqz v0, :cond_1

    .line 60
    new-instance v2, Lcom/twitter/sdk/android/core/Result;

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v3, v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getApiClient(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/TwitterApiClient;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/twitter/sdk/android/core/Result;-><init>(Ljava/lang/Object;Lretrofit/client/Response;)V

    invoke-virtual {p1, v2}, Lcom/twitter/sdk/android/core/Callback;->success(Lcom/twitter/sdk/android/core/Result;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 54
    .end local v0    # "session":Lcom/twitter/sdk/android/core/Session;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 62
    .restart local v0    # "session":Lcom/twitter/sdk/android/core/Session;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v2, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 63
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->awaitingSession:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 64
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->requestAuth()V

    goto :goto_0

    .line 67
    .end local v0    # "session":Lcom/twitter/sdk/android/core/Session;
    :cond_2
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v2, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method declared-synchronized flushQueueOnError(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 3
    .param p1, "error"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 118
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->awaitingSession:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 120
    :goto_0
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 121
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/Callback;

    .line 122
    .local v0, "request":Lcom/twitter/sdk/android/core/Callback;
    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/core/Callback;->failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 118
    .end local v0    # "request":Lcom/twitter/sdk/android/core/Callback;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 124
    :cond_0
    monitor-exit p0

    return-void
.end method

.method declared-synchronized flushQueueOnSuccess(Lcom/twitter/sdk/android/core/TwitterApiClient;)V
    .locals 3
    .param p1, "apiClient"    # Lcom/twitter/sdk/android/core/TwitterApiClient;

    .prologue
    .line 105
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->awaitingSession:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 107
    :goto_0
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 108
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/Callback;

    .line 109
    .local v0, "request":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/TwitterApiClient;>;"
    new-instance v1, Lcom/twitter/sdk/android/core/Result;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/twitter/sdk/android/core/Result;-><init>(Ljava/lang/Object;Lretrofit/client/Response;)V

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/Callback;->success(Lcom/twitter/sdk/android/core/Result;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 105
    .end local v0    # "request":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/TwitterApiClient;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 111
    :cond_0
    monitor-exit p0

    return-void
.end method

.method getAppAuthTokenCallback()Lcom/twitter/sdk/android/core/Callback;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/AppSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 139
    new-instance v0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue$1;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue$1;-><init>(Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;)V

    return-object v0
.end method

.method getValidSession()Lcom/twitter/sdk/android/core/Session;
    .locals 2

    .prologue
    .line 128
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->activeSessionProvider:Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/tweetui/internal/ActiveSessionProvider;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v0

    .line 130
    .local v0, "session":Lcom/twitter/sdk/android/core/Session;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/Session;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/Session;->getAuthToken()Lcom/twitter/sdk/android/core/AuthToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/AuthToken;->isExpired()Z

    move-result v1

    if-nez v1, :cond_0

    .line 134
    .end local v0    # "session":Lcom/twitter/sdk/android/core/Session;
    :goto_0
    return-object v0

    .restart local v0    # "session":Lcom/twitter/sdk/android/core/Session;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method requestAuth()V
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->getAppAuthTokenCallback()Lcom/twitter/sdk/android/core/Callback;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/TwitterCore;->logInGuest(Lcom/twitter/sdk/android/core/Callback;)V

    .line 96
    return-void
.end method

.method declared-synchronized sessionRestored(Lcom/twitter/sdk/android/core/Session;)V
    .locals 2
    .param p1, "session"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 80
    monitor-enter p0

    if-eqz p1, :cond_0

    .line 81
    :try_start_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/core/TwitterCore;->getApiClient(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/TwitterApiClient;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->flushQueueOnSuccess(Lcom/twitter/sdk/android/core/TwitterApiClient;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :goto_0
    monitor-exit p0

    return-void

    .line 82
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 83
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->requestAuth()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 86
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/AuthRequestQueue;->awaitingSession:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method
