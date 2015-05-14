.class public Lcom/google/android/exoplayer/hls/HlsSampleSource;
.super Ljava/lang/Object;
.source "HlsSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/SampleSource;
.implements Lcom/google/android/exoplayer/upstream/Loader$Callback;


# static fields
.field public static final DEFAULT_MIN_LOADABLE_RETRY_COUNT:I = 0x3

.field private static final NO_RESET_PENDING:I = -0x1


# instance fields
.field private final chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

.field private currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

.field private currentLoadableException:Ljava/io/IOException;

.field private currentLoadableExceptionCount:I

.field private currentLoadableExceptionFatal:Z

.field private currentLoadableExceptionTimestamp:J

.field private downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

.field private downstreamPositionUs:J

.field private enabledTrackCount:I

.field private final extractors:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/google/android/exoplayer/hls/parser/HlsExtractor;",
            ">;"
        }
    .end annotation
.end field

.field private final frameAccurateSeeking:Z

.field private lastSeekPositionUs:J

.field private loader:Lcom/google/android/exoplayer/upstream/Loader;

.field private loadingFinished:Z

.field private final minLoadableRetryCount:I

.field private pendingDiscontinuities:[Z

.field private pendingResetPositionUs:J

.field private prepared:Z

.field private previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

.field private remainingReleaseCount:I

.field private trackCount:I

.field private trackEnabledStates:[Z

.field private trackInfos:[Lcom/google/android/exoplayer/TrackInfo;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;ZI)V
    .locals 1
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/hls/HlsChunkSource;
    .param p2, "frameAccurateSeeking"    # Z
    .param p3, "downstreamRendererCount"    # I

    .prologue
    .line 76
    const/4 v0, 0x3

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;ZII)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;ZII)V
    .locals 1
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/hls/HlsChunkSource;
    .param p2, "frameAccurateSeeking"    # Z
    .param p3, "downstreamRendererCount"    # I
    .param p4, "minLoadableRetryCount"    # I

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    .line 83
    iput-boolean p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->frameAccurateSeeking:Z

    .line 84
    iput p3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    .line 85
    iput p4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->minLoadableRetryCount:I

    .line 86
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    .line 87
    return-void
.end method

.method private clearCurrentLoadable()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 395
    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    .line 396
    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 397
    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    .line 398
    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionFatal:Z

    .line 399
    return-void
.end method

.method private clearState()V
    .locals 2

    .prologue
    .line 386
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 387
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->release()V

    .line 386
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 389
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 390
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 391
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    .line 392
    return-void
.end method

