.class public Lcom/twitter/sdk/android/core/internal/SessionMonitor;
.super Ljava/lang/Object;
.source "SessionMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;,
        Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/twitter/sdk/android/core/Session;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final accountServiceProvider:Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field protected final monitorState:Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;

.field private final sessionManager:Lcom/twitter/sdk/android/core/SessionManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final time:Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/SessionManager;Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;Ljava/util/concurrent/ExecutorService;Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;)V
    .locals 0
    .param p2, "time"    # Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;
    .param p3, "accountServiceProvider"    # Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;
    .param p4, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p5, "monitorState"    # Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<TT;>;",
            "Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;",
            "Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;",
            "Ljava/util/concurrent/ExecutorService;",
            "Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor<TT;>;"
    .local p1, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->time:Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;

    .line 44
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    .line 45
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->accountServiceProvider:Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;

    .line 46
    iput-object p4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 47
    iput-object p5, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->monitorState:Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/twitter/sdk/android/core/SessionManager;Ljava/util/concurrent/ExecutorService;)V
    .locals 6
    .param p2, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<TT;>;",
            "Ljava/util/concurrent/ExecutorService;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor<TT;>;"
    .local p1, "sessionManager":Lcom/twitter/sdk/android/core/SessionManager;, "Lcom/twitter/sdk/android/core/SessionManager<TT;>;"
    new-instance v2, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;

    invoke-direct {v2}, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;-><init>()V

    new-instance v3, Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;

    invoke-direct {v3}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;-><init>()V

    new-instance v5, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;

    invoke-direct {v5}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;-><init>(Lcom/twitter/sdk/android/core/SessionManager;Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;Ljava/util/concurrent/ExecutorService;Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;)V

    .line 38
    return-void
.end method


# virtual methods
.method public monitorActivityLifecycle(Lio/fabric/sdk/android/ActivityLifecycleManager;)V
    .locals 1
    .param p1, "activityLifecycleManager"    # Lio/fabric/sdk/android/ActivityLifecycleManager;

    .prologue
    .line 55
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor<TT;>;"
    new-instance v0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$1;

    invoke-direct {v0, p0}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$1;-><init>(Lcom/twitter/sdk/android/core/internal/SessionMonitor;)V

    invoke-virtual {p1, v0}, Lio/fabric/sdk/android/ActivityLifecycleManager;->registerCallbacks(Lio/fabric/sdk/android/ActivityLifecycleManager$Callbacks;)Z

    .line 61
    return-void
.end method

.method public triggerVerificationIfNecessary()V
    .locals 6

    .prologue
    .line 74
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor<TT;>;"
    iget-object v4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v4}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v2

    .line 75
    .local v2, "session":Lcom/twitter/sdk/android/core/Session;
    iget-object v4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->time:Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;

    invoke-virtual {v4}, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;->getCurrentTimeMillis()J

    move-result-wide v0

    .line 76
    .local v0, "currentTime":J
    if-eqz v2, :cond_1

    iget-object v4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->monitorState:Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;

    invoke-virtual {v4, v0, v1}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->beginVerification(J)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v3, 0x1

    .line 78
    .local v3, "startVerification":Z
    :goto_0
    if-eqz v3, :cond_0

    .line 79
    iget-object v4, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v5, Lcom/twitter/sdk/android/core/internal/SessionMonitor$2;

    invoke-direct {v5, p0}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$2;-><init>(Lcom/twitter/sdk/android/core/internal/SessionMonitor;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 86
    :cond_0
    return-void

    .line 76
    .end local v3    # "startVerification":Z
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method protected verifyAll()V
    .locals 6

    .prologue
    .line 89
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor<TT;>;"
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->sessionManager:Lcom/twitter/sdk/android/core/SessionManager;

    invoke-interface {v2}, Lcom/twitter/sdk/android/core/SessionManager;->getSessionMap()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/Session;

    .line 90
    .local v1, "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    invoke-virtual {p0, v1}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->verifySession(Lcom/twitter/sdk/android/core/Session;)V

    goto :goto_0

    .line 92
    .end local v1    # "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    :cond_0
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->monitorState:Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->time:Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;

    invoke-virtual {v3}, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;->getCurrentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$MonitorState;->endVerification(J)V

    .line 93
    return-void
.end method

.method protected verifySession(Lcom/twitter/sdk/android/core/Session;)V
    .locals 3
    .param p1, "session"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 100
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor<TT;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->accountServiceProvider:Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;

    invoke-virtual {v1, p1}, Lcom/twitter/sdk/android/core/internal/SessionMonitor$AccountServiceProvider;->getAccountService(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/services/AccountService;

    move-result-object v0

    .line 103
    .local v0, "accountService":Lcom/twitter/sdk/android/core/services/AccountService;
    const/4 v1, 0x1

    :try_start_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/twitter/sdk/android/core/services/AccountService;->verifyCredentials(Ljava/lang/Boolean;Ljava/lang/Boolean;)Lcom/twitter/sdk/android/core/models/User;
    :try_end_0
    .catch Lretrofit/RetrofitError; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v1

    goto :goto_0
.end method
