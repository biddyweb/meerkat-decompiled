.class final Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;
.super Ljava/lang/Object;
.source "RollingSampleBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;
    }
.end annotation


# instance fields
.field private final dataOffsetHolder:[J

.field private final dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<[B>;"
        }
    .end annotation
.end field

.field private final fragmentLength:I

.field private final fragmentPool:Lcom/google/android/exoplayer/upstream/BufferPool;

.field private final infoQueue:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

.field private lastFragment:[B

.field private lastFragmentOffset:I

.field private pendingSampleOffset:J

.field private pendingSampleTimeUs:J

.field private totalBytesDropped:J

.field private totalBytesWritten:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 1
    .param p1, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    .line 51
    iget v0, p1, Lcom/google/android/exoplayer/upstream/BufferPool;->bufferLength:I

    iput v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentLength:I

    .line 52
    new-instance v0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

    invoke-direct {v0}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->infoQueue:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

    .line 53
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 54
    const/4 v0, 0x1

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataOffsetHolder:[J

    .line 55
    return-void
.end method

.method private dropFragmentsTo(J)V
    .locals 9
    .param p1, "absolutePosition"    # J

    .prologue
    .line 131
    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesDropped:J

    sub-long v4, p1, v4

    long-to-int v2, v4

    .line 132
    .local v2, "relativePosition":I
    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentLength:I

    div-int v0, v2, v3

    .line 133
    .local v0, "fragmentIndex":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 134
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-virtual {v4, v3}, Lcom/google/android/exoplayer/upstream/BufferPool;->releaseDirect([B)V

    .line 135
    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesDropped:J

    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentLength:I

    int-to-long v6, v3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesDropped:J

    .line 133
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 137
    :cond_0
    return-void
.end method

.method private readData(JLjava/nio/ByteBuffer;I)V
    .locals 7
    .param p1, "absolutePosition"    # J
    .param p3, "target"    # Ljava/nio/ByteBuffer;
    .param p4, "length"    # I

    .prologue
    .line 113
    move v1, p4

    .line 114
    .local v1, "remaining":I
    :goto_0
    if-lez v1, :cond_0

    .line 115
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dropFragmentsTo(J)V

    .line 116
    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesDropped:J

    sub-long v4, p1, v4

    long-to-int v0, v4

    .line 117
    .local v0, "positionInFragment":I
    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentLength:I

    sub-int/2addr v3, v0

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 118
    .local v2, "toCopy":I
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-virtual {p3, v3, v0, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 119
    int-to-long v4, v2

    add-long/2addr p1, v4

    .line 120
    sub-int/2addr v1, v2

    .line 121
    goto :goto_0

    .line 122
    .end local v0    # "positionInFragment":I
    .end local v2    # "toCopy":I
    :cond_0
    return-void
.end method


# virtual methods
.method public appendData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V
    .locals 6
    .param p1, "buffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "length"    # I

    .prologue
    .line 161
    move v0, p2

    .line 162
    .local v0, "remainingWriteLength":I
    :goto_0
    if-lez v0, :cond_2

    .line 163
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragmentOffset:I

    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentLength:I

    if-ne v2, v3, :cond_1

    .line 164
    :cond_0
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragmentOffset:I

    .line 165
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/upstream/BufferPool;->allocateDirect()[B

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragment:[B

    .line 166
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragment:[B

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 168
    :cond_1
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentLength:I

    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragmentOffset:I

    sub-int/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 169
    .local v1, "thisWriteLength":I
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragment:[B

    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragmentOffset:I

    invoke-virtual {p1, v2, v3, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 170
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragmentOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->lastFragmentOffset:I

    .line 171
    sub-int/2addr v0, v1

    .line 172
    goto :goto_0

    .line 173
    .end local v1    # "thisWriteLength":I
    :cond_2
    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesWritten:J

    int-to-long v4, p2

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesWritten:J

    .line 174
    return-void
.end method

.method public commitSample(ZI)V
    .locals 9
    .param p1, "isKeyframe"    # Z
    .param p2, "offset"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 184
    if-gtz p2, :cond_0

    move v0, v7

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 185
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesWritten:J

    int-to-long v2, p2

    add-long/2addr v0, v2

    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->pendingSampleOffset:J

    sub-long/2addr v0, v2

    long-to-int v6, v0

    .line 186
    .local v6, "sampleSize":I
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->infoQueue:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->pendingSampleTimeUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->pendingSampleOffset:J

    if-eqz p1, :cond_1

    :goto_1
    invoke-virtual/range {v1 .. v7}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->commitSample(JJII)V

    .line 188
    return-void

    .end local v6    # "sampleSize":I
    :cond_0
    move v0, v8

    .line 184
    goto :goto_0

    .restart local v6    # "sampleSize":I
    :cond_1
    move v7, v8

    .line 186
    goto :goto_1
.end method

.method public peekSample(Lcom/google/android/exoplayer/SampleHolder;)Z
    .locals 2
    .param p1, "holder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->infoQueue:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataOffsetHolder:[J

    invoke-virtual {v0, p1, v1}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->peekSample(Lcom/google/android/exoplayer/SampleHolder;[J)Z

    move-result v0

    return v0
.end method

.method public readSample(Lcom/google/android/exoplayer/SampleHolder;)V
    .locals 6
    .param p1, "holder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 92
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->infoQueue:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataOffsetHolder:[J

    invoke-virtual {v2, p1, v3}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->peekSample(Lcom/google/android/exoplayer/SampleHolder;[J)Z

    .line 94
    iget-object v2, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_0

    iget-object v2, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    iget v3, p1, Lcom/google/android/exoplayer/SampleHolder;->size:I

    if-ge v2, v3, :cond_1

    .line 95
    :cond_0
    iget v2, p1, Lcom/google/android/exoplayer/SampleHolder;->size:I

    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/SampleHolder;->replaceBuffer(I)Z

    .line 97
    :cond_1
    iget-object v2, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_2

    .line 98
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataOffsetHolder:[J

    const/4 v3, 0x0

    aget-wide v2, v2, v3

    iget-object v4, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    iget v5, p1, Lcom/google/android/exoplayer/SampleHolder;->size:I

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->readData(JLjava/nio/ByteBuffer;I)V

    .line 101
    :cond_2
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->infoQueue:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->moveToNextSample()J

    move-result-wide v0

    .line 102
    .local v0, "nextOffset":J
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dropFragmentsTo(J)V

    .line 103
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 58
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->fragmentPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer/upstream/BufferPool;->releaseDirect([B)V

    goto :goto_0

    .line 61
    :cond_0
    return-void
.end method

.method public skipSample()V
    .locals 3

    .prologue
    .line 81
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->infoQueue:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer$InfoQueue;->moveToNextSample()J

    move-result-wide v0

    .line 82
    .local v0, "nextOffset":J
    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->dropFragmentsTo(J)V

    .line 83
    return-void
.end method

.method public startSample(JI)V
    .locals 5
    .param p1, "sampleTimeUs"    # J
    .param p3, "offset"    # I

    .prologue
    .line 149
    if-gtz p3, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 150
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->pendingSampleTimeUs:J

    .line 151
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->totalBytesWritten:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->pendingSampleOffset:J

    .line 152
    return-void

    .line 149
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
