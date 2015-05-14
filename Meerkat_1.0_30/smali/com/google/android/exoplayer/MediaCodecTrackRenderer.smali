.class public abstract Lcom/google/android/exoplayer/MediaCodecTrackRenderer;
.super Lcom/google/android/exoplayer/TrackRenderer;
.source "MediaCodecTrackRenderer.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;,
        Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;
    }
.end annotation


# static fields
.field private static final MAX_CODEC_HOTSWAP_TIME_MS:J = 0x3e8L

.field private static final RECONFIGURATION_STATE_NONE:I = 0x0

.field private static final RECONFIGURATION_STATE_QUEUE_PENDING:I = 0x2

.field private static final RECONFIGURATION_STATE_WRITE_PENDING:I = 0x1

.field protected static final SOURCE_STATE_NOT_READY:I = 0x0

.field protected static final SOURCE_STATE_READY:I = 0x1

.field protected static final SOURCE_STATE_READY_READ_MAY_FAIL:I = 0x2


# instance fields
.field private codec:Landroid/media/MediaCodec;

.field public final codecCounters:Lcom/google/android/exoplayer/CodecCounters;

.field private codecHotswapTimeMs:J

.field private codecIsAdaptive:Z

.field private codecReconfigurationState:I

.field private codecReconfigured:Z

.field private currentPositionUs:J

.field private final decodeOnlyPresentationTimestamps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private drmInitData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation
.end field

.field private final drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

.field protected final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

.field private format:Lcom/google/android/exoplayer/MediaFormat;

.field private final formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

.field private inputBuffers:[Ljava/nio/ByteBuffer;

.field private inputIndex:I

.field private inputStreamEnded:Z

.field private openedDrmSession:Z

.field private final outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private outputBuffers:[Ljava/nio/ByteBuffer;

.field private outputIndex:I

.field private outputStreamEnded:Z

.field private final playClearSamplesWithoutKeys:Z

.field private final sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

.field private final source:Lcom/google/android/exoplayer/SampleSource;

.field private sourceState:I

.field private trackIndex:I

.field private waitingForFirstSyncFrame:Z

.field private waitingForKeys:Z


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;)V
    .locals 3
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "drmSessionManager"    # Lcom/google/android/exoplayer/drm/DrmSessionManager;
    .param p3, "playClearSamplesWithoutKeys"    # Z
    .param p4, "eventHandler"    # Landroid/os/Handler;
    .param p5, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    .prologue
    const/4 v1, 0x0

    .line 201
    invoke-direct {p0}, Lcom/google/android/exoplayer/TrackRenderer;-><init>()V

    .line 202
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 203
    iput-object p1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    .line 204
    iput-object p2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    .line 205
    iput-boolean p3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->playClearSamplesWithoutKeys:Z

    .line 206
    iput-object p4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    .line 207
    iput-object p5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    .line 208
    new-instance v0, Lcom/google/android/exoplayer/CodecCounters;

    invoke-direct {v0}, Lcom/google/android/exoplayer/CodecCounters;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    .line 209
    new-instance v0, Lcom/google/android/exoplayer/SampleHolder;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/SampleHolder;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    .line 210
    new-instance v0, Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/MediaFormatHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    .line 211
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    .line 212
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 213
    return-void

    :cond_0
    move v0, v1

    .line 202
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;)Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    return-object v0
.end method

.method private checkForDiscontinuity()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 467
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-nez v0, :cond_1

    .line 474
    :cond_0
    :goto_0
    return-void

    .line 470
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->currentPositionUs:J

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    const/4 v6, 0x1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/SampleSource;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I

    move-result v7

    .line 471
    .local v7, "result":I
    const/4 v0, -0x5

    if-ne v7, v0, :cond_0

    .line 472
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->flushCodec()V

    goto :goto_0
.end method

