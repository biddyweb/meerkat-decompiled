.class public abstract Lcom/google/android/exoplayer/hls/HlsChunk;
.super Ljava/lang/Object;
.source "HlsChunk.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/Loader$Loadable;


# instance fields
.field protected final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field protected final dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .locals 4
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iget-wide v0, p2, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 43
    invoke-static {p1}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSource;

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunk;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 44
    invoke-static {p2}, Lcom/google/android/exoplayer/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 45
    return-void

    .line 42
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public abstract consume()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isLoadFinished()Z
.end method
