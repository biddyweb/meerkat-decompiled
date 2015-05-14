.class public Lcom/twitter/cobalt/metrics/AverageValueMetric;
.super Lcom/twitter/cobalt/metrics/PeriodicMetric;
.source "AverageValueMetric.java"


# static fields
.field private static final COUNT_KEY:Ljava/lang/String; = "count"

.field private static final TAG:Ljava/lang/String; = "AverageValueMetric"

.field private static final TOTAL_KEY:Ljava/lang/String; = "total"


# instance fields
.field protected mCount:I

.field protected mTotal:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;ZI)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "event"    # Ljava/lang/String;
    .param p3, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p4, "id"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/twitter/cobalt/metrics/MetricListener;
    .param p6, "isPersisted"    # Z
    .param p7, "reportingInterval"    # I

    .prologue
    .line 24
    invoke-direct/range {p0 .. p7}, Lcom/twitter/cobalt/metrics/PeriodicMetric;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;ZI)V

    .line 25
    return-void
.end method

.method public static getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Lcom/twitter/cobalt/metrics/MetricsManager;ZI)Lcom/twitter/cobalt/metrics/AverageValueMetric;
    .locals 9
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p2, "manager"    # Lcom/twitter/cobalt/metrics/MetricsManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "isPersisted"    # Z
    .param p4, "reportingInterval"    # I

    .prologue
    .line 29
    const-string v0, "AverageValueMetric"

    invoke-static {v0, p0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->generateDefaultId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/twitter/cobalt/metrics/MetricsManager;->getMetric(Ljava/lang/String;)Lcom/twitter/cobalt/metrics/ManagedMetric;

    move-result-object v8

    .line 30
    .local v8, "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    if-nez v8, :cond_0

    .line 31
    new-instance v0, Lcom/twitter/cobalt/metrics/AverageValueMetric;

    invoke-virtual {p2}, Lcom/twitter/cobalt/metrics/MetricsManager;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "AverageValueMetric"

    invoke-static {v2, p0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->generateDefaultId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/twitter/cobalt/metrics/AverageValueMetric;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;ZI)V

    invoke-virtual {p2, v0}, Lcom/twitter/cobalt/metrics/MetricsManager;->trackMetric(Lcom/twitter/cobalt/metrics/ManagedMetric;)Lcom/twitter/cobalt/metrics/ManagedMetric;

    move-result-object v8

    .line 34
    :cond_0
    check-cast v8, Lcom/twitter/cobalt/metrics/AverageValueMetric;

    .end local v8    # "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    return-object v8
.end method


# virtual methods
.method protected declared-synchronized addPersistentMetric(Landroid/content/SharedPreferences$Editor;)V
    .locals 4
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->addPersistentMetric(Landroid/content/SharedPreferences$Editor;)V

    .line 68
    const-string v0, "total"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-wide v2, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mTotal:J

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 69
    const-string v0, "count"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mCount:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    monitor-exit p0

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addValue(J)V
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 38
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->isMeasuring()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 46
    :goto_0
    monitor-exit p0

    return-void

    .line 42
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mTotal:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mTotal:J

    .line 43
    iget v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mCount:I

    .line 44
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->setReady(Z)V

    .line 45
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->persist()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getEventValue()Ljava/lang/Long;
    .locals 4

    .prologue
    .line 50
    iget v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mCount:I

    if-nez v0, :cond_0

    .line 51
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 54
    :goto_0
    return-object v0

    :cond_0
    iget-wide v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mTotal:J

    iget v2, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mCount:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0
.end method

.method protected initFromPersistedData(Landroid/content/SharedPreferences;)V
    .locals 4
    .param p1, "storage"    # Landroid/content/SharedPreferences;

    .prologue
    .line 81
    const-string v0, "total"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mTotal:J

    .line 82
    const-string v0, "count"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mCount:I

    .line 83
    invoke-super {p0, p1}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->initFromPersistedData(Landroid/content/SharedPreferences;)V

    .line 84
    return-void
.end method

.method protected declared-synchronized onReset()V
    .locals 2

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->onReset()V

    .line 60
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mTotal:J

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lcom/twitter/cobalt/metrics/AverageValueMetric;->mCount:I

    .line 62
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->persist()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected removePersistentMetric(Landroid/content/SharedPreferences$Editor;)V
    .locals 1
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->removePersistentMetric(Landroid/content/SharedPreferences$Editor;)V

    .line 75
    const-string v0, "total"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 76
    const-string v0, "count"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/AverageValueMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 77
    return-void
.end method
