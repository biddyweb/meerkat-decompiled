.class public Lcom/google/android/exoplayer/chunk/ChunkSampleSource;
.super Ljava/lang/Object;
.source "ChunkSampleSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/SampleSource;
.implements Lcom/google/android/exoplayer/upstream/Loader$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
    }
.end annotation


# static fields
.field public static final DEFAULT_MIN_LOADABLE_RETRY_COUNT:I = 0x3

.field private static final NO_RESET_PENDING:I = -0x1

.field private static final STATE_ENABLED:I = 0x2

.field private static final STATE_PREPARED:I = 0x1

.field private static final STATE_UNPREPARED:I


# instance fields
.field private final bufferSizeContribution:I

.field private final chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

.field private currentLoadableException:Ljava/io/IOException;

.field private currentLoadableExceptionCount:I

.field private currentLoadableExceptionFatal:Z

.field private currentLoadableExceptionTimestamp:J

.field private final currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

.field private volatile downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

.field private downstreamMediaFormat:Lcom/google/android/exoplayer/MediaFormat;

.field private downstreamPositionUs:J

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

.field private final eventSourceId:I

.field private final frameAccurateSeeking:Z

.field private lastPerformedBufferOperation:J

.field private lastSeekPositionUs:J

.field private final loadControl:Lcom/google/android/exoplayer/LoadControl;

.field private loader:Lcom/google/android/exoplayer/upstream/Loader;

.field private final mediaChunks:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;"
        }
    .end annotation
.end field

.field private final minLoadableRetryCount:I

.field private pendingDiscontinuity:Z

.field private pendingResetPositionUs:J

.field private final readOnlyMediaChunks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;"
        }
    .end annotation
.end field

.field private state:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/chunk/ChunkSource;Lcom/google/android/exoplayer/LoadControl;IZ)V
    .locals 8
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/chunk/ChunkSource;
    .param p2, "loadControl"    # Lcom/google/android/exoplayer/LoadControl;
    .param p3, "bufferSizeContribution"    # I
    .param p4, "frameAccurateSeeking"    # Z

    .prologue
    const/4 v5, 0x0

    .line 178
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v6, v5

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSource;Lcom/google/android/exoplayer/LoadControl;IZLandroid/os/Handler;Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;I)V

    .line 179
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/chunk/ChunkSource;Lcom/google/android/exoplayer/LoadControl;IZLandroid/os/Handler;Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;I)V
    .locals 9
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/chunk/ChunkSource;
    .param p2, "loadControl"    # Lcom/google/android/exoplayer/LoadControl;
    .param p3, "bufferSizeContribution"    # I
    .param p4, "frameAccurateSeeking"    # Z
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
    .param p7, "eventSourceId"    # I

    .prologue
    .line 184
    const/4 v8, 0x3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSource;Lcom/google/android/exoplayer/LoadControl;IZLandroid/os/Handler;Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;II)V

    .line 186
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/chunk/ChunkSource;Lcom/google/android/exoplayer/LoadControl;IZLandroid/os/Handler;Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;II)V
    .locals 1
    .param p1, "chunkSource"    # Lcom/google/android/exoplayer/chunk/ChunkSource;
    .param p2, "loadControl"    # Lcom/google/android/exoplayer/LoadControl;
    .param p3, "bufferSizeContribution"    # I
    .param p4, "frameAccurateSeeking"    # Z
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
    .param p7, "eventSourceId"    # I
    .param p8, "minLoadableRetryCount"    # I

    .prologue
    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    .line 192
    iput-object p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    .line 193
    iput p3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->bufferSizeContribution:I

    .line 194
    iput-boolean p4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->frameAccurateSeeking:Z

    .line 195
    iput-object p5, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    .line 196
    iput-object p6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    .line 197
    iput p7, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventSourceId:I

    .line 198
    iput p8, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->minLoadableRetryCount:I

    .line 199
    new-instance v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    invoke-direct {v0}, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    .line 200
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    .line 201
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readOnlyMediaChunks:Ljava/util/List;

    .line 202
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    .line 203
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    .prologue
    .line 43
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventSourceId:I

    return v0
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;)Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/chunk/ChunkSampleSource;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    return-object v0
.end method

.method private clearCurrentLoadable()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 519
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iput-object v2, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 520
    iput-object v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 521
    iput v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionCount:I

    .line 522
    iput-boolean v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionFatal:Z

    .line 523
    return-void
.end method

.method private clearMediaChunks()V
    .locals 1

    .prologue
    .line 515
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->discardDownstreamMediaChunks(Lcom/google/android/exoplayer/chunk/MediaChunk;)V

    .line 516
    return-void
.end method