.method private continueBufferingInternal()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 174
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    .line 175
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 182
    :cond_0
    :goto_0
    return v0

    .line 178
    :cond_1
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->getCurrentExtractor()Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->haveSamplesForEnabledTracks(Lcom/google/android/exoplayer/hls/parser/HlsExtractor;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    .line 179
    .local v0, "haveSamples":Z
    :cond_2
    if-nez v0, :cond_0

    .line 180
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeThrowLoadableException()V

    goto :goto_0
.end method

.method private discardSamplesForDisabledTracks(Lcom/google/android/exoplayer/hls/parser/HlsExtractor;J)V
    .locals 2
    .param p1, "extractor"    # Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    .param p2, "timeUs"    # J

    .prologue
    .line 345
    invoke-virtual {p1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->isPrepared()Z

    move-result v1

    if-nez v1, :cond_1

    .line 353
    :cond_0
    return-void

    .line 348
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 349
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aget-boolean v1, v1, v0

    if-nez v1, :cond_2

    .line 350
    invoke-virtual {p1, v0, p2, p3}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->discardUntil(IJ)V

    .line 348
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getCurrentExtractor()Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    .locals 3

    .prologue
    .line 335
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .line 336
    .local v0, "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->haveSamplesForEnabledTracks(Lcom/google/android/exoplayer/hls/parser/HlsExtractor;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 338
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->release()V

    .line 339
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    check-cast v0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .restart local v0    # "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    goto :goto_0

    .line 341
    :cond_0
    return-object v0
.end method

.method private getRetryDelayMillis(J)J
    .locals 5
    .param p1, "errorCount"    # J

    .prologue
    .line 444
    const-wide/16 v0, 0x1

    sub-long v0, p1, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private haveSamplesForEnabledTracks(Lcom/google/android/exoplayer/hls/parser/HlsExtractor;)Z
    .locals 3
    .param p1, "extractor"    # Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .prologue
    const/4 v1, 0x0

    .line 356
    invoke-virtual {p1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->isPrepared()Z

    move-result v2

    if-nez v2, :cond_1

    .line 364
    :cond_0
    :goto_0
    return v1

    .line 359
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 360
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_2

    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->hasSamples(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 361
    const/4 v1, 0x1

    goto :goto_0

    .line 359
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private isPendingReset()Z
    .locals 4

    .prologue
    .line 440
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isTsChunk(Lcom/google/android/exoplayer/hls/HlsChunk;)Z
    .locals 1
    .param p1, "chunk"    # Lcom/google/android/exoplayer/hls/HlsChunk;

    .prologue
    .line 436
    instance-of v0, p1, Lcom/google/android/exoplayer/hls/TsChunk;

    return v0
.end method

.method private maybeStartLoading()V
    .locals 10

    .prologue
    .line 402
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 433
    :cond_0
    :goto_0
    return-void

    .line 406
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v0, :cond_2

    const/4 v8, 0x1

    .line 407
    .local v8, "isBackedOff":Z
    :goto_1
    if-eqz v8, :cond_3

    .line 408
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionTimestamp:J

    sub-long v6, v0, v2

    .line 409
    .local v6, "elapsedMillis":J
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->getRetryDelayMillis(J)J

    move-result-wide v0

    cmp-long v0, v6, v0

    if-ltz v0, :cond_0

    .line 410
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 411
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-virtual {v0, v1, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto :goto_0

    .line 406
    .end local v6    # "elapsedMillis":J
    .end local v8    # "isBackedOff":Z
    :cond_2
    const/4 v8, 0x0

    goto :goto_1

    .line 416
    .restart local v8    # "isBackedOff":Z
    :cond_3
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getChunkOperation(Lcom/google/android/exoplayer/hls/TsChunk;JJ)Lcom/google/android/exoplayer/hls/HlsChunk;

    move-result-object v9

    .line 418
    .local v9, "nextLoadable":Lcom/google/android/exoplayer/hls/HlsChunk;
    if-eqz v9, :cond_0

    .line 422
    iput-object v9, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    .line 423
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isTsChunk(Lcom/google/android/exoplayer/hls/HlsChunk;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 424
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    check-cast v0, Lcom/google/android/exoplayer/hls/TsChunk;

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    .line 425
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 426
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 428
    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-object v1, v1, Lcom/google/android/exoplayer/hls/TsChunk;->extractor:Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    if-eq v0, v1, :cond_6

    .line 429
    :cond_5
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->previousTsLoadable:Lcom/google/android/exoplayer/hls/TsChunk;

    iget-object v1, v1, Lcom/google/android/exoplayer/hls/TsChunk;->extractor:Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 432
    :cond_6
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-virtual {v0, v1, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto :goto_0
.end method

.method private maybeThrowLoadableException()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 368
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    iget v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->minLoadableRetryCount:I

    if-le v0, v1, :cond_1

    .line 370
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    throw v0

    .line 372
    :cond_1
    return-void
.end method

.method private restartFrom(J)V
    .locals 1
    .param p1, "positionUs"    # J

    .prologue
    .line 375
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 376
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    .line 377
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 383
    :goto_0
    return-void

    .line 380
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearState()V

    .line 381
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    goto :goto_0
.end method


# virtual methods
.method public continueBuffering(J)Z
    .locals 7
    .param p1, "playbackPositionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 164
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 165
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-lez v0, :cond_3

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 166
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 167
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    invoke-direct {p0, v0, v4, v5}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->discardSamplesForDisabledTracks(Lcom/google/android/exoplayer/hls/parser/HlsExtractor;J)V

    .line 170
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->continueBufferingInternal()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    move v2, v1

    :cond_2
    return v2

    :cond_3
    move v0, v2

    .line 165
    goto :goto_0
.end method

.method public disable(I)V
    .locals 2
    .param p1, "track"    # I

    .prologue
    const/4 v1, 0x0

    .line 148
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 149
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aget-boolean v0, v0, p1

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 150
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    .line 151
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aput-boolean v1, v0, p1

    .line 152
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    aput-boolean v1, v0, p1

    .line 153
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-nez v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 155
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 160
    :cond_0
    :goto_0
    return-void

    .line 157
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearState()V

    goto :goto_0
.end method

.method public enable(IJ)V
    .locals 4
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    const/4 v1, 0x1

    .line 136
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 137
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 138
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    .line 139
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    aput-boolean v1, v0, p1

    .line 140
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    const/4 v2, 0x0

    aput-object v2, v0, p1

    .line 141
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-ne v0, v1, :cond_0

    .line 142
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->seekToUs(J)V

    .line 144
    :cond_0
    return-void

    .line 137
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBufferedPositionUs()J
    .locals 4

    .prologue
    .line 259
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 260
    iget v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-lez v2, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 261
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 262
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    .line 267
    :cond_0
    :goto_1
    return-wide v0

    .line 260
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 263
    :cond_2
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-eqz v2, :cond_3

    .line 264
    const-wide/16 v0, -0x3

    goto :goto_1

    .line 266
    :cond_3
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getLargestSampleTimestamp()J

    move-result-wide v0

    .line 267
    .local v0, "largestSampleTimestamp":J
    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    goto :goto_1
.end method

.method public getTrackCount()I
    .locals 1

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 125
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    return v0
.end method

.method public getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 131
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 2
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 304
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-lez v0, :cond_0

    .line 305
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->restartFrom(J)V

    .line 309
    :goto_0
    return-void

    .line 307
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearState()V

    goto :goto_0
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 284
    :try_start_0
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/HlsChunk;->consume()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 291
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isTsChunk(Lcom/google/android/exoplayer/hls/HlsChunk;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v1, p1

    .line 292
    check-cast v1, Lcom/google/android/exoplayer/hls/TsChunk;

    .line 293
    .local v1, "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    iget-boolean v2, v1, Lcom/google/android/exoplayer/hls/TsChunk;->isLastChunk:Z

    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    .line 295
    .end local v1    # "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    :cond_0
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v2, :cond_1

    .line 296
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 298
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    .line 300
    :goto_0
    return-void

    .line 285
    :catch_0
    move-exception v0

    .line 286
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 287
    iget v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    .line 288
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionTimestamp:J

    .line 289
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionFatal:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 291
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isTsChunk(Lcom/google/android/exoplayer/hls/HlsChunk;)Z

    move-result v2

    if-eqz v2, :cond_2

    move-object v1, p1

    .line 292
    check-cast v1, Lcom/google/android/exoplayer/hls/TsChunk;

    .line 293
    .restart local v1    # "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    iget-boolean v2, v1, Lcom/google/android/exoplayer/hls/TsChunk;->isLastChunk:Z

    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    .line 295
    .end local v1    # "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    :cond_2
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v2, :cond_3

    .line 296
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 298
    :cond_3
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    goto :goto_0

    .line 291
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isTsChunk(Lcom/google/android/exoplayer/hls/HlsChunk;)Z

    move-result v3

    if-eqz v3, :cond_4

    move-object v1, p1

    .line 292
    check-cast v1, Lcom/google/android/exoplayer/hls/TsChunk;

    .line 293
    .restart local v1    # "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    iget-boolean v3, v1, Lcom/google/android/exoplayer/hls/TsChunk;->isLastChunk:Z

    iput-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    .line 295
    .end local v1    # "tsChunk":Lcom/google/android/exoplayer/hls/TsChunk;
    :cond_4
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v3, :cond_5

    .line 296
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 298
    :cond_5
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    throw v2
.end method

.method public onLoadError(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Ljava/io/IOException;)V
    .locals 2
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 313
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadable:Lcom/google/android/exoplayer/hls/HlsChunk;

    invoke-virtual {v0, v1, p2}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->onLoadError(Lcom/google/android/exoplayer/hls/HlsChunk;Ljava/io/IOException;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->clearCurrentLoadable()V

    .line 321
    :goto_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeStartLoading()V

    .line 322
    return-void

    .line 317
    :cond_0
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 318
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionCount:I

    .line 319
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->currentLoadableExceptionTimestamp:J

    goto :goto_0
.end method

.method public prepare()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 91
    iget-boolean v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    if-eqz v4, :cond_0

    .line 119
    :goto_0
    return v3

    .line 94
    :cond_0
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-nez v4, :cond_1

    .line 95
    new-instance v4, Lcom/google/android/exoplayer/upstream/Loader;

    const-string v5, "Loader:HLS"

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 97
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->continueBufferingInternal()Z

    .line 98
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    .line 99
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .line 100
    .local v0, "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->isPrepared()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 101
    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getTrackCount()I

    move-result v4

    iput v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    .line 102
    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    new-array v4, v4, [Z

    iput-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackEnabledStates:[Z

    .line 103
    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    new-array v4, v4, [Z

    iput-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    .line 104
    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    new-array v4, v4, [Lcom/google/android/exoplayer/MediaFormat;

    iput-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    .line 105
    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    new-array v4, v4, [Lcom/google/android/exoplayer/TrackInfo;

    iput-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    .line 106
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackCount:I

    if-ge v2, v4, :cond_3

    .line 107
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    .line 108
    .local v1, "format":Lcom/google/android/exoplayer/MediaFormat;
    if-eqz v1, :cond_2

    .line 109
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->trackInfos:[Lcom/google/android/exoplayer/TrackInfo;

    new-instance v5, Lcom/google/android/exoplayer/TrackInfo;

    iget-object v6, v1, Lcom/google/android/exoplayer/MediaFormat;->mimeType:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getDurationUs()J

    move-result-wide v8

    invoke-direct {v5, v6, v8, v9}, Lcom/google/android/exoplayer/TrackInfo;-><init>(Ljava/lang/String;J)V

    aput-object v5, v4, v2

    .line 106
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 113
    .end local v1    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_3
    iput-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    .line 116
    .end local v0    # "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    .end local v2    # "i":I
    :cond_4
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    if-nez v3, :cond_5

    .line 117
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeThrowLoadableException()V

    .line 119
    :cond_5
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    goto :goto_0
.end method

.method public readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I
    .locals 8
    .param p1, "track"    # I
    .param p2, "playbackPositionUs"    # J
    .param p4, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p5, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;
    .param p6, "onlyReadDiscontinuity"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 189
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 191
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    aget-boolean v3, v3, p1

    if-eqz v3, :cond_0

    .line 192
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    const/4 v4, 0x0

    aput-boolean v4, v3, p1

    .line 193
    const/4 v3, -0x5

    .line 238
    :goto_0
    return v3

    .line 196
    :cond_0
    if-nez p6, :cond_1

    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->isPendingReset()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 197
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeThrowLoadableException()V

    .line 198
    const/4 v3, -0x2

    goto :goto_0

    .line 201
    :cond_2
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->getCurrentExtractor()Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    move-result-object v0

    .line 202
    .local v0, "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_3

    .line 205
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->configureSpliceTo(Lcom/google/android/exoplayer/hls/parser/HlsExtractor;)V

    .line 208
    :cond_3
    const/4 v1, 0x0

    .line 209
    .local v1, "extractorIndex":I
    :goto_1
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    add-int/lit8 v4, v1, 0x1

    if-le v3, v4, :cond_4

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->hasSamples(I)Z

    move-result v3

    if-nez v3, :cond_4

    .line 212
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->extractors:Ljava/util/LinkedList;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    check-cast v0, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .restart local v0    # "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    goto :goto_1

    .line 215
    :cond_4
    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->isPrepared()Z

    move-result v3

    if-nez v3, :cond_5

    .line 216
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeThrowLoadableException()V

    .line 217
    const/4 v3, -0x2

    goto :goto_0

    .line 220
    :cond_5
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getFormat(I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v2

    .line 221
    .local v2, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    if-eqz v2, :cond_6

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aget-object v3, v3, p1

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lcom/google/android/exoplayer/MediaFormat;->equals(Lcom/google/android/exoplayer/MediaFormat;Z)Z

    move-result v3

    if-nez v3, :cond_6

    .line 222
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->chunkSource:Lcom/google/android/exoplayer/hls/HlsChunkSource;

    invoke-virtual {v3, v2}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getMaxVideoDimensions(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 223
    iput-object v2, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 224
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamMediaFormats:[Lcom/google/android/exoplayer/MediaFormat;

    aput-object v2, v3, p1

    .line 225
    const/4 v3, -0x4

    goto :goto_0

    .line 228
    :cond_6
    invoke-virtual {v0, p1, p5}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->getSample(ILcom/google/android/exoplayer/SampleHolder;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 229
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->frameAccurateSeeking:Z

    if-eqz v3, :cond_7

    iget-wide v4, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v6, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    cmp-long v3, v4, v6

    if-gez v3, :cond_7

    const/4 v3, 0x1

    :goto_2
    iput-boolean v3, p5, Lcom/google/android/exoplayer/SampleHolder;->decodeOnly:Z

    .line 230
    const/4 v3, -0x3

    goto/16 :goto_0

    .line 229
    :cond_7
    const/4 v3, 0x0

    goto :goto_2

    .line 233
    :cond_8
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loadingFinished:Z

    if-eqz v3, :cond_9

    .line 234
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 237
    :cond_9
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->maybeThrowLoadableException()V

    .line 238
    const/4 v3, -0x2

    goto/16 :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 274
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 275
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->remainingReleaseCount:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->release()V

    .line 277
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 279
    :cond_0
    return-void

    .line 274
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public seekToUs(J)V
    .locals 7
    .param p1, "positionUs"    # J

    .prologue
    const/4 v2, 0x1

    .line 243
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->prepared:Z

    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 244
    iget v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->enabledTrackCount:I

    if-lez v1, :cond_1

    move v1, v2

    :goto_0
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 245
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->lastSeekPositionUs:J

    .line 246
    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingResetPositionUs:J

    cmp-long v1, v4, p1

    if-eqz v1, :cond_0

    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    cmp-long v1, v4, p1

    if-nez v1, :cond_2

    .line 247
    :cond_0
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 255
    :goto_1
    return-void

    .line 244
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 250
    :cond_2
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->downstreamPositionUs:J

    .line 251
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 252
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsSampleSource;->pendingDiscontinuities:[Z

    aput-boolean v2, v1, v0

    .line 251
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 254
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;->restartFrom(J)V

    goto :goto_1
.end method

.method protected final usToMs(J)I
    .locals 3
    .param p1, "timeUs"    # J

    .prologue
    .line 448
    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    long-to-int v0, v0

    return v0
.end method
