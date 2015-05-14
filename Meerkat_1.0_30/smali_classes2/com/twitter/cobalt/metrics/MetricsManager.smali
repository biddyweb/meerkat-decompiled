.class public Lcom/twitter/cobalt/metrics/MetricsManager;
.super Ljava/lang/Object;
.source "MetricsManager.java"

# interfaces
.implements Lcom/twitter/cobalt/metrics/MetricListener;
.implements Lcom/twitter/cobalt/metrics/MetricsReporter;


# static fields
.field private static sInstance:Lcom/twitter/cobalt/metrics/MetricsManager;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDisabled:Z

.field private final mMetricComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/twitter/cobalt/metrics/ManagedMetric;",
            ">;"
        }
    .end annotation
.end field

.field private final mMetrics:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/twitter/cobalt/metrics/ManagedMetric;",
            ">;"
        }
    .end annotation
.end field

.field private final mMetricsPreferences:Landroid/content/SharedPreferences;

.field private final mMetricsReporters:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/twitter/cobalt/metrics/MetricsReporter;",
            ">;"
        }
    .end annotation
.end field

.field private mPersistenceEnabled:Z


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lcom/twitter/cobalt/metrics/MetricsManager$1;

    invoke-direct {v0, p0}, Lcom/twitter/cobalt/metrics/MetricsManager$1;-><init>(Lcom/twitter/cobalt/metrics/MetricsManager;)V

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricComparator:Ljava/util/Comparator;

    .line 50
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsReporters:Ljava/util/HashSet;

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mPersistenceEnabled:Z

    .line 52
    iput-boolean v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mDisabled:Z

    .line 96
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    .line 97
    iput-object p1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mContext:Landroid/content/Context;

    .line 98
    const-string v0, "metrics"

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsPreferences:Landroid/content/SharedPreferences;

    .line 99
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/twitter/cobalt/metrics/MetricsManager;
    .locals 3

    .prologue
    .line 55
    const-class v1, Lcom/twitter/cobalt/metrics/MetricsManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/twitter/cobalt/metrics/MetricsManager;->sInstance:Lcom/twitter/cobalt/metrics/MetricsManager;

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Metrics manager must be initialized first"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 58
    :cond_0
    :try_start_1
    sget-object v0, Lcom/twitter/cobalt/metrics/MetricsManager;->sInstance:Lcom/twitter/cobalt/metrics/MetricsManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method

