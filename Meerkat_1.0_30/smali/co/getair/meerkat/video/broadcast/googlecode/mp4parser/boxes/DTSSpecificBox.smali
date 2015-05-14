.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "DTSSpecificBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "ddts"


# instance fields
.field DTSSamplingFrequency:J

.field LBRDurationMod:I

.field avgBitRate:J

.field channelLayout:I

.field coreLFEPresent:I

.field coreLayout:I

.field coreSize:I

.field frameDuration:I

.field maxBitRate:J

.field multiAssetFlag:I

.field pcmSampleDepth:I

.field representationType:I

.field reserved:I

.field reservedBoxPresent:I

.field stereoDownmix:I

.field streamConstruction:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const-string v0, "ddts"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x1

    .line 47
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->DTSSamplingFrequency:J

    .line 48
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->maxBitRate:J

    .line 49
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->avgBitRate:J

    .line 50
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->pcmSampleDepth:I

    .line 51
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 52
    .local v0, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->frameDuration:I

    .line 53
    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->streamConstruction:I

    .line 54
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLFEPresent:I

    .line 55
    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLayout:I

    .line 56
    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreSize:I

    .line 57
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->stereoDownmix:I

    .line 58
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->representationType:I

    .line 59
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->channelLayout:I

    .line 60
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->multiAssetFlag:I

    .line 61
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->LBRDurationMod:I

    .line 62
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reservedBoxPresent:I

    .line 63
    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reserved:I

    .line 65
    return-void
.end method

.method public getAvgBitRate()J
    .locals 2

    .prologue
    .line 90
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->avgBitRate:J

    return-wide v0
.end method

