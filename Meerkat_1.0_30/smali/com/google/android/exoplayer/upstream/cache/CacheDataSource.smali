.class public final Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;
.super Ljava/lang/Object;
.source "CacheDataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/DataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CacheDataSource"


# instance fields
.field private final blockOnCache:Z

.field private bytesRemaining:J

.field private final cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

.field private final cacheReadDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final cacheWriteDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final eventListener:Lcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;

.field private ignoreCache:Z

.field private final ignoreCacheOnError:Z

.field private key:Ljava/lang/String;

.field private lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

.field private readPosition:J

.field private totalCachedBytesRead:J

.field private final upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/cache/Cache;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSink;ZZLcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;)V
    .locals 1
    .param p1, "cache"    # Lcom/google/android/exoplayer/upstream/cache/Cache;
    .param p2, "upstream"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "cacheReadDataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p4, "cacheWriteDataSink"    # Lcom/google/android/exoplayer/upstream/DataSink;
    .param p5, "blockOnCache"    # Z
    .param p6, "ignoreCacheOnError"    # Z
    .param p7, "eventListener"    # Lcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    .line 114
    iput-object p3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheReadDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 115
    iput-boolean p5, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->blockOnCache:Z

    .line 116
    iput-boolean p6, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->ignoreCacheOnError:Z

    .line 117
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 118
    if-eqz p4, :cond_0

    .line 119
    new-instance v0, Lcom/google/android/exoplayer/upstream/TeeDataSource;

    invoke-direct {v0, p2, p4}, Lcom/google/android/exoplayer/upstream/TeeDataSource;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSink;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheWriteDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 123
    :goto_0
    iput-object p7, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->eventListener:Lcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;

    .line 124
    return-void

    .line 121
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheWriteDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/cache/Cache;Lcom/google/android/exoplayer/upstream/DataSource;ZZ)V
    .locals 8
    .param p1, "cache"    # Lcom/google/android/exoplayer/upstream/cache/Cache;
    .param p2, "upstream"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "blockOnCache"    # Z
    .param p4, "ignoreCacheOnError"    # Z

    .prologue
    .line 80
    const-wide v6, 0x7fffffffffffffffL

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;-><init>(Lcom/google/android/exoplayer/upstream/cache/Cache;Lcom/google/android/exoplayer/upstream/DataSource;ZZJ)V

    .line 81
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/cache/Cache;Lcom/google/android/exoplayer/upstream/DataSource;ZZJ)V
    .locals 9
    .param p1, "cache"    # Lcom/google/android/exoplayer/upstream/cache/Cache;
    .param p2, "upstream"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "blockOnCache"    # Z
    .param p4, "ignoreCacheOnError"    # Z
    .param p5, "maxCacheFileSize"    # J

    .prologue
    .line 90
    new-instance v3, Lcom/google/android/exoplayer/upstream/FileDataSource;

    invoke-direct {v3}, Lcom/google/android/exoplayer/upstream/FileDataSource;-><init>()V

    new-instance v4, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;

    invoke-direct {v4, p1, p5, p6}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink;-><init>(Lcom/google/android/exoplayer/upstream/cache/Cache;J)V

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;-><init>(Lcom/google/android/exoplayer/upstream/cache/Cache;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSink;ZZLcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;)V

    .line 92
    return-void
.end method

.method private closeCurrentSource()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 228
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    if-nez v0, :cond_1

    .line 240
    :cond_0
    :goto_0
    return-void

    .line 232
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 233
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/upstream/cache/Cache;->releaseHoleSpan(Lcom/google/android/exoplayer/upstream/cache/CacheSpan;)V

    .line 237
    iput-object v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    goto :goto_0

    .line 235
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    if-eqz v1, :cond_2

    .line 236
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer/upstream/cache/Cache;->releaseHoleSpan(Lcom/google/android/exoplayer/upstream/cache/CacheSpan;)V

    .line 237
    iput-object v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    :cond_2
    throw v0
.end method

.method private handleBeforeThrow(Ljava/io/IOException;)V
    .locals 2
    .param p1, "exception"    # Ljava/io/IOException;

    .prologue
    .line 243
    iget-boolean v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->ignoreCacheOnError:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheReadDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    if-eq v0, v1, :cond_0

    instance-of v0, p1, Lcom/google/android/exoplayer/upstream/cache/CacheDataSink$CacheDataSinkException;

    if-eqz v0, :cond_1

    .line 246
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->ignoreCache:Z

    .line 248
    :cond_1
    return-void
.end method

.method private notifyBytesRead()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 251
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->eventListener:Lcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->totalCachedBytesRead:J

    cmp-long v0, v0, v6

    if-lez v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->eventListener:Lcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    invoke-interface {v1}, Lcom/google/android/exoplayer/upstream/cache/Cache;->getCacheSpace()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->totalCachedBytesRead:J

    invoke-interface {v0, v2, v3, v4, v5}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource$EventListener;->onCachedBytesRead(JJ)V

    .line 253
    iput-wide v6, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->totalCachedBytesRead:J

    .line 255
    :cond_0
    return-void
.end method

