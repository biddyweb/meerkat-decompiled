.class Lcom/google/android/exoplayer/hls/parser/SeiReader;
.super Lcom/google/android/exoplayer/hls/parser/SampleQueue;
.source "SeiReader.java"


# instance fields
.field private final seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 1
    .param p1, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/SampleQueue;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 35
    invoke-static {}, Lcom/google/android/exoplayer/MediaFormat;->createEia608Format()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/hls/parser/SeiReader;->setMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 36
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 37
    return-void
.end method


# virtual methods
.method public read([BIIJ)V
    .locals 8
    .param p1, "data"    # [B
    .param p2, "position"    # I
    .param p3, "limit"    # I
    .param p4, "pesTimeUs"    # J

    .prologue
    const/16 v6, 0xff

    const/4 v5, 0x1

    .line 40
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3, p1, p3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->reset([BI)V

    .line 42
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    add-int/lit8 v4, p2, 0x4

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 45
    :goto_0
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v3

    if-le v3, v5, :cond_3

    .line 47
    const/4 v2, 0x0

    .line 49
    .local v2, "payloadType":I
    :cond_0
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 50
    .local v0, "b":I
    add-int/2addr v2, v0

    .line 51
    if-eq v0, v6, :cond_0

    .line 53
    const/4 v1, 0x0

    .line 55
    .local v1, "payloadSize":I
    :cond_1
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 56
    add-int/2addr v1, v0

    .line 57
    if-eq v0, v6, :cond_1

    .line 59
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v2, v1, v3}, Lcom/google/android/exoplayer/text/eia608/Eia608Parser;->inspectSeiMessage(IILcom/google/android/exoplayer/util/ParsableByteArray;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 60
    invoke-virtual {p0, p4, p5}, Lcom/google/android/exoplayer/hls/parser/SeiReader;->startSample(J)V

    .line 61
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {p0, v3, v1}, Lcom/google/android/exoplayer/hls/parser/SeiReader;->appendData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 62
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/hls/parser/SeiReader;->commitSample(Z)V

    goto :goto_0

    .line 64
    :cond_2
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/parser/SeiReader;->seiBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v3, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    goto :goto_0

    .line 67
    .end local v0    # "b":I
    .end local v1    # "payloadSize":I
    .end local v2    # "payloadType":I
    :cond_3
    return-void
.end method
