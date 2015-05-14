.class public Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;
.super Ljava/lang/Object;
.source "TweetViewMetric.java"


# static fields
.field static final METRIC_LEVEL:Lcom/twitter/cobalt/metrics/Metric$Level;

.field public static final METRIC_TAG:Ljava/lang/String; = "TweetTimingMetric"

.field static final RENDER_METRIC_NAME:Ljava/lang/String; = "tweetview:render"

.field private static final TAG:Ljava/lang/String; = "TweetViewMetric"


# instance fields
.field metricsManager:Lcom/twitter/cobalt/metrics/MetricsManager;

.field renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/twitter/cobalt/metrics/Metric;->LEVEL_DEBUG:Lcom/twitter/cobalt/metrics/Metric$Level;

    sput-object v0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->METRIC_LEVEL:Lcom/twitter/cobalt/metrics/Metric$Level;

    return-void
.end method

.method public constructor <init>(Lcom/twitter/cobalt/metrics/MetricsManager;)V
    .locals 2
    .param p1, "metricsManager"    # Lcom/twitter/cobalt/metrics/MetricsManager;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    if-nez p1, :cond_0

    .line 30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MetricsManager may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->metricsManager:Lcom/twitter/cobalt/metrics/MetricsManager;

    .line 33
    return-void
.end method


# virtual methods
.method destroyAll()V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;

    invoke-virtual {v0}, Lcom/twitter/cobalt/metrics/TimingMetric;->destroyMetric()V

    .line 66
    :cond_0
    return-void
.end method

.method public finishRender()V
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;

    if-nez v0, :cond_0

    .line 51
    const-string v0, "TweetViewMetric"

    const-string v1, "Must call start() before finishRender()"

    invoke-static {v0, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->logOrThrowIllegalStateException(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    :goto_0
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;

    invoke-virtual {v0}, Lcom/twitter/cobalt/metrics/TimingMetric;->stopMeasuring()V

    goto :goto_0
.end method

.method public start()V
    .locals 5

    .prologue
    .line 40
    new-instance v0, Lcom/twitter/cobalt/metrics/TimingMetric;

    const-string v1, "tweetview:render"

    sget-object v2, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->METRIC_LEVEL:Lcom/twitter/cobalt/metrics/Metric$Level;

    const-string v3, "tweetview:render"

    iget-object v4, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->metricsManager:Lcom/twitter/cobalt/metrics/MetricsManager;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/twitter/cobalt/metrics/TimingMetric;-><init>(Ljava/lang/String;Lcom/twitter/cobalt/metrics/Metric$Level;Ljava/lang/String;Lcom/twitter/cobalt/metrics/MetricListener;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;

    .line 42
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;

    const-string v1, "TweetTimingMetric"

    invoke-virtual {v0, v1}, Lcom/twitter/cobalt/metrics/TimingMetric;->setTag(Ljava/lang/String;)V

    .line 43
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TweetViewMetric;->renderMetric:Lcom/twitter/cobalt/metrics/TimingMetric;

    invoke-virtual {v0}, Lcom/twitter/cobalt/metrics/TimingMetric;->startMeasuring()V

    .line 44
    return-void
.end method
