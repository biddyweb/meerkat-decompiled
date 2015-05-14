.class public Lcom/twitter/sdk/android/core/PersistedSessionManager;
.super Ljava/lang/Object;
.source "PersistedSessionManager.java"

# interfaces
.implements Lcom/twitter/sdk/android/core/SessionManager;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/twitter/sdk/android/core/Session;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/twitter/sdk/android/core/SessionManager",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final NUM_SESSIONS:I = 0x1


# instance fields
.field private final activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final activeSessionStorage:Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final prefKeyActiveSession:Ljava/lang/String;

.field private final prefKeySession:Ljava/lang/String;

.field private final preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

.field private volatile restorePending:Z

.field private final serializer:Lio/fabric/sdk/android/services/persistence/SerializationStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/fabric/sdk/android/services/persistence/SerializationStrategy",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final sessionMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Long;",
            "TT;>;"
        }
    .end annotation
.end field

.field private final storageMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Long;",
            "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "preferenceStore"    # Lio/fabric/sdk/android/services/persistence/PreferenceStore;
    .param p3, "prefKeyActiveSession"    # Ljava/lang/String;
    .param p4, "prefKeySession"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/fabric/sdk/android/services/persistence/PreferenceStore;",
            "Lio/fabric/sdk/android/services/persistence/SerializationStrategy",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    .local p2, "serializer":Lio/fabric/sdk/android/services/persistence/SerializationStrategy;, "Lio/fabric/sdk/android/services/persistence/SerializationStrategy<TT;>;"
    const/4 v0, 0x1

    .line 32
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3, v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    new-instance v4, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v4, v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    new-instance v5, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    invoke-direct {v5, p1, p2, p3}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;-><init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/lang/String;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/twitter/sdk/android/core/PersistedSessionManager;-><init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/util/concurrent/ConcurrentHashMap;Ljava/util/concurrent/ConcurrentHashMap;Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method constructor <init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/util/concurrent/ConcurrentHashMap;Ljava/util/concurrent/ConcurrentHashMap;Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "preferenceStore"    # Lio/fabric/sdk/android/services/persistence/PreferenceStore;
    .param p6, "prefKeyActiveSession"    # Ljava/lang/String;
    .param p7, "prefKeySession"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/fabric/sdk/android/services/persistence/PreferenceStore;",
            "Lio/fabric/sdk/android/services/persistence/SerializationStrategy",
            "<TT;>;",
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Long;",
            "TT;>;",
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Long;",
            "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy",
            "<TT;>;>;",
            "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    .local p2, "serializer":Lio/fabric/sdk/android/services/persistence/SerializationStrategy;, "Lio/fabric/sdk/android/services/persistence/SerializationStrategy<TT;>;"
    .local p3, "sessionMap":Ljava/util/concurrent/ConcurrentHashMap;, "Ljava/util/concurrent/ConcurrentHashMap<Ljava/lang/Long;TT;>;"
    .local p4, "storageMap":Ljava/util/concurrent/ConcurrentHashMap;, "Ljava/util/concurrent/ConcurrentHashMap<Ljava/lang/Long;Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy<TT;>;>;"
    .local p5, "activesSessionStorage":Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;, "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restorePending:Z

    .line 43
    iput-object p1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    .line 44
    iput-object p2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->serializer:Lio/fabric/sdk/android/services/persistence/SerializationStrategy;

    .line 45
    iput-object p3, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->sessionMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 46
    iput-object p4, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->storageMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 47
    iput-object p5, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionStorage:Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    .line 49
    iput-object p6, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->prefKeyActiveSession:Ljava/lang/String;

    .line 50
    iput-object p7, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->prefKeySession:Ljava/lang/String;

    .line 51
    return-void
.end method

