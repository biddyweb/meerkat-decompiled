.class public final Lcom/google/android/exoplayer/hls/parser/TsExtractor;
.super Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
.source "TsExtractor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/parser/TsExtractor$PesReader;,
        Lcom/google/android/exoplayer/hls/parser/TsExtractor$PmtReader;,
        Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;,
        Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;
    }
.end annotation


# static fields
.field private static final MAX_PTS:J = 0x1ffffffffL

.field private static final SEI_MIME:Ljava/lang/String; = "application/eia-608"

.field private static final TAG:Ljava/lang/String; = "TsExtractor"

.field private static final TS_PACKET_SIZE:I = 0xbc

.field private static final TS_PAT_PID:I = 0x0

.field private static final TS_STREAM_TYPE_AAC:I = 0xf

.field private static final TS_STREAM_TYPE_EIA608:I = 0x100

.field private static final TS_STREAM_TYPE_H264:I = 0x1b

.field private static final TS_STREAM_TYPE_ID3:I = 0x15

.field private static final TS_SYNC_BYTE:I = 0x47


# instance fields
.field private final bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

.field private final firstSampleTimestamp:J

.field private hasAudio:Z

.field private hasVideo:Z

.field private lastPts:J

.field private volatile prepared:Z

.field private final sampleQueues:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/hls/parser/SampleQueue;",
            ">;"
        }
    .end annotation
.end field

.field private timestampOffsetUs:J

.field private final tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private tsPacketBytesRead:I

.field private final tsPayloadReaders:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;",
            ">;"
        }
    .end annotation
.end field

.field private final tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;


# direct methods
.method public constructor <init>(ZJLcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 4
    .param p1, "shouldSpliceIn"    # Z
    .param p2, "firstSampleTimestamp"    # J
    .param p4, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    const/4 v2, 0x0

    .line 68
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;-><init>(Z)V

    .line 65
    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasAudio:Z

    .line 66
    iput-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasVideo:Z

    .line 69
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->firstSampleTimestamp:J

    .line 70
    iput-object p4, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    .line 71
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v1, 0x3

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 72
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v1, 0xbc

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 73
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    .line 74
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    .line 75
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    new-instance v1, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;

    invoke-direct {v1, p0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$PatReader;-><init>(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)V

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 76
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->lastPts:J

    .line 77
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer/hls/parser/TsExtractor;)Lcom/google/android/exoplayer/upstream/BufferPool;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    return-object v0
.end method

.method private checkPrepared()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 132
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 133
    .local v2, "pesPayloadReaderCount":I
    if-nez v2, :cond_0

    move v3, v4

    .line 161
    :goto_0
    return v3

    .line 136
    :cond_0
    const/4 v1, 0x0

    .line 137
    .local v1, "nullFormat":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_8

    .line 138
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 140
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/exoplayer/MediaFormat;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v3

    const-string v6, "mime"

    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "video/avc"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 141
    iput-boolean v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasVideo:Z

    .line 154
    :cond_1
    :goto_2
    if-eqz v1, :cond_6

    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasVideo:Z

    if-eqz v3, :cond_6

    move v3, v4

    .line 155
    goto :goto_0

    .line 142
    :cond_2
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/exoplayer/MediaFormat;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v3

    const-string v6, "mime"

    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "audio/mp4a-latm"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 143
    iput-boolean v5, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasAudio:Z

    goto :goto_2

    .line 144
    :cond_3
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/exoplayer/MediaFormat;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v3

    const-string v6, "mime"

    invoke-virtual {v3, v6}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "application/eia-608"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 145
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasAudio:Z

    if-nez v3, :cond_4

    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasVideo:Z

    if-eqz v3, :cond_1

    :cond_4
    move v3, v5

    .line 146
    goto/16 :goto_0

    .line 151
    :cond_5
    const/4 v1, 0x1

    goto :goto_2

    .line 156
    :cond_6
    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasAudio:Z

    if-eqz v3, :cond_7

    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->hasVideo:Z

    if-nez v3, :cond_7

    move v3, v5

    .line 157
    goto/16 :goto_0

    .line 137
    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    :cond_8
    move v3, v4

    .line 161
    goto/16 :goto_0
.end method


# virtual methods
.method public discardUntil(IJ)V
    .locals 2
    .param p1, "track"    # I
    .param p2, "timeUs"    # J

    .prologue
    .line 121
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 122
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v0, p2, p3}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->discardUntil(J)V

    .line 123
    return-void
.end method

.method public getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 88
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public getLargestSampleTimestamp()J
    .locals 6

    .prologue
    .line 105
    const-wide/high16 v2, -0x8000000000000000L

    .line 106
    .local v2, "largestParsedTimestampUs":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 107
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    .line 108
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->getLargestParsedTimestampUs()J

    move-result-wide v4

    .line 107
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 106
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 110
    :cond_0
    return-wide v2
.end method

.method public getSample(ILcom/google/android/exoplayer/SampleHolder;)Z
    .locals 1
    .param p1, "track"    # I
    .param p2, "holder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 115
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 116
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->getSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v0

    return v0
.end method

.method protected getSampleQueue(I)Lcom/google/android/exoplayer/hls/parser/SampleQueue;
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 221
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    return-object v0
.end method

.method public getTrackCount()I
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 82
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    return v0
.end method