.method private discardDownstreamMediaChunk()V
    .locals 8

    .prologue
    .line 690
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 691
    .local v0, "removed":Lcom/google/android/exoplayer/chunk/MediaChunk;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/MediaChunk;->bytesLoaded()J

    move-result-wide v6

    .line 692
    .local v6, "totalBytes":J
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/MediaChunk;->release()V

    .line 693
    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyDownstreamDiscarded(JJJ)V

    .line 694
    return-void
.end method

.method private discardDownstreamMediaChunks(Lcom/google/android/exoplayer/chunk/MediaChunk;)V
    .locals 10
    .param p1, "untilChunk"    # Lcom/google/android/exoplayer/chunk/MediaChunk;

    .prologue
    .line 671
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_1

    .line 684
    :cond_0
    :goto_0
    return-void

    .line 674
    :cond_1
    const-wide/16 v6, 0x0

    .line 675
    .local v6, "totalBytes":J
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/chunk/MediaChunk;

    iget-wide v2, v1, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    .line 676
    .local v2, "startTimeUs":J
    const-wide/16 v4, 0x0

    .line 677
    .local v4, "endTimeUs":J
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    if-eq p1, v1, :cond_2

    .line 678
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 679
    .local v0, "removed":Lcom/google/android/exoplayer/chunk/MediaChunk;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/MediaChunk;->bytesLoaded()J

    move-result-wide v8

    add-long/2addr v6, v8

    .line 680
    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    .line 681
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/MediaChunk;->release()V

    goto :goto_1

    .end local v0    # "removed":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :cond_2
    move-object v1, p0

    .line 683
    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyDownstreamDiscarded(JJJ)V

    goto :goto_0
.end method

.method private discardUpstreamMediaChunks(I)Z
    .locals 10
    .param p1, "queueLength"    # I

    .prologue
    .line 703
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-gt v1, p1, :cond_0

    .line 704
    const/4 v1, 0x0

    .line 716
    :goto_0
    return v1

    .line 706
    :cond_0
    const-wide/16 v6, 0x0

    .line 707
    .local v6, "totalBytes":J
    const-wide/16 v2, 0x0

    .line 708
    .local v2, "startTimeUs":J
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/chunk/MediaChunk;

    iget-wide v4, v1, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    .line 709
    .local v4, "endTimeUs":J
    :goto_1
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-le v1, p1, :cond_1

    .line 710
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 711
    .local v0, "removed":Lcom/google/android/exoplayer/chunk/MediaChunk;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/MediaChunk;->bytesLoaded()J

    move-result-wide v8

    add-long/2addr v6, v8

    .line 712
    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    .line 713
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/MediaChunk;->release()V

    goto :goto_1

    .end local v0    # "removed":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :cond_1
    move-object v1, p0

    .line 715
    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyUpstreamDiscarded(JJJ)V

    .line 716
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private getMediaChunk(J)Lcom/google/android/exoplayer/chunk/MediaChunk;
    .locals 7
    .param p1, "positionUs"    # J

    .prologue
    const/4 v2, 0x0

    .line 397
    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 398
    .local v1, "mediaChunkIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 399
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 400
    .local v0, "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    cmp-long v3, p1, v4

    if-gez v3, :cond_2

    move-object v0, v2

    .line 406
    .end local v0    # "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :cond_1
    :goto_0
    return-object v0

    .line 402
    .restart local v0    # "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :cond_2
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/MediaChunk;->isLastChunk()Z

    move-result v3

    if-nez v3, :cond_1

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    cmp-long v3, p1, v4

    if-gez v3, :cond_0

    goto :goto_0

    .end local v0    # "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :cond_3
    move-object v0, v2

    .line 406
    goto :goto_0
.end method

.method private getNextLoadPositionUs()J
    .locals 4

    .prologue
    .line 579
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isPendingReset()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 580
    iget-wide v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    .line 583
    :goto_0
    return-wide v2

    .line 582
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 583
    .local v0, "lastMediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    iget v1, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->nextChunkIndex:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    const-wide/16 v2, -0x1

    goto :goto_0

    :cond_1
    iget-wide v2, v0, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    goto :goto_0
.end method

.method private getRetryDelayMillis(J)J
    .locals 5
    .param p1, "errorCount"    # J

    .prologue
    .line 728
    const-wide/16 v0, 0x1

    sub-long v0, p1, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private isMediaChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z
    .locals 1
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;

    .prologue
    .line 720
    instance-of v0, p1, Lcom/google/android/exoplayer/chunk/MediaChunk;

    return v0
.end method

.method private isPendingReset()Z
    .locals 4

    .prologue
    .line 724
    iget-wide v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

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