.method private drainOutputBuffer(JJ)Z
    .locals 11
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 727
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    if-eqz v1, :cond_0

    .line 728
    const/4 v1, 0x0

    .line 764
    :goto_0
    return v1

    .line 731
    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v1, :cond_1

    .line 732
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v4, 0x0

    invoke-virtual {v1, v2, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v1

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 735
    :cond_1
    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v2, -0x2

    if-ne v1, v2, :cond_2

    .line 736
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onOutputFormatChanged(Landroid/media/MediaFormat;)V

    .line 737
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v2, v1, Lcom/google/android/exoplayer/CodecCounters;->outputFormatChangedCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/google/android/exoplayer/CodecCounters;->outputFormatChangedCount:I

    .line 738
    const/4 v1, 0x1

    goto :goto_0

    .line 739
    :cond_2
    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v2, -0x3

    if-ne v1, v2, :cond_3

    .line 740
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 741
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v2, v1, Lcom/google/android/exoplayer/CodecCounters;->outputBuffersChangedCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/google/android/exoplayer/CodecCounters;->outputBuffersChangedCount:I

    .line 742
    const/4 v1, 0x1

    goto :goto_0

    .line 743
    :cond_3
    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v1, :cond_4

    .line 744
    const/4 v1, 0x0

    goto :goto_0

    .line 747
    :cond_4
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_5

    .line 748
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    .line 749
    const/4 v1, 0x0

    goto :goto_0

    .line 752
    :cond_5
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v2, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getDecodeOnlyIndex(J)I

    move-result v0

    .line 753
    .local v0, "decodeOnlyIndex":I
    iget-object v6, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    aget-object v7, v1, v2

    iget-object v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v9, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    const/4 v10, 0x1

    :goto_1
    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-virtual/range {v1 .. v10}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;IZ)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 755
    const/4 v1, -0x1

    if-eq v0, v1, :cond_7

    .line 756
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 760
    :goto_2
    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 761
    const/4 v1, 0x1

    goto :goto_0

    .line 753
    :cond_6
    const/4 v10, 0x0

    goto :goto_1

    .line 758
    :cond_7
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v2, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->currentPositionUs:J

    goto :goto_2

    .line 764
    :cond_8
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method private feedInputBuffer(Z)Z
    .locals 21
    .param p1, "firstFeed"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 505
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    if-eqz v2, :cond_0

    .line 506
    const/4 v2, 0x0

    .line 611
    :goto_0
    return v2

    .line 508
    :cond_0
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    if-gez v2, :cond_2

    .line 509
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    const-wide/16 v8, 0x0

    invoke-virtual {v2, v8, v9}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 510
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    if-gez v2, :cond_1

    .line 511
    const/4 v2, 0x0

    goto :goto_0

    .line 513
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    aget-object v3, v3, v4

    iput-object v3, v2, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    .line 514
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v2, v2, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 518
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-eqz v2, :cond_4

    .line 520
    const/16 v19, -0x3

    .line 537
    .local v19, "result":I
    :cond_3
    :goto_1
    const/4 v2, -0x2

    move/from16 v0, v19

    if-ne v0, v2, :cond_7

    .line 538
    const/4 v2, 0x0

    goto :goto_0

    .line 524
    .end local v19    # "result":I
    :cond_4
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_6

    .line 525
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v2, v2, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    move/from16 v0, v18

    if-ge v0, v2, :cond_5

    .line 526
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v2, v2, Lcom/google/android/exoplayer/MediaFormat;->initializationData:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, [B

    .line 527
    .local v16, "data":[B
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v2, v2, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 525
    add-int/lit8 v18, v18, 0x1

    goto :goto_2

    .line 529
    .end local v16    # "data":[B
    :cond_5
    const/4 v2, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 531
    .end local v18    # "i":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->currentPositionUs:J

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    const/4 v8, 0x0

    invoke-interface/range {v2 .. v8}, Lcom/google/android/exoplayer/SampleSource;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I

    move-result v19

    .line 532
    .restart local v19    # "result":I
    if-eqz p1, :cond_3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    const/4 v2, -0x2

    move/from16 v0, v19

    if-ne v0, v2, :cond_3

    .line 533
    const/4 v2, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    goto :goto_1

    .line 540
    :cond_7
    const/4 v2, -0x5

    move/from16 v0, v19

    if-ne v0, v2, :cond_8

    .line 541
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->flushCodec()V

    .line 542
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 544
    :cond_8
    const/4 v2, -0x4

    move/from16 v0, v19

    if-ne v0, v2, :cond_a

    .line 545
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_9

    .line 548
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v2, v2, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 549
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 551
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 552
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 554
    :cond_a
    const/4 v2, -0x1

    move/from16 v0, v19

    if-ne v0, v2, :cond_c

    .line 555
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_b

    .line 559
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v2, v2, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 560
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 562
    :cond_b
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    .line 564
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x4

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 565
    const/4 v2, -0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I
    :try_end_0
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_0 .. :try_end_0} :catch_0

    .line 570
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 566
    :catch_0
    move-exception v17

    .line 567
    .local v17, "e":Landroid/media/MediaCodec$CryptoException;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V

    .line 568
    new-instance v2, Lcom/google/android/exoplayer/ExoPlaybackException;

    move-object/from16 v0, v17

    invoke-direct {v2, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 572
    .end local v17    # "e":Landroid/media/MediaCodec$CryptoException;
    :cond_c
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    if-eqz v2, :cond_f

    .line 575
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v2, v2, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_e

    .line 576
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v2, v2, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 577
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_d

    .line 580
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 582
    :cond_d
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 584
    :cond_e
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 586
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v2, v2, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_10

    const/16 v20, 0x1

    .line 587
    .local v20, "sampleEncrypted":Z
    :goto_3
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldWaitForKeys(Z)Z

    move-result v2

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 588
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-eqz v2, :cond_11

    .line 589
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 586
    .end local v20    # "sampleEncrypted":Z
    :cond_10
    const/16 v20, 0x0

    goto :goto_3

    .line 592
    .restart local v20    # "sampleEncrypted":Z
    :cond_11
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-object v2, v2, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v11

    .line 593
    .local v11, "bufferSize":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v2, v2, Lcom/google/android/exoplayer/SampleHolder;->size:I

    sub-int v15, v11, v2

    .line 594
    .local v15, "adaptiveReconfigurationBytes":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v6, v2, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 595
    .local v6, "presentationTimeUs":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-boolean v2, v2, Lcom/google/android/exoplayer/SampleHolder;->decodeOnly:Z

    if-eqz v2, :cond_12

    .line 596
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 598
    :cond_12
    if-eqz v20, :cond_13

    .line 599
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-static {v2, v15}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getFrameworkCryptoInfo(Lcom/google/android/exoplayer/SampleHolder;I)Landroid/media/MediaCodec$CryptoInfo;

    move-result-object v5

    .line 601
    .local v5, "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v4, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueSecureInputBuffer(IILandroid/media/MediaCodec$CryptoInfo;JI)V

    .line 605
    .end local v5    # "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    :goto_4
    const/4 v2, -0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 606
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 611
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 603
    :cond_13
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    const/4 v10, 0x0

    const/4 v14, 0x0

    move-wide v12, v6

    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_1
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    .line 607
    .end local v6    # "presentationTimeUs":J
    .end local v11    # "bufferSize":I
    .end local v15    # "adaptiveReconfigurationBytes":I
    :catch_1
    move-exception v17

    .line 608
    .restart local v17    # "e":Landroid/media/MediaCodec$CryptoException;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V

    .line 609
    new-instance v2, Lcom/google/android/exoplayer/ExoPlaybackException;

    move-object/from16 v0, v17

    invoke-direct {v2, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private flushCodec()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, -0x1

    .line 477
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 478
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 479
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 480
    iput-boolean v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 481
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 484
    sget v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_1

    .line 485
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 490
    :goto_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_0

    .line 493
    iput v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 495
    :cond_0
    return-void

    .line 487
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 488
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    goto :goto_0
.end method

.method private getDecodeOnlyIndex(J)I
    .locals 5
    .param p1, "presentationTimeUs"    # J

    .prologue
    .line 801
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 802
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 803
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v2, v2, p1

    if-nez v2, :cond_0

    .line 807
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 802
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 807
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method private static getFrameworkCryptoInfo(Lcom/google/android/exoplayer/SampleHolder;I)Landroid/media/MediaCodec$CryptoInfo;
    .locals 4
    .param p0, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;
    .param p1, "adaptiveReconfigurationBytes"    # I

    .prologue
    .line 616
    iget-object v1, p0, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/CryptoInfo;->getFrameworkCryptoInfoV16()Landroid/media/MediaCodec$CryptoInfo;

    move-result-object v0

    .line 617
    .local v0, "cryptoInfo":Landroid/media/MediaCodec$CryptoInfo;
    if-nez p1, :cond_0

    .line 627
    :goto_0
    return-object v0

    .line 623
    :cond_0
    iget-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    if-nez v1, :cond_1

    .line 624
    const/4 v1, 0x1

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    .line 626
    :cond_1
    iget-object v1, v0, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    const/4 v2, 0x0

    aget v3, v1, v2

    add-int/2addr v3, p1

    aput v3, v1, v2

    goto :goto_0
.end method

.method private isWithinHotswapPeriod()Z
    .locals 6

    .prologue
    .line 717
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V
    .locals 1
    .param p1, "e"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 334
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    .line 335
    new-instance v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private notifyCryptoError(Landroid/media/MediaCodec$CryptoException;)V
    .locals 2
    .param p1, "e"    # Landroid/media/MediaCodec$CryptoException;

    .prologue
    .line 790
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_0

    .line 791
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$2;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Landroid/media/MediaCodec$CryptoException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 798
    :cond_0
    return-void
.end method

.method private notifyDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V
    .locals 2
    .param p1, "e"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    .prologue
    .line 779
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;

    if-eqz v0, :cond_0

    .line 780
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$1;-><init>(Lcom/google/android/exoplayer/MediaCodecTrackRenderer;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 787
    :cond_0
    return-void
.end method

.method private readFormat()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 460
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->currentPositionUs:J

    iget-object v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    iget-object v5, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sampleHolder:Lcom/google/android/exoplayer/SampleHolder;

    const/4 v6, 0x0

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/SampleSource;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I

    move-result v7

    .line 461
    .local v7, "result":I
    const/4 v0, -0x4

    if-ne v7, v0, :cond_0

    .line 462
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->formatHolder:Lcom/google/android/exoplayer/MediaFormatHolder;

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V

    .line 464
    :cond_0
    return-void
.end method

.method private shouldWaitForKeys(Z)Z
    .locals 3
    .param p1, "sampleEncrypted"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 631
    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-nez v2, :cond_1

    .line 642
    :cond_0
    :goto_0
    return v1

    .line 634
    :cond_1
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v2}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getState()I

    move-result v0

    .line 635
    .local v0, "drmManagerState":I
    if-nez v0, :cond_2

    .line 636
    new-instance v1, Lcom/google/android/exoplayer/ExoPlaybackException;

    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v2}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getError()Ljava/lang/Exception;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 638
    :cond_2
    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    if-nez p1, :cond_3

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->playClearSamplesWithoutKeys:Z

    if-nez v2, :cond_0

    .line 640
    :cond_3
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected canReconfigureCodec(Landroid/media/MediaCodec;ZLcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/MediaFormat;)Z
    .locals 1
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "codecIsAdaptive"    # Z
    .param p3, "oldFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p4, "newFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 692
    const/4 v0, 0x0

    return v0
.end method

.method protected final codecInitialized()Z
    .locals 1

    .prologue
    .line 343
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected configureCodec(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCrypto;)V
    .locals 2
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "x"    # Landroid/media/MediaFormat;
    .param p3, "crypto"    # Landroid/media/MediaCrypto;

    .prologue
    .line 267
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 268
    return-void
.end method

.method protected doPrepare()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 218
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v3}, Lcom/google/android/exoplayer/SampleSource;->prepare()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 219
    .local v2, "sourcePrepared":Z
    if-nez v2, :cond_0

    .line 220
    const/4 v3, 0x0

    .line 236
    :goto_0
    return v3

    .line 222
    .end local v2    # "sourcePrepared":Z
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 226
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "sourcePrepared":Z
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v3}, Lcom/google/android/exoplayer/SampleSource;->getTrackCount()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 230
    iget-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v3, v1}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->handlesMimeType(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 231
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    .line 232
    const/4 v3, 0x1

    goto :goto_0

    .line 226
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 236
    :cond_2
    const/4 v3, -0x1

    goto :goto_0
.end method

.method protected doSomeWork(JJ)V
    .locals 5
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 437
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v3, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->continueBuffering(J)Z

    move-result v3

    if-eqz v3, :cond_6

    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    if-nez v2, :cond_5

    :goto_0
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    .line 440
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->checkForDiscontinuity()V

    .line 441
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-nez v1, :cond_0

    .line 442
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->readFormat()V

    .line 444
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldInitCodec()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 445
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    .line 447
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v1, :cond_4

    .line 448
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drainOutputBuffer(JJ)Z

    move-result v1

    if-nez v1, :cond_2

    .line 449
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->feedInputBuffer(Z)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 450
    :cond_3
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->feedInputBuffer(Z)Z

    move-result v1

    if-nez v1, :cond_3

    .line 453
    :cond_4
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/CodecCounters;->ensureUpdated()V

    .line 457
    return-void

    .line 437
    :cond_5
    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_6
    move v1, v2

    goto :goto_0

    .line 454
    :catch_0
    move-exception v0

    .line 455
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected getBufferedPositionUs()J
    .locals 4

    .prologue
    .line 409
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v2}, Lcom/google/android/exoplayer/SampleSource;->getBufferedPositionUs()J

    move-result-wide v0

    .line 410
    .local v0, "sourceBufferedPosition":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    const-wide/16 v2, -0x3

    cmp-long v2, v0, v2

    if-nez v2, :cond_1

    .line 411
    .end local v0    # "sourceBufferedPosition":J
    :cond_0
    :goto_0
    return-wide v0

    .restart local v0    # "sourceBufferedPosition":J
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getCurrentPositionUs()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    goto :goto_0
.end method

