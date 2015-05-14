.class public final Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;
.super Ljava/lang/Object;
.source "CommonMp4AtomParsers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;
    }
.end annotation


# static fields
.field private static final AC3_BITRATES:[I

.field private static final AC3_CHANNEL_COUNTS:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->AC3_CHANNEL_COUNTS:[I

    .line 39
    const/16 v0, 0x13

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->AC3_BITRATES:[I

    return-void

    .line 37
    nop

    :array_0
    .array-data 4
        0x2
        0x1
        0x2
        0x3
        0x3
        0x4
        0x4
        0x5
    .end array-data

    .line 39
    :array_1
    .array-data 4
        0x20
        0x28
        0x30
        0x38
        0x40
        0x50
        0x60
        0x70
        0x80
        0xa0
        0xc0
        0xe0
        0x100
        0x140
        0x180
        0x1c0
        0x200
        0x240
        0x280
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 652
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 654
    return-void
.end method

.method private static parseAc3SpecificBoxFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;
    .locals 8
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I

    .prologue
    .line 609
    add-int/lit8 v5, p1, 0x8

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 612
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    and-int/lit16 v5, v5, 0xc0

    shr-int/lit8 v2, v5, 0x6

    .line 614
    .local v2, "fscod":I
    packed-switch v2, :pswitch_data_0

    .line 626
    const/4 v5, 0x0

    .line 642
    :goto_0
    return-object v5

    .line 616
    :pswitch_0
    const v4, 0xbb80

    .line 629
    .local v4, "sampleRate":I
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 632
    .local v3, "nextByte":I
    sget-object v5, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->AC3_CHANNEL_COUNTS:[I

    and-int/lit8 v6, v3, 0x38

    shr-int/lit8 v6, v6, 0x3

    aget v1, v5, v6

    .line 635
    .local v1, "channelCount":I
    and-int/lit8 v5, v3, 0x4

    if-eqz v5, :cond_0

    .line 636
    add-int/lit8 v1, v1, 0x1

    .line 640
    :cond_0
    sget-object v5, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->AC3_BITRATES:[I

    and-int/lit8 v6, v3, 0x3

    shl-int/lit8 v6, v6, 0x3

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    shr-int/lit8 v7, v7, 0x5

    add-int/2addr v6, v7

    aget v0, v5, v6

    .line 642
    .local v0, "bitrate":I
    new-instance v5, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;

    invoke-direct {v5, v1, v4, v0}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;-><init>(III)V

    goto :goto_0

    .line 619
    .end local v0    # "bitrate":I
    .end local v1    # "channelCount":I
    .end local v3    # "nextByte":I
    .end local v4    # "sampleRate":I
    :pswitch_1
    const v4, 0xac44

    .line 620
    .restart local v4    # "sampleRate":I
    goto :goto_1

    .line 622
    .end local v4    # "sampleRate":I
    :pswitch_2
    const/16 v4, 0x7d00

    .line 623
    .restart local v4    # "sampleRate":I
    goto :goto_1

    .line 614
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static parseAudioSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;III)Landroid/util/Pair;
    .locals 17
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "atomType"    # I
    .param p2, "position"    # I
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            "III)",
            "Landroid/util/Pair",
            "<",
            "Lcom/google/android/exoplayer/MediaFormat;",
            "Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;",
            ">;"
        }
    .end annotation

    .prologue
    .line 500
    add-int/lit8 v6, p2, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 501
    const/16 v6, 0x10

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 502
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v3

    .line 503
    .local v3, "channelCount":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v2

    .line 504
    .local v2, "sampleSize":I
    const/4 v6, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 505
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedFixedPoint1616()I

    move-result v4

    .line 506
    .local v4, "sampleRate":I
    const/4 v5, -0x1

    .line 508
    .local v5, "bitrate":I
    const/4 v14, 0x0

    .line 509
    .local v14, "initializationData":[B
    const/4 v15, 0x0

    .line 510
    .local v15, "trackEncryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v11

    .line 511
    .local v11, "childPosition":I
    :goto_0
    sub-int v6, v11, p2

    move/from16 v0, p3

    if-ge v6, v0, :cond_7

    .line 512
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 513
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v12

    .line 514
    .local v12, "childStartPosition":I
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v9

    .line 515
    .local v9, "childAtomSize":I
    if-lez v9, :cond_2

    const/4 v6, 0x1

    :goto_1
    const-string v16, "childAtomSize should be positive"

    move-object/from16 v0, v16

    invoke-static {v6, v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 516
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v10

    .line 517
    .local v10, "childAtomType":I
    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mp4a:I

    move/from16 v0, p1

    if-eq v0, v6, :cond_0

    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_enca:I

    move/from16 v0, p1

    if-ne v0, v6, :cond_4

    .line 518
    :cond_0
    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_esds:I

    if-ne v10, v6, :cond_3

    .line 519
    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)[B

    move-result-object v14

    .line 523
    invoke-static {v14}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseAudioSpecificConfig([B)Landroid/util/Pair;

    move-result-object v8

    .line 524
    .local v8, "audioSpecificConfig":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v6, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 525
    iget-object v6, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 545
    .end local v8    # "audioSpecificConfig":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :cond_1
    :goto_2
    add-int/2addr v11, v9

    .line 546
    goto :goto_0

    .line 515
    .end local v10    # "childAtomType":I
    :cond_2
    const/4 v6, 0x0

    goto :goto_1

    .line 526
    .restart local v10    # "childAtomType":I
    :cond_3
    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_sinf:I

    if-ne v10, v6, :cond_1

    .line 527
    move-object/from16 v0, p0

    invoke-static {v0, v12, v9}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    move-result-object v15

    goto :goto_2

    .line 529
    :cond_4
    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ac_3:I

    move/from16 v0, p1

    if-ne v0, v6, :cond_6

    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_dac3:I

    if-ne v10, v6, :cond_6

    .line 532
    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseAc3SpecificBoxFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;

    move-result-object v7

    .line 533
    .local v7, "ac3Format":Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;
    if-eqz v7, :cond_5

    .line 534
    iget v4, v7, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;->sampleRate:I

    .line 535
    iget v3, v7, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;->channelCount:I

    .line 536
    iget v5, v7, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;->bitrate:I

    .line 540
    :cond_5
    const/4 v15, 0x0

    .line 541
    goto :goto_2

    .end local v7    # "ac3Format":Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers$Ac3Format;
    :cond_6
    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ec_3:I

    move/from16 v0, p1

    if-ne v0, v6, :cond_1

    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_dec3:I

    if-ne v10, v6, :cond_1

    .line 542
    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseEc3SpecificBoxFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)I

    move-result v4

    .line 543
    const/4 v15, 0x0

    goto :goto_2

    .line 549
    .end local v9    # "childAtomSize":I
    .end local v10    # "childAtomType":I
    .end local v12    # "childStartPosition":I
    :cond_7
    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ac_3:I

    move/from16 v0, p1

    if-ne v0, v6, :cond_8

    .line 550
    const-string v1, "audio/ac3"

    .line 557
    .local v1, "mimeType":Ljava/lang/String;
    :goto_3
    if-nez v14, :cond_a

    const/4 v6, 0x0

    :goto_4
    invoke-static/range {v1 .. v6}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;IIIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v13

    .line 560
    .local v13, "format":Lcom/google/android/exoplayer/MediaFormat;
    invoke-static {v13, v15}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    return-object v6

    .line 551
    .end local v1    # "mimeType":Ljava/lang/String;
    .end local v13    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_8
    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ec_3:I

    move/from16 v0, p1

    if-ne v0, v6, :cond_9

    .line 552
    const-string v1, "audio/eac3"

    .restart local v1    # "mimeType":Ljava/lang/String;
    goto :goto_3

    .line 554
    .end local v1    # "mimeType":Ljava/lang/String;
    :cond_9
    const-string v1, "audio/mp4a-latm"

    .restart local v1    # "mimeType":Ljava/lang/String;
    goto :goto_3

    .line 559
    :cond_a
    invoke-static {v14}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    goto :goto_4
.end method

.method private static parseAvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Ljava/util/List;
    .locals 6
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            "I)",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 396
    add-int/lit8 v5, p1, 0x8

    add-int/lit8 v5, v5, 0x4

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 398
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    and-int/lit8 v5, v5, 0x3

    add-int/lit8 v2, v5, 0x1

    .line 399
    .local v2, "nalUnitLength":I
    const/4 v5, 0x4

    if-eq v2, v5, :cond_0

    .line 402
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 404
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 407
    .local v0, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v5

    and-int/lit8 v4, v5, 0x1f

    .line 408
    .local v4, "numSequenceParameterSets":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-ge v1, v4, :cond_1

    .line 409
    invoke-static {p0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 411
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 412
    .local v3, "numPictureParameterSets":I
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v3, :cond_2

    .line 413
    invoke-static {p0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseChildNalUnit(Lcom/google/android/exoplayer/util/ParsableByteArray;)[B

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 412
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 415
    :cond_2
    return-object v0
.end method

.method private static parseAvcFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Landroid/util/Pair;
    .locals 12
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            "II)",
            "Landroid/util/Pair",
            "<",
            "Lcom/google/android/exoplayer/MediaFormat;",
            "Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;",
            ">;"
        }
    .end annotation

    .prologue
    .line 359
    add-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 361
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 362
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v2

    .line 363
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v3

    .line 364
    .local v3, "height":I
    const/high16 v4, 0x3f800000    # 1.0f

    .line 365
    .local v4, "pixelWidthHeightRatio":F
    const/16 v0, 0x32

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 367
    const/4 v5, 0x0

    .line 368
    .local v5, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v11, 0x0

    .line 369
    .local v11, "trackEncryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v8

    .line 370
    .local v8, "childPosition":I
    :goto_0
    sub-int v0, v8, p1

    if-ge v0, p2, :cond_0

    .line 371
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 372
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v9

    .line 373
    .local v9, "childStartPosition":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v6

    .line 374
    .local v6, "childAtomSize":I
    if-nez v6, :cond_1

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v0

    sub-int/2addr v0, p1

    if-ne v0, p2, :cond_1

    .line 390
    .end local v6    # "childAtomSize":I
    .end local v9    # "childStartPosition":I
    :cond_0
    const-string v0, "video/avc"

    const/4 v1, -0x1

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;IIIFLjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v10

    .line 392
    .local v10, "format":Lcom/google/android/exoplayer/MediaFormat;
    invoke-static {v10, v11}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    return-object v0

    .line 378
    .end local v10    # "format":Lcom/google/android/exoplayer/MediaFormat;
    .restart local v6    # "childAtomSize":I
    .restart local v9    # "childStartPosition":I
    :cond_1
    if-lez v6, :cond_3

    const/4 v0, 0x1

    :goto_1
    const-string v1, "childAtomSize should be positive"

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 379
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 380
    .local v7, "childAtomType":I
    sget v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avcC:I

    if-ne v7, v0, :cond_4

    .line 381
    invoke-static {p0, v9}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseAvcCFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)Ljava/util/List;

    move-result-object v5

    .line 387
    :cond_2
    :goto_2
    add-int/2addr v8, v6

    .line 388
    goto :goto_0

    .line 378
    .end local v7    # "childAtomType":I
    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 382
    .restart local v7    # "childAtomType":I
    :cond_4
    sget v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_sinf:I

    if-ne v7, v0, :cond_5

    .line 383
    invoke-static {p0, v9, v6}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    move-result-object v11

    goto :goto_2

    .line 384
    :cond_5
    sget v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_pasp:I

    if-ne v7, v0, :cond_2

    .line 385
    invoke-static {p0, v9}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parsePaspFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)F

    move-result v4

    goto :goto_2
.end method

.method private static parseEc3SpecificBoxFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)I
    .locals 1
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I

    .prologue
    .line 647
    add-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 649
    const/4 v0, 0x0

    return v0
.end method

.method private static parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)[B
    .locals 8
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I

    .prologue
    const/16 v7, 0x7f

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 565
    add-int/lit8 v4, p1, 0x8

    add-int/lit8 v4, v4, 0x4

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 567
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 568
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 569
    .local v3, "varIntByte":I
    :goto_0
    if-le v3, v7, :cond_0

    .line 570
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    goto :goto_0

    .line 572
    :cond_0
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 574
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 575
    .local v0, "flags":I
    and-int/lit16 v4, v0, 0x80

    if-eqz v4, :cond_1

    .line 576
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 578
    :cond_1
    and-int/lit8 v4, v0, 0x40

    if-eqz v4, :cond_2

    .line 579
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 581
    :cond_2
    and-int/lit8 v4, v0, 0x20

    if-eqz v4, :cond_3

    .line 582
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 586
    :cond_3
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 587
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 588
    :goto_1
    if-le v3, v7, :cond_4

    .line 589
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    goto :goto_1

    .line 591
    :cond_4
    const/16 v4, 0xd

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 594
    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 595
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 596
    and-int/lit8 v2, v3, 0x7f

    .line 597
    .local v2, "varInt":I
    :goto_2
    if-le v3, v7, :cond_5

    .line 598
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 599
    shl-int/lit8 v2, v2, 0x8

    .line 600
    and-int/lit8 v4, v3, 0x7f

    or-int/2addr v2, v4

    goto :goto_2

    .line 602
    :cond_5
    new-array v1, v2, [B

    .line 603
    .local v1, "initializationData":[B
    const/4 v4, 0x0

    invoke-virtual {p0, v1, v4, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 604
    return-object v1
.end method

.method private static parseHdlr(Lcom/google/android/exoplayer/util/ParsableByteArray;)I
    .locals 1
    .param p0, "hdlr"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 305
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 306
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    return v0
.end method

.method private static parseMdhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J
    .locals 4
    .param p0, "mdhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/16 v2, 0x8

    .line 316
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 317
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 318
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomVersion(I)I

    move-result v1

    .line 320
    .local v1, "version":I
    if-nez v1, :cond_0

    :goto_0
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 321
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    return-wide v2

    .line 320
    :cond_0
    const/16 v2, 0x10

    goto :goto_0
.end method

.method private static parseMp4vFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/MediaFormat;
    .locals 10
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I

    .prologue
    const/4 v8, 0x1

    .line 473
    add-int/lit8 v7, p1, 0x8

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 475
    const/16 v7, 0x18

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 476
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v6

    .line 477
    .local v6, "width":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v4

    .line 478
    .local v4, "height":I
    const/16 v7, 0x32

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 480
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 481
    .local v5, "initializationData":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v2

    .line 482
    .local v2, "childPosition":I
    :goto_0
    sub-int v7, v2, p1

    if-ge v7, p2, :cond_2

    .line 483
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 484
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    .line 485
    .local v3, "childStartPosition":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 486
    .local v0, "childAtomSize":I
    if-lez v0, :cond_1

    move v7, v8

    :goto_1
    const-string v9, "childAtomSize should be positive"

    invoke-static {v7, v9}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 487
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 488
    .local v1, "childAtomType":I
    sget v7, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_esds:I

    if-ne v1, v7, :cond_0

    .line 489
    invoke-static {p0, v3}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseEsdsFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)[B

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 491
    :cond_0
    add-int/2addr v2, v0

    .line 492
    goto :goto_0

    .line 486
    .end local v1    # "childAtomType":I
    :cond_1
    const/4 v7, 0x0

    goto :goto_1

    .line 494
    .end local v0    # "childAtomSize":I
    .end local v3    # "childStartPosition":I
    :cond_2
    const-string v7, "video/mp4v-es"

    const/4 v8, -0x1

    invoke-static {v7, v8, v6, v4, v5}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;IIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v7

    return-object v7
.end method

.method private static parseMvhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J
    .locals 4
    .param p0, "mvhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/16 v2, 0x8

    .line 252
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 254
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 255
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomVersion(I)I

    move-result v1

    .line 257
    .local v1, "version":I
    if-nez v1, :cond_0

    :goto_0
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 259
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    return-wide v2

    .line 257
    :cond_0
    const/16 v2, 0x10

    goto :goto_0
.end method

.method private static parsePaspFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;I)F
    .locals 4
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I

    .prologue
    .line 443
    add-int/lit8 v2, p1, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 444
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v0

    .line 445
    .local v0, "hSpacing":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 446
    .local v1, "vSpacing":I
    int-to-float v2, v0

    int-to-float v3, v1

    div-float/2addr v2, v3

    return v2
.end method

.method private static parseSchiFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    .locals 9
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 451
    add-int/lit8 v2, p1, 0x8

    .line 452
    .local v2, "childPosition":I
    :goto_0
    sub-int v8, v2, p1

    if-ge v8, p2, :cond_2

    .line 453
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 454
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 455
    .local v0, "childAtomSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 456
    .local v1, "childAtomType":I
    sget v8, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tenc:I

    if-ne v1, v8, :cond_1

    .line 457
    const/4 v8, 0x4

    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 458
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v6

    .line 459
    .local v6, "firstInt":I
    shr-int/lit8 v8, v6, 0x8

    if-ne v8, v4, :cond_0

    .line 460
    .local v4, "defaultIsEncrypted":Z
    :goto_1
    and-int/lit16 v3, v6, 0xff

    .line 461
    .local v3, "defaultInitVectorSize":I
    const/16 v8, 0x10

    new-array v5, v8, [B

    .line 462
    .local v5, "defaultKeyId":[B
    array-length v8, v5

    invoke-virtual {p0, v5, v7, v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 463
    new-instance v7, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    invoke-direct {v7, v4, v3, v5}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;-><init>(ZI[B)V

    .line 467
    .end local v0    # "childAtomSize":I
    .end local v1    # "childAtomType":I
    .end local v3    # "defaultInitVectorSize":I
    .end local v4    # "defaultIsEncrypted":Z
    .end local v5    # "defaultKeyId":[B
    .end local v6    # "firstInt":I
    :goto_2
    return-object v7

    .restart local v0    # "childAtomSize":I
    .restart local v1    # "childAtomType":I
    .restart local v6    # "firstInt":I
    :cond_0
    move v4, v7

    .line 459
    goto :goto_1

    .line 465
    .end local v6    # "firstInt":I
    :cond_1
    add-int/2addr v2, v0

    .line 466
    goto :goto_0

    .line 467
    .end local v0    # "childAtomSize":I
    .end local v1    # "childAtomType":I
    :cond_2
    const/4 v7, 0x0

    goto :goto_2
.end method

.method private static parseSinfFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    .locals 5
    .param p0, "parent"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "position"    # I
    .param p2, "size"    # I

    .prologue
    .line 420
    add-int/lit8 v2, p1, 0x8

    .line 422
    .local v2, "childPosition":I
    const/4 v3, 0x0

    .line 423
    .local v3, "trackEncryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    :goto_0
    sub-int v4, v2, p1

    if-ge v4, p2, :cond_3

    .line 424
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 425
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 426
    .local v0, "childAtomSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 427
    .local v1, "childAtomType":I
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_frma:I

    if-ne v1, v4, :cond_1

    .line 428
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    .line 436
    :cond_0
    :goto_1
    add-int/2addr v2, v0

    .line 437
    goto :goto_0

    .line 429
    :cond_1
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_schm:I

    if-ne v1, v4, :cond_2

    .line 430
    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 431
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    .line 432
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    goto :goto_1

    .line 433
    :cond_2
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_schi:I

    if-ne v1, v4, :cond_0

    .line 434
    invoke-static {p0, v2, v0}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseSchiFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    move-result-object v3

    goto :goto_1

    .line 439
    .end local v0    # "childAtomSize":I
    .end local v1    # "childAtomType":I
    :cond_3
    return-object v3
.end method

.method public static parseStbl(Lcom/google/android/exoplayer/mp4/Track;Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;
    .locals 46
    .param p0, "track"    # Lcom/google/android/exoplayer/mp4/Track;
    .param p1, "stblAtom"    # Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    .prologue
    .line 84
    sget v41, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stsz:I

    move-object/from16 v0, p1

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v41

    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v34, v0

    .line 88
    .local v34, "stsz":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v41, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stco:I

    move-object/from16 v0, p1

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v9

    .line 89
    .local v9, "chunkOffsetsAtom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    if-nez v9, :cond_0

    .line 90
    sget v41, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_co64:I

    move-object/from16 v0, p1

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v9

    .line 92
    :cond_0
    iget-object v8, v9, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 94
    .local v8, "chunkOffsets":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v41, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stsc:I

    move-object/from16 v0, p1

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v41

    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v31, v0

    .line 96
    .local v31, "stsc":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v41, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stts:I

    move-object/from16 v0, p1

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v41

    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v35, v0

    .line 98
    .local v35, "stts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    sget v41, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stss:I

    move-object/from16 v0, p1

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v33

    .line 99
    .local v33, "stssAtom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    if-eqz v33, :cond_a

    move-object/from16 v0, v33

    iget-object v0, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v32, v0

    .line 101
    .local v32, "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_0
    sget v41, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ctts:I

    move-object/from16 v0, p1

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v11

    .line 102
    .local v11, "cttsAtom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    if-eqz v11, :cond_b

    iget-object v10, v11, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 105
    .local v10, "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :goto_1
    const/16 v41, 0xc

    move-object/from16 v0, v34

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 106
    invoke-virtual/range {v34 .. v34}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v13

    .line 107
    .local v13, "fixedSampleSize":I
    invoke-virtual/range {v34 .. v34}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v28

    .line 109
    .local v28, "sampleCount":I
    move/from16 v0, v28

    new-array v0, v0, [I

    move-object/from16 v30, v0

    .line 110
    .local v30, "sizes":[I
    move/from16 v0, v28

    new-array v0, v0, [J

    move-object/from16 v40, v0

    .line 111
    .local v40, "timestamps":[J
    move/from16 v0, v28

    new-array v0, v0, [J

    move-object/from16 v20, v0

    .line 112
    .local v20, "offsets":[J
    move/from16 v0, v28

    new-array v14, v0, [I

    .line 115
    .local v14, "flags":[I
    const/16 v41, 0xc

    move/from16 v0, v41

    invoke-virtual {v8, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 116
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v6

    .line 118
    .local v6, "chunkCount":I
    const/16 v41, 0xc

    move-object/from16 v0, v31

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 119
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    add-int/lit8 v24, v41, -0x1

    .line 120
    .local v24, "remainingSamplesPerChunkChanges":I
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v41

    const/16 v42, 0x1

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_c

    const/16 v41, 0x1

    :goto_2
    const-string v42, "stsc first chunk must be 1"

    invoke-static/range {v41 .. v42}, Lcom/google/android/exoplayer/util/Assertions;->checkState(ZLjava/lang/Object;)V

    .line 121
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v29

    .line 122
    .local v29, "samplesPerChunk":I
    const/16 v41, 0x4

    move-object/from16 v0, v31

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 123
    const/16 v16, -0x1

    .line 124
    .local v16, "nextSamplesPerChunkChangeChunkIndex":I
    if-lez v24, :cond_1

    .line 126
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    add-int/lit8 v16, v41, -0x1

    .line 129
    :cond_1
    const/4 v7, 0x0

    .line 130
    .local v7, "chunkIndex":I
    move/from16 v23, v29

    .line 133
    .local v23, "remainingSamplesInChunk":I
    const/16 v41, 0xc

    move-object/from16 v0, v35

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 134
    invoke-virtual/range {v35 .. v35}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    add-int/lit8 v26, v41, -0x1

    .line 135
    .local v26, "remainingTimestampDeltaChanges":I
    invoke-virtual/range {v35 .. v35}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v21

    .line 136
    .local v21, "remainingSamplesAtTimestampDelta":I
    invoke-virtual/range {v35 .. v35}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v36

    .line 139
    .local v36, "timestampDeltaInTimeUnits":I
    const/4 v12, 0x0

    .line 140
    .local v12, "cttsHasSignedOffsets":Z
    const/16 v22, 0x0

    .line 141
    .local v22, "remainingSamplesAtTimestampOffset":I
    const/16 v27, 0x0

    .line 142
    .local v27, "remainingTimestampOffsetChanges":I
    const/16 v37, 0x0

    .line 143
    .local v37, "timestampOffset":I
    if-eqz v10, :cond_2

    .line 144
    const/16 v41, 0x8

    move/from16 v0, v41

    invoke-virtual {v10, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 145
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v41

    invoke-static/range {v41 .. v41}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomVersion(I)I

    move-result v41

    const/16 v42, 0x1

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_d

    const/4 v12, 0x1

    .line 146
    :goto_3
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    add-int/lit8 v27, v41, -0x1

    .line 147
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v22

    .line 148
    if-eqz v12, :cond_e

    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v37

    .line 151
    :cond_2
    :goto_4
    const/16 v17, -0x1

    .line 152
    .local v17, "nextSynchronizationSampleIndex":I
    const/16 v25, 0x0

    .line 153
    .local v25, "remainingSynchronizationSamples":I
    if-eqz v32, :cond_3

    .line 154
    const/16 v41, 0xc

    move-object/from16 v0, v32

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 155
    invoke-virtual/range {v32 .. v32}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v25

    .line 156
    invoke-virtual/range {v32 .. v32}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    add-int/lit8 v17, v41, -0x1

    .line 161
    :cond_3
    iget v0, v9, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->type:I

    move/from16 v41, v0

    sget v42, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stco:I

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_f

    .line 162
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v18

    .line 167
    .local v18, "offsetBytes":J
    :goto_5
    const-wide/16 v38, 0x0

    .line 168
    .local v38, "timestampTimeUnits":J
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_6
    move/from16 v0, v28

    if-ge v15, v0, :cond_15

    .line 169
    aput-wide v18, v20, v15

    .line 170
    if-nez v13, :cond_10

    invoke-virtual/range {v34 .. v34}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    :goto_7
    aput v41, v30, v15

    .line 171
    move/from16 v0, v37

    int-to-long v0, v0

    move-wide/from16 v42, v0

    add-long v42, v42, v38

    aput-wide v42, v40, v15

    .line 174
    if-nez v32, :cond_11

    const/16 v41, 0x1

    :goto_8
    aput v41, v14, v15

    .line 175
    move/from16 v0, v17

    if-ne v15, v0, :cond_4

    .line 176
    const/16 v41, 0x1

    aput v41, v14, v15

    .line 177
    add-int/lit8 v25, v25, -0x1

    .line 178
    if-lez v25, :cond_4

    .line 179
    invoke-virtual/range {v32 .. v32}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    add-int/lit8 v17, v41, -0x1

    .line 184
    :cond_4
    move/from16 v0, v36

    int-to-long v0, v0

    move-wide/from16 v42, v0

    add-long v38, v38, v42

    .line 185
    add-int/lit8 v21, v21, -0x1

    .line 186
    if-nez v21, :cond_5

    if-lez v26, :cond_5

    .line 187
    invoke-virtual/range {v35 .. v35}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v21

    .line 188
    invoke-virtual/range {v35 .. v35}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v36

    .line 189
    add-int/lit8 v26, v26, -0x1

    .line 193
    :cond_5
    if-eqz v10, :cond_6

    .line 194
    add-int/lit8 v22, v22, -0x1

    .line 195
    if-nez v22, :cond_6

    if-lez v27, :cond_6

    .line 196
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v22

    .line 197
    if-eqz v12, :cond_12

    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v37

    .line 198
    :goto_9
    add-int/lit8 v27, v27, -0x1

    .line 203
    :cond_6
    add-int/lit8 v23, v23, -0x1

    .line 204
    if-nez v23, :cond_14

    .line 205
    add-int/lit8 v7, v7, 0x1

    .line 206
    if-ge v7, v6, :cond_7

    .line 207
    iget v0, v9, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->type:I

    move/from16 v41, v0

    sget v42, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stco:I

    move/from16 v0, v41

    move/from16 v1, v42

    if-ne v0, v1, :cond_13

    .line 208
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v18

    .line 215
    :cond_7
    :goto_a
    move/from16 v0, v16

    if-ne v7, v0, :cond_8

    .line 216
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v29

    .line 217
    const/16 v41, 0x4

    move-object/from16 v0, v31

    move/from16 v1, v41

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 218
    add-int/lit8 v24, v24, -0x1

    .line 219
    if-lez v24, :cond_8

    .line 220
    invoke-virtual/range {v31 .. v31}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v41

    add-int/lit8 v16, v41, -0x1

    .line 225
    :cond_8
    if-ge v7, v6, :cond_9

    .line 226
    move/from16 v23, v29

    .line 168
    :cond_9
    :goto_b
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_6

    .line 99
    .end local v6    # "chunkCount":I
    .end local v7    # "chunkIndex":I
    .end local v10    # "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .end local v11    # "cttsAtom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .end local v12    # "cttsHasSignedOffsets":Z
    .end local v13    # "fixedSampleSize":I
    .end local v14    # "flags":[I
    .end local v15    # "i":I
    .end local v16    # "nextSamplesPerChunkChangeChunkIndex":I
    .end local v17    # "nextSynchronizationSampleIndex":I
    .end local v18    # "offsetBytes":J
    .end local v20    # "offsets":[J
    .end local v21    # "remainingSamplesAtTimestampDelta":I
    .end local v22    # "remainingSamplesAtTimestampOffset":I
    .end local v23    # "remainingSamplesInChunk":I
    .end local v24    # "remainingSamplesPerChunkChanges":I
    .end local v25    # "remainingSynchronizationSamples":I
    .end local v26    # "remainingTimestampDeltaChanges":I
    .end local v27    # "remainingTimestampOffsetChanges":I
    .end local v28    # "sampleCount":I
    .end local v29    # "samplesPerChunk":I
    .end local v30    # "sizes":[I
    .end local v32    # "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .end local v36    # "timestampDeltaInTimeUnits":I
    .end local v37    # "timestampOffset":I
    .end local v38    # "timestampTimeUnits":J
    .end local v40    # "timestamps":[J
    :cond_a
    const/16 v32, 0x0

    goto/16 :goto_0

    .line 102
    .restart local v11    # "cttsAtom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .restart local v32    # "stss":Lcom/google/android/exoplayer/util/ParsableByteArray;
    :cond_b
    const/4 v10, 0x0

    goto/16 :goto_1

    .line 120
    .restart local v6    # "chunkCount":I
    .restart local v10    # "ctts":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .restart local v13    # "fixedSampleSize":I
    .restart local v14    # "flags":[I
    .restart local v20    # "offsets":[J
    .restart local v24    # "remainingSamplesPerChunkChanges":I
    .restart local v28    # "sampleCount":I
    .restart local v30    # "sizes":[I
    .restart local v40    # "timestamps":[J
    :cond_c
    const/16 v41, 0x0

    goto/16 :goto_2

    .line 145
    .restart local v7    # "chunkIndex":I
    .restart local v12    # "cttsHasSignedOffsets":Z
    .restart local v16    # "nextSamplesPerChunkChangeChunkIndex":I
    .restart local v21    # "remainingSamplesAtTimestampDelta":I
    .restart local v22    # "remainingSamplesAtTimestampOffset":I
    .restart local v23    # "remainingSamplesInChunk":I
    .restart local v26    # "remainingTimestampDeltaChanges":I
    .restart local v27    # "remainingTimestampOffsetChanges":I
    .restart local v29    # "samplesPerChunk":I
    .restart local v36    # "timestampDeltaInTimeUnits":I
    .restart local v37    # "timestampOffset":I
    :cond_d
    const/4 v12, 0x0

    goto/16 :goto_3

    .line 148
    :cond_e
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v37

    goto/16 :goto_4

    .line 164
    .restart local v17    # "nextSynchronizationSampleIndex":I
    .restart local v25    # "remainingSynchronizationSamples":I
    :cond_f
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v18

    .restart local v18    # "offsetBytes":J
    goto/16 :goto_5

    .restart local v15    # "i":I
    .restart local v38    # "timestampTimeUnits":J
    :cond_10
    move/from16 v41, v13

    .line 170
    goto/16 :goto_7

    .line 174
    :cond_11
    const/16 v41, 0x0

    goto/16 :goto_8

    .line 197
    :cond_12
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v37

    goto :goto_9

    .line 210
    :cond_13
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v18

    goto :goto_a

    .line 230
    :cond_14
    aget v41, v30, v15

    move/from16 v0, v41

    int-to-long v0, v0

    move-wide/from16 v42, v0

    add-long v18, v18, v42

    goto :goto_b

    .line 234
    :cond_15
    const-wide/32 v42, 0xf4240

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/mp4/Track;->timescale:J

    move-wide/from16 v44, v0

    move-object/from16 v0, v40

    move-wide/from16 v1, v42

    move-wide/from16 v3, v44

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestampsInPlace([JJJ)V

    .line 237
    if-nez v25, :cond_16

    const/16 v41, 0x1

    :goto_c
    invoke-static/range {v41 .. v41}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 238
    if-nez v21, :cond_17

    const/16 v41, 0x1

    :goto_d
    invoke-static/range {v41 .. v41}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 239
    if-nez v23, :cond_18

    const/16 v41, 0x1

    :goto_e
    invoke-static/range {v41 .. v41}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 240
    if-nez v26, :cond_19

    const/16 v41, 0x1

    :goto_f
    invoke-static/range {v41 .. v41}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 241
    if-nez v27, :cond_1a

    const/16 v41, 0x1

    :goto_10
    invoke-static/range {v41 .. v41}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 242
    new-instance v41, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;

    move-object/from16 v0, v41

    move-object/from16 v1, v20

    move-object/from16 v2, v30

    move-object/from16 v3, v40

    invoke-direct {v0, v1, v2, v3, v14}, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;-><init>([J[I[J[I)V

    return-object v41

    .line 237
    :cond_16
    const/16 v41, 0x0

    goto :goto_c

    .line 238
    :cond_17
    const/16 v41, 0x0

    goto :goto_d

    .line 239
    :cond_18
    const/16 v41, 0x0

    goto :goto_e

    .line 240
    :cond_19
    const/16 v41, 0x0

    goto :goto_f

    .line 241
    :cond_1a
    const/16 v41, 0x0

    goto :goto_10
.end method

.method private static parseStsd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;
    .locals 11
    .param p0, "stsd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Lcom/google/android/exoplayer/MediaFormat;",
            "[",
            "Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;",
            ">;"
        }
    .end annotation

    .prologue
    .line 325
    const/16 v9, 0xc

    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 326
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 327
    .local v7, "numberOfEntries":I
    const/4 v6, 0x0

    .line 328
    .local v6, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    new-array v8, v7, [Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    .line 329
    .local v8, "trackEncryptionBoxes":[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v7, :cond_7

    .line 330
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v4

    .line 331
    .local v4, "childStartPosition":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 332
    .local v2, "childAtomSize":I
    if-lez v2, :cond_2

    const/4 v9, 0x1

    :goto_1
    const-string v10, "childAtomSize should be positive"

    invoke-static {v9, v10}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(ZLjava/lang/Object;)V

    .line 333
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v3

    .line 334
    .local v3, "childAtomType":I
    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avc1:I

    if-eq v3, v9, :cond_0

    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avc3:I

    if-eq v3, v9, :cond_0

    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_encv:I

    if-ne v3, v9, :cond_3

    .line 337
    :cond_0
    invoke-static {p0, v4, v2}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseAvcFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Landroid/util/Pair;

    move-result-object v1

    .line 338
    .local v1, "avc":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;>;"
    iget-object v6, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v6    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    check-cast v6, Lcom/google/android/exoplayer/MediaFormat;

    .line 339
    .restart local v6    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    iget-object v9, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v9, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    aput-object v9, v8, v5

    .line 351
    .end local v1    # "avc":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;>;"
    :cond_1
    :goto_2
    add-int v9, v4, v2

    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 329
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 332
    .end local v3    # "childAtomType":I
    :cond_2
    const/4 v9, 0x0

    goto :goto_1

    .line 340
    .restart local v3    # "childAtomType":I
    :cond_3
    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mp4a:I

    if-eq v3, v9, :cond_4

    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_enca:I

    if-eq v3, v9, :cond_4

    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ac_3:I

    if-ne v3, v9, :cond_5

    .line 343
    :cond_4
    invoke-static {p0, v3, v4, v2}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseAudioSampleEntry(Lcom/google/android/exoplayer/util/ParsableByteArray;III)Landroid/util/Pair;

    move-result-object v0

    .line 344
    .local v0, "audioSampleEntry":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;>;"
    iget-object v6, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .end local v6    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    check-cast v6, Lcom/google/android/exoplayer/MediaFormat;

    .line 345
    .restart local v6    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    iget-object v9, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v9, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    aput-object v9, v8, v5

    goto :goto_2

    .line 346
    .end local v0    # "audioSampleEntry":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer/MediaFormat;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;>;"
    :cond_5
    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_TTML:I

    if-ne v3, v9, :cond_6

    .line 347
    invoke-static {}, Lcom/google/android/exoplayer/MediaFormat;->createTtmlFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v6

    goto :goto_2

    .line 348
    :cond_6
    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mp4v:I

    if-ne v3, v9, :cond_1

    .line 349
    invoke-static {p0, v4, v2}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseMp4vFromParent(Lcom/google/android/exoplayer/util/ParsableByteArray;II)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v6

    goto :goto_2

    .line 353
    .end local v2    # "childAtomSize":I
    .end local v3    # "childAtomType":I
    .end local v4    # "childStartPosition":I
    :cond_7
    invoke-static {v6, v8}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v9

    return-object v9
.end method

.method private static parseTkhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;
    .locals 11
    .param p0, "tkhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ParsableByteArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x4

    const/16 v10, 0x8

    .line 269
    invoke-virtual {p0, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 270
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v5

    .line 271
    .local v5, "fullAtom":I
    invoke-static {v5}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomVersion(I)I

    move-result v8

    .line 273
    .local v8, "version":I
    if-nez v8, :cond_1

    move v9, v10

    :goto_0
    invoke-virtual {p0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 275
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 276
    .local v7, "trackId":I
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 278
    const/4 v4, 0x1

    .line 279
    .local v4, "durationUnknown":Z
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->getPosition()I

    move-result v3

    .line 280
    .local v3, "durationPosition":I
    if-nez v8, :cond_2

    .line 281
    .local v2, "durationByteCount":I
    :goto_1
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    if-ge v6, v2, :cond_0

    .line 282
    iget-object v9, p0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    add-int v10, v3, v6

    aget-byte v9, v9, v10

    const/4 v10, -0x1

    if-eq v9, v10, :cond_3

    .line 283
    const/4 v4, 0x0

    .line 288
    :cond_0
    if-eqz v4, :cond_4

    .line 289
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 290
    const-wide/16 v0, -0x1

    .line 295
    .local v0, "duration":J
    :goto_3
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v9

    return-object v9

    .line 273
    .end local v0    # "duration":J
    .end local v2    # "durationByteCount":I
    .end local v3    # "durationPosition":I
    .end local v4    # "durationUnknown":Z
    .end local v6    # "i":I
    .end local v7    # "trackId":I
    :cond_1
    const/16 v9, 0x10

    goto :goto_0

    .restart local v3    # "durationPosition":I
    .restart local v4    # "durationUnknown":Z
    .restart local v7    # "trackId":I
    :cond_2
    move v2, v10

    .line 280
    goto :goto_1

    .line 281
    .restart local v2    # "durationByteCount":I
    .restart local v6    # "i":I
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 292
    :cond_4
    if-nez v8, :cond_5

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v0

    .restart local v0    # "duration":J
    :goto_4
    goto :goto_3

    .end local v0    # "duration":J
    :cond_5
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v0

    goto :goto_4
.end method

.method public static parseTrak(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;)Lcom/google/android/exoplayer/mp4/Track;
    .locals 21
    .param p0, "trak"    # Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;
    .param p1, "mvhd"    # Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    .prologue
    .line 50
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdia:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    move-result-object v18

    .line 51
    .local v18, "mdia":Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_hdlr:I

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v4}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseHdlr(Lcom/google/android/exoplayer/util/ParsableByteArray;)I

    move-result v11

    .line 52
    .local v11, "trackType":I
    const v4, 0x736f756e

    if-eq v11, v4, :cond_0

    const v4, 0x76696465

    if-eq v11, v4, :cond_0

    const v4, 0x74657874

    if-eq v11, v4, :cond_0

    const v4, 0x746d6364

    if-ne v11, v4, :cond_1

    :cond_0
    const/4 v4, 0x1

    :goto_0
    invoke-static {v4}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 55
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tkhd:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v4}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseTkhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v8

    .line 56
    .local v8, "header":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    iget-object v4, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 57
    .local v10, "id":I
    iget-object v4, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 58
    .local v2, "duration":J
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v4}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseMvhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J

    move-result-wide v6

    .line 60
    .local v6, "movieTimescale":J
    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-nez v4, :cond_2

    .line 61
    const-wide/16 v14, -0x1

    .line 65
    .local v14, "durationUs":J
    :goto_1
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_minf:I

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    move-result-object v4

    sget v5, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stbl:I

    .line 66
    invoke-virtual {v4, v5}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    move-result-object v20

    .line 68
    .local v20, "stbl":Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdhd:I

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v4}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseMdhd(Lcom/google/android/exoplayer/util/ParsableByteArray;)J

    move-result-wide v12

    .line 69
    .local v12, "mediaTimescale":J
    sget v4, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stsd:I

    .line 70
    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v4

    iget-object v4, v4, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v4}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseStsd(Lcom/google/android/exoplayer/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v19

    .line 71
    .local v19, "sampleDescriptions":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer/MediaFormat;[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;>;"
    new-instance v9, Lcom/google/android/exoplayer/mp4/Track;

    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, Lcom/google/android/exoplayer/MediaFormat;

    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v17, v0

    check-cast v17, [Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    invoke-direct/range {v9 .. v17}, Lcom/google/android/exoplayer/mp4/Track;-><init>(IIJJLcom/google/android/exoplayer/MediaFormat;[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;)V

    return-object v9

    .line 52
    .end local v2    # "duration":J
    .end local v6    # "movieTimescale":J
    .end local v8    # "header":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    .end local v10    # "id":I
    .end local v12    # "mediaTimescale":J
    .end local v14    # "durationUs":J
    .end local v19    # "sampleDescriptions":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/google/android/exoplayer/MediaFormat;[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;>;"
    .end local v20    # "stbl":Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;
    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 63
    .restart local v2    # "duration":J
    .restart local v6    # "movieTimescale":J
    .restart local v8    # "header":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    .restart local v10    # "id":I
    :cond_2
    const-wide/32 v4, 0xf4240

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v14

    .restart local v14    # "durationUs":J
    goto :goto_1
.end method
