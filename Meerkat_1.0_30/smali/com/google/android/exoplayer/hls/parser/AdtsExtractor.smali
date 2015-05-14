.class public Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;
.super Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
.source "AdtsExtractor.java"


# static fields
.field private static final MAX_PACKET_SIZE:I = 0xc8


# instance fields
.field private final adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

.field private firstPacket:Z

.field private final firstSampleTimestamp:J

.field private final packetBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private volatile prepared:Z


# direct methods
.method public constructor <init>(ZJLcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 2
    .param p1, "shouldSpliceIn"    # Z
    .param p2, "firstSampleTimestamp"    # J
    .param p4, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/HlsExtractor;-><init>(Z)V

    .line 46
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->firstSampleTimestamp:J

    .line 47
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v1, 0xc8

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->packetBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 48
    new-instance v0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-direct {v0, p4}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->firstPacket:Z

    .line 50
    return-void
.end method


# virtual methods
.method public discardUntil(IJ)V
    .locals 2
    .param p1, "track"    # I
    .param p2, "timeUs"    # J

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 89
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 90
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-virtual {v0, p2, p3}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->discardUntil(J)V

    .line 91
    return-void

    .line 89
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFormat(I)Lcom/google/android/exoplayer/MediaFormat;
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 61
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->getMediaFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method public getLargestSampleTimestamp()J
    .locals 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->getLargestParsedTimestampUs()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSample(ILcom/google/android/exoplayer/SampleHolder;)Z
    .locals 1
    .param p1, "track"    # I
    .param p2, "holder"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 82
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 83
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->getSample(Lcom/google/android/exoplayer/SampleHolder;)Z

    move-result v0

    return v0

    .line 82
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getSampleQueue(I)Lcom/google/android/exoplayer/hls/parser/SampleQueue;
    .locals 1
    .param p1, "track"    # I

    .prologue
    .line 122
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 123
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    return-object v0

    .line 122
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTrackCount()I
    .locals 1

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 55
    const/4 v0, 0x1

    return v0
.end method

.method public hasSamples(I)Z
    .locals 3
    .param p1, "track"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 95
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 96
    if-nez p1, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 97
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :goto_1
    return v1

    :cond_0
    move v0, v2

    .line 96
    goto :goto_0

    :cond_1
    move v1, v2

    .line 97
    goto :goto_1
.end method

.method public isPrepared()Z
    .locals 1

    .prologue
    .line 66
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    return v0
.end method

.method public read(Lcom/google/android/exoplayer/upstream/DataSource;)I
    .locals 7
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    const/4 v6, 0x0

    .line 102
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->packetBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    const/16 v3, 0xc8

    invoke-interface {p1, v2, v6, v3}, Lcom/google/android/exoplayer/upstream/DataSource;->read([BII)I

    move-result v0

    .line 103
    .local v0, "bytesRead":I
    if-ne v0, v1, :cond_1

    move v0, v1

    .line 117
    .end local v0    # "bytesRead":I
    :cond_0
    :goto_0
    return v0

    .line 107
    .restart local v0    # "bytesRead":I
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->packetBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 108
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->packetBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setLimit(I)V

    .line 112
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->packetBuffer:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->firstSampleTimestamp:J

    iget-boolean v3, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->firstPacket:Z

    invoke-virtual {v1, v2, v4, v5, v3}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->consume(Lcom/google/android/exoplayer/util/ParsableByteArray;JZ)V

    .line 113
    iput-boolean v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->firstPacket:Z

    .line 114
    iget-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    if-nez v1, :cond_0

    .line 115
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->hasMediaFormat()Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->prepared:Z

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;->adtsReader:Lcom/google/android/exoplayer/hls/parser/AdtsReader;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->release()V

    .line 72
    return-void
.end method
