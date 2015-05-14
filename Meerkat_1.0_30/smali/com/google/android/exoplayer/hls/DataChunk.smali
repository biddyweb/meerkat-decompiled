.class public abstract Lcom/google/android/exoplayer/hls/DataChunk;
.super Lcom/google/android/exoplayer/hls/HlsChunk;
.source "DataChunk.java"


# static fields
.field private static final READ_GRANULARITY:I = 0x4000


# instance fields
.field private data:[B

.field private limit:I

.field private volatile loadCanceled:Z

.field private volatile loadFinished:Z


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;[B)V
    .locals 0
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "data"    # [B

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/hls/HlsChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    .line 48
    iput-object p3, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    .line 49
    return-void
.end method

.method private maybeExpandData()V
    .locals 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    if-nez v0, :cond_1

    .line 109
    const/16 v0, 0x4000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    .line 115
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    array-length v0, v0

    iget v1, p0, Lcom/google/android/exoplayer/hls/DataChunk;->limit:I

    add-int/lit16 v1, v1, 0x4000

    if-ge v0, v1, :cond_0

    .line 113
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    array-length v1, v1

    add-int/lit16 v1, v1, 0x4000

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    goto :goto_0
.end method


# virtual methods
.method public final cancelLoad()V
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->loadCanceled:Z

    .line 81
    return-void
.end method

.method public consume()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    iget v1, p0, Lcom/google/android/exoplayer/hls/DataChunk;->limit:I

    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer/hls/DataChunk;->consume([BI)V

    .line 54
    return-void
.end method

.method protected abstract consume([BI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final isLoadCanceled()Z
    .locals 1

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->loadCanceled:Z

    return v0
.end method

.method public isLoadFinished()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/DataChunk;->loadFinished:Z

    return v0
.end method

.method public final load()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v6, -0x1

    .line 91
    :try_start_0
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/DataChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-interface {v2, v3}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    .line 92
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->limit:I

    .line 93
    const/4 v0, 0x0

    .line 94
    .local v0, "bytesRead":I
    :cond_0
    :goto_0
    if-eq v0, v6, :cond_1

    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->loadCanceled:Z

    if-nez v2, :cond_1

    .line 95
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/DataChunk;->maybeExpandData()V

    .line 96
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/DataChunk;->data:[B

    iget v4, p0, Lcom/google/android/exoplayer/hls/DataChunk;->limit:I

    const/16 v5, 0x4000

    invoke-interface {v2, v3, v4, v5}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v0

    .line 97
    if-eq v0, v6, :cond_0

    .line 98
    iget v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->limit:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->limit:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 103
    .end local v0    # "bytesRead":I
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v2}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    throw v1

    .line 101
    .restart local v0    # "bytesRead":I
    :cond_1
    :try_start_1
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/DataChunk;->loadCanceled:Z

    if-nez v2, :cond_2

    const/4 v1, 0x1

    :cond_2
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/DataChunk;->loadFinished:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/DataChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 105
    return-void
.end method
