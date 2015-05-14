.class public final Lcom/google/android/exoplayer/hls/TsChunk;
.super Lcom/google/android/exoplayer/hls/HlsChunk;
.source "TsChunk.java"


# static fields
.field private static final SCRATCH_SPACE:[B


# instance fields
.field public final chunkIndex:I

.field public final endTimeUs:J

.field public final extractor:Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

.field public final isLastChunk:Z

.field private volatile loadCanceled:Z

.field private volatile loadFinished:Z

.field private loadPosition:I

.field public final startTimeUs:J

.field public final variantIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/16 v0, 0x1000

    new-array v0, v0, [B

    sput-object v0, Lcom/google/android/exoplayer/hls/TsChunk;->SCRATCH_SPACE:[B

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/hls/parser/HlsExtractor;IJJIZ)V
    .locals 1
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "extractor"    # Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    .param p4, "variantIndex"    # I
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "chunkIndex"    # I
    .param p10, "isLastChunk"    # Z

    .prologue
    .line 72
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/hls/HlsChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    .line 73
    iput-object p3, p0, Lcom/google/android/exoplayer/hls/TsChunk;->extractor:Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .line 74
    iput p4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->variantIndex:I

    .line 75
    iput-wide p5, p0, Lcom/google/android/exoplayer/hls/TsChunk;->startTimeUs:J

    .line 76
    iput-wide p7, p0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    .line 77
    iput p9, p0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    .line 78
    iput-boolean p10, p0, Lcom/google/android/exoplayer/hls/TsChunk;->isLastChunk:Z

    .line 79
    return-void
.end method


# virtual methods
.method public cancelLoad()V
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

    .line 96
    return-void
.end method

.method public consume()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    return-void
.end method

.method public isLoadCanceled()Z
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

    return v0
.end method

.method public isLoadFinished()Z
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadFinished:Z

    return v0
.end method

.method public load()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v7, -0x1

    .line 106
    :try_start_0
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-interface {v4, v5}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    .line 107
    const/4 v0, 0x0

    .line 108
    .local v0, "bytesRead":I
    const/4 v1, 0x0

    .line 114
    .local v1, "bytesSkipped":I
    :cond_0
    :goto_0
    if-eq v0, v7, :cond_1

    iget-boolean v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

    if-nez v4, :cond_1

    iget v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadPosition:I

    if-ge v1, v4, :cond_1

    .line 115
    iget v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadPosition:I

    sub-int/2addr v4, v1

    sget-object v5, Lcom/google/android/exoplayer/hls/TsChunk;->SCRATCH_SPACE:[B

    array-length v5, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 116
    .local v2, "skipLength":I
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    sget-object v5, Lcom/google/android/exoplayer/hls/TsChunk;->SCRATCH_SPACE:[B

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6, v2}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v0

    .line 117
    if-eq v0, v7, :cond_0

    .line 118
    add-int/2addr v1, v0

    goto :goto_0

    .line 122
    .end local v2    # "skipLength":I
    :cond_1
    :goto_1
    if-eq v0, v7, :cond_2

    iget-boolean v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

    if-nez v4, :cond_2

    .line 123
    iget-object v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->extractor:Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;->read(Lcom/google/android/exoplayer/upstream/DataSource;)I

    move-result v0

    .line 124
    if-eq v0, v7, :cond_1

    .line 125
    iget v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadPosition:I

    add-int/2addr v4, v0

    iput v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadPosition:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 130
    .end local v0    # "bytesRead":I
    .end local v1    # "bytesSkipped":I
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v4}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    throw v3

    .line 128
    .restart local v0    # "bytesRead":I
    .restart local v1    # "bytesSkipped":I
    :cond_2
    :try_start_1
    iget-boolean v4, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadCanceled:Z

    if-nez v4, :cond_3

    const/4 v3, 0x1

    :cond_3
    iput-boolean v3, p0, Lcom/google/android/exoplayer/hls/TsChunk;->loadFinished:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/TsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v3}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 132
    return-void
.end method