.method private maybeStartLoading()V
    .locals 12

    .prologue
    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    .line 642
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v10, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 643
    .local v10, "currentLoadable":Lcom/google/android/exoplayer/chunk/Chunk;
    if-nez v10, :cond_0

    .line 662
    :goto_0
    return-void

    .line 647
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v0}, Lcom/google/android/exoplayer/LoadControl;->getAllocator()Lcom/google/android/exoplayer/upstream/Allocator;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/google/android/exoplayer/chunk/Chunk;->init(Lcom/google/android/exoplayer/upstream/Allocator;)V

    .line 648
    invoke-direct {p0, v10}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isMediaChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v0

    if-eqz v0, :cond_2

    move-object v11, v10

    .line 649
    check-cast v11, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 650
    .local v11, "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 651
    iget-wide v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    invoke-virtual {v11, v0, v1, v3}, Lcom/google/android/exoplayer/chunk/MediaChunk;->seekTo(JZ)Z

    .line 652
    iput-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    .line 654
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v0, v11}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 655
    iget-object v0, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v1, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget v2, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->trigger:I

    iget-wide v4, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    iget-wide v6, v11, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    .line 656
    invoke-virtual {v11}, Lcom/google/android/exoplayer/chunk/MediaChunk;->getLength()J

    move-result-wide v8

    move-object v0, p0

    .line 655
    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyLoadStarted(Ljava/lang/String;IZJJJ)V

    .line 661
    .end local v11    # "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    :goto_1
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0, v10, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto :goto_0

    .line 658
    :cond_2
    iget-object v0, v10, Lcom/google/android/exoplayer/chunk/Chunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v1, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget v2, v10, Lcom/google/android/exoplayer/chunk/Chunk;->trigger:I

    const/4 v3, 0x1

    .line 659
    invoke-virtual {v10}, Lcom/google/android/exoplayer/chunk/Chunk;->getLength()J

    move-result-wide v8

    move-object v0, p0

    move-wide v6, v4

    .line 658
    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyLoadStarted(Ljava/lang/String;IZJJJ)V

    goto :goto_1
.end method

.method private maybeThrowLoadableException()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionCount:I

    iget v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->minLoadableRetryCount:I

    if-le v0, v1, :cond_1

    .line 392
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    throw v0

    .line 394
    :cond_1
    return-void
.end method

.method private notifyConsumptionError(Ljava/io/IOException;)V
    .locals 2
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 783
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 784
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$5;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$5;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;Ljava/io/IOException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 791
    :cond_0
    return-void
.end method

.method private notifyDownstreamDiscarded(JJJ)V
    .locals 9
    .param p1, "mediaStartTimeUs"    # J
    .param p3, "mediaEndTimeUs"    # J
    .param p5, "bytesDiscarded"    # J

    .prologue
    .line 821
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 822
    iget-object v8, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$8;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;JJJ)V

    invoke-virtual {v8, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 830
    :cond_0
    return-void
.end method

.method private notifyDownstreamFormatChanged(Ljava/lang/String;IJ)V
    .locals 7
    .param p1, "formatId"    # Ljava/lang/String;
    .param p2, "trigger"    # I
    .param p3, "positionUs"    # J

    .prologue
    .line 808
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 809
    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$7;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$7;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;Ljava/lang/String;IJ)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 817
    :cond_0
    return-void
.end method

.method private notifyLoadCanceled(J)V
    .locals 3
    .param p1, "bytesLoaded"    # J

    .prologue
    .line 761
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 762
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$3;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;J)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 769
    :cond_0
    return-void
.end method

.method private notifyLoadCompleted(J)V
    .locals 3
    .param p1, "bytesLoaded"    # J

    .prologue
    .line 750
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 751
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$2;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;J)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 758
    :cond_0
    return-void
.end method

.method private notifyLoadStarted(Ljava/lang/String;IZJJJ)V
    .locals 12
    .param p1, "formatId"    # Ljava/lang/String;
    .param p2, "trigger"    # I
    .param p3, "isInitialization"    # Z
    .param p4, "mediaStartTimeUs"    # J
    .param p6, "mediaEndTimeUs"    # J
    .param p8, "length"    # J

    .prologue
    .line 738
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 739
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-wide/from16 v6, p4

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    invoke-direct/range {v1 .. v11}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$1;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;Ljava/lang/String;IZJJJ)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 747
    :cond_0
    return-void
.end method

