.class public Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;
.super Ljava/lang/Object;
.source "FormatEvaluator.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/FormatEvaluator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/chunk/FormatEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdaptiveEvaluator"
.end annotation


# static fields
.field public static final DEFAULT_BANDWIDTH_FRACTION:F = 0.75f

.field public static final DEFAULT_MAX_DURATION_FOR_QUALITY_DECREASE_MS:I = 0x61a8

.field public static final DEFAULT_MAX_INITIAL_BITRATE:I = 0xc3500

.field public static final DEFAULT_MIN_DURATION_FOR_QUALITY_INCREASE_MS:I = 0x2710

.field public static final DEFAULT_MIN_DURATION_TO_RETAIN_AFTER_DISCARD_MS:I = 0x61a8


# instance fields
.field private final bandwidthFraction:F

.field private final bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

.field private final maxDurationForQualityDecreaseUs:J

.field private final maxInitialBitrate:I

.field private final minDurationForQualityIncreaseUs:J

.field private final minDurationToRetainAfterDiscardUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BandwidthMeter;)V
    .locals 7
    .param p1, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    .prologue
    const/16 v4, 0x61a8

    .line 186
    const v2, 0xc3500

    const/16 v3, 0x2710

    const/high16 v6, 0x3f400000    # 0.75f

    move-object v0, p0

    move-object v1, p1

    move v5, v4

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;-><init>(Lcom/google/android/exoplayer/upstream/BandwidthMeter;IIIIF)V

    .line 190
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BandwidthMeter;IIIIF)V
    .locals 4
    .param p1, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;
    .param p2, "maxInitialBitrate"    # I
    .param p3, "minDurationForQualityIncreaseMs"    # I
    .param p4, "maxDurationForQualityDecreaseMs"    # I
    .param p5, "minDurationToRetainAfterDiscardMs"    # I
    .param p6, "bandwidthFraction"    # F

    .prologue
    const-wide/16 v2, 0x3e8

    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    .line 215
    iput p2, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxInitialBitrate:I

    .line 216
    int-to-long v0, p3

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationForQualityIncreaseUs:J

    .line 217
    int-to-long v0, p4

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxDurationForQualityDecreaseUs:J

    .line 218
    int-to-long v0, p5

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationToRetainAfterDiscardUs:J

    .line 219
    iput p6, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthFraction:F

    .line 220
    return-void
.end method


# virtual methods
.method protected computeEffectiveBitrateEstimate(J)J
    .locals 3
    .param p1, "bitrateEstimate"    # J

    .prologue
    .line 295
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxInitialBitrate:I

    int-to-long v0, v0

    :goto_0
    return-wide v0

    :cond_0
    long-to-float v0, p1

    iget v1, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthFraction:F

    mul-float/2addr v0, v1

    float-to-long v0, v0

    goto :goto_0
.end method

