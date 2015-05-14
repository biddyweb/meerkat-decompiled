.class public Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;
.super Ljava/lang/Object;
.source "SmoothFrameReleaseTimeHelper.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;
.implements Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$FrameReleaseTimeHelper;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# static fields
.field private static final CHOREOGRAPHER_SAMPLE_DELAY_MILLIS:J = 0x1f4L

.field private static final MAX_ALLOWED_DRIFT_NS:J = 0x1312d00L

.field private static final MIN_FRAMES_FOR_ADJUSTMENT:I = 0x6

.field private static final VSYNC_OFFSET_PERCENTAGE:J = 0x50L


# instance fields
.field private adjustedLastFrameTimeNs:J

.field private choreographer:Landroid/view/Choreographer;

.field private frameCount:I

.field private haveSync:Z

.field private lastUnadjustedFrameTimeUs:J

.field private pendingAdjustedFrameTimeNs:J

.field private sampledVsyncTimeNs:J

.field private syncFrameTimeNs:J

.field private syncReleaseTimeNs:J

.field private final usePrimaryDisplayVsync:Z

.field private final vsyncDurationNs:J

.field private final vsyncOffsetNs:J


# direct methods
.method public constructor <init>(FZ)V
    .locals 4
    .param p1, "primaryDisplayRefreshRate"    # F
    .param p2, "usePrimaryDisplayVsync"    # Z

    .prologue
    const-wide/16 v0, -0x1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-boolean p2, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->usePrimaryDisplayVsync:Z

    .line 60
    if-eqz p2, :cond_0

    .line 61
    const-wide v0, 0x41cdcd6500000000L    # 1.0E9

    float-to-double v2, p1

    div-double/2addr v0, v2

    double-to-long v0, v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->vsyncDurationNs:J

    .line 62
    iget-wide v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->vsyncDurationNs:J

    const-wide/16 v2, 0x50

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x64

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->vsyncOffsetNs:J

    .line 67
    :goto_0
    return-void

    .line 64
    :cond_0
    iput-wide v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->vsyncDurationNs:J

    .line 65
    iput-wide v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->vsyncOffsetNs:J

    goto :goto_0
.end method

.method private static closestVsync(JJJ)J
    .locals 14
    .param p0, "releaseTime"    # J
    .param p2, "sampledVsyncTime"    # J
    .param p4, "vsyncDuration"    # J

    .prologue
    .line 164
    sub-long v12, p0, p2

    div-long v10, v12, p4

    .line 165
    .local v10, "vsyncCount":J
    mul-long v12, p4, v10

    add-long v8, p2, v12

    .line 168
    .local v8, "snappedTimeNs":J
    cmp-long v12, p0, v8

    if-gtz v12, :cond_0

    .line 169
    sub-long v6, v8, p4

    .line 170
    .local v6, "snappedBeforeNs":J
    move-wide v2, v8

    .line 175
    .local v2, "snappedAfterNs":J
    :goto_0
    sub-long v0, v2, p0

    .line 176
    .local v0, "snappedAfterDiff":J
    sub-long v4, p0, v6

    .line 177
    .local v4, "snappedBeforeDiff":J
    cmp-long v12, v0, v4

    if-gez v12, :cond_1

    .end local v2    # "snappedAfterNs":J
    :goto_1
    return-wide v2

    .line 172
    .end local v0    # "snappedAfterDiff":J
    .end local v4    # "snappedBeforeDiff":J
    .end local v6    # "snappedBeforeNs":J
    :cond_0
    move-wide v6, v8

    .line 173
    .restart local v6    # "snappedBeforeNs":J
    add-long v2, v8, p4

    .restart local v2    # "snappedAfterNs":J
    goto :goto_0

    .restart local v0    # "snappedAfterDiff":J
    .restart local v4    # "snappedBeforeDiff":J
    :cond_1
    move-wide v2, v6

    .line 177
    goto :goto_1
.end method

.method private isDriftTooLarge(JJ)Z
    .locals 9
    .param p1, "frameTimeNs"    # J
    .param p3, "releaseTimeNs"    # J

    .prologue
    .line 158
    iget-wide v4, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->syncFrameTimeNs:J

    sub-long v0, p1, v4

    .line 159
    .local v0, "elapsedFrameTimeNs":J
    iget-wide v4, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->syncReleaseTimeNs:J

    sub-long v2, p3, v4

    .line 160
    .local v2, "elapsedReleaseTimeNs":J
    sub-long v4, v2, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/32 v6, 0x1312d00

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method