.method private notifyUpstreamDiscarded(JJJ)V
    .locals 9
    .param p1, "mediaStartTimeUs"    # J
    .param p3, "mediaEndTimeUs"    # J
    .param p5, "totalBytes"    # J

    .prologue
    .line 795
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 796
    iget-object v8, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$6;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$6;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;JJJ)V

    invoke-virtual {v8, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 804
    :cond_0
    return-void
.end method

.method private notifyUpstreamError(Ljava/io/IOException;)V
    .locals 2
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 772
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventListener:Lcom/google/android/exoplayer/chunk/ChunkSampleSource$EventListener;

    if-eqz v0, :cond_0

    .line 773
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$4;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource$4;-><init>(Lcom/google/android/exoplayer/chunk/ChunkSampleSource;Ljava/io/IOException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 780
    :cond_0
    return-void
.end method

.method private restartFrom(J)V
    .locals 1
    .param p1, "positionUs"    # J

    .prologue
    .line 504
    iput-wide p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    .line 505
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 506
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 512
    :goto_0
    return-void

    .line 508
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearMediaChunks()V

    .line 509
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 510
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->updateLoadControl()V

    goto :goto_0
.end method

.method private resumeFromBackOff()V
    .locals 9

    .prologue
    .line 595
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 597
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v7, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 598
    .local v7, "backedOffChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    invoke-direct {p0, v7}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isMediaChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 599
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readOnlyMediaChunks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    .line 600
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readOnlyMediaChunks:Ljava/util/List;

    iget-wide v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getChunkOperation(Ljava/util/List;JJLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V

    .line 602
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget v0, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->discardUpstreamMediaChunks(I)Z

    .line 603
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    if-ne v0, v7, :cond_0

    .line 605
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0, v7, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    .line 639
    :goto_0
    return-void

    .line 607
    :cond_0
    invoke-virtual {v7}, Lcom/google/android/exoplayer/chunk/Chunk;->release()V

    .line 608
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->maybeStartLoading()V

    goto :goto_0

    .line 613
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    if-ne v7, v0, :cond_2

    .line 616
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0, v7, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto :goto_0

    .line 622
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 623
    .local v8, "removedChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    if-ne v7, v8, :cond_3

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 624
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readOnlyMediaChunks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    .line 625
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readOnlyMediaChunks:Ljava/util/List;

    iget-wide v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getChunkOperation(Ljava/util/List;JJLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V

    .line 627
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v0, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 629
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    if-ne v0, v7, :cond_4

    .line 631
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0, v7, p0}, Lcom/google/android/exoplayer/upstream/Loader;->startLoading(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Lcom/google/android/exoplayer/upstream/Loader$Callback;)V

    goto :goto_0

    .line 623
    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 635
    :cond_4
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget v0, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->discardUpstreamMediaChunks(I)Z

    .line 636
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 637
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->maybeStartLoading()V

    goto :goto_0
.end method

.method private updateLoadControl()V
    .locals 22

    .prologue
    .line 526
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionFatal:Z

    if-eqz v4, :cond_1

    .line 528
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    const-wide/16 v8, -0x1

    const/4 v10, 0x0

    const/4 v11, 0x1

    move-object/from16 v5, p0

    invoke-interface/range {v4 .. v11}, Lcom/google/android/exoplayer/LoadControl;->update(Ljava/lang/Object;JJZZ)Z

    .line 572
    :cond_0
    :goto_0
    return-void

    .line 532
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v20

    .line 533
    .local v20, "now":J
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->getNextLoadPositionUs()J

    move-result-wide v18

    .line 534
    .local v18, "nextLoadPositionUs":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v4, :cond_5

    const/4 v13, 0x1

    .line 535
    .local v13, "isBackedOff":Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v4}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v4

    if-nez v4, :cond_2

    if-eqz v13, :cond_6

    :cond_2
    const/16 v16, 0x1

    .line 539
    .local v16, "loadingOrBackedOff":Z
    :goto_2
    if-nez v16, :cond_9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v4, v4, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    if-nez v4, :cond_3

    const-wide/16 v4, -0x1

    cmp-long v4, v18, v4

    if-nez v4, :cond_4

    :cond_3
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->lastPerformedBufferOperation:J

    sub-long v4, v20, v4

    const-wide/16 v6, 0x7d0

    cmp-long v4, v4, v6

    if-lez v4, :cond_9

    .line 542
    :cond_4
    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->lastPerformedBufferOperation:J

    .line 543
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readOnlyMediaChunks:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    iput v5, v4, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    .line 544
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readOnlyMediaChunks:Ljava/util/List;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    invoke-interface/range {v4 .. v10}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getChunkOperation(Ljava/util/List;JJLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V

    .line 546
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget v4, v4, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->discardUpstreamMediaChunks(I)Z

    move-result v12

    .line 548
    .local v12, "chunksDiscarded":Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v4, v4, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    if-nez v4, :cond_7

    .line 550
    const-wide/16 v8, -0x1

    .line 558
    .end local v12    # "chunksDiscarded":Z
    .end local v18    # "nextLoadPositionUs":J
    .local v8, "nextLoadPositionUs":J
    :goto_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    const/4 v11, 0x0

    move-object/from16 v5, p0

    move/from16 v10, v16

    invoke-interface/range {v4 .. v11}, Lcom/google/android/exoplayer/LoadControl;->update(Ljava/lang/Object;JJZZ)Z

    move-result v17

    .line 561
    .local v17, "nextLoader":Z
    if-eqz v13, :cond_8

    .line 562
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionTimestamp:J

    sub-long v14, v20, v4

    .line 563
    .local v14, "elapsedMillis":J
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionCount:I

    int-to-long v4, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->getRetryDelayMillis(J)J

    move-result-wide v4

    cmp-long v4, v14, v4

    if-ltz v4, :cond_0

    .line 564
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->resumeFromBackOff()V

    goto/16 :goto_0

    .line 534
    .end local v8    # "nextLoadPositionUs":J
    .end local v13    # "isBackedOff":Z
    .end local v14    # "elapsedMillis":J
    .end local v16    # "loadingOrBackedOff":Z
    .end local v17    # "nextLoader":Z
    .restart local v18    # "nextLoadPositionUs":J
    :cond_5
    const/4 v13, 0x0

    goto/16 :goto_1

    .line 535
    .restart local v13    # "isBackedOff":Z
    :cond_6
    const/16 v16, 0x0

    goto/16 :goto_2

    .line 551
    .restart local v12    # "chunksDiscarded":Z
    .restart local v16    # "loadingOrBackedOff":Z
    :cond_7
    if-eqz v12, :cond_9

    .line 553
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->getNextLoadPositionUs()J

    move-result-wide v8

    .end local v18    # "nextLoadPositionUs":J
    .restart local v8    # "nextLoadPositionUs":J
    goto :goto_3

    .line 569
    .end local v12    # "chunksDiscarded":Z
    .restart local v17    # "nextLoader":Z
    :cond_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v4}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v4

    if-nez v4, :cond_0

    if-eqz v17, :cond_0

    .line 570
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->maybeStartLoading()V

    goto/16 :goto_0

    .end local v8    # "nextLoadPositionUs":J
    .end local v17    # "nextLoader":Z
    .restart local v18    # "nextLoadPositionUs":J
    :cond_9
    move-wide/from16 v8, v18

    .end local v18    # "nextLoadPositionUs":J
    .restart local v8    # "nextLoadPositionUs":J
    goto :goto_3
.end method


# virtual methods
.method public continueBuffering(J)Z
    .locals 5
    .param p1, "positionUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 271
    iget v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_2

    move v1, v2

    :goto_0
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 272
    iput-wide p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    .line 273
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    invoke-interface {v1, p1, p2}, Lcom/google/android/exoplayer/chunk/ChunkSource;->continueBuffering(J)V

    .line 274
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->updateLoadControl()V

    .line 276
    const/4 v0, 0x0

    .line 277
    .local v0, "haveSamples":Z
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isPendingReset()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 288
    :cond_0
    :goto_1
    if-nez v0, :cond_1

    .line 289
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->maybeThrowLoadableException()V

    .line 291
    :cond_1
    return v0

    .end local v0    # "haveSamples":Z
    :cond_2
    move v1, v3

    .line 271
    goto :goto_0

    .line 279
    .restart local v0    # "haveSamples":Z
    :cond_3
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/chunk/MediaChunk;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/MediaChunk;->sampleAvailable()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 281
    const/4 v0, 0x1

    goto :goto_1

    .line 285
    :cond_4
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-le v1, v2, :cond_5

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/chunk/MediaChunk;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/chunk/MediaChunk;->sampleAvailable()Z

    move-result v1

    if-eqz v1, :cond_5

    move v0, v2

    :goto_2
    goto :goto_1

    :cond_5
    move v0, v3

    goto :goto_2
.end method

.method public disable(I)V
    .locals 4
    .param p1, "track"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 251
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 252
    if-nez p1, :cond_1

    move v0, v1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 253
    iput-boolean v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingDiscontinuity:Z

    .line 254
    iput v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    .line 256
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/chunk/ChunkSource;->disable(Ljava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 258
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer/LoadControl;->unregister(Ljava/lang/Object;)V

    .line 259
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 260
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 267
    :goto_2
    return-void

    :cond_0
    move v0, v2

    .line 251
    goto :goto_0

    :cond_1
    move v0, v2

    .line 252
    goto :goto_1

    .line 262
    :cond_2
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearMediaChunks()V

    .line 263
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 264
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v0}, Lcom/google/android/exoplayer/LoadControl;->trimAllocator()V

    goto :goto_2

    .line 258
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v1, p0}, Lcom/google/android/exoplayer/LoadControl;->unregister(Ljava/lang/Object;)V

    .line 259
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/upstream/Loader;->isLoading()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 260
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/upstream/Loader;->cancelLoading()V

    .line 264
    :goto_3
    throw v0

    .line 262
    :cond_3
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearMediaChunks()V

    .line 263
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 264
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v1}, Lcom/google/android/exoplayer/LoadControl;->trimAllocator()V

    goto :goto_3
