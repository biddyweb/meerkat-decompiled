.class public abstract Lcom/twitter/cobalt/metrics/PeriodicMetric;
.super Lcom/twitter/cobalt/metrics/ManagedMetric;
.source "PeriodicMetric.java"

# interfaces
.implements Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;


# static fields
.field public static final LONG_INTERVAL:I = 0x3

.field private static final MAX_NUMBER_OF_INACTIVE_INTERVALS:I = 0x7

.field public static final REGULAR_INTERVAL:I = 0x2

.field public static final SHORT_INTERVAL:I = 0x1


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mReportRunnable:Ljava/lang/Runnable;

.field private mReportingInterval:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;ZI)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "event"    # Ljava/lang/String;
    .param p3, "level"    # Lcom/twitter/cobalt/metrics/Metric$Level;
    .param p4, "id"    # Ljava/lang/String;
    .param p5, "listener"    # Lcom/twitter/cobalt/metrics/MetricListener;
    .param p6, "isPersisted"    # Z
    .param p7, "reportingInterval"    # I

    .prologue
    .line 62
    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/twitter/cobalt/metrics/ManagedMetric;-><init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;Z)V

    .line 49
    new-instance v0, Lcom/twitter/cobalt/metrics/PeriodicMetric$1;

    invoke-direct {v0, p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric$1;-><init>(Lcom/twitter/cobalt/metrics/PeriodicMetric;)V

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mReportRunnable:Ljava/lang/Runnable;

    .line 63
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mHandler:Landroid/os/Handler;

    .line 64
    iput p7, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mReportingInterval:I

    .line 65
    iget v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mReportingInterval:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    iget v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mReportingInterval:I

    const/4 v1, 0x3

    if-le v0, v1, :cond_1

    .line 66
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid reporting interval, please see PeriodicMetric for valid intervals."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_1
    invoke-static {p0}, Lcom/twitter/cobalt/metrics/MetricsConfig;->addListener(Lcom/twitter/cobalt/metrics/MetricsConfig$MetricConfigListener;)V

    .line 70
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->restartReporting()V

    .line 71
    return-void
.end method

.method static synthetic access$000(Lcom/twitter/cobalt/metrics/PeriodicMetric;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/twitter/cobalt/metrics/PeriodicMetric;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mHandler:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method protected cancelReporting()V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mReportRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 166
    return-void
.end method

.method public getDuration()J
    .locals 4

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->isMeasuring()Z

    move-result v0

    if-nez v0, :cond_0

    .line 146
    iget-wide v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mDuration:J

    .line 150
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mDuration:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v0, v2

    iget-wide v2, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mStartTime:J

    sub-long/2addr v0, v2

    goto :goto_0
.end method

.method protected getReportInterval()I
    .locals 2

    .prologue
    .line 75
    iget v1, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mReportingInterval:I

    packed-switch v1, :pswitch_data_0

    .line 85
    invoke-static {}, Lcom/twitter/cobalt/metrics/MetricsConfig;->getValues()Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    move-result-object v1

    iget v0, v1, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalLong:I

    .line 89
    .local v0, "interval":I
    :goto_0
    return v0

    .line 77
    .end local v0    # "interval":I
    :pswitch_0
    invoke-static {}, Lcom/twitter/cobalt/metrics/MetricsConfig;->getValues()Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    move-result-object v1

    iget v0, v1, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalShort:I

    .line 78
    .restart local v0    # "interval":I
    goto :goto_0

    .line 81
    .end local v0    # "interval":I
    :pswitch_1
    invoke-static {}, Lcom/twitter/cobalt/metrics/MetricsConfig;->getValues()Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    move-result-object v1

    iget v0, v1, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalRegular:I

    .line 82
    .restart local v0    # "interval":I
    goto :goto_0

    .line 75
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onConfigChanged()V
    .locals 0

    .prologue
    .line 161
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->restartReporting()V

    .line 162
    return-void
.end method

.method protected onDestroyMetric()V
    .locals 0

    .prologue
    .line 94
    invoke-super {p0}, Lcom/twitter/cobalt/metrics/ManagedMetric;->onDestroyMetric()V

    .line 95
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->cancelReporting()V

    .line 96
    return-void
.end method

.method protected restartReporting()V
    .locals 14

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->cancelReporting()V

    .line 100
    iget-boolean v5, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mIsDestroyed:Z

    if-eqz v5, :cond_0

    .line 141
    :goto_0
    return-void

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->getReportInterval()I

    move-result v5

    int-to-long v2, v5

    .line 105
    .local v2, "interval":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 106
    .local v0, "currentTime":J
    iget-wide v10, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mLastReport:J

    const-wide/16 v12, 0x0

    cmp-long v5, v10, v12

    if-nez v5, :cond_2

    move-wide v10, v0

    :goto_1
    add-long v6, v10, v2

    .line 111
    .local v6, "newReportTime":J
    iget-wide v10, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mLastReport:J

    cmp-long v5, v10, v0

    if-gtz v5, :cond_1

    sub-long v10, v0, v6

    const-wide/16 v12, 0x7

    mul-long/2addr v12, v2

    cmp-long v5, v10, v12

    if-ltz v5, :cond_3

    .line 113
    :cond_1
    const-wide/16 v10, 0x0

    iput-wide v10, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mLastReport:J

    .line 114
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->reset()V

    .line 115
    invoke-virtual {p0, v2, v3}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->scheduleReporting(J)V

    goto :goto_0

    .line 106
    .end local v6    # "newReportTime":J
    :cond_2
    iget-wide v10, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mLastReport:J

    goto :goto_1

    .line 119
    .restart local v6    # "newReportTime":J
    :cond_3
    cmp-long v5, v6, v0

    if-lez v5, :cond_4

    .line 120
    sub-long v8, v6, v0

    .line 139
    .local v8, "nextReport":J
    :goto_2
    sub-long v10, v2, v8

    sub-long v10, v0, v10

    iput-wide v10, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mStartTime:J

    .line 140
    invoke-virtual {p0, v8, v9}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->scheduleReporting(J)V

    goto :goto_0

    .line 125
    .end local v8    # "nextReport":J
    :cond_4
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->isMeasuring()Z

    move-result v4

    .line 126
    .local v4, "isCurrentlyMeasuring":Z
    if-eqz v4, :cond_5

    .line 129
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->stopMeasuring()V

    .line 131
    :cond_5
    iput-wide v2, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mDuration:J

    .line 132
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->makeAvailable()V

    .line 133
    if-eqz v4, :cond_6

    .line 134
    invoke-virtual {p0}, Lcom/twitter/cobalt/metrics/PeriodicMetric;->startMeasuring()V

    .line 136
    :cond_6
    sub-long v10, v0, v6

    rem-long/2addr v10, v2

    sub-long v8, v2, v10

    .restart local v8    # "nextReport":J
    goto :goto_2
.end method

.method protected scheduleReporting(J)V
    .locals 3
    .param p1, "time"    # J

    .prologue
    .line 169
    iget-object v0, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/twitter/cobalt/metrics/PeriodicMetric;->mReportRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 170
    return-void
.end method

.method protected shouldRestartOnStart()Z
    .locals 1

    .prologue
    .line 156
    const/4 v0, 0x0

    return v0
.end method