# virtual methods
.method public adjustReleaseTime(JJ)J
    .locals 23
    .param p1, "unadjustedFrameTimeUs"    # J
    .param p3, "unadjustedReleaseTimeNs"    # J

    .prologue
    .line 95
    const-wide/16 v8, 0x3e8

    mul-long v20, p1, v8

    .line 98
    .local v20, "unadjustedFrameTimeNs":J
    move-wide/from16 v12, v20

    .line 99
    .local v12, "adjustedFrameTimeNs":J
    move-wide/from16 v6, p3

    .line 101
    .local v6, "adjustedReleaseTimeNs":J
    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->haveSync:Z

    if-eqz v8, :cond_1

    .line 103
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->lastUnadjustedFrameTimeUs:J

    cmp-long v8, p1, v8

    if-eqz v8, :cond_0

    .line 104
    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->frameCount:I

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p0

    iput v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->frameCount:I

    .line 105
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->pendingAdjustedFrameTimeNs:J

    move-object/from16 v0, p0

    iput-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->adjustedLastFrameTimeNs:J

    .line 107
    :cond_0
    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->frameCount:I

    const/4 v9, 0x6

    if-lt v8, v9, :cond_4

    .line 112
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->syncFrameTimeNs:J

    sub-long v8, v20, v8

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->frameCount:I

    int-to-long v10, v10

    div-long v14, v8, v10

    .line 114
    .local v14, "averageFrameTimeNs":J
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->adjustedLastFrameTimeNs:J

    add-long v16, v8, v14

    .line 116
    .local v16, "candidateAdjustedFrameTimeNs":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-wide/from16 v3, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->isDriftTooLarge(JJ)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 117
    const/4 v8, 0x0

    move-object/from16 v0, p0

    iput-boolean v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->haveSync:Z

    .line 132
    .end local v14    # "averageFrameTimeNs":J
    .end local v16    # "candidateAdjustedFrameTimeNs":J
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->haveSync:Z

    if-nez v8, :cond_2

    .line 133
    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->syncFrameTimeNs:J

    .line 134
    move-wide/from16 v0, p3

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->syncReleaseTimeNs:J

    .line 135
    const/4 v8, 0x0

    move-object/from16 v0, p0

    iput v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->frameCount:I

    .line 136
    const/4 v8, 0x1

    move-object/from16 v0, p0

    iput-boolean v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->haveSync:Z

    .line 137
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->onSynced()V

    .line 140
    :cond_2
    move-wide/from16 v0, p1

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->lastUnadjustedFrameTimeUs:J

    .line 141
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->pendingAdjustedFrameTimeNs:J

    .line 143
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->sampledVsyncTimeNs:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_5

    .line 150
    .end local v6    # "adjustedReleaseTimeNs":J
    :goto_1
    return-wide v6

    .line 119
    .restart local v6    # "adjustedReleaseTimeNs":J
    .restart local v14    # "averageFrameTimeNs":J
    .restart local v16    # "candidateAdjustedFrameTimeNs":J
    :cond_3
    move-wide/from16 v12, v16

    .line 120
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->syncReleaseTimeNs:J

    add-long/2addr v8, v12

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->syncFrameTimeNs:J

    sub-long v6, v8, v10

    goto :goto_0

    .line 125
    .end local v14    # "averageFrameTimeNs":J
    .end local v16    # "candidateAdjustedFrameTimeNs":J
    :cond_4
    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    move-wide/from16 v3, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->isDriftTooLarge(JJ)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 126
    const/4 v8, 0x0

    move-object/from16 v0, p0

    iput-boolean v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->haveSync:Z

    goto :goto_0

    .line 148
    :cond_5
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->sampledVsyncTimeNs:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->vsyncDurationNs:J

    invoke-static/range {v6 .. v11}, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->closestVsync(JJJ)J

    move-result-wide v18

    .line 150
    .local v18, "snappedTimeNs":J
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->vsyncOffsetNs:J

    sub-long v6, v18, v8

    goto :goto_1
.end method

.method public disable()V
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->usePrimaryDisplayVsync:Z

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->choreographer:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->choreographer:Landroid/view/Choreographer;

    .line 85
    :cond_0
    return-void
.end method

.method public doFrame(J)V
    .locals 5
    .param p1, "vsyncTimeNs"    # J

    .prologue
    .line 89
    iput-wide p1, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->sampledVsyncTimeNs:J

    .line 90
    iget-object v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->choreographer:Landroid/view/Choreographer;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, p0, v2, v3}, Landroid/view/Choreographer;->postFrameCallbackDelayed(Landroid/view/Choreographer$FrameCallback;J)V

    .line 91
    return-void
.end method

.method public enable()V
    .locals 2

    .prologue
    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->haveSync:Z

    .line 72
    iget-boolean v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->usePrimaryDisplayVsync:Z

    if-eqz v0, :cond_0

    .line 73
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->sampledVsyncTimeNs:J

    .line 74
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->choreographer:Landroid/view/Choreographer;

    .line 75
    iget-object v0, p0, Lcom/google/android/exoplayer/SmoothFrameReleaseTimeHelper;->choreographer:Landroid/view/Choreographer;

    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 77
    :cond_0
    return-void
.end method

.method protected onSynced()V
    .locals 0

    .prologue
    .line 155
    return-void
.end method