.method public getChannelLayout()I
    .locals 1

    .prologue
    .line 178
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->channelLayout:I

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x1

    .line 69
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->DTSSamplingFrequency:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 70
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->maxBitRate:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 71
    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->avgBitRate:J

    invoke-static {p1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 72
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->pcmSampleDepth:I

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 73
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 74
    .local v0, "bwb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->frameDuration:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 75
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->streamConstruction:I

    invoke-virtual {v0, v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 76
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLFEPresent:I

    invoke-virtual {v0, v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 77
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLayout:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 78
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreSize:I

    const/16 v2, 0xe

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 79
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->stereoDownmix:I

    invoke-virtual {v0, v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 80
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->representationType:I

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 81
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->channelLayout:I

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 82
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->multiAssetFlag:I

    invoke-virtual {v0, v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 83
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->LBRDurationMod:I

    invoke-virtual {v0, v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 84
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reservedBoxPresent:I

    invoke-virtual {v0, v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 85
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reserved:I

    invoke-virtual {v0, v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitWriterBuffer;->writeBits(II)V

    .line 87
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 42
    const-wide/16 v0, 0x14

    return-wide v0
.end method

.method public getCoreLFEPresent()I
    .locals 1

    .prologue
    .line 138
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLFEPresent:I

    return v0
.end method

.method public getCoreLayout()I
    .locals 1

    .prologue
    .line 146
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLayout:I

    return v0
.end method

.method public getCoreSize()I
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreSize:I

    return v0
.end method

.method public getDTSSamplingFrequency()J
    .locals 2

    .prologue
    .line 98
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->DTSSamplingFrequency:J

    return-wide v0
.end method

.method public getDashAudioChannelConfiguration()[I
    .locals 10
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/high16 v7, 0x20000

    const/high16 v6, 0x10000

    const v5, 0x8000

    .line 219
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->getChannelLayout()I

    move-result v0

    .line 220
    .local v0, "channelLayout":I
    const/4 v2, 0x0

    .line 221
    .local v2, "numChannels":I
    const/4 v1, 0x0

    .line 222
    .local v1, "dwChannelMask":I
    and-int/lit8 v3, v0, 0x1

    if-ne v3, v8, :cond_0

    .line 224
    add-int/lit8 v2, v2, 0x1

    .line 225
    or-int/lit8 v1, v1, 0x4

    .line 227
    :cond_0
    and-int/lit8 v3, v0, 0x2

    if-ne v3, v9, :cond_1

    .line 229
    add-int/lit8 v2, v2, 0x2

    .line 230
    or-int/lit8 v1, v1, 0x1

    .line 231
    or-int/lit8 v1, v1, 0x2

    .line 233
    :cond_1
    and-int/lit8 v3, v0, 0x4

    const/4 v4, 0x4

    if-ne v3, v4, :cond_2

    .line 235
    add-int/lit8 v2, v2, 0x2

    .line 237
    or-int/lit8 v1, v1, 0x10

    .line 238
    or-int/lit8 v1, v1, 0x20

    .line 240
    :cond_2
    and-int/lit8 v3, v0, 0x8

    const/16 v4, 0x8

    if-ne v3, v4, :cond_3

    .line 242
    add-int/lit8 v2, v2, 0x1

    .line 243
    or-int/lit8 v1, v1, 0x8

    .line 245
    :cond_3
    and-int/lit8 v3, v0, 0x10

    const/16 v4, 0x10

    if-ne v3, v4, :cond_4

    .line 247
    add-int/lit8 v2, v2, 0x1

    .line 248
    or-int/lit16 v1, v1, 0x100

    .line 250
    :cond_4
    and-int/lit8 v3, v0, 0x20

    const/16 v4, 0x20

    if-ne v3, v4, :cond_5

    .line 252
    add-int/lit8 v2, v2, 0x2

    .line 253
    or-int/lit16 v1, v1, 0x1000

    .line 254
    or-int/lit16 v1, v1, 0x4000

    .line 256
    :cond_5
    and-int/lit8 v3, v0, 0x40

    const/16 v4, 0x40

    if-ne v3, v4, :cond_6

    .line 258
    add-int/lit8 v2, v2, 0x2

    .line 259
    or-int/lit8 v1, v1, 0x10

    .line 260
    or-int/lit8 v1, v1, 0x20

    .line 262
    :cond_6
    and-int/lit16 v3, v0, 0x80

    const/16 v4, 0x80

    if-ne v3, v4, :cond_7

    .line 264
    add-int/lit8 v2, v2, 0x1

    .line 265
    or-int/lit16 v1, v1, 0x2000

    .line 267
    :cond_7
    and-int/lit16 v3, v0, 0x100

    const/16 v4, 0x100

    if-ne v3, v4, :cond_8

    .line 269
    add-int/lit8 v2, v2, 0x1

    .line 270
    or-int/lit16 v1, v1, 0x800

    .line 272
    :cond_8
    and-int/lit16 v3, v0, 0x200

    const/16 v4, 0x200

    if-ne v3, v4, :cond_9

    .line 274
    add-int/lit8 v2, v2, 0x2

    .line 275
    or-int/lit8 v1, v1, 0x40

    .line 276
    or-int/lit16 v1, v1, 0x80

    .line 278
    :cond_9
    and-int/lit16 v3, v0, 0x400

    const/16 v4, 0x400

    if-ne v3, v4, :cond_a

    .line 280
    add-int/lit8 v2, v2, 0x2

    .line 281
    or-int/lit16 v1, v1, 0x200

    .line 282
    or-int/lit16 v1, v1, 0x400

    .line 284
    :cond_a
    and-int/lit16 v3, v0, 0x800

    const/16 v4, 0x800

    if-ne v3, v4, :cond_b

    .line 286
    add-int/lit8 v2, v2, 0x2

    .line 288
    or-int/lit8 v1, v1, 0x10

    .line 289
    or-int/lit8 v1, v1, 0x20

    .line 291
    :cond_b
    and-int/lit16 v3, v0, 0x1000

    const/16 v4, 0x1000

    if-ne v3, v4, :cond_c

    .line 293
    add-int/lit8 v2, v2, 0x1

    .line 294
    or-int/lit8 v1, v1, 0x8

    .line 296
    :cond_c
    and-int/lit16 v3, v0, 0x2000

    const/16 v4, 0x2000

    if-ne v3, v4, :cond_d

    .line 298
    add-int/lit8 v2, v2, 0x2

    .line 299
    or-int/lit8 v1, v1, 0x10

    .line 300
    or-int/lit8 v1, v1, 0x20

    .line 302
    :cond_d
    and-int/lit16 v3, v0, 0x4000

    const/16 v4, 0x4000

    if-ne v3, v4, :cond_e

    .line 304
    add-int/lit8 v2, v2, 0x1

    .line 305
    or-int/2addr v1, v6

    .line 307
    :cond_e
    and-int v3, v0, v5

    if-ne v3, v5, :cond_f

    .line 309
    add-int/lit8 v2, v2, 0x2

    .line 310
    or-int/2addr v1, v5

    .line 311
    or-int/2addr v1, v7

    .line 313
    :cond_f
    and-int v3, v0, v6

    if-ne v3, v6, :cond_10

    .line 315
    add-int/lit8 v2, v2, 0x1

    .line 317
    :cond_10
    and-int v3, v0, v7

    if-ne v3, v7, :cond_11

    .line 319
    add-int/lit8 v2, v2, 0x2

    .line 321
    :cond_11
    new-array v3, v9, [I

    const/4 v4, 0x0

    aput v2, v3, v4

    aput v1, v3, v8

    return-object v3
.end method

.method public getFrameDuration()I
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->frameDuration:I

    return v0
.end method

.method public getLBRDurationMod()I
    .locals 1

    .prologue
    .line 194
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->LBRDurationMod:I

    return v0
.end method

.method public getMaxBitRate()J
    .locals 2

    .prologue
    .line 106
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->maxBitRate:J

    return-wide v0
.end method

.method public getMultiAssetFlag()I
    .locals 1

    .prologue
    .line 186
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->multiAssetFlag:I

    return v0
.end method

.method public getPcmSampleDepth()I
    .locals 1

    .prologue
    .line 114
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->pcmSampleDepth:I

    return v0
.end method

.method public getRepresentationType()I
    .locals 1

    .prologue
    .line 170
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->representationType:I

    return v0
.end method

.method public getReserved()I
    .locals 1

    .prologue
    .line 202
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reserved:I

    return v0
.end method

.method public getReservedBoxPresent()I
    .locals 1

    .prologue
    .line 210
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reservedBoxPresent:I

    return v0
.end method

.method public getStereoDownmix()I
    .locals 1

    .prologue
    .line 162
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->stereoDownmix:I

    return v0
.end method

.method public getStreamConstruction()I
    .locals 1

    .prologue
    .line 130
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->streamConstruction:I

    return v0
.end method

.method public setAvgBitRate(J)V
    .locals 1
    .param p1, "avgBitRate"    # J

    .prologue
    .line 94
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->avgBitRate:J

    .line 95
    return-void
.end method

.method public setChannelLayout(I)V
    .locals 0
    .param p1, "channelLayout"    # I

    .prologue
    .line 182
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->channelLayout:I

    .line 183
    return-void
.end method

.method public setCoreLFEPresent(I)V
    .locals 0
    .param p1, "coreLFEPresent"    # I

    .prologue
    .line 142
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLFEPresent:I

    .line 143
    return-void
.end method

.method public setCoreLayout(I)V
    .locals 0
    .param p1, "coreLayout"    # I

    .prologue
    .line 150
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreLayout:I

    .line 151
    return-void
.end method

.method public setCoreSize(I)V
    .locals 0
    .param p1, "coreSize"    # I

    .prologue
    .line 158
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->coreSize:I

    .line 159
    return-void
.end method

.method public setDTSSamplingFrequency(J)V
    .locals 1
    .param p1, "DTSSamplingFrequency"    # J

    .prologue
    .line 102
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->DTSSamplingFrequency:J

    .line 103
    return-void
.end method

.method public setFrameDuration(I)V
    .locals 0
    .param p1, "frameDuration"    # I

    .prologue
    .line 126
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->frameDuration:I

    .line 127
    return-void
.end method

.method public setLBRDurationMod(I)V
    .locals 0
    .param p1, "LBRDurationMod"    # I

    .prologue
    .line 198
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->LBRDurationMod:I

    .line 199
    return-void
.end method

.method public setMaxBitRate(J)V
    .locals 1
    .param p1, "maxBitRate"    # J

    .prologue
    .line 110
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->maxBitRate:J

    .line 111
    return-void
.end method

.method public setMultiAssetFlag(I)V
    .locals 0
    .param p1, "multiAssetFlag"    # I

    .prologue
    .line 190
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->multiAssetFlag:I

    .line 191
    return-void
.end method

.method public setPcmSampleDepth(I)V
    .locals 0
    .param p1, "pcmSampleDepth"    # I

    .prologue
    .line 118
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->pcmSampleDepth:I

    .line 119
    return-void
.end method

.method public setRepresentationType(I)V
    .locals 0
    .param p1, "representationType"    # I

    .prologue
    .line 174
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->representationType:I

    .line 175
    return-void
.end method

.method public setReserved(I)V
    .locals 0
    .param p1, "reserved"    # I

    .prologue
    .line 206
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reserved:I

    .line 207
    return-void
.end method

.method public setReservedBoxPresent(I)V
    .locals 0
    .param p1, "reservedBoxPresent"    # I

    .prologue
    .line 214
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->reservedBoxPresent:I

    .line 215
    return-void
.end method

.method public setStereoDownmix(I)V
    .locals 0
    .param p1, "stereoDownmix"    # I

    .prologue
    .line 166
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->stereoDownmix:I

    .line 167
    return-void
.end method

.method public setStreamConstruction(I)V
    .locals 0
    .param p1, "streamConstruction"    # I

    .prologue
    .line 134
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->streamConstruction:I

    .line 135
    return-void
.end method
