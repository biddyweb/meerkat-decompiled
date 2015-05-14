.class public Lcom/twitter/cobalt/metrics/CounterMetric;
.super Lcom/twitter/cobalt/metrics/PeriodicMetric;
.source "CounterMetric.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CounterMetric"

.field private static final USAGE_KEY:Ljava/lang/String; = "usage"


# instance fields
.field private mCounter:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;I)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "event"    # Ljava/lang/String;
    .param p3, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p4, "id"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/twitter/cobalt/metrics/MetricListener;
    .param p6, "interval"    # I

    .prologue
    .line 78
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/twitter/cobalt/metrics/PeriodicMetric;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;ZI)V

    .line 79
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    if-nez v0, :cond_0

    .line 80
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    .line 82
    :cond_0
    return-void
.end method

.method private add(J)V
    .locals 1
    .param p1, "more"    # J

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/CounterMetric;->isMeasuring()Z

    move-result v0

    if-nez v0, :cond_0

    .line 126
    :goto_0
    return-void

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 125
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/CounterMetric;->persist()V

    goto :goto_0
.end method

.method public static getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;JLcom/twitter/cobalt/metrics/Metric$Level;I)Lcom/twitter/cobalt/metrics/CounterMetric;
    .locals 8
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "manager"    # Lcom/twitter/cobalt/metrics/MetricsManager;
    .param p2, "ownerId"    # J
    .param p4, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p5, "interval"    # I

    .prologue
    .line 41
    const-string v0, "CounterMetric"

    invoke-static {v0, p0}, Lcom/twitter/cobalt/metrics/CounterMetric;->generateDefaultId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    move v5, p5

    invoke-static/range {v0 .. v6}, Lcom/twitter/cobalt/metrics/CounterMetric;->getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;JLcom/twitter/cobalt/metrics/Metric$Level;ILjava/lang/String;)Lcom/twitter/cobalt/metrics/CounterMetric;

    move-result-object v0

    return-object v0
.end method

.method public static getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;JLcom/twitter/cobalt/metrics/Metric$Level;ILjava/lang/String;)Lcom/twitter/cobalt/metrics/CounterMetric;
    .locals 8
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "manager"    # Lcom/twitter/cobalt/metrics/MetricsManager;
    .param p2, "ownerId"    # J
    .param p4, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p5, "interval"    # I
    .param p6, "id"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-virtual {p1, p6}, Lcom/twitter/cobalt/metrics/MetricsManager;->getMetric(Ljava/lang/String;)Lcom/twitter/cobalt/metrics/ManagedMetric;

    move-result-object v7

    .line 62
    .local v7, "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    if-nez v7, :cond_0

    .line 63
    new-instance v0, Lcom/twitter/cobalt/metrics/CounterMetric;

    invoke-virtual {p1}, Lcom/twitter/cobalt/metrics/MetricsManager;->getContext()Landroid/content/Context;

    move-result-object v1

    move-object v2, p0

    move-object v3, p4

    move-object v4, p6

    move-object v5, p1

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/twitter/cobalt/metrics/CounterMetric;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;I)V

    invoke-virtual {p1, v0}, Lcom/twitter/cobalt/metrics/MetricsManager;->trackMetric(Lcom/twitter/cobalt/metrics/ManagedMetric;)Lcom/twitter/cobalt/metrics/ManagedMetric;

    move-result-object v7

    .line 65
    invoke-virtual {v7, p2, p3}, Lcom/twitter/cobalt/metrics/ManagedMetric;->setOwnerId(J)V

    .line 67
    :cond_0
    check-cast v7, Lcom/twitter/cobalt/metrics/CounterMetric;

    .end local v7    # "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    return-object v7
.end method


# virtual methods
.method protected addPersistentMetric(Landroid/content/SharedPreferences$Editor;)V
    .locals 4
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 144
    invoke-super {p0, p1}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->addPersistentMetric(Landroid/content/SharedPreferences$Editor;)V

    .line 145
    const-string v0, "usage"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/CounterMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    invoke-interface {p1, v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 146
    return-void
.end method

.method public decrement()V
    .locals 2

    .prologue
    .line 104
    const-wide/16 v0, -0x1

    invoke-direct {p0, v0, v1}, Lcom/twitter/cobalt/metrics/CounterMetric;->add(J)V

    .line 105
    return-void
.end method

.method public decrementBy(J)V
    .locals 3
    .param p1, "number"    # J

    .prologue
    .line 113
    neg-long v0, p1

    invoke-direct {p0, v0, v1}, Lcom/twitter/cobalt/metrics/CounterMetric;->add(J)V

    .line 114
    return-void
.end method

.method public getEventValue()Ljava/lang/Long;
    .locals 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public increment()V
    .locals 2

    .prologue
    .line 88
    const-wide/16 v0, 0x1

    invoke-direct {p0, v0, v1}, Lcom/twitter/cobalt/metrics/CounterMetric;->add(J)V

    .line 89
    return-void
.end method

.method public incrementBy(J)V
    .locals 1
    .param p1, "number"    # J

    .prologue
    .line 97
    invoke-direct {p0, p1, p2}, Lcom/twitter/cobalt/metrics/CounterMetric;->add(J)V

    .line 98
    return-void
.end method

.method protected initFromPersistedData(Landroid/content/SharedPreferences;)V
    .locals 4
    .param p1, "storage"    # Landroid/content/SharedPreferences;

    .prologue
    const-wide/16 v2, 0x0

    .line 156
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    if-nez v0, :cond_0

    .line 157
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-string v1, "usage"

    invoke-virtual {p0, v1}, Lcom/twitter/cobalt/metrics/CounterMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    .line 161
    :goto_0
    invoke-super {p0, p1}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->initFromPersistedData(Landroid/content/SharedPreferences;)V

    .line 162
    return-void

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    const-string v1, "usage"

    invoke-virtual {p0, v1}, Lcom/twitter/cobalt/metrics/CounterMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    goto :goto_0
.end method

.method protected onReset()V
    .locals 4

    .prologue
    .line 135
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/CounterMetric;->mCounter:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 136
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/CounterMetric;->isMeasuring()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/CounterMetric;->setReady(Z)V

    .line 139
    :cond_0
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/CounterMetric;->persist()V

    .line 140
    return-void
.end method

.method public onStartMeasuring()V
    .locals 1

    .prologue
    .line 130
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/CounterMetric;->setReady(Z)V

    .line 131
    return-void
.end method

.method protected removePersistentMetric(Landroid/content/SharedPreferences$Editor;)V
    .locals 1
    .param p1, "editor"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 150
    invoke-super {p0, p1}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->removePersistentMetric(Landroid/content/SharedPreferences$Editor;)V

    .line 151
    const-string v0, "usage"

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/CounterMetric;->getDataKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 152
    return-void
.end method
