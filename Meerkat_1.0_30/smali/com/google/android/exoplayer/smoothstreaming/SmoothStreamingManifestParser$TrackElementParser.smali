.class Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;
.super Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser;
.source "SmoothStreamingManifestParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TrackElementParser"
.end annotation


# static fields
.field private static final KEY_AUDIO_TAG:Ljava/lang/String; = "AudioTag"

.field private static final KEY_BITRATE:Ljava/lang/String; = "Bitrate"

.field private static final KEY_BITS_PER_SAMPLE:Ljava/lang/String; = "BitsPerSample"

.field private static final KEY_CHANNELS:Ljava/lang/String; = "Channels"

.field private static final KEY_CODEC_PRIVATE_DATA:Ljava/lang/String; = "CodecPrivateData"

.field private static final KEY_FOUR_CC:Ljava/lang/String; = "FourCC"

.field private static final KEY_INDEX:Ljava/lang/String; = "Index"

.field private static final KEY_MAX_HEIGHT:Ljava/lang/String; = "MaxHeight"

.field private static final KEY_MAX_WIDTH:Ljava/lang/String; = "MaxWidth"

.field private static final KEY_NAL_UNIT_LENGTH_FIELD:Ljava/lang/String; = "NALUnitLengthField"

.field private static final KEY_PACKET_SIZE:Ljava/lang/String; = "PacketSize"

.field private static final KEY_SAMPLING_RATE:Ljava/lang/String; = "SamplingRate"

.field private static final KEY_TYPE:Ljava/lang/String; = "Type"

.field public static final TAG:Ljava/lang/String; = "QualityLevel"


# instance fields
.field private audioTag:I

.field private bitPerSample:I

.field private bitrate:I

.field private channels:I

.field private content:Ljava/lang/String;

.field private final csd:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end field

.field private index:I

.field private level:I

.field private maxHeight:I

.field private maxWidth:I

.field private mimeType:Ljava/lang/String;

.field private nalUnitLengthField:I

.field private packetSize:I

.field private profile:I

.field private samplingRate:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser;Landroid/net/Uri;)V
    .locals 1
    .param p1, "parent"    # Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser;
    .param p2, "baseUri"    # Landroid/net/Uri;

    .prologue
    .line 616
    const-string v0, "QualityLevel"

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser;-><init>(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser;Landroid/net/Uri;Ljava/lang/String;)V

    .line 617
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->csd:Ljava/util/List;

    .line 618
    return-void
.end method

