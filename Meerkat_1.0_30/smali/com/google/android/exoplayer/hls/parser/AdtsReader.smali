.class Lcom/google/android/exoplayer/hls/parser/AdtsReader;
.super Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;
.source "AdtsReader.java"


# static fields
.field private static final CRC_SIZE:I = 0x2

.field private static final HEADER_SIZE:I = 0x5

.field private static final STATE_FINDING_SYNC:I = 0x0

.field private static final STATE_READING_HEADER:I = 0x1

.field private static final STATE_READING_SAMPLE:I = 0x2


# instance fields
.field private final adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field private bytesRead:I

.field private frameDurationUs:J

.field private hasCrc:Z

.field private lastByteWasFF:Z

.field private sampleSize:I

.field private state:I

.field private timeUs:J


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V
    .locals 2
    .param p1, "bufferPool"    # Lcom/google/android/exoplayer/upstream/BufferPool;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/ElementaryStreamReader;-><init>(Lcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 60
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v1, 0x7

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->state:I

    .line 62
    return-void
.end method

.method private continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z
    .locals 3
    .param p1, "source"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "target"    # [B
    .param p3, "targetLength"    # I

    .prologue
    .line 116
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v1

    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    sub-int v2, p3, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 117
    .local v0, "bytesToRead":I
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    invoke-virtual {p1, p2, v1, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 118
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    .line 119
    iget v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    if-ne v1, p3, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private parseHeader()V
    .locals 12

    .prologue
    const/4 v11, 0x4

    .line 153
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->setPosition(I)V

    .line 155
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->hasMediaFormat()Z

    move-result v6

    if-nez v6, :cond_1

    .line 156
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v6

    add-int/lit8 v0, v6, 0x1

    .line 157
    .local v0, "audioObjectType":I
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v6, v11}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 158
    .local v5, "sampleRateIndex":I
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 159
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/4 v7, 0x3

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v3

    .line 161
    .local v3, "channelConfig":I
    invoke-static {v0, v5, v3}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->buildAudioSpecificConfig(III)[B

    move-result-object v2

    .line 163
    .local v2, "audioSpecificConfig":[B
    invoke-static {v2}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAudioSpecificConfig([B)Landroid/util/Pair;

    move-result-object v1

    .line 166
    .local v1, "audioParams":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const-string v7, "audio/mp4a-latm"

    const/4 v8, -0x1

    iget-object v6, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    .line 167
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v6, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 168
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    .line 166
    invoke-static {v7, v8, v9, v6, v10}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;IIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    .line 169
    .local v4, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    const-wide/32 v6, 0x3d090000

    iget v8, v4, Lcom/google/android/exoplayer/MediaFormat;->sampleRate:I

    int-to-long v8, v8

    div-long/2addr v6, v8

    iput-wide v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->frameDurationUs:J

    .line 170
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->setMediaFormat(Lcom/google/android/exoplayer/MediaFormat;)V

    .line 175
    .end local v0    # "audioObjectType":I
    .end local v1    # "audioParams":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v2    # "audioSpecificConfig":[B
    .end local v3    # "channelConfig":I
    .end local v4    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v5    # "sampleRateIndex":I
    :goto_0
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v6, v11}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 176
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v7, 0xd

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readBits(I)I

    move-result v6

    add-int/lit8 v6, v6, -0x2

    add-int/lit8 v6, v6, -0x5

    iput v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->sampleSize:I

    .line 177
    iget-boolean v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->hasCrc:Z

    if-eqz v6, :cond_0

    .line 178
    iget v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->sampleSize:I

    add-int/lit8 v6, v6, -0x2

    iput v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->sampleSize:I

    .line 180
    :cond_0
    return-void

    .line 172
    :cond_1
    iget-object v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    goto :goto_0
.end method

.method private skipToNextSync(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z
    .locals 10
    .param p1, "pesBuffer"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 130
    iget-object v0, p1, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    .line 131
    .local v0, "adtsData":[B
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v5

    .line 132
    .local v5, "startOffset":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v2

    .line 133
    .local v2, "endOffset":I
    move v4, v5

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_4

    .line 134
    aget-byte v8, v0, v4

    and-int/lit16 v8, v8, 0xff

    const/16 v9, 0xff

    if-ne v8, v9, :cond_0

    move v1, v6

    .line 135
    .local v1, "byteIsFF":Z
    :goto_1
    iget-boolean v8, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->lastByteWasFF:Z

    if-eqz v8, :cond_1

    if-nez v1, :cond_1

    aget-byte v8, v0, v4

    and-int/lit16 v8, v8, 0xf0

    const/16 v9, 0xf0

    if-ne v8, v9, :cond_1

    move v3, v6

    .line 136
    .local v3, "found":Z
    :goto_2
    iput-boolean v1, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->lastByteWasFF:Z

    .line 137
    if-eqz v3, :cond_3

    .line 138
    aget-byte v8, v0, v4

    and-int/lit8 v8, v8, 0x1

    if-nez v8, :cond_2

    move v8, v6

    :goto_3
    iput-boolean v8, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->hasCrc:Z

    .line 139
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 141
    iput-boolean v7, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->lastByteWasFF:Z

    .line 146
    .end local v1    # "byteIsFF":Z
    .end local v3    # "found":Z
    :goto_4
    return v6

    :cond_0
    move v1, v7

    .line 134
    goto :goto_1

    .restart local v1    # "byteIsFF":Z
    :cond_1
    move v3, v7

    .line 135
    goto :goto_2

    .restart local v3    # "found":Z
    :cond_2
    move v8, v7

    .line 138
    goto :goto_3

    .line 133
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 145
    .end local v1    # "byteIsFF":Z
    .end local v3    # "found":Z
    :cond_4
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    move v6, v7

    .line 146
    goto :goto_4
.end method


# virtual methods
.method public consume(Lcom/google/android/exoplayer/util/ParsableByteArray;JZ)V
    .locals 8
    .param p1, "data"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "pesTimeUs"    # J
    .param p4, "startOfPacket"    # Z

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 66
    if-eqz p4, :cond_0

    .line 67
    iput-wide p2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->timeUs:J

    .line 69
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    if-lez v2, :cond_2

    .line 70
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->state:I

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 72
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->skipToNextSync(Lcom/google/android/exoplayer/util/ParsableByteArray;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 73
    iput v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    .line 74
    iput v7, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->state:I

    goto :goto_0

    .line 78
    :pswitch_1
    iget-boolean v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->hasCrc:Z

    if-eqz v2, :cond_1

    const/4 v1, 0x7

    .line 79
    .local v1, "targetLength":I
    :goto_1
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->adtsScratch:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->getData()[B

    move-result-object v2

    invoke-direct {p0, p1, v2, v1}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->continueRead(Lcom/google/android/exoplayer/util/ParsableByteArray;[BI)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 80
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->parseHeader()V

    .line 81
    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->timeUs:J

    invoke-virtual {p0, v2, v3}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->startSample(J)V

    .line 82
    iput v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    .line 83
    const/4 v2, 0x2

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->state:I

    goto :goto_0

    .line 78
    .end local v1    # "targetLength":I
    :cond_1
    const/4 v1, 0x5

    goto :goto_1

    .line 87
    :pswitch_2
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->sampleSize:I

    iget v4, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    sub-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 88
    .local v0, "bytesToRead":I
    invoke-virtual {p0, p1, v0}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->appendData(Lcom/google/android/exoplayer/util/ParsableByteArray;I)V

    .line 89
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    .line 90
    iget v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    iget v3, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->sampleSize:I

    if-ne v2, v3, :cond_0

    .line 91
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->commitSample(Z)V

    .line 92
    iget-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->timeUs:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->frameDurationUs:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->timeUs:J

    .line 93
    iput v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->bytesRead:I

    .line 94
    iput v6, p0, Lcom/google/android/exoplayer/hls/parser/AdtsReader;->state:I

    goto :goto_0

    .line 99
    .end local v0    # "bytesToRead":I
    :cond_2
    return-void

    .line 70
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public packetFinished()V
    .locals 0

    .prologue
    .line 104
    return-void
.end method
