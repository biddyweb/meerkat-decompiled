.class public abstract Lcom/twitter/cobalt/metrics/ManagedMetric;
.super Lcom/twitter/cobalt/metrics/Metric;
.source "ManagedMetric.java"


# static fields
.field private static final DURATION:Ljava/lang/String; = "duration"

.field private static final LAST_REPORT:Ljava/lang/String; = "last_report"

.field private static final MEASURING:Ljava/lang/String; = "measuring"

.field private static final READY:Ljava/lang/String; = "ready"

.field private static final START_TIME:Ljava/lang/String; = "starttime"

.field private static final TAG:Ljava/lang/String; = "MetricsManager"


# instance fields
.field protected final mCreationTime:J

.field protected final mId:Ljava/lang/String;

.field protected mIsDestroyed:Z

.field private mIsMeasuring:Z

.field mIsPersisted:Z

.field mIsReady:Z

.field protected mLastReport:J

.field private final mListener:Lcom/twitter/cobalt/metrics/MetricListener;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;)V
    .locals 6
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/twitter/cobalt/metrics/MetricListener;

    .prologue
    .line 50
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/twitter/cobalt/metrics/ManagedMetric;-><init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;Z)V

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;Z)V
    .locals 2
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/twitter/cobalt/metrics/MetricListener;
    .param p5, "isPersisted"    # Z

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lcom/twitter/cobalt/metrics/Metric;-><init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;)V

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mTag:Ljava/lang/String;

    .line 65
    iput-object p3, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mId:Ljava/lang/String;

    .line 66
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mCreationTime:J

    .line 67
    iput-object p4, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mListener:Lcom/twitter/cobalt/metrics/MetricListener;

    .line 68
    iput-boolean p5, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsPersisted:Z

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsDestroyed:Z

    .line 71
    if-eqz p5, :cond_0

    if-eqz p4, :cond_0

    .line 72
    invoke-interface {p4}, Lcom/twitter/cobalt/metrics/MetricListener;->restore()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->initFromPersistedData(Landroid/content/SharedPreferences;)V

    .line 74
    :cond_0
    return-void
.end method

.method protected static generateDefaultId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected addPersistentMetric(Landroid/content/SharedPreferences$Editor;)V
    .locals 4
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 204
    const-string v0, "starttime"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-wide v2, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mStartTime:J

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 205
    const-string v0, "measuring"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 206
    const-string v0, "duration"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-wide v2, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mDuration:J

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 207
    const-string v0, "ready"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsReady:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 208
    const-string v0, "last_report"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-wide v2, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mLastReport:J

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 209
    return-void
.end method

.method public final declared-synchronized destroyMetric()V
    .locals 1

    .prologue
    .line 128
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->onDestroyMetric()V

    .line 129
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->discard()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    monitor-exit p0

    return-void

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected final discard()V
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsDestroyed:Z

    .line 155
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mListener:Lcom/twitter/cobalt/metrics/MetricListener;

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mListener:Lcom/twitter/cobalt/metrics/MetricListener;

    invoke-interface {v0, p0}, Lcom/twitter/cobalt/metrics/MetricListener;->discard(Lcom/twitter/cobalt/metrics/ManagedMetric;)V

    .line 158
    :cond_0
    return-void
.end method

.method protected getDataKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "keyName"    # Ljava/lang/String;

    .prologue
    .line 238
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected initFromPersistedData(Landroid/content/SharedPreferences;)V
    .locals 5
    .param p1, "storage"    # Landroid/content/SharedPreferences;

    .prologue
    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 227
    const-string v0, "starttime"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mStartTime:J

    .line 228
    const-string v0, "measuring"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z

    .line 229
    const-string v0, "duration"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mDuration:J

    .line 230
    const-string v0, "ready"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsReady:Z

    .line 231
    const-string v0, "last_report"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mLastReport:J

    .line 232
    return-void
.end method

.method public final isDestroyed()Z
    .locals 1

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsDestroyed:Z

    return v0
.end method

.method public final isMeasuring()Z
    .locals 1

    .prologue
    .line 138
    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z

    return v0
.end method

.method protected final isReady()Z
    .locals 1

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsReady:Z

    return v0
.end method

.method protected final makeAvailable()V
    .locals 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mListener:Lcom/twitter/cobalt/metrics/MetricListener;

    if-eqz v0, :cond_0

    .line 162
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mLastReport:J

    .line 163
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mListener:Lcom/twitter/cobalt/metrics/MetricListener;

    invoke-interface {v0, p0}, Lcom/twitter/cobalt/metrics/MetricListener;->available(Lcom/twitter/cobalt/metrics/ManagedMetric;)V

    .line 165
    :cond_0
    return-void
.end method

.method protected onDestroyMetric()V
    .locals 0

    .prologue
    .line 257
    return-void
.end method

.method protected onReset()V
    .locals 0

    .prologue
    .line 263
    return-void
.end method

.method protected onStartMeasuring()V
    .locals 0

    .prologue
    .line 245
    return-void
.end method

.method protected onStopMeasuring()V
    .locals 0

    .prologue
    .line 251
    return-void
.end method

.method protected final persist()V
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mListener:Lcom/twitter/cobalt/metrics/MetricListener;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mListener:Lcom/twitter/cobalt/metrics/MetricListener;

    invoke-interface {v0, p0}, Lcom/twitter/cobalt/metrics/MetricListener;->persist(Lcom/twitter/cobalt/metrics/ManagedMetric;)V

    .line 182
    :cond_0
    return-void
.end method

.method protected removePersistentMetric(Landroid/content/SharedPreferences$Editor;)V
    .locals 1
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 216
    const-string v0, "starttime"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 217
    const-string v0, "measuring"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 218
    const-string v0, "duration"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 219
    const-string v0, "ready"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 220
    const-string v0, "last_report"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 221
    return-void
.end method

.method protected final reset()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 168
    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z

    if-eqz v0, :cond_0

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mStartTime:J

    .line 173
    :goto_0
    iput-wide v2, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mDuration:J

    .line 174
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsReady:Z

    .line 175
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->onReset()V

    .line 176
    return-void

    .line 171
    :cond_0
    iput-wide v2, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mStartTime:J

    goto :goto_0
.end method

.method protected final setReady(Z)V
    .locals 0
    .param p1, "ready"    # Z

    .prologue
    .line 192
    iput-boolean p1, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsReady:Z

    .line 193
    return-void
.end method

.method protected shouldRestartOnStart()Z
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized startMeasuring()V
    .locals 2

    .prologue
    .line 93
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsDestroyed:Z

    if-eqz v0, :cond_0

    .line 94
    const-string v0, "MetricsManager"

    const-string v1, "attempting to start a metric which has already been destroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :cond_0
    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsDestroyed:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->shouldRestartOnStart()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_2

    .line 107
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 101
    :cond_2
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z

    .line 104
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mStartTime:J

    .line 106
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->onStartMeasuring()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 93
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized stopMeasuring()V
    .locals 6

    .prologue
    .line 115
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 122
    :goto_0
    monitor-exit p0

    return-void

    .line 118
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mDuration:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mStartTime:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mDuration:J

    .line 120
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->onStopMeasuring()V

    .line 121
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/twitter/cobalt/metrics/ManagedMetric;->mIsMeasuring:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 115
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
