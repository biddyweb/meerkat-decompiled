.class public Lcom/twitter/cobalt/metrics/TimingMetric;
.super Lcom/twitter/cobalt/metrics/ManagedMetric;
.source "TimingMetric.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TimingMetric"


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;)V
    .locals 0
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p3, "id"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/twitter/cobalt/metrics/MetricListener;

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/twitter/cobalt/metrics/ManagedMetric;-><init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;)V

    .line 79
    return-void
.end method

.method public static getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;JLcom/twitter/cobalt/metrics/Metric$Level;)Lcom/twitter/cobalt/metrics/TimingMetric;
    .locals 6
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "manager"    # Lcom/twitter/cobalt/metrics/MetricsManager;
    .param p2, "ownerId"    # J
    .param p4, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;

    .prologue
    .line 51
    const-string v0, "TimingMetric"

    invoke-static {v0, p0}, Lcom/twitter/cobalt/metrics/TimingMetric;->generateDefaultId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/twitter/cobalt/metrics/TimingMetric;->getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;JLcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;)Lcom/twitter/cobalt/metrics/TimingMetric;

    move-result-object v0

    return-object v0
.end method

.method public static getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;JLcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;)Lcom/twitter/cobalt/metrics/TimingMetric;
    .locals 2
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "manager"    # Lcom/twitter/cobalt/metrics/MetricsManager;
    .param p2, "ownerId"    # J
    .param p4, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p5, "id"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-virtual {p1, p5}, Lcom/twitter/cobalt/metrics/MetricsManager;->getMetric(Ljava/lang/String;)Lcom/twitter/cobalt/metrics/ManagedMetric;

    move-result-object v0

    .line 69
    .local v0, "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    if-nez v0, :cond_0

    .line 70
    new-instance v1, Lcom/twitter/cobalt/metrics/TimingMetric;

    invoke-direct {v1, p0, p4, p5, p1}, Lcom/twitter/cobalt/metrics/TimingMetric;-><init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;)V

    invoke-virtual {p1, v1}, Lcom/twitter/cobalt/metrics/MetricsManager;->trackMetric(Lcom/twitter/cobalt/metrics/ManagedMetric;)Lcom/twitter/cobalt/metrics/ManagedMetric;

    move-result-object v0

    .line 71
    invoke-virtual {v0, p2, p3}, Lcom/twitter/cobalt/metrics/ManagedMetric;->setOwnerId(J)V

    .line 73
    :cond_0
    check-cast v0, Lcom/twitter/cobalt/metrics/TimingMetric;

    .end local v0    # "metric":Lcom/twitter/cobalt/metrics/ManagedMetric;
    return-object v0
.end method

.method public static getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;Lcom/twitter/cobalt/metrics/Metric$Level;)Lcom/twitter/cobalt/metrics/TimingMetric;
    .locals 6
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "manager"    # Lcom/twitter/cobalt/metrics/MetricsManager;
    .param p2, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;

    .prologue
    .line 31
    const-wide/16 v2, 0x0

    const-string v0, "TimingMetric"

    invoke-static {v0, p0}, Lcom/twitter/cobalt/metrics/TimingMetric;->generateDefaultId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    invoke-static/range {v0 .. v5}, Lcom/twitter/cobalt/metrics/TimingMetric;->getManaged(Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricsManager;JLcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;)Lcom/twitter/cobalt/metrics/TimingMetric;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onReset()V
    .locals 0

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/TimingMetric;->discard()V

    .line 98
    return-void
.end method

.method protected onStartMeasuring()V
    .locals 2

    .prologue
    .line 83
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/TimingMetric;->mStartTime:J

    .line 84
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/TimingMetric;->setReady(Z)V

    .line 85
    return-void
.end method

.method protected onStopMeasuring()V
    .locals 4

    .prologue
    .line 89
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/twitter/cobalt/metrics/TimingMetric;->mStartTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/twitter/cobalt/metrics/TimingMetric;->mDuration:J

    .line 90
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/twitter/cobalt/metrics/TimingMetric;->setReady(Z)V

    .line 91
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/TimingMetric;->makeAvailable()V

    .line 92
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/TimingMetric;->discard()V

    .line 93
    return-void
.end method
