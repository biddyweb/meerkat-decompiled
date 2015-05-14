.class public final Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;
.source "AudioSampleEntry.java"


# static fields
.field public static final TYPE1:Ljava/lang/String; = "samr"

.field public static final TYPE10:Ljava/lang/String; = "mlpa"

.field public static final TYPE11:Ljava/lang/String; = "dtsl"

.field public static final TYPE12:Ljava/lang/String; = "dtsh"

.field public static final TYPE13:Ljava/lang/String; = "dtse"

.field public static final TYPE2:Ljava/lang/String; = "sawb"

.field public static final TYPE3:Ljava/lang/String; = "mp4a"

.field public static final TYPE4:Ljava/lang/String; = "drms"

.field public static final TYPE5:Ljava/lang/String; = "alac"

.field public static final TYPE7:Ljava/lang/String; = "owma"

.field public static final TYPE8:Ljava/lang/String; = "ac-3"

.field public static final TYPE9:Ljava/lang/String; = "ec-3"

.field public static final TYPE_ENCRYPTED:Ljava/lang/String; = "enca"


# instance fields
.field private bytesPerFrame:J

.field private bytesPerPacket:J

.field private bytesPerSample:J

.field private channelCount:I

.field private compressionId:I

.field private packetSize:I

.field private reserved1:I

.field private reserved2:J

.field private sampleRate:J

.field private sampleSize:I

.field private samplesPerPacket:J

.field private soundVersion:I