.method protected getCurrentPositionUs()J
    .locals 2

    .prologue
    .line 399
    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->currentPositionUs:J

    return-wide v0
.end method

.method protected getDurationUs()J
    .locals 2

    .prologue
    .line 404
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v0

    iget-wide v0, v0, Lcom/google/android/exoplayer/TrackInfo;->durationUs:J

    return-wide v0
.end method

.method protected final getSourceState()I
    .locals 1

    .prologue
    .line 713
    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    return v0
.end method

.method protected handlesMimeType(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 246
    const/4 v0, 0x1

    return v0
.end method

.method protected final haveFormat()Z
    .locals 1

    .prologue
    .line 347
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isEnded()Z
    .locals 1

    .prologue
    .line 697
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    return v0
.end method

.method protected isReady()Z
    .locals 1

    .prologue
    .line 702
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    if-gez v0, :cond_0

    .line 703
    invoke-direct {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->isWithinHotswapPeriod()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final maybeInitCodec()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x1

    const/4 v11, -0x1

    .line 272
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->shouldInitCodec()Z

    move-result v7

    if-nez v7, :cond_1

    .line 330
    :cond_0
    :goto_0
    return-void

    .line 276
    :cond_1
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    iget-object v5, v7, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    .line 277
    .local v5, "mimeType":Ljava/lang/String;
    const/4 v4, 0x0

    .line 278
    .local v4, "mediaCrypto":Landroid/media/MediaCrypto;
    const/4 v6, 0x0

    .line 279
    .local v6, "requiresSecureDecoder":Z
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Ljava/util/Map;

    if-eqz v7, :cond_6

    .line 280
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    if-nez v7, :cond_2

    .line 281
    new-instance v7, Lcom/google/android/exoplayer/ExoPlaybackException;

    const-string v8, "Media requires a DrmSessionManager"

    invoke-direct {v7, v8}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 283
    :cond_2
    iget-boolean v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-nez v7, :cond_3

    .line 284
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    iget-object v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Ljava/util/Map;

    invoke-interface {v7, v8, v5}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->open(Ljava/util/Map;Ljava/lang/String;)V

    .line 285
    iput-boolean v12, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    .line 287
    :cond_3
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v7}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getState()I

    move-result v2

    .line 288
    .local v2, "drmSessionState":I
    if-nez v2, :cond_4

    .line 289
    new-instance v7, Lcom/google/android/exoplayer/ExoPlaybackException;

    iget-object v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v8}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getError()Ljava/lang/Exception;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 290
    :cond_4
    if-eq v2, v13, :cond_5

    const/4 v7, 0x4

    if-ne v2, v7, :cond_0

    .line 292
    :cond_5
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v7}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->getMediaCrypto()Landroid/media/MediaCrypto;

    move-result-object v4

    .line 293
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v7, v5}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->requiresSecureDecoderComponent(Ljava/lang/String;)Z

    move-result v6

    .line 300
    .end local v2    # "drmSessionState":I
    :cond_6
    const/4 v0, 0x0

    .line 302
    .local v0, "decoderInfo":Lcom/google/android/exoplayer/DecoderInfo;
    :try_start_0
    invoke-static {v5, v6}, Lcom/google/android/exoplayer/MediaCodecUtil;->getDecoderInfo(Ljava/lang/String;Z)Lcom/google/android/exoplayer/DecoderInfo;
    :try_end_0
    .catch Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 308
    :goto_1
    if-nez v0, :cond_7

    .line 309
    new-instance v7, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    const/4 v9, 0x0

    const v10, -0xc34f

    invoke-direct {v7, v8, v9, v10}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;I)V

    invoke-direct {p0, v7}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    .line 313
    :cond_7
    iget-object v1, v0, Lcom/google/android/exoplayer/DecoderInfo;->name:Ljava/lang/String;

    .line 314
    .local v1, "decoderName":Ljava/lang/String;
    iget-boolean v7, v0, Lcom/google/android/exoplayer/DecoderInfo;->adaptive:Z

    iput-boolean v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    .line 316
    :try_start_1
    invoke-static {v1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    .line 317
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-object v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/MediaFormat;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v8

    invoke-virtual {p0, v7, v8, v4}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->configureCodec(Landroid/media/MediaCodec;Landroid/media/MediaFormat;Landroid/media/MediaCrypto;)V

    .line 318
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v7}, Landroid/media/MediaCodec;->start()V

    .line 319
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v7}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 320
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v7}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 324
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getState()I

    move-result v7

    if-ne v7, v13, :cond_8

    .line 325
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    :goto_3
    iput-wide v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 326
    iput v11, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 327
    iput v11, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 328
    iput-boolean v12, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForFirstSyncFrame:Z

    .line 329
    iget-object v7, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v8, v7, Lcom/google/android/exoplayer/CodecCounters;->codecInitCount:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v7, Lcom/google/android/exoplayer/CodecCounters;->codecInitCount:I

    goto/16 :goto_0

    .line 303
    .end local v1    # "decoderName":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 304
    .local v3, "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    new-instance v7, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    const v9, -0xc34e

    invoke-direct {v7, v8, v3, v9}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;I)V

    invoke-direct {p0, v7}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    goto :goto_1

    .line 321
    .end local v3    # "e":Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
    .restart local v1    # "decoderName":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 322
    .local v3, "e":Ljava/lang/Exception;
    new-instance v7, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    iget-object v8, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-direct {v7, v8, v3, v1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;-><init>(Lcom/google/android/exoplayer/MediaFormat;Ljava/lang/Throwable;Ljava/lang/String;)V

    invoke-direct {p0, v7}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->notifyAndThrowDecoderInitError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V

    goto :goto_2

    .line 325
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_8
    const-wide/16 v8, -0x1

    goto :goto_3
.end method

.method protected onDisabled()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 352
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 353
    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Ljava/util/Map;

    .line 355
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 358
    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v0}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->close()V

    .line 360
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/SampleSource;->disable(I)V

    .line 366
    return-void

    .line 363
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/SampleSource;->disable(I)V

    throw v0

    .line 357
    :catchall_1
    move-exception v0

    .line 358
    :try_start_2
    iget-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z

    if-eqz v1, :cond_1

    .line 359
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmSessionManager:Lcom/google/android/exoplayer/drm/DrmSessionManager;

    invoke-interface {v1}, Lcom/google/android/exoplayer/drm/DrmSessionManager;->close()V

    .line 360
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->openedDrmSession:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 363
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/SampleSource;->disable(I)V

    throw v0

    :catchall_2
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/SampleSource;->disable(I)V

    throw v0
