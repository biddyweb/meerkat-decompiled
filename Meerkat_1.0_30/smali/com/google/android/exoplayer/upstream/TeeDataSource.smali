.class public final Lcom/google/android/exoplayer/upstream/TeeDataSource;
.super Ljava/lang/Object;
.source "TeeDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/DataSource;


# instance fields
.field private final dataSink:Lcom/google/android/exoplayer/upstream/DataSink;

.field private final upstream:Lcom/google/android/exoplayer/upstream/DataSource;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSink;)V
    .locals 1
    .param p1, "upstream"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSink"    # Lcom/google/android/exoplayer/upstream/DataSink;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->upstream:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 37
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSink;

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->dataSink:Lcom/google/android/exoplayer/upstream/DataSink;

    .line 38
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->upstream:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 65
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->dataSink:Lcom/google/android/exoplayer/upstream/DataSink;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/DataSink;->close()V

    .line 66
    return-void
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .locals 10
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, -0x1

    .line 42
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->upstream:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1, p1}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    move-result-wide v4

    .line 43
    .local v4, "dataLength":J
    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    cmp-long v1, v2, v6

    if-nez v1, :cond_0

    cmp-long v1, v4, v6

    if-eqz v1, :cond_0

    .line 45
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    iget-object v6, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    iget-wide v7, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    iget-boolean v9, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uriIsFullStream:Z

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;JZ)V

    .end local p1    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .local v0, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object p1, v0

    .line 48
    .end local v0    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .restart local p1    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->dataSink:Lcom/google/android/exoplayer/upstream/DataSink;

    invoke-interface {v1, p1}, Lcom/google/android/exoplayer/upstream/DataSink;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)Lcom/google/android/exoplayer/upstream/DataSink;

    .line 49
    return-wide v4
.end method

.method public read([BII)I
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "max"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->upstream:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v1, p1, p2, p3}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v0

    .line 55
    .local v0, "num":I
    if-lez v0, :cond_0

    .line 57
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/TeeDataSource;->dataSink:Lcom/google/android/exoplayer/upstream/DataSink;

    invoke-interface {v1, p1, p2, v0}, Lcom/google/android/exoplayer/upstream/DataSink;->write([BII)V

    .line 59
    :cond_0
    return v0
.end method
