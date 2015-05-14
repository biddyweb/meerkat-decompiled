.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "MP3TrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    }
.end annotation


# static fields
.field private static final BIT_RATE:[I

.field private static final ES_OBJECT_TYPE_INDICATION:I = 0x6b

.field private static final ES_STREAM_TYPE:I = 0x5

.field private static final MPEG_L3:I = 0x1

.field private static final MPEG_V1:I = 0x3

.field private static final SAMPLES_PER_FRAME:I = 0x480

.field private static final SAMPLE_RATE:[I


# instance fields
.field avgBitRate:J

.field private final dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

.field private durations:[J

.field firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

.field maxBitRate:J

.field sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field private samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->SAMPLE_RATE:[I

    .line 34
    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->BIT_RATE:[I

    return-void

    .line 33
    :array_0
    .array-data 4
        0xac44
        0xbb80
        0x7d00
        0x0
    .end array-data

    .line 34
    :array_1
    .array-data 4
        0x0
        0x7d00
        0x9c40
        0xbb80
        0xdac0
        0xfa00
        0x13880
        0x17700
        0x1b580
        0x1f400
        0x27100
        0x2ee00
        0x36b00
        0x3e800
        0x4e200
        0x0
    .end array-data
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 1
    .param p1, "channel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    const-string v0, "eng"

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V
    .locals 28
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "lang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 41
    new-instance v23, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 62
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 63
    new-instance v23, Ljava/util/LinkedList;

    invoke-direct/range {v23 .. v23}, Ljava/util/LinkedList;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->samples:Ljava/util/List;

    .line 64
    invoke-direct/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->sampleRate:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x4092000000000000L    # 1152.0

    div-double v18, v24, v26

    .line 67
    .local v18, "packetsPerSecond":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->samples:Ljava/util/List;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v23

    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v14, v24, v18

    .line 69
    .local v14, "duration":D
    const-wide/16 v10, 0x0

    .line 70
    .local v10, "dataSize":J
    new-instance v17, Ljava/util/LinkedList;

    invoke-direct/range {v17 .. v17}, Ljava/util/LinkedList;-><init>()V

    .line 71
    .local v17, "queue":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->samples:Ljava/util/List;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_0
    :goto_0
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_3

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 72
    .local v20, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface/range {v20 .. v20}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v24

    move-wide/from16 v0, v24

    long-to-int v0, v0

    move/from16 v21, v0

    .line 73
    .local v21, "size":I
    move/from16 v0, v21

    int-to-long v0, v0

    move-wide/from16 v24, v0

    add-long v10, v10, v24

    .line 74
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 75
    :goto_1
    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->size()I

    move-result v24

    move/from16 v0, v24

    int-to-double v0, v0

    move-wide/from16 v24, v0

    cmpl-double v24, v24, v18

    if-lez v24, :cond_1

    .line 76
    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    goto :goto_1

    .line 78
    :cond_1
    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->size()I

    move-result v24

    move-wide/from16 v0, v18

    double-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_0

    .line 79
    const/4 v8, 0x0

    .line 80
    .local v8, "currSize":I
    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :goto_2
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_2

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 81
    .local v4, "aQueue":Ljava/lang/Integer;
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v25

    add-int v8, v8, v25

    .line 82
    goto :goto_2

    .line 83
    .end local v4    # "aQueue":Ljava/lang/Integer;
    :cond_2
    const-wide/high16 v24, 0x4020000000000000L    # 8.0

    int-to-double v0, v8

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    invoke-virtual/range {v17 .. v17}, Ljava/util/LinkedList;->size()I

    move-result v26

    move/from16 v0, v26

    int-to-double v0, v0

    move-wide/from16 v26, v0

    div-double v24, v24, v26

    mul-double v6, v24, v18

    .line 84
    .local v6, "currBitRate":D
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->maxBitRate:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    long-to-double v0, v0

    move-wide/from16 v24, v0

    cmpl-double v24, v6, v24

    if-lez v24, :cond_0

    .line 85
    double-to-int v0, v6

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->maxBitRate:J

    goto/16 :goto_0

    .line 90
    .end local v6    # "currBitRate":D
    .end local v8    # "currSize":I
    .end local v20    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .end local v21    # "size":I
    :cond_3
    const-wide/16 v24, 0x8

    mul-long v24, v24, v10

    move-wide/from16 v0, v24

    long-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v24, v24, v14

    move-wide/from16 v0, v24

    double-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->avgBitRate:J

    .line 92
    new-instance v23, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 93
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    const-string v23, "mp4a"

    move-object/from16 v0, v23

    invoke-direct {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;-><init>(Ljava/lang/String;)V

    .line 94
    .local v5, "audioSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->channelCount:I

    move/from16 v23, v0

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setChannelCount(I)V

    .line 95
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->sampleRate:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    invoke-virtual {v5, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleRate(J)V

    .line 96
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setDataReferenceIndex(I)V

    .line 97
    const/16 v23, 0x10

    move/from16 v0, v23

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleSize(I)V

    .line 100
    new-instance v16, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;

    invoke-direct/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;-><init>()V

    .line 101
    .local v16, "esds":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
    new-instance v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    invoke-direct {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;-><init>()V

    .line 102
    .local v13, "descriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v13, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->setEsId(I)V

    .line 104
    new-instance v22, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;

    invoke-direct/range {v22 .. v22}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;-><init>()V

    .line 105
    .local v22, "slConfigDescriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;
    const/16 v23, 0x2

    invoke-virtual/range {v22 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;->setPredefined(I)V

    .line 106
    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->setSlConfigDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;)V

    .line 108
    new-instance v12, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    invoke-direct {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;-><init>()V

    .line 109
    .local v12, "decoderConfigDescriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    const/16 v23, 0x6b

    move/from16 v0, v23

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setObjectTypeIndication(I)V

    .line 110
    const/16 v23, 0x5

    move/from16 v0, v23

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setStreamType(I)V

    .line 111
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->maxBitRate:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setMaxBitRate(J)V

    .line 112
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->avgBitRate:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setAvgBitRate(J)V

    .line 113
    invoke-virtual {v13, v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->setDecoderConfigDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;)V

    .line 115
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->serialize()Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 116
    .local v9, "data":Ljava/nio/ByteBuffer;
    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->setData(Ljava/nio/ByteBuffer;)V

    .line 117
    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 118
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v23, v0

    new-instance v24, Ljava/util/Date;

    invoke-direct/range {v24 .. v24}, Ljava/util/Date;-><init>()V

    invoke-virtual/range {v23 .. v24}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 121
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v23, v0

    new-instance v24, Ljava/util/Date;

    invoke-direct/range {v24 .. v24}, Ljava/util/Date;-><init>()V

    invoke-virtual/range {v23 .. v24}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 122
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v23, v0

    const/high16 v24, 0x3f800000    # 1.0f

    invoke-virtual/range {v23 .. v24}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setVolume(F)V

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->sampleRate:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    invoke-virtual/range {v23 .. v25}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 125
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->samples:Ljava/util/List;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v23

    move/from16 v0, v23

    new-array v0, v0, [J

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->durations:[J

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->durations:[J

    move-object/from16 v23, v0

    const-wide/16 v24, 0x480

    invoke-static/range {v23 .. v25}, Ljava/util/Arrays;->fill([JJ)V

    .line 127
    return-void
.end method

.method private readMP3Header(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    .locals 10
    .param p1, "channel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 189
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    invoke-direct {v2, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;)V

    .line 190
    .local v2, "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    invoke-static {v8}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 191
    .local v0, "bb":Ljava/nio/ByteBuffer;
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-ge v4, v8, :cond_1

    .line 192
    invoke-interface {p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    move-result v4

    const/4 v7, -0x1

    if-ne v4, v7, :cond_0

    .line 193
    const/4 v2, 0x0

    .line 228
    .end local v2    # "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    :goto_0
    return-object v2

    .line 197
    .restart local v2    # "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    :cond_1
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-direct {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 198
    .local v1, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/16 v4, 0xb

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    .line 199
    .local v3, "sync":I
    const/16 v4, 0x7ff

    if-eq v3, v4, :cond_2

    .line 200
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Expected Start Word 0x7ff"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 201
    :cond_2
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->mpegVersion:I

    .line 203
    iget v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->mpegVersion:I

    if-eq v4, v9, :cond_3

    .line 204
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Expected MPEG Version 1 (ISO/IEC 11172-3)"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 206
    :cond_3
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->layer:I

    .line 208
    iget v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->layer:I

    if-eq v4, v5, :cond_4

    .line 209
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Expected Layer III"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 211
    :cond_4
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->protectionAbsent:I

    .line 213
    invoke-virtual {v1, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->bitRateIndex:I

    .line 214
    sget-object v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->BIT_RATE:[I

    iget v7, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->bitRateIndex:I

    aget v4, v4, v7

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->bitRate:I

    .line 215
    iget v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->bitRate:I

    if-nez v4, :cond_5

    .line 216
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Unexpected (free/bad) bit rate"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 218
    :cond_5
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->sampleFrequencyIndex:I

    .line 219
    sget-object v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->SAMPLE_RATE:[I

    iget v7, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->sampleFrequencyIndex:I

    aget v4, v4, v7

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->sampleRate:I

    .line 220
    iget v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->sampleRate:I

    if-nez v4, :cond_6

    .line 221
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Unexpected (reserved) sample rate frequency"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 223
    :cond_6
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->padding:I

    .line 224
    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 226
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->channelMode:I

    .line 227
    iget v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->channelMode:I

    if-ne v4, v9, :cond_7

    move v4, v5

    :goto_1
    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->channelCount:I

    goto/16 :goto_0

    :cond_7
    move v4, v6

    goto :goto_1
.end method

.method private readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    .locals 7
    .param p1, "channel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    const/4 v1, 0x0

    .line 173
    .local v1, "first":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    :goto_0
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v4

    .line 175
    .local v4, "pos":J
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->readMP3Header(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;

    move-result-object v2

    .local v2, "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;
    if-nez v2, :cond_0

    .line 185
    return-object v1

    .line 177
    :cond_0
    if-nez v1, :cond_1

    .line 178
    move-object v1, v2

    .line 179
    :cond_1
    invoke-interface {p1, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 180
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl$MP3Header;->getFrameLength()I

    move-result v3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 181
    .local v0, "data":Ljava/nio/ByteBuffer;
    invoke-interface {p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 182
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 183
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->samples:Ljava/util/List;

    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;

    invoke-direct {v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 58
    return-void
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    const-string v0, "soun"

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->durations:[J

    return-object v0
.end method

.method public getSamples()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/MP3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 233
    const-string v0, "MP3TrackImpl"

    return-object v0
.end method
