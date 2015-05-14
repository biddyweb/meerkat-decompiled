.class final Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;
.super Ljava/io/FilterInputStream;
.source "ByteStreams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/utils/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LimitedInputStream"
.end annotation


# instance fields
.field private left:J

.field private mark:J


# direct methods
.method constructor <init>(Ljava/io/InputStream;J)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "limit"    # J

    .prologue
    .line 588
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 585
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->mark:J

    .line 589
    invoke-static {p1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 590
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "limit must be non-negative"

    invoke-static {v0, v1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 591
    iput-wide p2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    .line 592
    return-void

    .line 590
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public available()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 595
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    int-to-long v0, v0

    iget-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public declared-synchronized mark(I)V
    .locals 2
    .param p1, "readLimit"    # I

    .prologue
    .line 600
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 601
    iget-wide v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    iput-wide v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->mark:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 602
    monitor-exit p0

    return-void

    .line 600
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 605
    iget-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    move v0, v1

    .line 613
    :cond_0
    :goto_0
    return v0

    .line 609
    :cond_1
    iget-object v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 610
    .local v0, "result":I
    if-eq v0, v1, :cond_0

    .line 611
    iget-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    const-wide/16 v4, 0x1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    goto :goto_0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 617
    iget-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    move v0, v1

    .line 626
    :cond_0
    :goto_0
    return v0

    .line 621
    :cond_1
    int-to-long v2, p3

    iget-wide v4, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    .line 622
    iget-object v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 623
    .local v0, "result":I
    if-eq v0, v1, :cond_0

    .line 624
    iget-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    goto :goto_0
.end method

.method public declared-synchronized reset()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 630
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-nez v0, :cond_0

    .line 631
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mark not supported"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 630
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 633
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->mark:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 634
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mark not set"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 637
    :cond_1
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 638
    iget-wide v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->mark:J

    iput-wide v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 639
    monitor-exit p0

    return-void
.end method

.method public skip(J)J
    .locals 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 642
    iget-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    .line 643
    iget-object v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 644
    .local v0, "skipped":J
    iget-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    sub-long/2addr v2, v0

    iput-wide v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$LimitedInputStream;->left:J

    .line 645
    return-wide v0
.end method
