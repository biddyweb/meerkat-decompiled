.class public Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;
.super Lcom/google/android/exoplayer/MediaCodecTrackRenderer;
.source "MediaCodecAudioTrackRenderer.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;
    }
.end annotation


# static fields
.field public static final MSG_SET_VOLUME:I = 0x1


# instance fields
.field private audioSessionId:I

.field private final audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

.field private currentPositionUs:J

.field private final eventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;)V
    .locals 2
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;

    .prologue
    .line 75
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/drm/DrmSessionManager;Z)V

    .line 76
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Landroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;)V
    .locals 6
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "eventHandler"    # Landroid/os/Handler;
    .param p3, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    .prologue
    .line 101
    const/4 v2, 0x0

    const/4 v3, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/drm/DrmSessionManager;Z)V
    .locals 6
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "drmSessionManager"    # Lcom/google/android/exoplayer/drm/DrmSessionManager;
    .param p3, "playClearSamplesWithoutKeys"    # Z

    .prologue
    const/4 v4, 0x0

    .line 90
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;)V
    .locals 1
    .param p1, "source"    # Lcom/google/android/exoplayer/SampleSource;
    .param p2, "drmSessionManager"    # Lcom/google/android/exoplayer/drm/DrmSessionManager;
    .param p3, "playClearSamplesWithoutKeys"    # Z
    .param p4, "eventHandler"    # Landroid/os/Handler;
    .param p5, "eventListener"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    .prologue
    .line 119
    invoke-direct/range {p0 .. p5}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;Lcom/google/android/exoplayer/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecTrackRenderer$EventListener;)V

    .line 120
    iput-object p5, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    .line 121
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioSessionId:I

    .line 122
    new-instance v0, Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-direct {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    .line 123
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    return-object v0
.end method

.method private notifyAudioTrackInitializationError(Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;)V
    .locals 2
    .param p1, "e"    # Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;

    .prologue
    .line 283
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$1;-><init>(Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 291
    :cond_0
    return-void
.end method

.method private notifyAudioTrackWriteError(Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;)V
    .locals 2
    .param p1, "e"    # Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$2;-><init>(Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 302
    :cond_0
    return-void
.end method


# virtual methods
.method protected getCurrentPositionUs()J
    .locals 6

    .prologue
    .line 190
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->isEnded()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/audio/AudioTrack;->getCurrentPositionUs(Z)J

    move-result-wide v0

    .line 191
    .local v0, "audioTrackCurrentPositionUs":J
    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 193
    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->getCurrentPositionUs()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    .line 198
    :goto_0
    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    return-wide v2

    .line 196
    :cond_0
    iget-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    goto :goto_0
.end method

.method public handleMessage(ILjava/lang/Object;)V
    .locals 2
    .param p1, "messageType"    # I
    .param p2, "message"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 275
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    check-cast p2, Ljava/lang/Float;

    .end local p2    # "message":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/audio/AudioTrack;->setVolume(F)V

    .line 280
    :goto_0
    return-void

    .line 278
    .restart local p2    # "message":Ljava/lang/Object;
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->handleMessage(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method protected handlesMimeType(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 132
    invoke-static {p1}, Lcom/google/android/exoplayer/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->handlesMimeType(Ljava/lang/String;)Z

    move-result v0

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
    .line 178
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->isEnded()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->hasPendingData()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    .line 179
    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->hasEnoughDataToBeginPlayback()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isReady()Z
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->hasPendingData()Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->isReady()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->getSourceState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isTimeSource()Z
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x1

    return v0
.end method

.method protected onAudioSessionId(I)V
    .locals 0
    .param p1, "audioSessionId"    # I

    .prologue
    .line 160
    return-void
.end method

.method protected onDisabled()V
    .locals 1

    .prologue
    .line 203
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioSessionId:I

    .line 205
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onDisabled()V

    .line 209
    return-void

    .line 207
    :catchall_0
    move-exception v0

    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onDisabled()V

    throw v0
.end method

.method protected onEnabled(JZ)V
    .locals 3
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z

    .prologue
    .line 137
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onEnabled(JZ)V

    .line 138
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    .line 139
    return-void
.end method

.method protected onOutputFormatChanged(Landroid/media/MediaFormat;)V
    .locals 1
    .param p1, "format"    # Landroid/media/MediaFormat;

    .prologue
    .line 143
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/audio/AudioTrack;->reconfigure(Landroid/media/MediaFormat;)V

    .line 144
    return-void
.end method

.method protected onStarted()V
    .locals 1

    .prologue
    .line 164
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onStarted()V

    .line 165
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->play()V

    .line 166
    return-void
.end method

.method protected onStopped()V
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->pause()V

    .line 171
    invoke-super {p0}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->onStopped()V

    .line 172
    return-void
.end method

.method protected processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;IZ)Z
    .locals 10
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .param p5, "codec"    # Landroid/media/MediaCodec;
    .param p6, "buffer"    # Ljava/nio/ByteBuffer;
    .param p7, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;
    .param p8, "bufferIndex"    # I
    .param p9, "shouldSkip"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 223
    if-eqz p9, :cond_0

    .line 224
    const/4 v2, 0x0

    move/from16 v0, p8

    invoke-virtual {p5, v0, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 225
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v3, v2, Lcom/google/android/exoplayer/CodecCounters;->skippedOutputBufferCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/google/android/exoplayer/CodecCounters;->skippedOutputBufferCount:I

    .line 226
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack;->handleDiscontinuity()V

    .line 227
    const/4 v2, 0x1

    .line 270
    :goto_0
    return v2

    .line 231
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack;->isInitialized()Z

    move-result v2

    if-nez v2, :cond_1

    .line 233
    :try_start_0
    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioSessionId:I

    if-eqz v2, :cond_3

    .line 234
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    iget v3, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioSessionId:I

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/audio/AudioTrack;->initialize(I)I
    :try_end_0
    .catch Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->getState()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 245
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack;->play()V

    .line 251
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    move-object/from16 v0, p7

    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    move-object/from16 v0, p7

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    move-object/from16 v0, p7

    iget-wide v6, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    move-object/from16 v3, p6

    invoke-virtual/range {v2 .. v7}, Lcom/google/android/exoplayer/audio/AudioTrack;->handleBuffer(Ljava/nio/ByteBuffer;IIJ)I
    :try_end_1
    .catch Lcom/google/android/exoplayer/audio/AudioTrack$WriteException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v9

    .line 259
    .local v9, "handleBufferResult":I
    and-int/lit8 v2, v9, 0x1

    if-eqz v2, :cond_2

    .line 260
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    .line 264
    :cond_2
    and-int/lit8 v2, v9, 0x2

    if-eqz v2, :cond_4

    .line 265
    const/4 v2, 0x0

    move/from16 v0, p8

    invoke-virtual {p5, v0, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 266
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->codecCounters:Lcom/google/android/exoplayer/CodecCounters;

    iget v3, v2, Lcom/google/android/exoplayer/CodecCounters;->renderedOutputBufferCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/google/android/exoplayer/CodecCounters;->renderedOutputBufferCount:I

    .line 267
    const/4 v2, 0x1

    goto :goto_0

    .line 236
    .end local v9    # "handleBufferResult":I
    :cond_3
    :try_start_2
    iget-object v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/audio/AudioTrack;->initialize()I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioSessionId:I

    .line 237
    iget v2, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioSessionId:I

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->onAudioSessionId(I)V
    :try_end_2
    .catch Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 239
    :catch_0
    move-exception v8

    .line 240
    .local v8, "e":Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
    invoke-direct {p0, v8}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->notifyAudioTrackInitializationError(Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;)V

    .line 241
    new-instance v2, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v2, v8}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 253
    .end local v8    # "e":Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;
    :catch_1
    move-exception v8

    .line 254
    .local v8, "e":Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;
    invoke-direct {p0, v8}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->notifyAudioTrackWriteError(Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;)V

    .line 255
    new-instance v2, Lcom/google/android/exoplayer/ExoPlaybackException;

    invoke-direct {v2, v8}, Lcom/google/android/exoplayer/ExoPlaybackException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 270
    .end local v8    # "e":Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;
    .restart local v9    # "handleBufferResult":I
    :cond_4
    const/4 v2, 0x0

    goto :goto_0
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
    .line 213
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer;->seekTo(J)V

    .line 215
    iget-object v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->audioTrack:Lcom/google/android/exoplayer/audio/AudioTrack;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/audio/AudioTrack;->reset()V

    .line 216
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;->currentPositionUs:J

    .line 217
    return-void
.end method
