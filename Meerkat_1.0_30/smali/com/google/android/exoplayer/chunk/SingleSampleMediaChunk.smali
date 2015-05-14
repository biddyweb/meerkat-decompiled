.class public Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;
.super Lcom/google/android/exoplayer/chunk/MediaChunk;
.source "SingleSampleMediaChunk.java"


# instance fields
.field public final headerData:[B

.field private final sampleFormat:Lcom/google/android/exoplayer/MediaFormat;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/MediaFormat;)V
    .locals 13
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "trigger"    # I
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "nextChunkIndex"    # I
    .param p10, "sampleFormat"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 52
    const/4 v12, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    move/from16 v10, p9

    move-object/from16 v11, p10

    invoke-direct/range {v1 .. v12}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/MediaFormat;[B)V

    .line 54
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/MediaFormat;[B)V
    .locals 1
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "trigger"    # I
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "nextChunkIndex"    # I
    .param p10, "sampleFormat"    # Lcom/google/android/exoplayer/MediaFormat;
    .param p11, "headerData"    # [B

    .prologue
    .line 72
    invoke-direct/range {p0 .. p9}, Lcom/google/android/exoplayer/chunk/MediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJI)V

    .line 73
    iput-object p10, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->sampleFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 74
    iput-object p11, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->headerData:[B

    .line 75
    return-void
.end method


# virtual methods
.method public getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->sampleFormat:Lcom/google/android/exoplayer/MediaFormat;

    return-object v0
.end method

.method public getPsshInfo()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation

    .prologue
    .line 136
    const/4 v0, 0x0

    return-object v0
.end method

.method public prepare()Z
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x1

    return v0
.end method

.method public read(Lcom/google/android/exoplayer/SampleHolder;)Z
    .locals 10
    .param p1, "holder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 89
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->getNonBlockingInputStream()Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    move-result-object v2

    .line 90
    .local v2, "inputStream":Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    if-eqz v2, :cond_0

    move v4, v5

    :goto_0
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 91
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->sampleAvailable()Z

    move-result v4

    if-nez v4, :cond_1

    .line 115
    :goto_1
    return v6

    :cond_0
    move v4, v6

    .line 90
    goto :goto_0

    .line 94
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->bytesLoaded()J

    move-result-wide v8

    long-to-int v0, v8

    .line 95
    .local v0, "bytesLoaded":I
    move v3, v0

    .line 96
    .local v3, "sampleSize":I
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->headerData:[B

    if-eqz v4, :cond_2

    .line 97
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->headerData:[B

    array-length v4, v4

    add-int/2addr v3, v4

    .line 99
    :cond_2
    iget-object v4, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_3

    iget-object v4, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    if-ge v4, v3, :cond_4

    .line 100
    :cond_3
    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer/SampleHolder;->replaceBuffer(I)Z

    .line 103
    :cond_4
    iget-object v4, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_7

    .line 104
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->headerData:[B

    if-eqz v4, :cond_5

    .line 105
    iget-object v4, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    iget-object v7, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->headerData:[B

    invoke-virtual {v4, v7}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 107
    :cond_5
    iget-object v4, p1, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-interface {v2, v4, v0}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->read(Ljava/nio/ByteBuffer;I)I

    move-result v1

    .line 108
    .local v1, "bytesRead":I
    iput v3, p1, Lcom/google/android/exoplayer/SampleHolder;->size:I

    .line 113
    :goto_2
    if-ne v1, v0, :cond_6

    move v6, v5

    :cond_6
    invoke-static {v6}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 114
    iget-wide v6, p0, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->startTimeUs:J

    iput-wide v6, p1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    move v6, v5

    .line 115
    goto :goto_1

    .line 110
    .end local v1    # "bytesRead":I
    :cond_7
    invoke-interface {v2, v0}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->skip(I)I

    move-result v1

    .line 111
    .restart local v1    # "bytesRead":I
    iput v6, p1, Lcom/google/android/exoplayer/SampleHolder;->size:I

    goto :goto_2
.end method

.method public sampleAvailable()Z
    .locals 1

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->isLoadFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->isReadFinished()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public seekTo(JZ)Z
    .locals 1
    .param p1, "positionUs"    # J
    .param p3, "allowNoop"    # Z

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->resetReadPosition()V

    .line 126
    const/4 v0, 0x1

    return v0
.end method

.method public seekToStart()V
    .locals 0

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;->resetReadPosition()V

    .line 121
    return-void
.end method
