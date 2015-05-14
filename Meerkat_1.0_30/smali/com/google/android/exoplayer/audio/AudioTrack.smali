.class public final Lcom/google/android/exoplayer/audio/AudioTrack;
.super Ljava/lang/Object;
.source "AudioTrack.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;,
        Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;,
        Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;,
        Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
    }
.end annotation


# static fields
.field private static final BUFFER_MULTIPLICATION_FACTOR:I = 0x4

.field public static final CURRENT_POSITION_NOT_SET:J = -0x8000000000000000L

.field private static final MAX_AUDIO_TIMESTAMP_OFFSET_US:J = 0x4c4b40L

.field private static final MAX_BUFFER_DURATION_US:J = 0xb71b0L

.field private static final MAX_LATENCY_US:J = 0x4c4b40L

.field private static final MAX_PLAYHEAD_OFFSET_COUNT:I = 0xa

.field private static final MIN_BUFFER_DURATION_US:J = 0x3d090L

.field private static final MIN_PLAYHEAD_OFFSET_SAMPLE_INTERVAL_US:I = 0x7530

.field private static final MIN_TIMESTAMP_SAMPLE_INTERVAL_US:I = 0x7a120

.field public static final RESULT_BUFFER_CONSUMED:I = 0x2

.field public static final RESULT_POSITION_DISCONTINUITY:I = 0x1

.field public static final SESSION_ID_NOT_SET:I = 0x0

.field private static final START_IN_SYNC:I = 0x1

.field private static final START_NEED_SYNC:I = 0x2

.field private static final START_NOT_SET:I = 0x0

.field private static final TAG:Ljava/lang/String; = "AudioTrack"

.field private static final UNKNOWN_AC3_BITRATE:I


# instance fields
.field private ac3Bitrate:I

.field private audioTimestampSet:Z

.field private audioTrack:Landroid/media/AudioTrack;

.field private audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

.field private bufferSize:I

.field private channelConfig:I

.field private encoding:I

.field private frameSize:I

.field private getLatencyMethod:Ljava/lang/reflect/Method;

.field private isAc3:Z

.field private lastPlayheadSampleTimeUs:J

.field private lastTimestampSampleTimeUs:J

.field private latencyUs:J

.field private minBufferSize:I

.field private nextPlayheadOffsetIndex:I

.field private playheadOffsetCount:I

