.class abstract Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
.super Lcom/google/android/exoplayer/hls/parser/SampleQueue;
.source "ElementaryStreamReader.java"


# direct methods
.method protected constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 0
    .param p1, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 28
    return-void
.end method


# virtual methods
.method public abstract consume(Lcom/google/android/exoplayer/util/ParsableByteArray;JZ)V
.end method

.method public abstract packetFinished()V
.end method