.method private internalSetSession(JLcom/twitter/sdk/android/core/Session;Z)V
    .locals 5
    .param p1, "id"    # J
    .param p4, "forceUpdate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTT;Z)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    .local p3, "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    iget-object v2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->sessionMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3, p3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    iget-object v2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->storageMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    .line 157
    .local v1, "storage":Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;, "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy<TT;>;"
    if-nez v1, :cond_0

    .line 158
    new-instance v1, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    .end local v1    # "storage":Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;, "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy<TT;>;"
    iget-object v2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    iget-object v3, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->serializer:Lio/fabric/sdk/android/services/persistence/SerializationStrategy;

    invoke-virtual {p0, p1, p2}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->getPrefKey(J)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;-><init>(Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/persistence/SerializationStrategy;Ljava/lang/String;)V

    .line 159
    .restart local v1    # "storage":Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;, "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy<TT;>;"
    iget-object v2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->storageMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    :cond_0
    invoke-virtual {v1, p3}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;->save(Ljava/lang/Object;)V

    .line 163
    iget-object v2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/Session;

    .line 164
    .local v0, "activeSession":Lcom/twitter/sdk/android/core/Session;, "TT;"
    if-eqz v0, :cond_1

    if-eqz p4, :cond_2

    .line 165
    :cond_1
    monitor-enter p0

    .line 166
    :try_start_0
    iget-object v2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0, p3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 167
    iget-object v2, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionStorage:Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    invoke-virtual {v2, p3}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;->save(Ljava/lang/Object;)V

    .line 168
    monitor-exit p0

    .line 170
    :cond_2
    return-void

    .line 168
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private restoreActiveSession()V
    .locals 4

    .prologue
    .line 84
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionStorage:Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    invoke-virtual {v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;->restore()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/Session;

    .line 85
    .local v0, "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/Session;->getId()J

    move-result-wide v2

    const/4 v1, 0x0

    invoke-direct {p0, v2, v3, v0, v1}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->internalSetSession(JLcom/twitter/sdk/android/core/Session;Z)V

    .line 88
    :cond_0
    return-void
.end method

.method private declared-synchronized restoreAllSessions()V
    .locals 1

    .prologue
    .line 61
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restorePending:Z

    if-eqz v0, :cond_0

    .line 62
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreActiveSession()V

    .line 63
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreSessions()V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restorePending:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    :cond_0
    monitor-exit p0

    return-void

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private restoreSessions()V
    .locals 7

    .prologue
    .line 71
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    iget-object v4, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v4}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->get()Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v2

    .line 72
    .local v2, "preferences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 73
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->isSessionPreferenceKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 74
    iget-object v5, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->serializer:Lio/fabric/sdk/android/services/persistence/SerializationStrategy;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v5, v4}, Lio/fabric/sdk/android/services/persistence/SerializationStrategy;->deserialize(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/twitter/sdk/android/core/Session;

    .line 75
    .local v3, "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    if-eqz v3, :cond_0

    .line 76
    invoke-virtual {v3}, Lcom/twitter/sdk/android/core/Session;->getId()J

    move-result-wide v4

    const/4 v6, 0x0

    invoke-direct {p0, v4, v5, v3, v6}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->internalSetSession(JLcom/twitter/sdk/android/core/Session;Z)V

    goto :goto_0

    .line 81
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    .end local v3    # "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    :cond_1
    return-void
.end method


# virtual methods
.method public clearActiveSession()V
    .locals 2

    .prologue
    .line 120
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessionsIfNecessary()V

    .line 121
    iget-object v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/Session;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/Session;->getId()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->clearSession(J)V

    .line 124
    :cond_0
    return-void
.end method

.method public clearSession(J)V
    .locals 5
    .param p1, "id"    # J

    .prologue
    .line 181
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessionsIfNecessary()V

    .line 182
    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/sdk/android/core/Session;

    invoke-virtual {v1}, Lcom/twitter/sdk/android/core/Session;->getId()J

    move-result-wide v2

    cmp-long v1, v2, p1

    if-nez v1, :cond_0

    .line 183
    monitor-enter p0

    .line 184
    :try_start_0
    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 185
    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionStorage:Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    invoke-virtual {v1}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;->clear()V

    .line 186
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    :cond_0
    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->sessionMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->storageMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;

    .line 191
    .local v0, "storage":Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;, "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy<TT;>;"
    if-eqz v0, :cond_1

    .line 192
    invoke-virtual {v0}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;->clear()V

    .line 194
    :cond_1
    return-void

    .line 186
    .end local v0    # "storage":Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy;, "Lio/fabric/sdk/android/services/persistence/PreferenceStoreStrategy<TT;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getActiveSession()Lcom/twitter/sdk/android/core/Session;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessionsIfNecessary()V

    .line 100
    iget-object v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->activeSessionRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/Session;

    return-object v0
.end method

.method getPrefKey(J)Ljava/lang/String;
    .locals 3
    .param p1, "id"    # J

    .prologue
    .line 173
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->prefKeySession:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSession(J)Lcom/twitter/sdk/android/core/Session;
    .locals 3
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessionsIfNecessary()V

    .line 132
    iget-object v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->sessionMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/Session;

    return-object v0
.end method

.method public getSessionMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "TT;>;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessionsIfNecessary()V

    .line 151
    iget-object v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->sessionMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method isSessionPreferenceKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "preferenceKey"    # Ljava/lang/String;

    .prologue
    .line 91
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->prefKeySession:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method restoreAllSessionsIfNecessary()V
    .locals 1

    .prologue
    .line 55
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    iget-boolean v0, p0, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restorePending:Z

    if-eqz v0, :cond_0

    .line 56
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessions()V

    .line 58
    :cond_0
    return-void
.end method

.method public setActiveSession(Lcom/twitter/sdk/android/core/Session;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    .local p1, "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    if-nez p1, :cond_0

    .line 109
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Session must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_0
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessionsIfNecessary()V

    .line 112
    invoke-virtual {p1}, Lcom/twitter/sdk/android/core/Session;->getId()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->internalSetSession(JLcom/twitter/sdk/android/core/Session;Z)V

    .line 113
    return-void
.end method

.method public setSession(JLcom/twitter/sdk/android/core/Session;)V
    .locals 3
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTT;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p0, "this":Lcom/twitter/sdk/android/core/PersistedSessionManager;, "Lcom/twitter/sdk/android/core/PersistedSessionManager<TT;>;"
    .local p3, "session":Lcom/twitter/sdk/android/core/Session;, "TT;"
    if-nez p3, :cond_0

    .line 142
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Session must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_0
    invoke-virtual {p0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->restoreAllSessionsIfNecessary()V

    .line 145
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/twitter/sdk/android/core/PersistedSessionManager;->internalSetSession(JLcom/twitter/sdk/android/core/Session;Z)V

    .line 146
    return-void
.end method
