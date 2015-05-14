.class final Lcom/twitter/cobalt/metrics/Metric$1;
.super Ljava/lang/Object;
.source "Metric.java"

# interfaces
.implements Lcom/twitter/cobalt/metrics/Metric$Level;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/cobalt/metrics/Metric;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSampleRate()I
    .locals 1

    .prologue
    .line 21
    invoke-static {}, Lcom/twitter/cobalt/metrics/MetricsConfig;->getValues()Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    move-result-object v0

    iget v0, v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateDebug:I

    return v0
.end method
