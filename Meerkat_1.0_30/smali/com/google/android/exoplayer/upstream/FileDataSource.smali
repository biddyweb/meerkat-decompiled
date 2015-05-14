.class public final Lcom/google/android/exoplayer/upstream/FileDataSource;
.super Ljava/lang/Object;
.source "FileDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/DataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
    }
.end annotation


# instance fields
.field private bytesRemaining:J

.field private file:Ljava/io/RandomAccessFile;

.field private final listener:Lcom/google/android/exoplayer/upstream/TransferListener;

.field private opened:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/upstream/FileDataSource;-><init>(Lcom/google/android/exoplayer/upstream/TransferListener;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/TransferListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/google/android/exoplayer/upstream/TransferListener;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    .line 59
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 105
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    if-eqz v1, :cond_0

    .line 107
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 113
    iget-boolean v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    if-eqz v1, :cond_0

    .line 114
    iput-boolean v3, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    .line 115
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v1, :cond_0

    .line 116
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    .line 121
    :cond_0
    return-void

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v1, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    iput-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 113
    iget-boolean v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    if-eqz v2, :cond_1

    .line 114
    iput-boolean v3, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    .line 115
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v2, :cond_1

    .line 116
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v2}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferEnd()V

    :cond_1
    throw v1
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .locals 6
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    .line 64
    :try_start_0
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    .line 65
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 66
    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    iget-wide v4, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    sub-long/2addr v2, v4

    :goto_0
    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->opened:Z

    .line 73
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v1, :cond_0

    .line 74
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/TransferListener;->onTransferStart()V

    .line 77
    :cond_0
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    return-wide v2

    .line 66
    :cond_1
    :try_start_1
    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 68
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;

    invoke-direct {v1, v0}, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public read([BII)I
    .locals 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;
        }
    .end annotation

    .prologue
    .line 82
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    .line 83
    const/4 v0, -0x1

    .line 99
    :cond_0
    :goto_0
    return v0

    .line 85
    :cond_1
    const/4 v0, 0x0

    .line 87
    .local v0, "bytesRead":I
    :try_start_0
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->file:Ljava/io/RandomAccessFile;

    iget-wide v4, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    int-to-long v6, p3

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {v2, p1, p2, v3}, Ljava/io/RandomAccessFile;->read([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 92
    if-lez v0, :cond_0

    .line 93
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->bytesRemaining:J

    .line 94
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    if-eqz v2, :cond_0

    .line 95
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/FileDataSource;->listener:Lcom/google/android/exoplayer/upstream/TransferListener;

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer/upstream/TransferListener;->onBytesTransferred(I)V

    goto :goto_0

    .line 88
    :catch_0
    move-exception v1

    .line 89
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;

    invoke-direct {v2, v1}, Lcom/google/android/exoplayer/upstream/FileDataSource$FileDataSourceException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method