.end method

.method public enable(IJ)V
    .locals 4
    .param p1, "track"    # I
    .param p2, "positionUs"    # J

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 237
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 238
    if-nez p1, :cond_1

    :goto_1
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 239
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    .line 240
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/ChunkSource;->enable()V

    .line 241
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    iget v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->bufferSizeContribution:I

    invoke-interface {v0, p0, v1}, Lcom/google/android/exoplayer/LoadControl;->register(Ljava/lang/Object;I)V

    .line 242
    iput-object v3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    .line 243
    iput-object v3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamMediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 244
    iput-wide p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    .line 245
    iput-wide p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->lastSeekPositionUs:J

    .line 246
    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->restartFrom(J)V

    .line 247
    return-void

    :cond_0
    move v0, v2

    .line 237
    goto :goto_0

    :cond_1
    move v1, v2

    .line 238
    goto :goto_1
.end method

.method public getBufferedPositionUs()J
    .locals 10

    .prologue
    .line 411
    iget v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    const/4 v4, 0x1

    :goto_0
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 412
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isPendingReset()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 413
    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    .line 429
    :goto_1
    return-wide v4

    .line 411
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 415
    :cond_1
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 416
    .local v3, "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v2, v4, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 417
    .local v2, "currentLoadable":Lcom/google/android/exoplayer/chunk/Chunk;
    if-eqz v2, :cond_3

    if-ne v3, v2, :cond_3

    .line 419
    invoke-virtual {v3}, Lcom/google/android/exoplayer/chunk/MediaChunk;->getLength()J

    move-result-wide v0

    .line 420
    .local v0, "chunkLength":J
    const-wide/16 v4, -0x1

    cmp-long v4, v0, v4

    if-eqz v4, :cond_2

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-eqz v4, :cond_2

    .line 421
    iget-wide v4, v3, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    iget-wide v6, v3, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    iget-wide v8, v3, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    sub-long/2addr v6, v8

    .line 422
    invoke-virtual {v3}, Lcom/google/android/exoplayer/chunk/MediaChunk;->bytesLoaded()J

    move-result-wide v8

    mul-long/2addr v6, v8

    div-long/2addr v6, v0

    add-long/2addr v4, v6

    goto :goto_1

    .line 424
    :cond_2
    iget-wide v4, v3, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    goto :goto_1

    .line 426
    .end local v0    # "chunkLength":J
    :cond_3
    invoke-virtual {v3}, Lcom/google/android/exoplayer/chunk/MediaChunk;->isLastChunk()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 427
    const-wide/16 v4, -0x3

    goto :goto_1

    .line 429
    :cond_4
    iget-wide v4, v3, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    goto :goto_1
