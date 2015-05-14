.class public abstract Lcom/google/android/exoplayer/chunk/MediaChunk;
.super Lcom/google/android/exoplayer/chunk/Chunk;
.source "MediaChunk.java"


# instance fields
.field public final endTimeUs:J

.field public final nextChunkIndex:I

.field public final startTimeUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJI)V
    .locals 1
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p3, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p4, "trigger"    # I
    .param p5, "startTimeUs"    # J
    .param p7, "endTimeUs"    # J
    .param p9, "nextChunkIndex"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/chunk/Chunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;I)V

    .line 59
    iput-wide p5, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->startTimeUs:J

    .line 60
    iput-wide p7, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->endTimeUs:J

    .line 61
    iput p9, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->nextChunkIndex:I

    .line 62
    return-void
.end method


# virtual methods
.method public abstract getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;
.end method

.method public abstract getPsshInfo()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation
.end method

.method public final isLastChunk()Z
    .locals 2

    .prologue
    .line 70
    iget v0, p0, Lcom/google/android/exoplayer/chunk/MediaChunk;->nextChunkIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract prepare()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract read(Lcom/google/android/exoplayer/SampleHolder;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract sampleAvailable()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation
.end method

.method public abstract seekTo(JZ)Z
.end method

.method public abstract seekToStart()V
.end method
