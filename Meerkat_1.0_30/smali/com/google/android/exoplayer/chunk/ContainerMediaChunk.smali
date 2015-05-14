.class public final Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;
.super Lcom/google/android/exoplayer/chunk/MediaChunk;
.source "ContainerMediaChunk.java"


# instance fields
.field private final extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

.field private final maybeSelfContained:Z

.field private mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

.field private prepared:Z

.field private psshInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation
.end field

.field private final sampleOffsetUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/chunk/parser/Extractor;Ljava/util/Map;ZJ)V
    .locals 1
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "trigger"    # I
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "nextChunkIndex"    # I
    .param p10, "extractor"    # Lcom/google/android/exoplayer/chunk/parser/Extractor;
    .param p12, "maybeSelfContained"    # Z
    .param p13, "sampleOffsetUs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/upstream/DataSpec;",
            "Lcom/google/android/exoplayer/chunk/Format;",
            "IJJI",
            "Lcom/google/android/exoplayer/chunk/parser/Extractor;",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;ZJ)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p11, "psshInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    invoke-direct/range {p0 .. p9}, Lcom/google/android/exoplayer/chunk/MediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJI)V

    .line 75
    iput-object p10, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    .line 76
    iput-boolean p12, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->maybeSelfContained:Z

    .line 77
    iput-wide p13, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    .line 78
    iput-object p11, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->psshInfo:Ljava/util/Map;

    .line 79
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/chunk/parser/Extractor;ZJ)V
    .locals 17
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "trigger"    # I
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "nextChunkIndex"    # I
    .param p10, "extractor"    # Lcom/google/android/exoplayer/chunk/parser/Extractor;
    .param p11, "maybeSelfContained"    # Z
    .param p12, "sampleOffsetUs"    # J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 50
    const/4 v12, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    move/from16 v10, p9

    move-object/from16 v11, p10

    move/from16 v13, p11

    move-wide/from16 v14, p12

    invoke-direct/range {v1 .. v15}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/chunk/parser/Extractor;Ljava/util/Map;ZJ)V

    .line 52
    return-void
.end method


# virtual methods
.method public getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

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
    .line 149
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->psshInfo:Ljava/util/Map;

    return-object v0
.end method

.method public prepare()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 99
    iget-boolean v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->prepared:Z

    if-nez v3, :cond_0

    .line 100
    iget-boolean v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->maybeSelfContained:Z

    if-eqz v3, :cond_3

    .line 103
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getNonBlockingInputStream()Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    move-result-object v1

    .line 104
    .local v1, "inputStream":Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    if-eqz v1, :cond_1

    move v3, v4

    :goto_0
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 105
    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    const/4 v6, 0x0

    invoke-interface {v3, v1, v6}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->read(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v2

    .line 106
    .local v2, "result":I
    and-int/lit8 v3, v2, 0x20

    if-eqz v3, :cond_2

    :goto_1
    iput-boolean v4, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->prepared:Z

    .line 112
    .end local v1    # "inputStream":Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .end local v2    # "result":I
    :goto_2
    iget-boolean v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->prepared:Z

    if-eqz v3, :cond_0

    .line 113
    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    invoke-interface {v3}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->getFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    .line 114
    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    invoke-interface {v3}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->getPsshInfo()Ljava/util/Map;

    move-result-object v0

    .line 115
    .local v0, "extractorPsshInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    if-eqz v0, :cond_0

    .line 116
    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->psshInfo:Ljava/util/Map;

    .line 120
    .end local v0    # "extractorPsshInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    :cond_0
    iget-boolean v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->prepared:Z

    return v3

    .restart local v1    # "inputStream":Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    :cond_1
    move v3, v5

    .line 104
    goto :goto_0

    .restart local v2    # "result":I
    :cond_2
    move v4, v5

    .line 106
    goto :goto_1

    .line 110
    .end local v1    # "inputStream":Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .end local v2    # "result":I
    :cond_3
    iput-boolean v4, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->prepared:Z

    goto :goto_2
.end method

.method public read(Lcom/google/android/exoplayer/SampleHolder;)Z
    .locals 8
    .param p1, "holder"    # Lcom/google/android/exoplayer/SampleHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 132
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getNonBlockingInputStream()Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    move-result-object v0

    .line 133
    .local v0, "inputStream":Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    if-eqz v0, :cond_1

    move v3, v4

    :goto_0
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 134
    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    invoke-interface {v3, v0, p1}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->read(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v1

    .line 135
    .local v1, "result":I
    and-int/lit8 v3, v1, 0x4

    if-eqz v3, :cond_2

    move v2, v4

    .line 136
    .local v2, "sampleRead":Z
    :goto_1
    if-eqz v2, :cond_0

    .line 137
    iget-wide v4, p1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    iget-wide v6, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    sub-long/2addr v4, v6

    iput-wide v4, p1, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 139
    :cond_0
    return v2

    .end local v1    # "result":I
    .end local v2    # "sampleRead":Z
    :cond_1
    move v3, v5

    .line 133
    goto :goto_0

    .restart local v1    # "result":I
    :cond_2
    move v2, v5

    .line 135
    goto :goto_1
.end method

.method public sampleAvailable()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->getNonBlockingInputStream()Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    move-result-object v0

    .line 126
    .local v0, "inputStream":Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    const/4 v3, 0x0

    invoke-interface {v2, v0, v3}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->read(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v1

    .line 127
    .local v1, "result":I
    and-int/lit8 v2, v1, 0x20

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public seekTo(JZ)Z
    .locals 7
    .param p1, "positionUs"    # J
    .param p3, "allowNoop"    # Z

    .prologue
    .line 89
    iget-wide v4, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    add-long v2, p1, v4

    .line 90
    .local v2, "seekTimeUs":J
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    invoke-interface {v1, v2, v3, p3}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->seekTo(JZ)Z

    move-result v0

    .line 91
    .local v0, "isDiscontinuous":Z
    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->resetReadPosition()V

    .line 94
    :cond_0
    return v0
.end method

.method public seekToStart()V
    .locals 4

    .prologue
    .line 83
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    invoke-interface {v0, v2, v3, v1}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->seekTo(JZ)Z

    .line 84
    invoke-virtual {p0}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;->resetReadPosition()V

    .line 85
    return-void
.end method