.end method

.method public getFormat()Lcom/google/android/exoplayer/chunk/Format;
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    return-object v0
.end method

.method public getTrackCount()I
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 224
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 225
    return v1

    .line 224
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTrackInfo(I)Lcom/google/android/exoplayer/TrackInfo;
    .locals 3
    .param p1, "track"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 230
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 231
    if-nez p1, :cond_1

    :goto_1
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 232
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getTrackInfo()Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v0

    return-object v0

    :cond_0
    move v0, v2

    .line 230
    goto :goto_0

    :cond_1
    move v1, v2

    .line 231
    goto :goto_1
.end method

.method public onLoadCanceled(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 468
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v0, v1, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 469
    .local v0, "currentLoadable":Lcom/google/android/exoplayer/chunk/Chunk;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->bytesLoaded()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyLoadCanceled(J)V

    .line 470
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isMediaChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 471
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->release()V

    .line 473
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 474
    iget v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 475
    iget-wide v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->restartFrom(J)V

    .line 480
    :goto_0
    return-void

    .line 477
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearMediaChunks()V

    .line 478
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loadControl:Lcom/google/android/exoplayer/LoadControl;

    invoke-interface {v1}, Lcom/google/android/exoplayer/LoadControl;->trimAllocator()V

    goto :goto_0
.end method

.method public onLoadCompleted(Lcom/google/android/exoplayer/upstream/Loader$Loadable;)V
    .locals 4
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;

    .prologue
    .line 445
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v0, v2, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 446
    .local v0, "currentLoadable":Lcom/google/android/exoplayer/chunk/Chunk;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->bytesLoaded()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyLoadCompleted(J)V

    .line 448
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->consume()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 456
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isMediaChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 457
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->release()V

    .line 459
    :cond_0
    iget-boolean v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v2, :cond_1

    .line 460
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 462
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->updateLoadControl()V

    .line 464
    :goto_0
    return-void

    .line 449
    :catch_0
    move-exception v1

    .line 450
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    iput-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 451
    iget v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionCount:I

    .line 452
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionTimestamp:J

    .line 453
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionFatal:Z

    .line 454
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyConsumptionError(Ljava/io/IOException;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 456
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isMediaChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 457
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->release()V

    .line 459
    :cond_2
    iget-boolean v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v2, :cond_3

    .line 460
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 462
    :cond_3
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->updateLoadControl()V

    goto :goto_0

    .line 456
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isMediaChunk(Lcom/google/android/exoplayer/chunk/Chunk;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 457
    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/Chunk;->release()V

    .line 459
    :cond_4
    iget-boolean v3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionFatal:Z

    if-nez v3, :cond_5

    .line 460
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->clearCurrentLoadable()V

    .line 462
    :cond_5
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->updateLoadControl()V

    throw v2
.end method

.method public onLoadError(Lcom/google/android/exoplayer/upstream/Loader$Loadable;Ljava/io/IOException;)V
    .locals 2
    .param p1, "loadable"    # Lcom/google/android/exoplayer/upstream/Loader$Loadable;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 484
    iput-object p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    .line 485
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionCount:I

    .line 486
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableExceptionTimestamp:J

    .line 487
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyUpstreamError(Ljava/io/IOException;)V

    .line 488
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableHolder:Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;

    iget-object v1, v1, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    invoke-interface {v0, v1, p2}, Lcom/google/android/exoplayer/chunk/ChunkSource;->onChunkLoadError(Lcom/google/android/exoplayer/chunk/Chunk;Ljava/lang/Exception;)V

    .line 489
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->updateLoadControl()V

    .line 490
    return-void
.end method

.method protected onSampleRead(Lcom/google/android/exoplayer/chunk/MediaChunk;Lcom/google/android/exoplayer/SampleHolder;)V
    .locals 0
    .param p1, "mediaChunk"    # Lcom/google/android/exoplayer/chunk/MediaChunk;
    .param p2, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 501
    return-void
.end method

.method public prepare()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 216
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 217
    new-instance v0, Lcom/google/android/exoplayer/upstream/Loader;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Loader:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    invoke-interface {v3}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getTrackInfo()Lcom/google/android/exoplayer/TrackInfo;

    move-result-object v3

    iget-object v3, v3, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 218
    iput v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    .line 219
    return v1

    .line 216
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I
    .locals 10
    .param p1, "track"    # I
    .param p2, "positionUs"    # J
    .param p4, "formatHolder"    # Lcom/google/android/exoplayer/MediaFormatHolder;
    .param p5, "sampleHolder"    # Lcom/google/android/exoplayer/SampleHolder;
    .param p6, "onlyReadDiscontinuity"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 298
    if-nez p1, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 300
    iget-boolean v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingDiscontinuity:Z

    if-eqz v0, :cond_2

    .line 301
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingDiscontinuity:Z

    .line 302
    const/4 v0, -0x5

    .line 365
    :goto_2
    return v0

    .line 297
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 298
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 305
    :cond_2
    if-eqz p6, :cond_3

    .line 306
    const/4 v0, -0x2

    goto :goto_2

    .line 309
    :cond_3
    iput-wide p2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    .line 310
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 311
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->maybeThrowLoadableException()V

    .line 312
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getError()Ljava/io/IOException;

    move-result-object v7

    .line 313
    .local v7, "chunkSourceException":Ljava/io/IOException;
    if-eqz v7, :cond_4

    .line 314
    throw v7

    .line 316
    :cond_4
    const/4 v0, -0x2

    goto :goto_2

    .line 319
    .end local v7    # "chunkSourceException":Ljava/io/IOException;
    :cond_5
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 320
    .local v8, "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    invoke-virtual {v8}, Lcom/google/android/exoplayer/chunk/MediaChunk;->isReadFinished()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 322
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_6

    .line 323
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->discardDownstreamMediaChunk()V

    .line 324
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    check-cast v8, Lcom/google/android/exoplayer/chunk/MediaChunk;

    .line 325
    .restart local v8    # "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    invoke-virtual {v8}, Lcom/google/android/exoplayer/chunk/MediaChunk;->seekToStart()V

    .line 326
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->readData(IJLcom/google/android/exoplayer/MediaFormatHolder;Lcom/google/android/exoplayer/SampleHolder;Z)I

    move-result v0

    goto :goto_2

    .line 327
    :cond_6
    invoke-virtual {v8}, Lcom/google/android/exoplayer/chunk/MediaChunk;->isLastChunk()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 328
    const/4 v0, -0x1

    goto :goto_2

    .line 330
    :cond_7
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getError()Ljava/io/IOException;

    move-result-object v7

    .line 331
    .restart local v7    # "chunkSourceException":Ljava/io/IOException;
    if-eqz v7, :cond_8

    .line 332
    throw v7

    .line 334
    :cond_8
    const/4 v0, -0x2

    goto :goto_2

    .line 337
    .end local v7    # "chunkSourceException":Ljava/io/IOException;
    :cond_9
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v1, v8, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/chunk/Format;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 338
    :cond_a
    iget-object v0, v8, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    iget v1, v8, Lcom/google/android/exoplayer/chunk/MediaChunk;->trigger:I

    iget-wide v2, v8, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->notifyDownstreamFormatChanged(Ljava/lang/String;IJ)V

    .line 340
    iget-object v0, v8, Lcom/google/android/exoplayer/chunk/MediaChunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamFormat:Lcom/google/android/exoplayer/chunk/Format;

    .line 343
    :cond_b
    invoke-virtual {v8}, Lcom/google/android/exoplayer/chunk/MediaChunk;->prepare()Z

    move-result v0

    if-nez v0, :cond_d

    .line 344
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    if-eqz v0, :cond_c

    .line 345
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->currentLoadableException:Ljava/io/IOException;

    throw v0

    .line 347
    :cond_c
    const/4 v0, -0x2

    goto/16 :goto_2

    .line 350
    :cond_d
    invoke-virtual {v8}, Lcom/google/android/exoplayer/chunk/MediaChunk;->getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v9

    .line 351
    .local v9, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    if-eqz v9, :cond_e

    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamMediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    const/4 v1, 0x1

    invoke-virtual {v9, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->equals(Lcom/google/android/exoplayer/MediaFormat;Z)Z

    move-result v0

    if-nez v0, :cond_e

    .line 352
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->chunkSource:Lcom/google/android/exoplayer/chunk/ChunkSource;

    invoke-interface {v0, v9}, Lcom/google/android/exoplayer/chunk/ChunkSource;->getMaxVideoDimensions(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 353
    iput-object v9, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->format:Lcom/google/android/exoplayer/MediaFormat;

    .line 354
    invoke-virtual {v8}, Lcom/google/android/exoplayer/chunk/MediaChunk;->getPsshInfo()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p4, Lcom/google/android/exoplayer/MediaFormatHolder;->drmInitData:Ljava/util/Map;

    .line 355
    iput-object v9, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamMediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 356
    const/4 v0, -0x4

    goto/16 :goto_2

    .line 359
    :cond_e
    invoke-virtual {v8, p5}, Lcom/google/android/exoplayer/chunk/MediaChunk;->read(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 360
    iget-boolean v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->frameAccurateSeeking:Z

    if-eqz v0, :cond_f

    iget-wide v0, p5, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->lastSeekPositionUs:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_f

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p5, Lcom/google/android/exoplayer/SampleHolder;->decodeOnly:Z

    .line 361
    invoke-virtual {p0, v8, p5}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->onSampleRead(Lcom/google/android/exoplayer/chunk/MediaChunk;Lcom/google/android/exoplayer/SampleHolder;)V

    .line 362
    const/4 v0, -0x3

    goto/16 :goto_2

    .line 360
    :cond_f
    const/4 v0, 0x0

    goto :goto_3

    .line 364
    :cond_10
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->maybeThrowLoadableException()V

    .line 365
    const/4 v0, -0x2

    goto/16 :goto_2
.end method

.method public release()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 435
    iget v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 436
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/Loader;->release()V

    .line 438
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->loader:Lcom/google/android/exoplayer/upstream/Loader;

    .line 440
    :cond_0
    iput v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    .line 441
    return-void

    :cond_1
    move v0, v1

    .line 435
    goto :goto_0
.end method

.method public seekToUs(J)V
    .locals 7
    .param p1, "positionUs"    # J

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 371
    iget v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->state:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_0

    move v1, v2

    :goto_0
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 372
    iput-wide p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->downstreamPositionUs:J

    .line 373
    iput-wide p1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->lastSeekPositionUs:J

    .line 374
    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingResetPositionUs:J

    cmp-long v1, v4, p1

    if-nez v1, :cond_1

    .line 387
    :goto_1
    return-void

    :cond_0
    move v1, v3

    .line 371
    goto :goto_0

    .line 378
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->getMediaChunk(J)Lcom/google/android/exoplayer/chunk/MediaChunk;

    move-result-object v0

    .line 379
    .local v0, "mediaChunk":Lcom/google/android/exoplayer/chunk/MediaChunk;
    if-nez v0, :cond_2

    .line 380
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->restartFrom(J)V

    .line 381
    iput-boolean v2, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingDiscontinuity:Z

    goto :goto_1

    .line 383
    :cond_2
    iget-boolean v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingDiscontinuity:Z

    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->mediaChunks:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v4

    if-ne v0, v4, :cond_3

    :goto_2
    invoke-virtual {v0, p1, p2, v2}, Lcom/google/android/exoplayer/chunk/MediaChunk;->seekTo(JZ)Z

    move-result v2

    or-int/2addr v1, v2

    iput-boolean v1, p0, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->pendingDiscontinuity:Z

    .line 384
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->discardDownstreamMediaChunks(Lcom/google/android/exoplayer/chunk/MediaChunk;)V

    .line 385
    invoke-direct {p0}, Lcom/google/android/exoplayer/chunk/ChunkSampleSource;->updateLoadControl()V

    goto :goto_1

    :cond_3
    move v2, v3

    .line 383
    goto :goto_2
.end method

.method protected final usToMs(J)I
    .locals 3
    .param p1, "timeUs"    # J

    .prologue
    .line 732
    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    long-to-int v0, v0

    return v0
.end method
