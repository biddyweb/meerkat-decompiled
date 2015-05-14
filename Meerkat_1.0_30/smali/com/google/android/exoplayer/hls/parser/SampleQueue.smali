.class abstract Lcom/google/android/exoplayer/hls/parser/SampleQueue;
.super Ljava/lang/Object;
.source "SampleQueue.java"


# instance fields
.field private volatile largestParsedTimestampUs:J

.field private lastReadTimeUs:J

.field private volatile mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

.field private needKeyframe:Z

.field private final rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

.field private final sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

.field private spliceOutTimeUs:J

.field private writingSample:Z


# direct methods
.method protected constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 4
    .param p1, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    const-wide/high16 v2, -0x8000000000000000L

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    .line 48
    new-instance v0, Lcom/google/android/exoplayer/SampleHolder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/SampleHolder;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->needKeyframe:Z

    .line 50
    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->lastReadTimeUs:J

    .line 51
    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->spliceOutTimeUs:J

    .line 52
    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->largestParsedTimestampUs:J

    .line 53
    return-void
.end method

.method private advanceToEligibleSample()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 153
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->peekSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v0

    .line 154
    .local v0, "haveNext":Z
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->needKeyframe:Z

    if-eqz v2, :cond_0

    .line 155
    :goto_0
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v2, v2, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_0

    .line 156
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->skipSample()V

    .line 157
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->peekSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v0

    goto :goto_0

    .line 160
    :cond_0
    if-nez v0, :cond_2

    .line 166
    :cond_1
    :goto_1
    return v1

    .line 163
    :cond_2
    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->spliceOutTimeUs:J

    const-wide/high16 v4, -0x8000000000000000L

    cmp-long v2, v2, v4

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v2, v2, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->spliceOutTimeUs:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    .line 166
    :cond_3
    const/4 v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method protected appendData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V
    .locals 1
    .param p1, "buffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "length"    # I

    .prologue
    .line 190
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->appendData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 191
    return-void
.end method

.method protected commitSample(Z)V
    .locals 1
    .param p1, "isKeyframe"    # Z

    .prologue
    .line 194
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->commitSample(ZI)V

    .line 195
    return-void
.end method

.method protected commitSample(ZI)V
    .locals 1
    .param p1, "isKeyframe"    # Z
    .param p2, "offset"    # I

    .prologue
    .line 198
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->commitSample(ZI)V

    .line 199
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->writingSample:Z

    .line 200
    return-void
.end method

.method public configureSpliceTo(Lcom/google/android/exoplayer/hls/parser/SampleQueue;)Z
    .locals 8
    .param p1, "nextQueue"    # Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    .prologue
    const/4 v3, 0x1

    .line 119
    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->spliceOutTimeUs:J

    const-wide/high16 v6, -0x8000000000000000L

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 143
    :goto_0
    return v3

    .line 124
    :cond_0
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->peekSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 125
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v0, v4, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 129
    .local v0, "firstPossibleSpliceTime":J
    :goto_1
    iget-object v2, p1, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    .line 130
    .local v2, "nextRollingBuffer":Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;
    :goto_2
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->peekSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v4, v4, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    cmp-long v4, v4, v0

    if-ltz v4, :cond_1

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget v4, v4, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_3

    .line 135
    :cond_1
    invoke-virtual {v2}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->skipSample()V

    goto :goto_2

    .line 127
    .end local v0    # "firstPossibleSpliceTime":J
    .end local v2    # "nextRollingBuffer":Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;
    :cond_2
    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->lastReadTimeUs:J

    const-wide/16 v6, 0x1

    add-long v0, v4, v6

    .restart local v0    # "firstPossibleSpliceTime":J
    goto :goto_1

    .line 137
    .restart local v2    # "nextRollingBuffer":Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;
    :cond_3
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v2, v4}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->peekSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 140
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v4, v4, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iput-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->spliceOutTimeUs:J

    goto :goto_0

    .line 143
    :cond_4
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public discardUntil(J)V
    .locals 3
    .param p1, "timeUs"    # J

    .prologue
    .line 104
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->peekSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->sampleInfoHolder:Lcom/google/android/exoplayer/SampleHolder;

    iget-wide v0, v0, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    cmp-long v0, v0, p1

    if-gez v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->skipSample()V

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->needKeyframe:Z

    goto :goto_0

    .line 109
    :cond_0
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->lastReadTimeUs:J

    .line 110
    return-void
.end method

.method public getLargestParsedTimestampUs()J
    .locals 2

    .prologue
    .line 62
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->largestParsedTimestampUs:J

    return-wide v0
.end method

.method public getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    return-object v0
.end method

.method public getSample(Lcom/google/android/exoplayer/SampleHolder;)Z
    .locals 4
    .param p1, "holder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    const/4 v1, 0x0

    .line 87
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->advanceToEligibleSample()Z

    move-result v0

    .line 88
    .local v0, "foundEligibleSample":Z
    if-nez v0, :cond_0

    .line 95
    :goto_0
    return v1

    .line 92
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-virtual {v2, p1}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->readSample(Lcom/google/android/exoplayer/SampleHolder;)V

    .line 93
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->needKeyframe:Z

    .line 94
    iget-wide v2, p1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->lastReadTimeUs:J

    .line 95
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hasMediaFormat()Z
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->advanceToEligibleSample()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->release()V

    .line 57
    return-void
.end method

.method protected setMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)V
    .locals 0
    .param p1, "mediaFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 176
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 177
    return-void
.end method

.method protected startSample(J)V
    .locals 1
    .param p1, "sampleTimeUs"    # J

    .prologue
    .line 180
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->startSample(JI)V

    .line 181
    return-void
.end method

.method protected startSample(JI)V
    .locals 3
    .param p1, "sampleTimeUs"    # J
    .param p3, "offset"    # I

    .prologue
    .line 184
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->writingSample:Z

    .line 185
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->largestParsedTimestampUs:J

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->largestParsedTimestampUs:J

    .line 186
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->rollingBuffer:Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/hls/parser/RollingSampleBuffer;->startSample(JI)V

    .line 187
    return-void
.end method

.method protected writingSample()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->writingSample:Z

    return v0
.end method