.method public hasSamples(I)Z
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 128
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPrepared()Z
    .locals 1

    .prologue
    .line 93
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    return v0
.end method

.method ptsToTimeUs(J)J
    .locals 13
    .param p1, "pts"    # J

    .prologue
    .line 231
    iget-wide v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->lastPts:J

    const-wide/high16 v10, -0x8000000000000000L

    cmp-long v8, v8, v10

    if-eqz v8, :cond_0

    .line 234
    iget-wide v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->lastPts:J

    const-wide v10, 0xffffffffL

    add-long/2addr v8, v10

    const-wide v10, 0x1ffffffffL

    div-long v0, v8, v10

    .line 235
    .local v0, "closestWrapCount":J
    const-wide v8, 0x1ffffffffL

    const-wide/16 v10, 0x1

    sub-long v10, v0, v10

    mul-long/2addr v8, v10

    add-long v4, p1, v8

    .line 236
    .local v4, "ptsWrapBelow":J
    const-wide v8, 0x1ffffffffL

    mul-long/2addr v8, v0

    add-long v2, p1, v8

    .line 237
    .local v2, "ptsWrapAbove":J
    iget-wide v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->lastPts:J

    sub-long v8, v4, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->abs(J)J

    move-result-wide v8

    iget-wide v10, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->lastPts:J

    sub-long v10, v2, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-gez v8, :cond_2

    move-wide p1, v4

    .line 241
    .end local v0    # "closestWrapCount":J
    .end local v2    # "ptsWrapAbove":J
    .end local v4    # "ptsWrapBelow":J
    :cond_0
    :goto_0
    const-wide/32 v8, 0xf4240

    mul-long/2addr v8, p1

    const-wide/32 v10, 0x15f90

    div-long v6, v8, v10

    .line 243
    .local v6, "timeUs":J
    iget-wide v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->lastPts:J

    const-wide/high16 v10, -0x8000000000000000L

    cmp-long v8, v8, v10

    if-nez v8, :cond_1

    .line 244
    iget-wide v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->firstSampleTimestamp:J

    sub-long/2addr v8, v6

    iput-wide v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->timestampOffsetUs:J

    .line 247
    :cond_1
    iput-wide p1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->lastPts:J

    .line 248
    iget-wide v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->timestampOffsetUs:J

    add-long/2addr v8, v6

    return-wide v8

    .end local v6    # "timeUs":J
    .restart local v0    # "closestWrapCount":J
    .restart local v2    # "ptsWrapAbove":J
    .restart local v4    # "ptsWrapBelow":J
    :cond_2
    move-wide p1, v2

    .line 237
    goto :goto_0
.end method

.method public read(Lcom/google/android/exoplayer/upstream/DataSource;)I
    .locals 11
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBytesRead:I

    iget v10, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBytesRead:I

    rsub-int v10, v10, 0xbc

    invoke-interface {p1, v8, v9, v10}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v2

    .line 168
    .local v2, "bytesRead":I
    const/4 v8, -0x1

    if-ne v2, v8, :cond_1

    .line 169
    const/4 v2, -0x1

    .line 216
    .end local v2    # "bytesRead":I
    :cond_0
    :goto_0
    return v2

    .line 172
    .restart local v2    # "bytesRead":I
    :cond_1
    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBytesRead:I

    add-int/2addr v8, v2

    iput v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBytesRead:I

    .line 173
    iget v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBytesRead:I

    const/16 v9, 0xbc

    if-lt v8, v9, :cond_0

    .line 179
    const/4 v8, 0x0

    iput v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBytesRead:I

    .line 180
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 181
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v9, 0xbc

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    .line 183
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    .line 184
    .local v7, "syncByte":I
    const/16 v8, 0x47

    if-ne v7, v8, :cond_0

    .line 188
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v9, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v10, 0x3

    invoke-virtual {v8, v9, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer/util/ParsableBitArray;I)V

    .line 189
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 190
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v5

    .line 191
    .local v5, "payloadUnitStartIndicator":Z
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 192
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v9, 0xd

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v6

    .line 193
    .local v6, "pid":I
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 194
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v0

    .line 195
    .local v0, "adaptationFieldExists":Z
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBit()Z

    move-result v3

    .line 199
    .local v3, "payloadExists":Z
    if-eqz v0, :cond_2

    .line 200
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    .line 201
    .local v1, "adaptationFieldLength":I
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v8, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 205
    .end local v1    # "adaptationFieldLength":I
    :cond_2
    if-eqz v3, :cond_3

    .line 206
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;

    .line 207
    .local v4, "payloadReader":Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;
    if-eqz v4, :cond_3

    .line 208
    iget-object v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v4, v8, v5}, Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;->consume(Lcom/google/android/exoplayer/util/ParsableByteArray;Z)V

    .line 212
    .end local v4    # "payloadReader":Lcom/google/android/exoplayer/hls/parser/TsExtractor$TsPayloadReader;
    :cond_3
    iget-boolean v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    if-nez v8, :cond_0

    .line 213
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->checkPrepared()Z

    move-result v8

    iput-boolean v8, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->prepared:Z

    goto/16 :goto_0
.end method

.method public release()V
    .locals 2

    .prologue
    .line 98
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/TsExtractor;->sampleQueues:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/hls/parser/SampleQueue;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;->release()V

    .line 98
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 101
    :cond_0
    return-void
.end method