.method public static declared-synchronized initialize(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    const-class v1, Lcom/twitter/cobalt/metrics/MetricsManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/twitter/cobalt/metrics/MetricsManager;->sInstance:Lcom/twitter/cobalt/metrics/MetricsManager;

    if-nez v0, :cond_0

    .line 68
    new-instance v0, Lcom/twitter/cobalt/metrics/MetricsManager;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/twitter/cobalt/metrics/MetricsManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/twitter/cobalt/metrics/MetricsManager;->sInstance:Lcom/twitter/cobalt/metrics/MetricsManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    :cond_0
    monitor-exit v1

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized reset()V
    .locals 2

    .prologue
    .line 77
    const-class v0, Lcom/twitter/cobalt/metrics/MetricsManager;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    sput-object v1, Lcom/twitter/cobalt/metrics/MetricsManager;->sInstance:Lcom/twitter/cobalt/metrics/MetricsManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    monitor-exit v0

    return-void

    .line 77
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public addReporter(Lcom/twitter/cobalt/metrics/MetricsReporter;)V
    .locals 1
    .param p1, "reporter"    # Lcom/twitter/cobalt/metrics/MetricsReporter;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsReporters:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 198
    return-void
.end method

.method public available(Lcom/twitter/cobalt/metrics/ManagedMetric;)V
    .locals 0
    .param p1, "metric"    # Lcom/twitter/cobalt/metrics/ManagedMetric;

    .prologue
    .line 116
    invoke-virtual {p0, p1}, Lcom/twitter/cobalt/metrics/MetricsManager;->report(Lcom/twitter/cobalt/metrics/Metric;)V

    .line 117
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 255
    return-void
.end method

.method clearPersistedMetrics()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 85
    iget-object v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 86
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 87
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_0

    .line 88
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 92
    :goto_0
    return-void

    .line 90
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public declared-synchronized disableAllMetrics(Z)V
    .locals 1
    .param p1, "disabled"    # Z

    .prologue
    .line 262
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mDisabled:Z

    .line 263
    if-eqz p1, :cond_0

    .line 264
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/MetricsManager;->clear()V

    .line 265
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/MetricsManager;->clearPersistedMetrics()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    :cond_0
    monitor-exit p0

    return-void

    .line 262
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public discard(Lcom/twitter/cobalt/metrics/ManagedMetric;)V
    .locals 3
    .param p1, "metric"    # Lcom/twitter/cobalt/metrics/ManagedMetric;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 122
    iget-object v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, p1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    iget-boolean v1, p1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsPersisted:Z

    if-eqz v1, :cond_0

    .line 124
    iget-object v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 125
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->removePersistentMetric(Landroid/content/SharedPreferences$Editor;)V

    .line 126
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_1

    .line 127
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 132
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    :goto_0
    return-void

    .line 129
    .restart local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public enablePersistence(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 181
    iput-boolean p1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mPersistenceEnabled:Z

    .line 182
    if-eqz p1, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/MetricsManager;->persistAll()V

    .line 185
    :cond_0
    return-void
.end method

.method public flushMetrics()V
    .locals 4

    .prologue
    .line 232
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/MetricsManager;->sortMetrics()Ljava/util/Collection;

    move-result-object v2

    .line 233
    .local v2, "sortedMetrics":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/twitter/cobalt/metrics/ManagedMetric;>;"
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .line 234
    .local v1, "m":Lcom/twitter/cobalt/metrics/ManagedMetric;
    iget-boolean v3, v1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsReady:Z

    if-eqz v3, :cond_0

    .line 235
    invoke-virtual {p0, v1}, Lcom/twitter/cobalt/metrics/MetricsManager;->report(Lcom/twitter/cobalt/metrics/Metric;)V

    goto :goto_0

    .line 238
    .end local v1    # "m":Lcom/twitter/cobalt/metrics/ManagedMetric;
    :cond_1
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getMetric(Ljava/lang/String;)Lcom/twitter/cobalt/metrics/ManagedMetric;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/cobalt/metrics/ManagedMetric;

    return-object v0
.end method

.method public persist(Lcom/twitter/cobalt/metrics/ManagedMetric;)V
    .locals 3
    .param p1, "metric"    # Lcom/twitter/cobalt/metrics/ManagedMetric;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 145
    iget-boolean v1, p1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsPersisted:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mPersistenceEnabled:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mDisabled:Z

    if-nez v1, :cond_0

    .line 146
    iget-object v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 147
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->addPersistentMetric(Landroid/content/SharedPreferences$Editor;)V

    .line 148
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_1

    .line 149
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 154
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    :goto_0
    return-void

    .line 151
    .restart local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public persistAll()V
    .locals 4

    .prologue
    .line 160
    iget-boolean v3, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mPersistenceEnabled:Z

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mDisabled:Z

    if-eqz v3, :cond_1

    .line 170
    :cond_0
    return-void

    .line 164
    :cond_1
    iget-object v3, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 165
    .local v2, "s":Ljava/lang/String;
    iget-object v3, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .line 166
    .local v1, "m":Lcom/twitter/cobalt/metrics/ManagedMetric;
    iget-boolean v3, v1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsPersisted:Z

    if-eqz v3, :cond_2

    .line 167
    invoke-virtual {p0, v1}, Lcom/twitter/cobalt/metrics/MetricsManager;->persist(Lcom/twitter/cobalt/metrics/ManagedMetric;)V

    goto :goto_0
.end method

.method public report(Lcom/twitter/cobalt/metrics/Metric;)V
    .locals 3
    .param p1, "metric"    # Lcom/twitter/cobalt/metrics/Metric;

    .prologue
    .line 206
    iget-boolean v2, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mDisabled:Z

    if-eqz v2, :cond_1

    .line 215
    .end local p1    # "metric":Lcom/twitter/cobalt/metrics/Metric;
    :cond_0
    :goto_0
    return-void

    .line 209
    .restart local p1    # "metric":Lcom/twitter/cobalt/metrics/Metric;
    :cond_1
    iget-object v2, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsReporters:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/cobalt/metrics/MetricsReporter;

    .line 210
    .local v1, "r":Lcom/twitter/cobalt/metrics/MetricsReporter;
    invoke-interface {v1, p1}, Lcom/twitter/cobalt/metrics/MetricsReporter;->report(Lcom/twitter/cobalt/metrics/Metric;)V

    goto :goto_1

    .line 212
    .end local v1    # "r":Lcom/twitter/cobalt/metrics/MetricsReporter;
    :cond_2
    instance-of v2, p1, Lcom/twitter/cobalt/metrics/ManagedMetric;

    if-eqz v2, :cond_0

    .line 213
    check-cast p1, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .end local p1    # "metric":Lcom/twitter/cobalt/metrics/Metric;
    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/ManagedMetric;->reset()V

    goto :goto_0
.end method

.method public resetMetrics()V
    .locals 4

    .prologue
    .line 244
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/MetricsManager;->sortMetrics()Ljava/util/Collection;

    move-result-object v2

    .line 245
    .local v2, "sortedMetrics":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/twitter/cobalt/metrics/ManagedMetric;>;"
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .line 246
    .local v1, "m":Lcom/twitter/cobalt/metrics/ManagedMetric;
    invoke-virtual {v1}, Lcom/twitter/cobalt/metrics/ManagedMetric;->reset()V

    goto :goto_0

    .line 248
    .end local v1    # "m":Lcom/twitter/cobalt/metrics/ManagedMetric;
    :cond_0
    return-void
.end method

.method public restore()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricsPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method sortMetrics()Ljava/util/Collection;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/twitter/cobalt/metrics/ManagedMetric;",
            ">;"
        }
    .end annotation

    .prologue
    .line 218
    new-instance v3, Ljava/util/TreeSet;

    iget-object v4, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetricComparator:Ljava/util/Comparator;

    invoke-direct {v3, v4}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 219
    .local v3, "sortedMetrics":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Lcom/twitter/cobalt/metrics/ManagedMetric;>;"
    iget-object v4, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 220
    .local v2, "s":Ljava/lang/String;
    iget-object v4, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .line 221
    .local v1, "m":Lcom/twitter/cobalt/metrics/ManagedMetric;
    if-eqz v1, :cond_0

    iget-boolean v4, v1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsReady:Z

    if-eqz v4, :cond_0

    .line 222
    invoke-virtual {v3, v1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 225
    .end local v1    # "m":Lcom/twitter/cobalt/metrics/ManagedMetric;
    .end local v2    # "s":Ljava/lang/String;
    :cond_1
    return-object v3
.end method

.method public trackMetric(Lcom/twitter/cobalt/metrics/ManagedMetric;)Lcom/twitter/cobalt/metrics/ManagedMetric;
    .locals 3
    .param p1, "metric"    # Lcom/twitter/cobalt/metrics/ManagedMetric;

    .prologue
    .line 106
    iget-boolean v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mDisabled:Z

    if-eqz v1, :cond_1

    .line 111
    .end local p1    # "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    :cond_0
    :goto_0
    return-object p1

    .line 110
    .restart local p1    # "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    :cond_1
    iget-object v1, p0, Lcom/twitter/cobalt/metrics/MetricsManager;->mMetrics:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, p1, Lcom/twitter/cobalt/metrics/ManagedMetric;->mId:Ljava/lang/String;

    invoke-virtual {v1, v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/cobalt/metrics/ManagedMetric;

    .line 111
    .local v0, "existing":Lcom/twitter/cobalt/metrics/ManagedMetric;
    if-eqz v0, :cond_0

    move-object p1, v0

    goto :goto_0
.end method
