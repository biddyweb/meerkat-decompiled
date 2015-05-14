.class public Lcom/twitter/cobalt/metrics/MetricsConfig$Values;
.super Ljava/lang/Object;
.source "MetricsConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/cobalt/metrics/MetricsConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Values"
.end annotation


# instance fields
.field public final intervalLong:I

.field public final intervalRegular:I

.field public final intervalShort:I

.field public final samplingRateDebug:I

.field public final samplingRateHigh:I

.field public final samplingRateLow:I


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0
    .param p1, "samplingRateDebug"    # I
    .param p2, "samplingRateLow"    # I
    .param p3, "samplingRateHigh"    # I
    .param p4, "intervalShort"    # I
    .param p5, "intervalRegular"    # I
    .param p6, "intervalLong"    # I

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput p1, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateDebug:I

    .line 96
    iput p2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateLow:I

    .line 97
    iput p3, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateHigh:I

    .line 99
    iput p4, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalShort:I

    .line 100
    iput p5, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalRegular:I

    .line 101
    iput p6, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalLong:I

    .line 102
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 106
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    .line 108
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 107
    check-cast v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;

    .line 108
    .local v0, "newVals":Lcom/twitter/cobalt/metrics/MetricsConfig$Values;
    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateDebug:I

    iget v3, v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateDebug:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateLow:I

    iget v3, v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateLow:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateHigh:I

    iget v3, v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateHigh:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalShort:I

    iget v3, v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalShort:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalRegular:I

    iget v3, v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalRegular:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalLong:I

    iget v3, v0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalLong:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 118
    iget v0, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateDebug:I

    .line 119
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateLow:I

    add-int v0, v1, v2

    .line 120
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->samplingRateHigh:I

    add-int v0, v1, v2

    .line 121
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalShort:I

    add-int v0, v1, v2

    .line 122
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalRegular:I

    add-int v0, v1, v2

    .line 123
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/twitter/cobalt/metrics/MetricsConfig$Values;->intervalLong:I

    add-int v0, v1, v2

    .line 124
    return v0
.end method
