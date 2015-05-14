.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "EC3TrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    }
.end annotation


# static fields
.field private static final MAX_FRAMES_PER_MMAP:J = 0x14L


# instance fields
.field private bitStreamInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;",
            ">;"
        }
    .end annotation
.end field

.field private bitrate:I

.field private final dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

.field private decodingTimes:[J

.field private frameSize:I

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
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 13
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 36
    new-instance v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    iput-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 42
    new-instance v9, Ljava/util/LinkedList;

    invoke-direct {v9}, Ljava/util/LinkedList;-><init>()V

    iput-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    .line 48
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 50
    const/4 v4, 0x0

    .line 52
    .local v4, "done":Z
    :cond_0
    :goto_0
    if-nez v4, :cond_4

    .line 53
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->readVariables()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;

    move-result-object v1

    .line 54
    .local v1, "bsi":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    if-nez v1, :cond_1

    .line 55
    new-instance v9, Ljava/io/IOException;

    invoke-direct {v9}, Ljava/io/IOException;-><init>()V

    throw v9

    .line 57
    :cond_1
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;

    .line 58
    .local v7, "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->strmtyp:I

    const/4 v11, 0x1

    if-eq v10, v11, :cond_2

    iget v10, v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->substreamid:I

    iget v11, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->substreamid:I

    if-ne v10, v11, :cond_2

    .line 59
    const/4 v4, 0x1

    goto :goto_1

    .line 62
    .end local v7    # "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    :cond_3
    if-nez v4, :cond_0

    .line 63
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 68
    .end local v1    # "bsi":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    :cond_4
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_5

    .line 69
    new-instance v9, Ljava/io/IOException;

    invoke-direct {v9}, Ljava/io/IOException;-><init>()V

    throw v9

    .line 71
    :cond_5
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    const/4 v10, 0x0

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;

    iget v8, v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    .line 73
    .local v8, "samplerate":I
    new-instance v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    iput-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 74
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    const-string v9, "ec-3"

    invoke-direct {v0, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;-><init>(Ljava/lang/String;)V

    .line 75
    .local v0, "audioSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    const/4 v9, 0x2

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setChannelCount(I)V

    .line 76
    int-to-long v10, v8

    invoke-virtual {v0, v10, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleRate(J)V

    .line 77
    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setDataReferenceIndex(I)V

    .line 78
    const/16 v9, 0x10

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleSize(I)V

    .line 80
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;

    invoke-direct {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;-><init>()V

    .line 81
    .local v6, "ec3":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    new-array v3, v9, [I

    .line 82
    .local v3, "deps":[I
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    new-array v2, v9, [I

    .line 83
    .local v2, "chan_locs":[I
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_6
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;

    .line 84
    .restart local v1    # "bsi":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->strmtyp:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_6

    .line 85
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->substreamid:I

    aget v11, v3, v10

    add-int/lit8 v11, v11, 0x1

    aput v11, v3, v10

    .line 86
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->substreamid:I

    iget v11, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->chanmap:I

    shr-int/lit8 v11, v11, 0x6

    and-int/lit16 v11, v11, 0x100

    iget v12, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->chanmap:I

    shr-int/lit8 v12, v12, 0x5

    and-int/lit16 v12, v12, 0xff

    or-int/2addr v11, v12

    aput v11, v2, v10

    goto :goto_2

    .line 89
    .end local v1    # "bsi":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    :cond_7
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;

    .line 90
    .restart local v1    # "bsi":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->strmtyp:I

    const/4 v11, 0x1

    if-eq v10, v11, :cond_8

    .line 91
    new-instance v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;

    invoke-direct {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;-><init>()V

    .line 92
    .local v5, "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->fscod:I

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->fscod:I

    .line 93
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->bsid:I

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->bsid:I

    .line 94
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->bsmod:I

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->bsmod:I

    .line 95
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->acmod:I

    .line 96
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->lfeon:I

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->lfeon:I

    .line 97
    const/4 v10, 0x0

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->reserved:I

    .line 98
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->substreamid:I

    aget v10, v3, v10

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->num_dep_sub:I

    .line 99
    iget v10, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->substreamid:I

    aget v10, v2, v10

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->chan_loc:I

    .line 100
    const/4 v10, 0x0

    iput v10, v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;->reserved2:I

    .line 101
    invoke-virtual {v6, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->addEntry(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;)V

    .line 103
    .end local v5    # "e":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox$Entry;
    :cond_8
    iget v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitrate:I

    iget v11, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->bitrate:I

    add-int/2addr v10, v11

    iput v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitrate:I

    .line 104
    iget v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I

    iget v11, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->frameSize:I

    add-int/2addr v10, v11

    iput v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I

    goto :goto_3

    .line 107
    .end local v1    # "bsi":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    :cond_9
    iget v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitrate:I

    div-int/lit16 v9, v9, 0x3e8

    invoke-virtual {v6, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/EC3SpecificBox;->setDataRate(I)V

    .line 108
    invoke-virtual {v0, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 109
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v9, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 111
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v10, Ljava/util/Date;

    invoke-direct {v10}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 112
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v10, Ljava/util/Date;

    invoke-direct {v10}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 114
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    int-to-long v10, v8

    invoke-virtual {v9, v10, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 115
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setVolume(F)V

    .line 117
    const-wide/16 v10, 0x0

    invoke-interface {p1, v10, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 118
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->readSamples()Ljava/util/List;

    move-result-object v9

    iput-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->samples:Ljava/util/List;

    .line 119
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->samples:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [J

    iput-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->decodingTimes:[J

    .line 120
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->decodingTimes:[J

    const-wide/16 v10, 0x600

    invoke-static {v9, v10, v11}, Ljava/util/Arrays;->fill([JJ)V

    .line 121
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;)I
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    .prologue
    .line 33
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I

    return v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    return-object v0
.end method

.method private readSamples()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 387
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->size()J

    move-result-wide v4

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v6

    sub-long/2addr v4, v6

    iget v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I

    int-to-long v6, v6

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    .line 388
    .local v0, "framesLeft":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 389
    .local v2, "mySamples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 390
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->frameSize:I

    mul-int v3, v1, v4

    .line 391
    .local v3, "start":I
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;

    invoke-direct {v4, p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;I)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 389
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 410
    .end local v3    # "start":I
    :cond_0
    return-object v2
.end method

.method private readVariables()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v12

    .line 166
    .local v12, "startPosition":J
    const/16 v15, 0xc8

    invoke-static {v15}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 167
    .local v2, "bb":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v15, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 168
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 170
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v3, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 171
    .local v3, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/16 v15, 0x10

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v14

    .line 172
    .local v14, "syncword":I
    const/16 v15, 0xb77

    if-eq v14, v15, :cond_0

    .line 173
    const/4 v4, 0x0

    .line 383
    :goto_0
    return-object v4

    .line 176
    :cond_0
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;-><init>()V

    .line 178
    .local v4, "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;
    const/4 v15, 0x2

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->strmtyp:I

    .line 179
    const/4 v15, 0x3

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->substreamid:I

    .line 180
    const/16 v15, 0xb

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v5

    .line 181
    .local v5, "frmsiz":I
    add-int/lit8 v15, v5, 0x1

    mul-int/lit8 v15, v15, 0x2

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->frameSize:I

    .line 183
    const/4 v15, 0x2

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->fscod:I

    .line 184
    const/4 v6, -0x1

    .line 186
    .local v6, "fscod2":I
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->fscod:I

    const/16 v16, 0x3

    move/from16 v0, v16

    if-ne v15, v0, :cond_10

    .line 187
    const/4 v15, 0x2

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v6

    .line 188
    const/4 v11, 0x3

    .line 192
    .local v11, "numblkscod":I
    :goto_1
    const/4 v10, 0x0

    .line 193
    .local v10, "numberOfBlocksPerSyncFrame":I
    packed-switch v11, :pswitch_data_0

    .line 211
    :goto_2
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->frameSize:I

    const/16 v16, 0x6

    div-int v16, v16, v10

    mul-int v15, v15, v16

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->frameSize:I

    .line 213
    const/4 v15, 0x3

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    .line 214
    const/4 v15, 0x1

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->lfeon:I

    .line 215
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->bsid:I

    .line 216
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 217
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1

    .line 218
    const/16 v15, 0x8

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 220
    :cond_1
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    if-nez v15, :cond_2

    .line 221
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 222
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_2

    .line 223
    const/16 v15, 0x8

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 226
    :cond_2
    const/4 v15, 0x1

    iget v0, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->strmtyp:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 227
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 228
    const/16 v15, 0x10

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->chanmap:I

    .line 231
    :cond_3
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_e

    .line 232
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    const/16 v16, 0x2

    move/from16 v0, v16

    if-le v15, v0, :cond_4

    .line 233
    const/4 v15, 0x2

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 235
    :cond_4
    const/4 v15, 0x1

    iget v0, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    move/from16 v16, v0

    and-int/lit8 v16, v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_5

    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    const/16 v16, 0x2

    move/from16 v0, v16

    if-le v15, v0, :cond_5

    .line 236
    const/4 v15, 0x3

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 237
    const/4 v15, 0x3

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 239
    :cond_5
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    and-int/lit8 v15, v15, 0x4

    if-lez v15, :cond_6

    .line 240
    const/4 v15, 0x3

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 241
    const/4 v15, 0x3

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 243
    :cond_6
    const/4 v15, 0x1

    iget v0, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->lfeon:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ne v15, v0, :cond_7

    .line 244
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_7

    .line 245
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 248
    :cond_7
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->strmtyp:I

    if-nez v15, :cond_e

    .line 249
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_8

    .line 250
    const/4 v15, 0x6

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 252
    :cond_8
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    if-nez v15, :cond_9

    .line 253
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_9

    .line 254
    const/4 v15, 0x6

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 257
    :cond_9
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_a

    .line 258
    const/4 v15, 0x6

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 260
    :cond_a
    const/4 v15, 0x2

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v8

    .line 261
    .local v8, "mixdef":I
    const/4 v15, 0x1

    if-ne v15, v8, :cond_11

    .line 262
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 313
    :cond_b
    :goto_3
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ge v15, v0, :cond_e

    .line 314
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_c

    .line 315
    const/16 v15, 0xe

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 317
    :cond_c
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->acmod:I

    if-nez v15, :cond_d

    .line 318
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_d

    .line 319
    const/16 v15, 0xe

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 322
    :cond_d
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_e

    .line 323
    if-nez v11, :cond_1e

    .line 324
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 337
    .end local v8    # "mixdef":I
    :cond_e
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_f

    .line 338
    const/4 v15, 0x3

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v15

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->bsmod:I

    .line 341
    :cond_f
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->fscod:I

    packed-switch v15, :pswitch_data_1

    .line 376
    :goto_4
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    if-nez v15, :cond_20

    .line 377
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 190
    .end local v10    # "numberOfBlocksPerSyncFrame":I
    .end local v11    # "numblkscod":I
    :cond_10
    const/4 v15, 0x2

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v11

    .restart local v11    # "numblkscod":I
    goto/16 :goto_1

    .line 195
    .restart local v10    # "numberOfBlocksPerSyncFrame":I
    :pswitch_0
    const/4 v10, 0x1

    .line 196
    goto/16 :goto_2

    .line 199
    :pswitch_1
    const/4 v10, 0x2

    .line 200
    goto/16 :goto_2

    .line 203
    :pswitch_2
    const/4 v10, 0x3

    .line 204
    goto/16 :goto_2

    .line 207
    :pswitch_3
    const/4 v10, 0x6

    goto/16 :goto_2

    .line 263
    .restart local v8    # "mixdef":I
    :cond_11
    const/4 v15, 0x2

    if-ne v15, v8, :cond_12

    .line 264
    const/16 v15, 0xc

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    goto :goto_3

    .line 265
    :cond_12
    const/4 v15, 0x3

    if-ne v15, v8, :cond_b

    .line 266
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v9

    .line 267
    .local v9, "mixdeflen":I
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1b

    .line 268
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 269
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_13

    .line 270
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 272
    :cond_13
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_14

    .line 273
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 275
    :cond_14
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_15

    .line 276
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 278
    :cond_15
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_16

    .line 279
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 281
    :cond_16
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_17

    .line 282
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 284
    :cond_17
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_18

    .line 285
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 287
    :cond_18
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_19

    .line 288
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 290
    :cond_19
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1b

    .line 291
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1a

    .line 292
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 294
    :cond_1a
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1b

    .line 295
    const/4 v15, 0x4

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 299
    :cond_1b
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1c

    .line 300
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 301
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1c

    .line 302
    const/4 v15, 0x7

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 303
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1c

    .line 304
    const/16 v15, 0x8

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 308
    :cond_1c
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_5
    add-int/lit8 v15, v9, 0x2

    if-ge v7, v15, :cond_1d

    .line 309
    const/16 v15, 0x8

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 308
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 311
    :cond_1d
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->byteSync()I

    goto/16 :goto_3

    .line 326
    .end local v7    # "i":I
    .end local v9    # "mixdeflen":I
    :cond_1e
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_6
    if-ge v7, v10, :cond_e

    .line 327
    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_1f

    .line 328
    const/4 v15, 0x5

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 326
    :cond_1f
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 343
    .end local v7    # "i":I
    .end local v8    # "mixdef":I
    :pswitch_4
    const v15, 0xbb80

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    goto/16 :goto_4

    .line 347
    :pswitch_5
    const v15, 0xac44

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    goto/16 :goto_4

    .line 351
    :pswitch_6
    const/16 v15, 0x7d00

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    goto/16 :goto_4

    .line 355
    :pswitch_7
    packed-switch v6, :pswitch_data_2

    goto/16 :goto_4

    .line 357
    :pswitch_8
    const/16 v15, 0x5dc0

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    goto/16 :goto_4

    .line 361
    :pswitch_9
    const/16 v15, 0x5622

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    goto/16 :goto_4

    .line 365
    :pswitch_a
    const/16 v15, 0x3e80

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    goto/16 :goto_4

    .line 369
    :pswitch_b
    const/4 v15, 0x0

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    goto/16 :goto_4

    .line 380
    :cond_20
    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->samplerate:I

    int-to-double v0, v15

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4098000000000000L    # 1536.0

    div-double v16, v16, v18

    iget v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->frameSize:I

    int-to-double v0, v15

    move-wide/from16 v18, v0

    mul-double v16, v16, v18

    const-wide/high16 v18, 0x4020000000000000L    # 8.0

    mul-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-int v15, v0

    iput v15, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->bitrate:I

    .line 382
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    iget v0, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl$BitStreamInfo;->frameSize:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    add-long v16, v16, v12

    invoke-interface/range {v15 .. v17}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    goto/16 :goto_0

    .line 193
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 341
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch

    .line 355
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
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
    .line 124
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 125
    return-void
.end method

.method public getCompositionTimeEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 157
    const-string v0, "soun"

    return-object v0
.end method

.method public getSampleDependencies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 149
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->decodingTimes:[J

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
    .line 129
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 161
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 141
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 436
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "EC3TrackImpl{bitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitrate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bitStreamInfos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/EC3TrackImpl;->bitStreamInfos:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