.end method

.method protected onEnabled(JZ)V
    .locals 3
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z

    .prologue
    const/4 v2, 0x0

    .line 253
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    iget v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->trackIndex:I

    invoke-interface {v0, v1, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->enable(IJ)V

    .line 254
    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    .line 255
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    .line 256
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    .line 257
    iput-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 258
    iput-wide p1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->currentPositionUs:J

    .line 259
    return-void
.end method

.method protected onInputFormatChanged(Lcom/google/android/exoplayer/MediaFormatHolder;)V
    .locals 5
    .param p1, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 652
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 653
    .local v0, "oldFormat":Lcom/google/android/exoplayer/MediaFormat;
    iget-object v1, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 654
    iget-object v1, p1, Lcom/google/android/exoplayer/MediaFormatHolder;->drmInitData:Ljava/util/Map;

    iput-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->drmInitData:Ljava/util/Map;

    .line 655
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    iget-boolean v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    iget-object v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    invoke-virtual {p0, v1, v2, v0, v3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->canReconfigureCodec(Landroid/media/MediaCodec;ZLcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/MediaFormat;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 656
    iput-boolean v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    .line 657
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 662
    :goto_0
    return-void

    .line 659
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->releaseCodec()V

    .line 660
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->maybeInitCodec()V

    goto :goto_0
.end method

.method protected onOutputFormatChanged(Landroid/media/MediaFormat;)V
    .locals 0
    .param p1, "format"    # Landroid/media/MediaFormat;

    .prologue
    .line 673
    return-void
.end method

.method protected onReleased()V
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/SampleSource;->release()V

    .line 395
    return-void
.end method

.method protected onStarted()V
    .locals 0

    .prologue
    .line 427
    return-void
.end method

.method protected onStopped()V
    .locals 0

    .prologue
    .line 432
    return-void
.end method

.method protected abstract processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;IZ)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation
.end method

.method protected releaseCodec()V
    .locals 5

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 369
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    .line 370
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecHotswapTimeMs:J

    .line 371
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputIndex:I

    .line 372
    iput v4, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputIndex:I

    .line 373
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->decodeOnlyPresentationTimestamps:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 374
    iput-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 375
    iput-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 376
    iput-boolean v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigured:Z

    .line 377
    iput-boolean v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecIsAdaptive:Z

    .line 378
    iput v3, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecReconfigurationState:I

    .line 379
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v1, v0, Lcom/google/android/exoplayer/CodecCounters;->codecReleaseCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer/CodecCounters;->codecReleaseCount:I

    .line 381
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 384
    :try_start_1
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 386
    iput-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    .line 390
    :cond_0
    return-void

    .line 386
    :catchall_0
    move-exception v0

    iput-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0

    .line 383
    :catchall_1
    move-exception v0

    .line 384
    :try_start_2
    iget-object v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 386
    iput-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0

    :catchall_2
    move-exception v0

    iput-object v2, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    throw v0
.end method

.method protected seekTo(J)V
    .locals 3
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 416
    iput-wide p1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->currentPositionUs:J

    .line 417
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->source:Lcom/google/android/exoplayer/SampleSource;

    invoke-interface {v0, p1, p2}, Lcom/google/android/exoplayer/SampleSource;->seekToUs(J)V

    .line 418
    iput v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->sourceState:I

    .line 419
    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->inputStreamEnded:Z

    .line 420
    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->outputStreamEnded:Z

    .line 421
    iput-boolean v1, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->waitingForKeys:Z

    .line 422
    return-void
.end method

.method protected shouldInitCodec()Z
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->codec:Landroid/media/MediaCodec;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->format:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