.method private static fourCCToMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "fourCC"    # Ljava/lang/String;

    .prologue
    .line 694
    const-string v0, "H264"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "X264"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "AVC1"

    .line 695
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "DAVC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 696
    :cond_0
    const-string v0, "video/avc"

    .line 703
    :goto_0
    return-object v0

    .line 697
    :cond_1
    const-string v0, "AAC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "AACL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "AACH"

    .line 698
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "AACP"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 699
    :cond_2
    const-string v0, "audio/mp4a-latm"

    goto :goto_0

    .line 700
    :cond_3
    const-string v0, "TTML"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 701
    const-string v0, "application/ttml+xml"

    goto :goto_0

    .line 703
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static hexStringToByteArray(Ljava/lang/String;)[B
    .locals 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 707
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 708
    .local v2, "length":I
    div-int/lit8 v4, v2, 0x2

    new-array v0, v4, [B

    .line 709
    .local v0, "data":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_0

    .line 710
    mul-int/lit8 v3, v1, 0x2

    .line 711
    .local v3, "stringOffset":I
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v3, 0x1

    .line 712
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 709
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 714
    .end local v3    # "stringOffset":I
    :cond_0
    return-object v0
.end method


# virtual methods
.method public build()Ljava/lang/Object;
    .locals 17

    .prologue
    .line 683
    const/4 v5, 0x0

    check-cast v5, [[B

    .line 684
    .local v5, "csdArray":[[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->csd:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 685
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->csd:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v5, v1, [[B

    .line 686
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->csd:Ljava/util/List;

    invoke-interface {v1, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 688
    :cond_0
    new-instance v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->index:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->bitrate:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->profile:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->level:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->maxWidth:I

    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->maxHeight:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->samplingRate:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->channels:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->packetSize:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->audioTag:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->bitPerSample:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->nalUnitLengthField:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->content:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-direct/range {v1 .. v16}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;-><init>(IILjava/lang/String;[[BIIIIIIIIIILjava/lang/String;)V

    return-object v1
.end method

.method public parseStartTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 11
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v10, -0x1

    .line 622
    const-string v7, "Type"

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->getNormalizedAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 623
    .local v5, "type":I
    iput-object v8, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->content:Ljava/lang/String;

    .line 626
    const-string v7, "Index"

    invoke-virtual {p0, p1, v7, v10}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->index:I

    .line 627
    const-string v7, "Bitrate"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->bitrate:I

    .line 628
    const-string v7, "NALUnitLengthField"

    const/4 v9, 0x4

    invoke-virtual {p0, p1, v7, v9}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->nalUnitLengthField:I

    .line 630
    const/4 v7, 0x1

    if-ne v5, v7, :cond_1

    .line 631
    const-string v7, "MaxHeight"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->maxHeight:I

    .line 632
    const-string v7, "MaxWidth"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->maxWidth:I

    .line 633
    const-string v7, "FourCC"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->fourCCToMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->mimeType:Ljava/lang/String;

    .line 643
    :goto_0
    if-nez v5, :cond_4

    .line 644
    const-string v7, "SamplingRate"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->samplingRate:I

    .line 645
    const-string v7, "Channels"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->channels:I

    .line 646
    const-string v7, "BitsPerSample"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->bitPerSample:I

    .line 647
    const-string v7, "PacketSize"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->packetSize:I

    .line 648
    const-string v7, "AudioTag"

    invoke-virtual {p0, p1, v7}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->parseRequiredInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->audioTag:I

    .line 657
    :goto_1
    const-string v7, "CodecPrivateData"

    invoke-interface {p1, v8, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 658
    .local v6, "value":Ljava/lang/String;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_0

    .line 659
    invoke-static {v6}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v0

    .line 660
    .local v0, "codecPrivateData":[B
    invoke-static {v0}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->splitNalUnits([B)[[B

    move-result-object v3

    .line 661
    .local v3, "split":[[B
    if-nez v3, :cond_5

    .line 662
    iget-object v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->csd:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 674
    .end local v0    # "codecPrivateData":[B
    .end local v3    # "split":[[B
    :cond_0
    return-void

    .line 635
    .end local v6    # "value":Ljava/lang/String;
    :cond_1
    iput v10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->maxHeight:I

    .line 636
    iput v10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->maxWidth:I

    .line 637
    const-string v7, "FourCC"

    invoke-interface {p1, v8, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 639
    .local v1, "fourCC":Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-static {v1}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->fourCCToMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_2
    iput-object v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->mimeType:Ljava/lang/String;

    goto :goto_0

    :cond_2
    if-nez v5, :cond_3

    const-string v7, "audio/mp4a-latm"

    goto :goto_2

    :cond_3
    move-object v7, v8

    goto :goto_2

    .line 650
    .end local v1    # "fourCC":Ljava/lang/String;
    :cond_4
    iput v10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->samplingRate:I

    .line 651
    iput v10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->channels:I

    .line 652
    iput v10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->bitPerSample:I

    .line 653
    iput v10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->packetSize:I

    .line 654
    iput v10, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->audioTag:I

    goto :goto_1

    .line 664
    .restart local v0    # "codecPrivateData":[B
    .restart local v3    # "split":[[B
    .restart local v6    # "value":Ljava/lang/String;
    :cond_5
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    array-length v7, v3

    if-ge v2, v7, :cond_0

    .line 665
    aget-object v7, v3, v2

    invoke-static {v7}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->parseSpsNalUnit([B)Landroid/util/Pair;

    move-result-object v4

    .line 666
    .local v4, "spsParameters":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    if-eqz v4, :cond_6

    .line 667
    iget-object v7, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->profile:I

    .line 668
    iget-object v7, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iput v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->level:I

    .line 670
    :cond_6
    iget-object v7, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->csd:Ljava/util/List;

    aget-object v8, v3, v2

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 664
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method public parseText(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 1
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 678
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;->content:Ljava/lang/String;

    .line 679
    return-void
.end method