.method protected determineIdealFormat([Lcom/google/android/exoplayer/chunk/Format;J)Lcom/google/android/exoplayer/chunk/Format;
    .locals 6
    .param p1, "formats"    # [Lcom/google/android/exoplayer/chunk/Format;
    .param p2, "bitrateEstimate"    # J

    .prologue
    .line 280
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->computeEffectiveBitrateEstimate(J)J

    move-result-wide v0

    .line 281
    .local v0, "effectiveBitrate":J
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_1

    .line 282
    aget-object v2, p1, v3

    .line 283
    .local v2, "format":Lcom/google/android/exoplayer/chunk/Format;
    iget v4, v2, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    int-to-long v4, v4

    cmp-long v4, v4, v0

    if-gtz v4, :cond_0

    .line 288
    .end local v2    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :goto_1
    return-object v2

    .line 281
    .restart local v2    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 288
    .end local v2    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_1
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    aget-object v2, p1, v4

    goto :goto_1
.end method

.method public disable()V
    .locals 0

    .prologue
    .line 230
    return-void
.end method

.method public enable()V
    .locals 0

    .prologue
    .line 225
    return-void
.end method

.method public evaluate(Ljava/util/List;J[Lcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;)V
    .locals 14
    .param p2, "playbackPositionUs"    # J
    .param p4, "formats"    # [Lcom/google/android/exoplayer/chunk/Format;
    .param p5, "evaluation"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;J[",
            "Lcom/google/android/exoplayer/chunk/Format;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;",
            ")V"
        }
    .end annotation

    .prologue
    .line 235
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_2

    const-wide/16 v2, 0x0

    .line 237
    .local v2, "bufferedDurationUs":J
    :goto_0
    move-object/from16 v0, p5

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 238
    .local v4, "current":Lcom/google/android/exoplayer/chunk/Format;
    iget-object v12, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    invoke-interface {v12}, Lcom/google/android/exoplayer/upstream/BandwidthMeter;->getBitrateEstimate()J

    move-result-wide v12

    move-object/from16 v0, p4

    invoke-virtual {p0, v0, v12, v13}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->determineIdealFormat([Lcom/google/android/exoplayer/chunk/Format;J)Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v8

    .line 239
    .local v8, "ideal":Lcom/google/android/exoplayer/chunk/Format;
    if-eqz v8, :cond_3

    if-eqz v4, :cond_3

    iget v12, v8, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v13, v4, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    if-le v12, v13, :cond_3

    const/4 v9, 0x1

    .line 240
    .local v9, "isHigher":Z
    :goto_1
    if-eqz v8, :cond_4

    if-eqz v4, :cond_4

    iget v12, v8, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v13, v4, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    if-ge v12, v13, :cond_4

    const/4 v10, 0x1

    .line 241
    .local v10, "isLower":Z
    :goto_2
    if-eqz v9, :cond_7

    .line 242
    iget-wide v12, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationForQualityIncreaseUs:J

    cmp-long v12, v2, v12

    if-gez v12, :cond_5

    .line 245
    move-object v8, v4

    .line 270
    :cond_0
    :goto_3
    if-eqz v4, :cond_1

    if-eq v8, v4, :cond_1

    .line 271
    const/4 v12, 0x2

    move-object/from16 v0, p5

    iput v12, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    .line 273
    :cond_1
    move-object/from16 v0, p5

    iput-object v8, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 274
    return-void

    .line 236
    .end local v2    # "bufferedDurationUs":J
    .end local v4    # "current":Lcom/google/android/exoplayer/chunk/Format;
    .end local v8    # "ideal":Lcom/google/android/exoplayer/chunk/Format;
    .end local v9    # "isHigher":Z
    .end local v10    # "isLower":Z
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {p1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/exoplayer/chunk/MediaChunk;

    iget-wide v12, v12, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    sub-long v2, v12, p2

    goto :goto_0

    .line 239
    .restart local v2    # "bufferedDurationUs":J
    .restart local v4    # "current":Lcom/google/android/exoplayer/chunk/Format;
    .restart local v8    # "ideal":Lcom/google/android/exoplayer/chunk/Format;
    :cond_3
    const/4 v9, 0x0

    goto :goto_1

    .line 240
    .restart local v9    # "isHigher":Z
    :cond_4
    const/4 v10, 0x0

    goto :goto_2

    .line 246
    .restart local v10    # "isLower":Z
    :cond_5
    iget-wide v12, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationToRetainAfterDiscardUs:J

    cmp-long v12, v2, v12

    if-ltz v12, :cond_0

    .line 250
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v12

    if-ge v5, v12, :cond_0

    .line 251
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 252
    .local v11, "thisChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    iget-wide v12, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    sub-long v6, v12, p2

    .line 253
    .local v6, "durationBeforeThisSegmentUs":J
    iget-wide v12, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->minDurationToRetainAfterDiscardUs:J

    cmp-long v12, v6, v12

    if-ltz v12, :cond_6

    iget-object v12, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v12, v12, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    iget v13, v8, Lcom/google/android/exoplayer/chunk/Format;->bitrate:I

    if-ge v12, v13, :cond_6

    iget-object v12, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v12, v12, Lcom/google/android/exoplayer/chunk/Format;->height:I

    iget v13, v8, Lcom/google/android/exoplayer/chunk/Format;->height:I

    if-ge v12, v13, :cond_6

    iget-object v12, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v12, v12, Lcom/google/android/exoplayer/chunk/Format;->height:I

    const/16 v13, 0x2d0

    if-ge v12, v13, :cond_6

    iget-object v12, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget v12, v12, Lcom/google/android/exoplayer/chunk/Format;->width:I

    const/16 v13, 0x500

    if-ge v12, v13, :cond_6

    .line 259
    move-object/from16 v0, p5

    iput v5, v0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    goto :goto_3

    .line 250
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 264
    .end local v5    # "i":I
    .end local v6    # "durationBeforeThisSegmentUs":J
    .end local v11    # "thisChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :cond_7
    if-eqz v10, :cond_0

    if-eqz v4, :cond_0

    iget-wide v12, p0, Lcom/google/android/exoplayer/chunk/FormatEvaluator$AdaptiveEvaluator;->maxDurationForQualityDecreaseUs:J

    cmp-long v12, v2, v12

    if-ltz v12, :cond_0

    .line 268
    move-object v8, v4

    goto :goto_3
.end method