.field private soundVersion2Data:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;-><init>(Ljava/lang/String;)V

    .line 77
    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 8
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x10

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 286
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getHeader()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 287
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    if-ne v1, v6, :cond_3

    move v1, v2

    :goto_0
    add-int/lit8 v1, v1, 0x1c

    iget v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    if-ne v4, v7, :cond_0

    const/16 v3, 0x24

    :cond_0
    add-int/2addr v1, v3

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 290
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 291
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->dataReferenceIndex:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 292
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 293
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved1:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 294
    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved2:J

    invoke-static {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 295
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->channelCount:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 296
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleSize:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 297
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->compressionId:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 298
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->packetSize:I

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 300
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->type:Ljava/lang/String;

    const-string v3, "mlpa"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 301
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 306
    :goto_1
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    if-ne v1, v6, :cond_1

    .line 307
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->samplesPerPacket:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 308
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerPacket:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 309
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerFrame:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 310
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerSample:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 313
    :cond_1
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    if-ne v1, v7, :cond_2

    .line 314
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->samplesPerPacket:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 315
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerPacket:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 316
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerFrame:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 317
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerSample:J

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 318
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion2Data:[B

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 320
    :cond_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 321
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 322
    return-void

    .end local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    :cond_3
    move v1, v3

    .line 287
    goto/16 :goto_0

    .line 303
    .restart local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    :cond_4
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v4

    shl-long v2, v4, v2

    invoke-static {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_1
.end method

.method public getBytesPerFrame()J
    .locals 2

    .prologue
    .line 116
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerFrame:J

    return-wide v0
.end method

.method public getBytesPerPacket()J
    .locals 2

    .prologue
    .line 112
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerPacket:J

    return-wide v0
.end method

.method public getBytesPerSample()J
    .locals 2

    .prologue
    .line 120
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerSample:J

    return-wide v0
.end method

.method public getChannelCount()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->channelCount:I

    return v0
.end method

.method public getCompressionId()I
    .locals 1

    .prologue
    .line 100
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->compressionId:I

    return v0
.end method

.method public getPacketSize()I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->packetSize:I

    return v0
.end method

.method public getReserved1()I
    .locals 1

    .prologue
    .line 129
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved1:I

    return v0
.end method

.method public getReserved2()J
    .locals 2

    .prologue
    .line 133
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved2:J

    return-wide v0
.end method

.method public getSampleRate()J
    .locals 2

    .prologue
    .line 92
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleRate:J

    return-wide v0
.end method

.method public getSampleSize()I
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleSize:I

    return v0
.end method

.method public getSamplesPerPacket()J
    .locals 2

    .prologue
    .line 108
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->samplesPerPacket:J

    return-wide v0
.end method

.method public getSize()J
    .locals 8

    .prologue
    const/16 v3, 0x10

    const/4 v4, 0x0

    .line 326
    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v5, 0x1

    if-ne v2, v5, :cond_2

    move v2, v3

    :goto_0
    add-int/lit8 v2, v2, 0x1c

    iget v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_0

    const/16 v4, 0x24

    :cond_0
    add-int/2addr v2, v4

    int-to-long v4, v2

    .line 328
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getContainerSize()J

    move-result-wide v6

    add-long v0, v4, v6

    .line 329
    .local v0, "s":J
    iget-boolean v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->largeBox:Z

    if-nez v2, :cond_1

    const-wide/16 v4, 0x8

    add-long/2addr v4, v0

    const-wide v6, 0x100000000L

    cmp-long v2, v4, v6

    if-ltz v2, :cond_3

    :cond_1
    :goto_1
    int-to-long v2, v3

    add-long/2addr v0, v2

    .line 330
    return-wide v0

    .end local v0    # "s":J
    :cond_2
    move v2, v4

    .line 326
    goto :goto_0

    .line 329
    .restart local v0    # "s":J
    :cond_3
    const/16 v3, 0x8

    goto :goto_1
.end method

.method public getSoundVersion()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    return v0
.end method

.method public getSoundVersion2Data()[B
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion2Data:[B

    return-object v0
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 13
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contentSize"    # J
    .param p5, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    const/16 v5, 0x1c

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 191
    .local v3, "content":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 192
    const/4 v5, 0x6

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 193
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->dataReferenceIndex:I

    .line 197
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    .line 200
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved1:I

    .line 201
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved2:J

    .line 203
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->channelCount:I

    .line 204
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleSize:I

    .line 206
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->compressionId:I

    .line 208
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->packetSize:I

    .line 210
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleRate:J

    .line 211
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->type:Ljava/lang/String;

    const-string v8, "mlpa"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 212
    iget-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleRate:J

    const/16 v5, 0x10

    ushr-long/2addr v8, v5

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleRate:J

    .line 217
    :cond_0
    iget v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v8, 0x1

    if-ne v5, v8, :cond_1

    .line 218
    const/16 v5, 0x10

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 219
    .local v2, "appleStuff":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 220
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 221
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->samplesPerPacket:J

    .line 222
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerPacket:J

    .line 223
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerFrame:J

    .line 224
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerSample:J

    .line 226
    .end local v2    # "appleStuff":Ljava/nio/ByteBuffer;
    :cond_1
    iget v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v8, 0x2

    if-ne v5, v8, :cond_2

    .line 227
    const/16 v5, 0x24

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 228
    .restart local v2    # "appleStuff":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 229
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 230
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->samplesPerPacket:J

    .line 231
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerPacket:J

    .line 232
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerFrame:J

    .line 233
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    iput-wide v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerSample:J

    .line 234
    const/16 v5, 0x14

    new-array v5, v5, [B

    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion2Data:[B

    .line 235
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion2Data:[B

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 238
    .end local v2    # "appleStuff":Ljava/nio/ByteBuffer;
    :cond_2
    const-string v5, "owma"

    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->type:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 239
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v8, "owma"

    invoke-virtual {v5, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 240
    const-wide/16 v8, 0x1c

    sub-long v8, p3, v8

    iget v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v10, 0x1

    if-ne v5, v10, :cond_3

    const/16 v5, 0x10

    :goto_0
    int-to-long v10, v5

    sub-long/2addr v8, v10

    iget v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v10, 0x2

    if-ne v5, v10, :cond_4

    const/16 v5, 0x24

    :goto_1
    int-to-long v10, v5

    sub-long v6, v8, v10

    .line 243
    .local v6, "remaining":J
    invoke-static {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 244
    .local v4, "owmaSpecifics":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 246
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;

    invoke-direct {v5, p0, v6, v7, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;JLjava/nio/ByteBuffer;)V

    invoke-virtual {p0, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 282
    .end local v4    # "owmaSpecifics":Ljava/nio/ByteBuffer;
    .end local v6    # "remaining":J
    :goto_2
    return-void

    .line 240
    :cond_3
    const/4 v5, 0x0

    goto :goto_0

    :cond_4
    const/4 v5, 0x0

    goto :goto_1

    .line 277
    :cond_5
    const-wide/16 v8, 0x1c

    sub-long v8, p3, v8

    iget v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v10, 0x1

    if-ne v5, v10, :cond_6

    const/16 v5, 0x10

    :goto_3
    int-to-long v10, v5

    sub-long/2addr v8, v10

    iget v5, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    const/4 v10, 0x2

    if-ne v5, v10, :cond_7

    const/16 v5, 0x24

    :goto_4
    int-to-long v10, v5

    sub-long/2addr v8, v10

    move-object/from16 v0, p5

    invoke-virtual {p0, p1, v8, v9, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->initContainer(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    goto :goto_2

    :cond_6
    const/4 v5, 0x0

    goto :goto_3

    :cond_7
    const/4 v5, 0x0

    goto :goto_4
.end method

.method public setBytesPerFrame(J)V
    .locals 1
    .param p1, "bytesPerFrame"    # J

    .prologue
    .line 169
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerFrame:J

    .line 170
    return-void
.end method

.method public setBytesPerPacket(J)V
    .locals 1
    .param p1, "bytesPerPacket"    # J

    .prologue
    .line 165
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerPacket:J

    .line 166
    return-void
.end method

.method public setBytesPerSample(J)V
    .locals 1
    .param p1, "bytesPerSample"    # J

    .prologue
    .line 173
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerSample:J

    .line 174
    return-void
.end method

.method public setChannelCount(I)V
    .locals 0
    .param p1, "channelCount"    # I

    .prologue
    .line 137
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->channelCount:I

    .line 138
    return-void
.end method

.method public setCompressionId(I)V
    .locals 0
    .param p1, "compressionId"    # I

    .prologue
    .line 153
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->compressionId:I

    .line 154
    return-void
.end method

.method public setPacketSize(I)V
    .locals 0
    .param p1, "packetSize"    # I

    .prologue
    .line 157
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->packetSize:I

    .line 158
    return-void
.end method

.method public setReserved1(I)V
    .locals 0
    .param p1, "reserved1"    # I

    .prologue
    .line 177
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved1:I

    .line 178
    return-void
.end method

.method public setReserved2(J)V
    .locals 1
    .param p1, "reserved2"    # J

    .prologue
    .line 181
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->reserved2:J

    .line 182
    return-void
.end method

.method public setSampleRate(J)V
    .locals 1
    .param p1, "sampleRate"    # J

    .prologue
    .line 145
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleRate:J

    .line 146
    return-void
.end method

.method public setSampleSize(I)V
    .locals 0
    .param p1, "sampleSize"    # I

    .prologue
    .line 141
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleSize:I

    .line 142
    return-void
.end method

.method public setSamplesPerPacket(J)V
    .locals 1
    .param p1, "samplesPerPacket"    # J

    .prologue
    .line 161
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->samplesPerPacket:J

    .line 162
    return-void
.end method

.method public setSoundVersion(I)V
    .locals 0
    .param p1, "soundVersion"    # I

    .prologue
    .line 149
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    .line 150
    return-void
.end method

.method public setSoundVersion2Data([B)V
    .locals 0
    .param p1, "soundVersion2Data"    # [B

    .prologue
    .line 185
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion2Data:[B

    .line 186
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->type:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AudioSampleEntry{bytesPerSample="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerSample:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bytesPerFrame="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerFrame:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bytesPerPacket="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->bytesPerPacket:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", samplesPerPacket="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->samplesPerPacket:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", packetSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->packetSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", compressionId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->compressionId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", soundVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->soundVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sampleRate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleRate:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sampleSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->sampleSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", channelCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->channelCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", boxes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 347
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
