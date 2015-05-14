.class Lcom/google/android/exoplayer/hls/parser/Id3Reader;
.super Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
.source "Id3Reader.java"


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 1
    .param p1, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 29
    invoke-static {}, Lcom/google/android/exoplayer/MediaFormat;->createId3Format()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/hls/parser/Id3Reader;->setMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 30
    return-void
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;JZ)V
    .locals 2
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "pesTimeUs"    # J
    .param p4, "startOfPacket"    # Z

    .prologue
    .line 34
    if-eqz p4, :cond_0

    .line 35
    invoke-virtual {p0, p2, p3}, Lcom/google/android/exoplayer/hls/parser/Id3Reader;->startSample(J)V

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/parser/Id3Reader;->writingSample()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 38
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer/hls/parser/Id3Reader;->appendData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 40
    :cond_1
    return-void
.end method

.method public packetFinished()V
    .locals 1

    .prologue
    .line 44
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/hls/parser/Id3Reader;->commitSample(Z)V

    .line 45
    return-void
.end method