.method private openNextSource()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->ignoreCache:Z

    if-eqz v4, :cond_0

    .line 189
    const/16 v19, 0x0

    .line 200
    .local v19, "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    :goto_0
    if-nez v19, :cond_3

    .line 203
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 204
    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->uri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->key:Ljava/lang/String;

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 220
    .local v2, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v4, v2}, Lcom/google/android/exoplayer/upstream/DataSource;->open(Lcom/google/android/exoplayer/upstream/DataSpec;)J

    .line 225
    return-void

    .line 190
    .end local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    :cond_0
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    const-wide/16 v12, -0x1

    cmp-long v4, v4, v12

    if-nez v4, :cond_1

    .line 193
    const-string v4, "CacheDataSource"

    const-string v5, "Cache bypassed due to unbounded length."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    const/16 v19, 0x0

    .restart local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    goto :goto_0

    .line 195
    .end local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->blockOnCache:Z

    if-eqz v4, :cond_2

    .line 196
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->key:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    invoke-interface {v4, v5, v12, v13}, Lcom/google/android/exoplayer/upstream/cache/Cache;->startReadWrite(Ljava/lang/String;J)Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    move-result-object v19

    .restart local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    goto :goto_0

    .line 198
    .end local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cache:Lcom/google/android/exoplayer/upstream/cache/Cache;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->key:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    invoke-interface {v4, v5, v12, v13}, Lcom/google/android/exoplayer/upstream/cache/Cache;->startReadWriteNonBlocking(Ljava/lang/String;J)Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    move-result-object v19

    .restart local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    goto :goto_0

    .line 205
    :cond_3
    move-object/from16 v0, v19

    iget-boolean v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheSpan;->isCached:Z

    if-eqz v4, :cond_4

    .line 207
    move-object/from16 v0, v19

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheSpan;->file:Ljava/io/File;

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    .line 208
    .local v3, "fileUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    move-object/from16 v0, v19

    iget-wide v12, v0, Lcom/google/android/exoplayer/upstream/cache/CacheSpan;->position:J

    sub-long v9, v4, v12

    .line 209
    .local v9, "filePosition":J
    move-object/from16 v0, v19

    iget-wide v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheSpan;->length:J

    sub-long/2addr v4, v9

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    invoke-static {v4, v5, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    .line 210
    .local v6, "length":J
    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->key:Ljava/lang/String;

    invoke-direct/range {v2 .. v10}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;J)V

    .line 211
    .restart local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheReadDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 221
    .end local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v3    # "fileUri":Landroid/net/Uri;
    .end local v6    # "length":J
    .end local v9    # "filePosition":J
    .end local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    :catch_0
    move-exception v11

    .line 223
    .local v11, "e":Ljava/lang/InterruptedException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 214
    .end local v11    # "e":Ljava/lang/InterruptedException;
    .restart local v19    # "span":Lcom/google/android/exoplayer/upstream/cache/CacheSpan;
    :cond_4
    :try_start_1
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->lockedSpan:Lcom/google/android/exoplayer/upstream/cache/CacheSpan;

    .line 215
    invoke-virtual/range {v19 .. v19}, Lcom/google/android/exoplayer/upstream/cache/CacheSpan;->isOpenEnded()Z

    move-result v4

    if-eqz v4, :cond_5

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    .line 216
    .restart local v6    # "length":J
    :goto_2
    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->uri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->key:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object v12, v2

    move-wide/from16 v16, v6

    invoke-direct/range {v12 .. v18}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 217
    .restart local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheWriteDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    if-eqz v4, :cond_6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheWriteDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    :goto_3
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    goto/16 :goto_1

    .line 215
    .end local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v6    # "length":J
    :cond_5
    move-object/from16 v0, v19

    iget-wide v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheSpan;->length:J

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    invoke-static {v4, v5, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    goto :goto_2

    .line 217
    .restart local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .restart local v6    # "length":J
    :cond_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3
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
    .line 170
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->notifyBytesRead()V

    .line 172
    :try_start_0
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->closeCurrentSource()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    return-void

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->handleBeforeThrow(Ljava/io/IOException;)V

    .line 175
    throw v0
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .locals 4
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-boolean v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uriIsFullStream:Z

    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 130
    :try_start_0
    iget-object v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    iput-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->uri:Landroid/net/Uri;

    .line 131
    iget-object v1, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    iput-object v1, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->key:Ljava/lang/String;

    .line 132
    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    .line 133
    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    .line 134
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->openNextSource()V

    .line 135
    iget-wide v2, p1, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v2

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->handleBeforeThrow(Ljava/io/IOException;)V

    .line 138
    throw v0
.end method

.method public read([BII)I
    .locals 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "max"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, -0x1

    .line 145
    :try_start_0
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v2, p1, p2, p3}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v0

    .line 146
    .local v0, "bytesRead":I
    if-ltz v0, :cond_2

    .line 147
    iget-object v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->currentDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    iget-object v3, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->cacheReadDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    if-ne v2, v3, :cond_0

    .line 148
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->totalCachedBytesRead:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->totalCachedBytesRead:J

    .line 150
    :cond_0
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->readPosition:J

    .line 151
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    cmp-long v2, v2, v6

    if-eqz v2, :cond_1

    .line 152
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    .line 161
    .end local v0    # "bytesRead":I
    :cond_1
    :goto_0
    return v0

    .line 155
    .restart local v0    # "bytesRead":I
    :cond_2
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->closeCurrentSource()V

    .line 156
    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->bytesRemaining:J

    cmp-long v2, v2, v6

    if-eqz v2, :cond_1

    .line 157
    invoke-direct {p0}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->openNextSource()V

    .line 158
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->read([BII)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 162
    .end local v0    # "bytesRead":I
    :catch_0
    move-exception v1

    .line 163
    .local v1, "e":Ljava/io/IOException;
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/upstream/cache/CacheDataSource;->handleBeforeThrow(Ljava/io/IOException;)V

    .line 164
    throw v1
.end method