.field private final playheadOffsets:[J

.field private final releasingConditionVariable:Landroid/os/ConditionVariable;

.field private resumeSystemTimeUs:J

.field private sampleRate:I

.field private smoothedPlayheadOffsetUs:J

.field private startMediaTimeState:I

.field private startMediaTimeUs:J

.field private submittedBytes:J

.field private temporaryBuffer:[B

.field private temporaryBufferOffset:I

.field private temporaryBufferSize:I

.field private volume:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    new-instance v0, Landroid/os/ConditionVariable;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/os/ConditionVariable;-><init>(Z)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    .line 170
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    .line 172
    :try_start_0
    const-class v1, Landroid/media/AudioTrack;

    const-string v2, "getLatency"

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    .line 173
    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :cond_0
    :goto_0
    const/16 v0, 0xa

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsets:[J

    .line 179
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    .line 180
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 181
    return-void

    .line 174
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/audio/AudioTrack;)Landroid/os/ConditionVariable;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/audio/AudioTrack;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    return-object v0
.end method

.method private bytesToFrames(J)J
    .locals 5
    .param p1, "byteCount"    # J

    .prologue
    .line 649
    iget-boolean v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->isAc3:Z

    if-eqz v0, :cond_1

    .line 650
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->ac3Bitrate:I

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    .line 653
    :goto_0
    return-wide v0

    .line 650
    :cond_0
    const-wide/16 v0, 0x8

    mul-long/2addr v0, p1

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    int-to-long v2, v2

    mul-long/2addr v0, v2

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->ac3Bitrate:I

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    div-long/2addr v0, v2

    goto :goto_0

    .line 653
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->frameSize:I

    int-to-long v0, v0

    div-long v0, p1, v0

    goto :goto_0
.end method

.method private checkAudioTrackInitialized()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 631
    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    .line 632
    .local v0, "state":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 633
    return-void

    .line 637
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 642
    iput-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 645
    :goto_0
    new-instance v1, Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;-><init>(IIII)V

    throw v1

    .line 638
    :catch_0
    move-exception v1

    .line 642
    iput-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    goto :goto_0

    :catchall_0
    move-exception v1

    iput-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    throw v1
.end method

.method private durationUsToFrames(J)J
    .locals 5
    .param p1, "durationUs"    # J

    .prologue
    .line 662
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    int-to-long v0, v0

    mul-long/2addr v0, p1

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    return-wide v0
.end method

.method private framesToDurationUs(J)J
    .locals 5
    .param p1, "frameCount"    # J

    .prologue
    .line 658
    const-wide/32 v0, 0xf4240

    mul-long/2addr v0, p1

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method private hasCurrentPositionUs()Z
    .locals 4

    .prologue
    .line 552
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maybeSampleSyncParams()V
    .locals 18

    .prologue
    .line 557
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v12}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPositionUs()J

    move-result-wide v8

    .line 558
    .local v8, "playbackPositionUs":J
    const-wide/16 v12, 0x0

    cmp-long v12, v8, v12

    if-nez v12, :cond_1

    .line 621
    :cond_0
    :goto_0
    return-void

    .line 562
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    const-wide/16 v14, 0x3e8

    div-long v10, v12, v14

    .line 563
    .local v10, "systemClockUs":J
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    sub-long v12, v10, v12

    const-wide/16 v14, 0x7530

    cmp-long v12, v12, v14

    if-ltz v12, :cond_3

    .line 565
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsets:[J

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    sub-long v14, v8, v10

    aput-wide v14, v12, v13

    .line 566
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    add-int/lit8 v12, v12, 0x1

    rem-int/lit8 v12, v12, 0xa

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    .line 567
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    const/16 v13, 0xa

    if-ge v12, v13, :cond_2

    .line 568
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    .line 570
    :cond_2
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    .line 571
    const-wide/16 v12, 0x0

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 572
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    if-ge v7, v12, :cond_3

    .line 573
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsets:[J

    aget-wide v14, v14, v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    div-long v14, v14, v16

    add-long/2addr v12, v14

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 572
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 577
    .end local v7    # "i":I
    :cond_3
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    sub-long v12, v10, v12

    const-wide/32 v14, 0x7a120

    cmp-long v12, v12, v14

    if-ltz v12, :cond_0

    .line 578
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v12}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->updateTimestamp()Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 579
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    if-eqz v12, :cond_4

    .line 581
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v12}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampNanoTime()J

    move-result-wide v12

    const-wide/16 v14, 0x3e8

    div-long v4, v12, v14

    .line 582
    .local v4, "audioTimestampUs":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v12}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampFramePosition()J

    move-result-wide v2

    .line 583
    .local v2, "audioTimestampFramePosition":J
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->resumeSystemTimeUs:J

    cmp-long v12, v4, v12

    if-gez v12, :cond_6

    .line 585
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 601
    .end local v2    # "audioTimestampFramePosition":J
    .end local v4    # "audioTimestampUs":J
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    if-eqz v12, :cond_5

    .line 605
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    const/4 v12, 0x0

    check-cast v12, [Ljava/lang/Object;

    invoke-virtual {v13, v14, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    int-to-long v12, v12

    const-wide/16 v14, 0x3e8

    mul-long/2addr v12, v14

    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    int-to-long v14, v14

    .line 606
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/google/android/exoplayer/audio/AudioTrack;->bytesToFrames(J)J

    move-result-wide v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v14

    sub-long/2addr v12, v14

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    .line 608
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    const-wide/16 v14, 0x0

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    .line 610
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    const-wide/32 v14, 0x4c4b40

    cmp-long v12, v12, v14

    if-lez v12, :cond_5

    .line 611
    const-string v12, "AudioTrack"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Ignoring impossibly large audio latency: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 612
    const-wide/16 v12, 0x0

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 619
    :cond_5
    :goto_3
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    goto/16 :goto_0

    .line 586
    .restart local v2    # "audioTimestampFramePosition":J
    .restart local v4    # "audioTimestampUs":J
    :cond_6
    sub-long v12, v4, v10

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v12

    const-wide/32 v14, 0x4c4b40

    cmp-long v12, v12, v14

    if-lez v12, :cond_7

    .line 588
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 589
    const-string v12, "AudioTrack"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Spurious audio timestamp (system clock mismatch): "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 592
    :cond_7
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v12

    sub-long/2addr v12, v8

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v12

    const-wide/32 v14, 0x4c4b40

    cmp-long v12, v12, v14

    if-lez v12, :cond_4

    .line 595
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 596
    const-string v12, "AudioTrack"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Spurious audio timestamp (frame position mismatch): "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 614
    .end local v2    # "audioTimestampFramePosition":J
    .end local v4    # "audioTimestampUs":J
    :catch_0
    move-exception v6

    .line 616
    .local v6, "e":Ljava/lang/Exception;
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->getLatencyMethod:Ljava/lang/reflect/Method;

    goto/16 :goto_3
.end method

.method private resetSyncParams()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v0, 0x0

    .line 666
    iput-wide v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    .line 667
    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    .line 668
    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->nextPlayheadOffsetIndex:I

    .line 669
    iput-wide v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastPlayheadSampleTimeUs:J

    .line 670
    iput-boolean v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    .line 671
    iput-wide v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->lastTimestampSampleTimeUs:J

    .line 672
    return-void
.end method

.method private static setVolumeV21(Landroid/media/AudioTrack;F)V
    .locals 0
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "volume"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 501
    invoke-virtual {p0, p1}, Landroid/media/AudioTrack;->setVolume(F)I

    .line 502
    return-void
.end method

.method private static setVolumeV3(Landroid/media/AudioTrack;F)V
    .locals 0
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "volume"    # F

    .prologue
    .line 506
    invoke-virtual {p0, p1, p1}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    .line 507
    return-void
.end method

.method private static writeNonBlockingV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I
    .locals 1
    .param p0, "audioTrack"    # Landroid/media/AudioTrack;
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "size"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 471
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Landroid/media/AudioTrack;->write(Ljava/nio/ByteBuffer;II)I

    move-result v0

    return v0
.end method


# virtual methods
.method public getCurrentPositionUs(Z)J
    .locals 14
    .param p1, "sourceEnded"    # Z

    .prologue
    const-wide/16 v12, 0x3e8

    .line 203
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->hasCurrentPositionUs()Z

    move-result v10

    if-nez v10, :cond_1

    .line 204
    const-wide/high16 v2, -0x8000000000000000L

    .line 235
    :cond_0
    :goto_0
    return-wide v2

    .line 207
    :cond_1
    iget-object v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v10}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v10

    const/4 v11, 0x3

    if-ne v10, v11, :cond_2

    .line 208
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->maybeSampleSyncParams()V

    .line 211
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    div-long v8, v10, v12

    .line 213
    .local v8, "systemClockUs":J
    iget-boolean v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTimestampSet:Z

    if-eqz v10, :cond_3

    .line 215
    iget-object v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v10}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampNanoTime()J

    move-result-wide v10

    div-long/2addr v10, v12

    sub-long v6, v8, v10

    .line 216
    .local v6, "presentationDiff":J
    invoke-direct {p0, v6, v7}, Lcom/google/android/exoplayer/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v4

    .line 218
    .local v4, "framesDiff":J
    iget-object v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v10}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getTimestampFramePosition()J

    move-result-wide v10

    add-long v0, v10, v4

    .line 219
    .local v0, "currentFramePosition":J
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v10

    iget-wide v12, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    add-long v2, v10, v12

    .line 220
    .local v2, "currentPositionUs":J
    goto :goto_0

    .line 221
    .end local v0    # "currentFramePosition":J
    .end local v2    # "currentPositionUs":J
    .end local v4    # "framesDiff":J
    .end local v6    # "presentationDiff":J
    :cond_3
    iget v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->playheadOffsetCount:I

    if-nez v10, :cond_4

    .line 223
    iget-object v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v10}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPositionUs()J

    move-result-wide v10

    iget-wide v12, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    add-long v2, v10, v12

    .line 230
    .restart local v2    # "currentPositionUs":J
    :goto_1
    if-nez p1, :cond_0

    .line 231
    iget-wide v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->latencyUs:J

    sub-long/2addr v2, v10

    goto :goto_0

    .line 228
    .end local v2    # "currentPositionUs":J
    :cond_4
    iget-wide v10, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->smoothedPlayheadOffsetUs:J

    add-long/2addr v10, v8

    iget-wide v12, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    add-long v2, v10, v12

    .restart local v2    # "currentPositionUs":J
    goto :goto_1
