.class public abstract Lcom/google/android/exoplayer/chunk/Chunk;
.super Ljava/lang/Object;
.source "Chunk.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Loader$Loadable;


# instance fields
.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

.field private final dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

.field public final format:Lcom/google/android/exoplayer/chunk/Format;

.field public final trigger:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;I)V
    .locals 4
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "trigger"    # I

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iget-wide v0, p2, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 64
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 65
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 66
    invoke-static {p3}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/chunk/Format;

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    .line 67
    iput p4, p0, Lcom/google/android/exoplayer/chunk/Chunk;->trigger:I

    .line 68
    return-void

    .line 63
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final bytesLoaded()J
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->getLoadPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public final cancelLoad()V
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->cancelLoad()V

    .line 168
    return-void
.end method

.method public final consume()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 135
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/chunk/Chunk;->consumeStream(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)V

    .line 136
    return-void

    .line 134
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected consumeStream(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)V
    .locals 0
    .param p1, "stream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    return-void
.end method

.method public final getLength()J
    .locals 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->getLength()J

    move-result-wide v0

    return-wide v0
.end method

.method protected final getNonBlockingInputStream()Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    return-object v0
.end method

.method public final init(Lcom/google/android/exoplayer/upstream/Allocator;)V
    .locals 3
    .param p1, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 78
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSourceStream;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-direct {v0, v1, v2, p1}, Lcom/google/android/exoplayer/upstream/DataSourceStream;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/upstream/Allocator;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    .line 79
    return-void

    .line 77
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isLoadCanceled()Z
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->isLoadCanceled()Z

    move-result v0

    return v0
.end method

.method public final isLoadFinished()Z
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->isLoadFinished()Z

    move-result v0

    return v0
.end method

.method public final isReadFinished()Z
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->isEndOfStream()Z

    move-result v0

    return v0
.end method

.method public final load()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 177
    const-string v0, "chunkLoad"

    invoke-static {v0}, Lcom/google/android/exoplayer/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 179
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->load()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    .line 183
    return-void

    .line 181
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/google/android/exoplayer/util/TraceUtil;->endSection()V

    throw v0
.end method

.method public final release()V
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->close()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    .line 89
    :cond_0
    return-void
.end method

.method protected final resetReadPosition()V
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/Chunk;->dataSourceStream:Lcom/google/android/exoplayer/upstream/DataSourceStream;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/upstream/DataSourceStream;->resetReadPosition()V

    .line 161
    :cond_0
    return-void
.end method