.end method

.method public handleBuffer(Ljava/nio/ByteBuffer;IIJ)I
    .locals 18
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "offset"    # I
    .param p3, "size"    # I
    .param p4, "presentationTimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;
        }
    .end annotation

    .prologue
    .line 386
    if-nez p3, :cond_1

    .line 387
    const/4 v10, 0x2

    .line 465
    :cond_0
    :goto_0
    return v10

    .line 390
    :cond_1
    const/4 v10, 0x0

    .line 391
    .local v10, "result":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    if-nez v12, :cond_3

    .line 392
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->isAc3:Z

    if-eqz v12, :cond_2

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->ac3Bitrate:I

    if-nez v12, :cond_2

    .line 395
    mul-int/lit8 v12, p3, 0x8

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    mul-int v11, v12, v13

    .line 396
    .local v11, "unscaledAc3Bitrate":I
    const v7, 0x177000

    .line 397
    .local v7, "divisor":I
    const v12, 0xbb800

    add-int/2addr v12, v11

    div-int/2addr v12, v7

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->ac3Bitrate:I

    .line 402
    .end local v7    # "divisor":I
    .end local v11    # "unscaledAc3Bitrate":I
    :cond_2
    move/from16 v0, p3

    int-to-long v12, v0

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/google/android/exoplayer/audio/AudioTrack;->bytesToFrames(J)J

    move-result-wide v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v12

    sub-long v2, p4, v12

    .line 403
    .local v2, "bufferStartTime":J
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    const-wide/16 v14, 0x0

    cmp-long v12, v12, v14

    if-nez v12, :cond_8

    .line 404
    const-wide/16 v12, 0x0

    invoke-static {v12, v13, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    .line 405
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 426
    .end local v2    # "bufferStartTime":J
    :cond_3
    :goto_1
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    if-nez v12, :cond_6

    .line 427
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    .line 428
    invoke-virtual/range {p1 .. p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 429
    sget v12, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v13, 0x15

    if-ge v12, v13, :cond_6

    .line 431
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    if-eqz v12, :cond_4

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    array-length v12, v12

    move/from16 v0, p3

    if-ge v12, v0, :cond_5

    .line 432
    :cond_4
    move/from16 v0, p3

    new-array v12, v0, [B

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    .line 434
    :cond_5
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    const/4 v13, 0x0

    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-virtual {v0, v12, v13, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 435
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    .line 439
    :cond_6
    const/4 v6, 0x0

    .line 440
    .local v6, "bytesWritten":I
    sget v12, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v13, 0x15

    if-ge v12, v13, :cond_a

    .line 442
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedBytes:J

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    .line 443
    invoke-virtual {v14}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->frameSize:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    mul-long v14, v14, v16

    sub-long/2addr v12, v14

    long-to-int v4, v12

    .line 444
    .local v4, "bytesPending":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    sub-int v5, v12, v4

    .line 445
    .local v5, "bytesToWrite":I
    if-lez v5, :cond_7

    .line 446
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    invoke-static {v12, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 447
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBuffer:[B

    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    invoke-virtual {v12, v13, v14, v5}, Landroid/media/AudioTrack;->write([BII)I

    move-result v6

    .line 448
    if-ltz v6, :cond_7

    .line 449
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    add-int/2addr v12, v6

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferOffset:I

    .line 456
    .end local v4    # "bytesPending":I
    .end local v5    # "bytesToWrite":I
    :cond_7
    :goto_2
    if-gez v6, :cond_b

    .line 457
    new-instance v12, Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;

    invoke-direct {v12, v6}, Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;-><init>(I)V

    throw v12

    .line 408
    .end local v6    # "bytesWritten":I
    .restart local v2    # "bufferStartTime":J
    :cond_8
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedBytes:J

    .line 409
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/google/android/exoplayer/audio/AudioTrack;->bytesToFrames(J)J

    move-result-wide v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/google/android/exoplayer/audio/AudioTrack;->framesToDurationUs(J)J

    move-result-wide v14

    add-long v8, v12, v14

    .line 410
    .local v8, "expectedBufferStartTime":J
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    const/4 v13, 0x1

    if-ne v12, v13, :cond_9

    sub-long v12, v8, v2

    .line 411
    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v12

    const-wide/32 v14, 0x30d40

    cmp-long v12, v12, v14

    if-lez v12, :cond_9

    .line 412
    const-string v12, "AudioTrack"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Discontinuity detected [expected "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", got "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "]"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    const/4 v12, 0x2

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 416
    :cond_9
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    const/4 v13, 0x2

    if-ne v12, v13, :cond_3

    .line 419
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    sub-long v14, v2, v8

    add-long/2addr v12, v14

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    .line 420
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 421
    or-int/lit8 v10, v10, 0x1

    goto/16 :goto_1

    .line 453
    .end local v2    # "bufferStartTime":J
    .end local v8    # "expectedBufferStartTime":J
    .restart local v6    # "bytesWritten":I
    :cond_a
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    move-object/from16 v0, p1

    invoke-static {v12, v0, v13}, Lcom/google/android/exoplayer/audio/AudioTrack;->writeNonBlockingV21(Landroid/media/AudioTrack;Ljava/nio/ByteBuffer;I)I

    move-result v6

    goto/16 :goto_2

    .line 460
    :cond_b
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    sub-int/2addr v12, v6

    move-object/from16 v0, p0

    iput v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    .line 461
    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedBytes:J

    int-to-long v14, v6

    add-long/2addr v12, v14

    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedBytes:J

    .line 462
    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    if-nez v12, :cond_0

    .line 463
    or-int/lit8 v10, v10, 0x2

    goto/16 :goto_0
.end method

.method public handleDiscontinuity()V
    .locals 2

    .prologue
    .line 364
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 365
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeState:I

    .line 367
    :cond_0
    return-void
.end method

.method public hasEnoughDataToBeginPlayback()Z
    .locals 4

    .prologue
    .line 484
    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedBytes:J

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->minBufferSize:I

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasPendingData()Z
    .locals 4

    .prologue
    .line 476
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedBytes:J

    .line 477
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->bytesToFrames(J)J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;->getPlaybackHeadPosition()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public initialize()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    .line 244
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->initialize(I)I

    move-result v0

    return v0
.end method

.method public initialize(I)I
    .locals 8
    .param p1, "sessionId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x3

    const/4 v6, 0x1

    .line 260
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 262
    if-nez p1, :cond_0

    .line 263
    new-instance v0, Landroid/media/AudioTrack;

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    iget v5, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 271
    :goto_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->checkAudioTrackInitialized()V

    .line 272
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    .line 273
    new-instance v0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;

    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtilV19;-><init>(Landroid/media/AudioTrack;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    .line 277
    :goto_1
    iget v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->setVolume(F)V

    .line 278
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioSessionId()I

    move-result v0

    return v0

    .line 267
    :cond_0
    new-instance v0, Landroid/media/AudioTrack;

    iget v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    iget v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    iget v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    iget v5, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    move v7, p1

    invoke-direct/range {v0 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    goto :goto_0

    .line 275
    :cond_1
    new-instance v0, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;-><init>(Landroid/media/AudioTrack;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    goto :goto_1
.end method

.method public isInitialized()Z
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 511
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 512
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->resetSyncParams()V

    .line 513
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 515
    :cond_0
    return-void
.end method

.method public play()V
    .locals 4

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 356
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->resumeSystemTimeUs:J

    .line 357
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 359
    :cond_0
    return-void
.end method

.method public reconfigure(Landroid/media/MediaFormat;)V
    .locals 2
    .param p1, "format"    # Landroid/media/MediaFormat;

    .prologue
    .line 286
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->reconfigure(Landroid/media/MediaFormat;II)V

    .line 287
    return-void
.end method

.method public reconfigure(Landroid/media/MediaFormat;II)V
    .locals 16
    .param p1, "format"    # Landroid/media/MediaFormat;
    .param p2, "encoding"    # I
    .param p3, "specifiedBufferSize"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 301
    const-string v9, "channel-count"

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    .line 303
    .local v3, "channelCount":I
    packed-switch v3, :pswitch_data_0

    .line 317
    :pswitch_0
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unsupported channel count: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 305
    :pswitch_1
    const/4 v2, 0x4

    .line 320
    .local v2, "channelConfig":I
    :goto_0
    const-string v9, "sample-rate"

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v8

    .line 323
    .local v8, "sampleRate":I
    const/4 v9, 0x5

    move/from16 v0, p2

    if-eq v0, v9, :cond_0

    const/4 v9, 0x6

    move/from16 v0, p2

    if-ne v0, v9, :cond_1

    :cond_0
    const/4 v4, 0x1

    .line 324
    .local v4, "isAc3":Z
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v9

    if-eqz v9, :cond_2

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    if-ne v9, v8, :cond_2

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    if-ne v9, v2, :cond_2

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->isAc3:Z

    if-nez v9, :cond_2

    if-nez v4, :cond_2

    .line 351
    :goto_2
    return-void

    .line 308
    .end local v2    # "channelConfig":I
    .end local v4    # "isAc3":Z
    .end local v8    # "sampleRate":I
    :pswitch_2
    const/16 v2, 0xc

    .line 309
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 311
    .end local v2    # "channelConfig":I
    :pswitch_3
    const/16 v2, 0xfc

    .line 312
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 314
    .end local v2    # "channelConfig":I
    :pswitch_4
    const/16 v2, 0x3fc

    .line 315
    .restart local v2    # "channelConfig":I
    goto :goto_0

    .line 323
    .restart local v8    # "sampleRate":I
    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 330
    .restart local v4    # "isAc3":Z
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->reset()V

    .line 332
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/audio/AudioTrack;->encoding:I

    .line 333
    move-object/from16 v0, p0

    iput v8, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->sampleRate:I

    .line 334
    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->channelConfig:I

    .line 335
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->isAc3:Z

    .line 336
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->ac3Bitrate:I

    .line 337
    mul-int/lit8 v9, v3, 0x2

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->frameSize:I

    .line 338
    move/from16 v0, p2

    invoke-static {v8, v2, v0}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v9

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->minBufferSize:I

    .line 340
    if-eqz p3, :cond_3

    .line 341
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    goto :goto_2

    .line 343
    :cond_3
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->minBufferSize:I

    mul-int/lit8 v7, v9, 0x4

    .line 344
    .local v7, "multipliedBufferSize":I
    const-wide/32 v10, 0x3d090

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/google/android/exoplayer/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v10

    long-to-int v9, v10

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->frameSize:I

    mul-int v6, v9, v10

    .line 345
    .local v6, "minAppBufferSize":I
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->minBufferSize:I

    int-to-long v10, v9

    const-wide/32 v12, 0xb71b0

    .line 346
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/google/android/exoplayer/audio/AudioTrack;->durationUsToFrames(J)J

    move-result-wide v12

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->frameSize:I

    int-to-long v14, v9

    mul-long/2addr v12, v14

    .line 345
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    long-to-int v5, v10

    .line 347
    .local v5, "maxAppBufferSize":I
    if-ge v7, v6, :cond_4

    .end local v6    # "minAppBufferSize":I
    :goto_3
    move-object/from16 v0, p0

    iput v6, v0, Lcom/google/android/exoplayer/audio/AudioTrack;->bufferSize:I

    goto :goto_2

    .restart local v6    # "minAppBufferSize":I
    :cond_4
    if-le v7, v5, :cond_5

    move v6, v5

    goto :goto_3

    :cond_5
    move v6, v7

    goto :goto_3

    .line 303
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public reset()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    .line 523
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 524
    iput-wide v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->submittedBytes:J

    .line 525
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->temporaryBufferSize:I

    .line 526
    iput-wide v4, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->startMediaTimeUs:J

    .line 527
    invoke-direct {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->resetSyncParams()V

    .line 528
    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    .line 529
    .local v0, "playState":I
    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 530
    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v2}, Landroid/media/AudioTrack;->pause()V

    .line 533
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 534
    .local v1, "toRelease":Landroid/media/AudioTrack;
    iput-object v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    .line 535
    iput-object v3, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrackUtil:Lcom/google/android/exoplayer/audio/AudioTrack$AudioTrackUtil;

    .line 536
    iget-object v2, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->releasingConditionVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->close()V

    .line 537
    new-instance v2, Lcom/google/android/exoplayer/audio/AudioTrack$1;

    invoke-direct {v2, p0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack$1;-><init>(Lcom/google/android/exoplayer/audio/AudioTrack;Landroid/media/AudioTrack;)V

    .line 546
    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack$1;->start()V

    .line 548
    .end local v0    # "playState":I
    .end local v1    # "toRelease":Landroid/media/AudioTrack;
    :cond_1
    return-void
.end method

.method public setVolume(F)V
    .locals 2
    .param p1, "volume"    # F

    .prologue
    .line 489
    iput p1, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->volume:F

    .line 490
    invoke-virtual {p0}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    .line 492
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-static {v0, p1}, Lcom/google/android/exoplayer/audio/AudioTrack;->setVolumeV21(Landroid/media/AudioTrack;F)V

    .line 497
    :cond_0
    :goto_0
    return-void

    .line 494
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/audio/AudioTrack;->audioTrack:Landroid/media/AudioTrack;

    invoke-static {v0, p1}, Lcom/google/android/exoplayer/audio/AudioTrack;->setVolumeV3(Landroid/media/AudioTrack;F)V

    goto :goto_0
.end method
