.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "DTSTrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$LookAhead;
    }
.end annotation


# static fields
.field private static final BUFFER:I = 0x4000000


# instance fields
.field bcCoreBitRate:I

.field bcCoreChannelMask:I

.field bcCoreMaxSampleRate:I

.field bitrate:I

.field channelCount:I

.field channelMask:I

.field codecDelayAtMaxFs:I

.field coreBitRate:I

.field coreChannelMask:I

.field coreFramePayloadInBytes:I

.field coreMaxSampleRate:I

.field coreSubStreamPresent:Z

.field private dataOffset:I

.field private dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

.field ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

.field extAvgBitrate:I

.field extFramePayloadInBytes:I

.field extPeakBitrate:I

.field extSmoothBuffSize:I

.field extensionSubStreamPresent:Z

.field frameSize:I

.field isVBR:Z

.field private lang:Ljava/lang/String;

.field lbrCodingPresent:I

.field lsbTrimPercent:I

.field maxSampleRate:I

.field numExtSubStreams:I

.field numFramesTotal:I

.field numSamplesOrigAudioAtMaxFs:I

.field sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field private sampleDurations:[J

.field sampleSize:I

.field samplerate:I

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

.field samplesPerFrame:I

.field samplesPerFrameAtMaxFs:I

.field trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

.field type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 2
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 79
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 26
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 31
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->frameSize:I

    .line 36
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataOffset:I

    .line 37
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    .line 43
    iput-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->isVBR:Z

    .line 44
    iput-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreSubStreamPresent:Z

    .line 45
    iput-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extensionSubStreamPresent:Z

    .line 46
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numExtSubStreams:I

    .line 47
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreMaxSampleRate:I

    .line 48
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreBitRate:I

    .line 49
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreChannelMask:I

    .line 50
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreFramePayloadInBytes:I

    .line 51
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extAvgBitrate:I

    .line 52
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extPeakBitrate:I

    .line 53
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extSmoothBuffSize:I

    .line 54
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extFramePayloadInBytes:I

    .line 56
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->maxSampleRate:I

    .line 57
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lbrCodingPresent:I

    .line 58
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numFramesTotal:I

    .line 59
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrameAtMaxFs:I

    .line 60
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numSamplesOrigAudioAtMaxFs:I

    .line 61
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelMask:I

    .line 62
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->codecDelayAtMaxFs:I

    .line 63
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreMaxSampleRate:I

    .line 64
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreBitRate:I

    .line 65
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreChannelMask:I

    .line 66
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lsbTrimPercent:I

    .line 68
    const-string v0, "none"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    .line 69
    const-string v0, "eng"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lang:Ljava/lang/String;

    .line 80
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 81
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->parse()V

    .line 82
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V
    .locals 2
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "lang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 26
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 31
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->frameSize:I

    .line 36
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataOffset:I

    .line 37
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    .line 43
    iput-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->isVBR:Z

    .line 44
    iput-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreSubStreamPresent:Z

    .line 45
    iput-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extensionSubStreamPresent:Z

    .line 46
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numExtSubStreams:I

    .line 47
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreMaxSampleRate:I

    .line 48
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreBitRate:I

    .line 49
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreChannelMask:I

    .line 50
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreFramePayloadInBytes:I

    .line 51
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extAvgBitrate:I

    .line 52
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extPeakBitrate:I

    .line 53
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extSmoothBuffSize:I

    .line 54
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extFramePayloadInBytes:I

    .line 56
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->maxSampleRate:I

    .line 57
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lbrCodingPresent:I

    .line 58
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numFramesTotal:I

    .line 59
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrameAtMaxFs:I

    .line 60
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numSamplesOrigAudioAtMaxFs:I

    .line 61
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelMask:I

    .line 62
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->codecDelayAtMaxFs:I

    .line 63
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreMaxSampleRate:I

    .line 64
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreBitRate:I

    .line 65
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreChannelMask:I

    .line 66
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lsbTrimPercent:I

    .line 68
    const-string v0, "none"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    .line 69
    const-string v0, "eng"

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lang:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lang:Ljava/lang/String;

    .line 74
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 75
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->parse()V

    .line 76
    return-void
.end method

.method private generateSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;IJI)Ljava/util/List;
    .locals 11
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "dataOffset"    # I
    .param p3, "dataSize"    # J
    .param p5, "corePresent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;",
            "IJI)",
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
    .line 656
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$LookAhead;

    int-to-long v4, p2

    move-object v2, p0

    move-object v3, p1

    move-wide v6, p3

    move/from16 v8, p5

    invoke-direct/range {v1 .. v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$LookAhead;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JJI)V

    .line 658
    .local v1, "la":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$LookAhead;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 660
    .local v9, "mySamples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    :goto_0
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$LookAhead;->findNextStart()Ljava/nio/ByteBuffer;

    move-result-object v10

    .local v10, "sample":Ljava/nio/ByteBuffer;
    if-eqz v10, :cond_0

    .line 661
    move-object v0, v10

    .line 662
    .local v0, "finalSample":Ljava/nio/ByteBuffer;
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;

    invoke-direct {v2, p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;Ljava/nio/ByteBuffer;)V

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 677
    .end local v0    # "finalSample":Ljava/nio/ByteBuffer;
    :cond_0
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "all samples found"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 678
    return-object v9
.end method

.method private getBitRate(I)I
    .locals 3
    .param p1, "rate"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 683
    packed-switch p1, :pswitch_data_0

    .line 791
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Unknown bitrate value"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 687
    :pswitch_0
    const/16 v0, 0x20

    .line 794
    .local v0, "bitrate":I
    :goto_0
    return v0

    .line 691
    .end local v0    # "bitrate":I
    :pswitch_1
    const/16 v0, 0x38

    .line 692
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 695
    .end local v0    # "bitrate":I
    :pswitch_2
    const/16 v0, 0x40

    .line 696
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 699
    .end local v0    # "bitrate":I
    :pswitch_3
    const/16 v0, 0x60

    .line 700
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 703
    .end local v0    # "bitrate":I
    :pswitch_4
    const/16 v0, 0x70

    .line 704
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 707
    .end local v0    # "bitrate":I
    :pswitch_5
    const/16 v0, 0x80

    .line 708
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 711
    .end local v0    # "bitrate":I
    :pswitch_6
    const/16 v0, 0xc0

    .line 712
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 715
    .end local v0    # "bitrate":I
    :pswitch_7
    const/16 v0, 0xe0

    .line 716
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 719
    .end local v0    # "bitrate":I
    :pswitch_8
    const/16 v0, 0x100

    .line 720
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 723
    .end local v0    # "bitrate":I
    :pswitch_9
    const/16 v0, 0x140

    .line 724
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 727
    .end local v0    # "bitrate":I
    :pswitch_a
    const/16 v0, 0x180

    .line 728
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 731
    .end local v0    # "bitrate":I
    :pswitch_b
    const/16 v0, 0x1c0

    .line 732
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 735
    .end local v0    # "bitrate":I
    :pswitch_c
    const/16 v0, 0x200

    .line 736
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 739
    .end local v0    # "bitrate":I
    :pswitch_d
    const/16 v0, 0x240

    .line 740
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 743
    .end local v0    # "bitrate":I
    :pswitch_e
    const/16 v0, 0x280

    .line 744
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 747
    .end local v0    # "bitrate":I
    :pswitch_f
    const/16 v0, 0x300

    .line 748
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 751
    .end local v0    # "bitrate":I
    :pswitch_10
    const/16 v0, 0x3c0

    .line 752
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 755
    .end local v0    # "bitrate":I
    :pswitch_11
    const/16 v0, 0x400

    .line 756
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 759
    .end local v0    # "bitrate":I
    :pswitch_12
    const/16 v0, 0x480

    .line 760
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 763
    .end local v0    # "bitrate":I
    :pswitch_13
    const/16 v0, 0x500

    .line 764
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 767
    .end local v0    # "bitrate":I
    :pswitch_14
    const/16 v0, 0x540

    .line 768
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 771
    .end local v0    # "bitrate":I
    :pswitch_15
    const/16 v0, 0x580

    .line 772
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 775
    .end local v0    # "bitrate":I
    :pswitch_16
    const/16 v0, 0x583

    .line 776
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 779
    .end local v0    # "bitrate":I
    :pswitch_17
    const/16 v0, 0x5c0

    .line 780
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 783
    .end local v0    # "bitrate":I
    :pswitch_18
    const/16 v0, 0x600

    .line 784
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 787
    .end local v0    # "bitrate":I
    :pswitch_19
    const/4 v0, -0x1

    .line 788
    .restart local v0    # "bitrate":I
    goto :goto_0

    .line 683
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
    .end packed-switch
.end method

.method private getSampleRate(I)I
    .locals 3
    .param p1, "sfreq"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 799
    packed-switch p1, :pswitch_data_0

    .line 839
    :pswitch_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Unknown Sample Rate"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 803
    :pswitch_1
    const/16 v0, 0x1f40

    .line 842
    .local v0, "samplerate":I
    :goto_0
    return v0

    .line 807
    .end local v0    # "samplerate":I
    :pswitch_2
    const/16 v0, 0x3e80

    .line 808
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 811
    .end local v0    # "samplerate":I
    :pswitch_3
    const/16 v0, 0x7d00

    .line 812
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 815
    .end local v0    # "samplerate":I
    :pswitch_4
    const/16 v0, 0x2b11

    .line 816
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 819
    .end local v0    # "samplerate":I
    :pswitch_5
    const/16 v0, 0x5622

    .line 820
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 823
    .end local v0    # "samplerate":I
    :pswitch_6
    const v0, 0xac44

    .line 824
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 827
    .end local v0    # "samplerate":I
    :pswitch_7
    const/16 v0, 0x2ee0

    .line 828
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 831
    .end local v0    # "samplerate":I
    :pswitch_8
    const/16 v0, 0x5dc0

    .line 832
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 835
    .end local v0    # "samplerate":I
    :pswitch_9
    const v0, 0xbb80

    .line 836
    .restart local v0    # "samplerate":I
    goto :goto_0

    .line 799
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method private parse()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->readVariables()Z

    move-result v1

    if-nez v1, :cond_0

    .line 90
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 93
    :cond_0
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 94
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;-><init>(Ljava/lang/String;)V

    .line 95
    .local v0, "audioSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelCount:I

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setChannelCount(I)V

    .line 96
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplerate:I

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleRate(J)V

    .line 97
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setDataReferenceIndex(I)V

    .line 98
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleSize(I)V

    .line 101
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 102
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 104
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 105
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 106
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lang:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 107
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplerate:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 110
    return-void
.end method

.method private parseAuprhdr(ILjava/nio/ByteBuffer;)Z
    .locals 9
    .param p1, "size"    # I
    .param p2, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v8, 0x1

    const v7, 0xffff

    .line 190
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 191
    .local v1, "audioPresIndex":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    .line 192
    .local v3, "bitwAupresData":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 193
    .local v0, "a":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    .line 194
    .local v2, "b":I
    shl-int/lit8 v5, v0, 0x10

    and-int v6, v2, v7

    or-int/2addr v5, v6

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->maxSampleRate:I

    .line 195
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numFramesTotal:I

    .line 196
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrameAtMaxFs:I

    .line 197
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 198
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 199
    shl-int/lit8 v5, v0, 0x20

    and-int v6, v2, v7

    or-int/2addr v5, v6

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numSamplesOrigAudioAtMaxFs:I

    .line 200
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelMask:I

    .line 201
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->codecDelayAtMaxFs:I

    .line 202
    const/16 v4, 0x15

    .line 203
    .local v4, "c":I
    and-int/lit8 v5, v3, 0x3

    const/4 v6, 0x3

    if-ne v5, v6, :cond_0

    .line 204
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 205
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    .line 206
    shl-int/lit8 v5, v0, 0x10

    and-int v6, v2, v7

    or-int/2addr v5, v6

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreMaxSampleRate:I

    .line 207
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreBitRate:I

    .line 208
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bcCoreChannelMask:I

    .line 209
    add-int/lit8 v4, v4, 0x7

    .line 211
    :cond_0
    and-int/lit8 v5, v3, 0x4

    if-lez v5, :cond_1

    .line 212
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    iput v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lsbTrimPercent:I

    .line 213
    add-int/lit8 v4, v4, 0x1

    .line 215
    :cond_1
    and-int/lit8 v5, v3, 0x8

    if-lez v5, :cond_2

    .line 216
    iput v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lbrCodingPresent:I

    .line 218
    :cond_2
    :goto_0
    if-ge v4, p1, :cond_3

    .line 219
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 220
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 223
    :cond_3
    return v8
.end method

.method private parseCoressmd(ILjava/nio/ByteBuffer;)Z
    .locals 5
    .param p1, "size"    # I
    .param p2, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 175
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 176
    .local v0, "cmsr_1":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 177
    .local v1, "cmsr_2":I
    shl-int/lit8 v3, v0, 0x10

    const v4, 0xffff

    and-int/2addr v4, v1

    or-int/2addr v3, v4

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreMaxSampleRate:I

    .line 178
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreBitRate:I

    .line 179
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreChannelMask:I

    .line 180
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreFramePayloadInBytes:I

    .line 181
    const/16 v2, 0xb

    .line 182
    .local v2, "i":I
    :goto_0
    if-ge v2, p1, :cond_0

    .line 183
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 184
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 186
    :cond_0
    const/4 v3, 0x1

    return v3
.end method

.method private parseDtshdhdr(ILjava/nio/ByteBuffer;)V
    .locals 10
    .param p1, "size"    # I
    .param p2, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v9, 0x1

    .line 147
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 148
    .local v1, "hdrVersion":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v6

    .line 149
    .local v6, "timeCodeHigh":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    .line 150
    .local v4, "timeCode":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    .line 151
    .local v5, "timeCodeFrameRate":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    .line 152
    .local v0, "bitwStreamMetadata":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    .line 153
    .local v3, "numAudioPresentations":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v7

    iput v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numExtSubStreams:I

    .line 155
    and-int/lit8 v7, v0, 0x1

    if-ne v7, v9, :cond_0

    .line 156
    iput-boolean v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->isVBR:Z

    .line 158
    :cond_0
    and-int/lit8 v7, v0, 0x8

    const/16 v8, 0x8

    if-ne v7, v8, :cond_1

    .line 159
    iput-boolean v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreSubStreamPresent:Z

    .line 161
    :cond_1
    and-int/lit8 v7, v0, 0x10

    const/16 v8, 0x10

    if-ne v7, v8, :cond_2

    .line 162
    iput-boolean v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extensionSubStreamPresent:Z

    .line 163
    iget v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numExtSubStreams:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numExtSubStreams:I

    .line 167
    :goto_0
    const/16 v2, 0xe

    .line 168
    .local v2, "i":I
    :goto_1
    if-ge v2, p1, :cond_3

    .line 169
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 170
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 165
    .end local v2    # "i":I
    :cond_2
    const/4 v7, 0x0

    iput v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->numExtSubStreams:I

    goto :goto_0

    .line 172
    .restart local v2    # "i":I
    :cond_3
    return-void
.end method

.method private parseExtssmd(ILjava/nio/ByteBuffer;)Z
    .locals 6
    .param p1, "size"    # I
    .param p2, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    const v5, 0xffff

    .line 230
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 231
    .local v0, "a":I
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 232
    .local v1, "b":I
    shl-int/lit8 v3, v0, 0x10

    and-int v4, v1, v5

    or-int/2addr v3, v4

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extAvgBitrate:I

    .line 233
    const/4 v2, 0x3

    .line 234
    .local v2, "i":I
    iget-boolean v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->isVBR:Z

    if-eqz v3, :cond_0

    .line 235
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 236
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 237
    shl-int/lit8 v3, v0, 0x10

    and-int v4, v1, v5

    or-int/2addr v3, v4

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extPeakBitrate:I

    .line 238
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extSmoothBuffSize:I

    .line 239
    add-int/lit8 v2, v2, 0x5

    .line 244
    :goto_0
    if-ge v2, p1, :cond_1

    .line 245
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->get()B

    .line 246
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 241
    :cond_0
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    iput v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extFramePayloadInBytes:I

    .line 242
    add-int/lit8 v2, v2, 0x4

    goto :goto_0

    .line 248
    :cond_1
    const/4 v3, 0x1

    return v3
.end method

.method private readVariables()Z
    .locals 66
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    const-wide/16 v4, 0x0

    const-wide/16 v64, 0x61a8

    move-wide/from16 v0, v64

    invoke-interface {v3, v4, v5, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->map(JJ)Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 253
    .local v11, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v59

    .line 254
    .local v59, "testHeader1":I
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v60

    .line 255
    .local v60, "testHeader2":I
    const v3, 0x44545348

    move/from16 v0, v59

    if-ne v0, v3, :cond_0

    const v3, 0x44484452

    move/from16 v0, v60

    if-eq v0, v3, :cond_1

    .line 256
    :cond_0
    new-instance v3, Ljava/io/IOException;

    const-string v4, "data does not start with \'DTSHDHDR\' as required for a DTS-HD file"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 259
    :cond_1
    :goto_0
    const v3, 0x5354524d

    move/from16 v0, v59

    if-ne v0, v3, :cond_2

    const v3, 0x44415441

    move/from16 v0, v60

    if-eq v0, v3, :cond_8

    :cond_2
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    const/16 v4, 0x64

    if-le v3, v4, :cond_8

    .line 260
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    long-to-int v0, v4

    move/from16 v54, v0

    .line 261
    .local v54, "size":I
    const v3, 0x44545348

    move/from16 v0, v59

    if-ne v0, v3, :cond_4

    const v3, 0x44484452

    move/from16 v0, v60

    if-ne v0, v3, :cond_4

    .line 262
    move-object/from16 v0, p0

    move/from16 v1, v54

    invoke-direct {v0, v1, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->parseDtshdhdr(ILjava/nio/ByteBuffer;)V

    .line 280
    :cond_3
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v59

    .line 281
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v60

    .line 282
    goto :goto_0

    .line 263
    :cond_4
    const v3, 0x434f5245

    move/from16 v0, v59

    if-ne v0, v3, :cond_5

    const v3, 0x53534d44

    move/from16 v0, v60

    if-ne v0, v3, :cond_5

    .line 264
    move-object/from16 v0, p0

    move/from16 v1, v54

    invoke-direct {v0, v1, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->parseCoressmd(ILjava/nio/ByteBuffer;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 265
    const/4 v3, 0x0

    .line 652
    .end local v54    # "size":I
    :goto_1
    return v3

    .line 267
    .restart local v54    # "size":I
    :cond_5
    const v3, 0x41555052

    move/from16 v0, v59

    if-ne v0, v3, :cond_6

    const v3, 0x2d484452

    move/from16 v0, v60

    if-ne v0, v3, :cond_6

    .line 268
    move-object/from16 v0, p0

    move/from16 v1, v54

    invoke-direct {v0, v1, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->parseAuprhdr(ILjava/nio/ByteBuffer;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 269
    const/4 v3, 0x0

    goto :goto_1

    .line 271
    :cond_6
    const v3, 0x45585453

    move/from16 v0, v59

    if-ne v0, v3, :cond_7

    const v3, 0x535f4d44

    move/from16 v0, v60

    if-ne v0, v3, :cond_7

    .line 272
    move-object/from16 v0, p0

    move/from16 v1, v54

    invoke-direct {v0, v1, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->parseExtssmd(ILjava/nio/ByteBuffer;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 273
    const/4 v3, 0x0

    goto :goto_1

    .line 276
    :cond_7
    const/16 v41, 0x0

    .local v41, "i":I
    :goto_2
    move/from16 v0, v41

    move/from16 v1, v54

    if-ge v0, v1, :cond_3

    .line 277
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->get()B

    .line 276
    add-int/lit8 v41, v41, 0x1

    goto :goto_2

    .line 283
    .end local v41    # "i":I
    .end local v54    # "size":I
    :cond_8
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    .line 284
    .local v6, "dataSize":J
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataOffset:I

    .line 286
    const/4 v2, -0x1

    .line 287
    .local v2, "amode":I
    const/16 v22, 0x0

    .line 288
    .local v22, "extAudioId":I
    const/16 v21, 0x0

    .line 290
    .local v21, "extAudio":I
    const/4 v8, -0x1

    .line 291
    .local v8, "corePresent":I
    const/16 v25, -0x1

    .line 292
    .local v25, "extPresent":I
    const/16 v30, 0x0

    .line 293
    .local v30, "extXch":I
    const/16 v28, 0x0

    .line 294
    .local v28, "extXXch":I
    const/16 v27, 0x0

    .line 295
    .local v27, "extX96k":I
    const/16 v29, 0x0

    .line 296
    .local v29, "extXbr":I
    const/16 v24, 0x0

    .line 297
    .local v24, "extLbr":I
    const/16 v31, 0x0

    .line 298
    .local v31, "extXll":I
    const/16 v23, 0x0

    .line 300
    .local v23, "extCore":I
    const/16 v19, 0x0

    .line 303
    .local v19, "done":Z
    :goto_3
    if-nez v19, :cond_21

    .line 304
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->position()I

    move-result v49

    .line 305
    .local v49, "offset":I
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v58

    .line 306
    .local v58, "sync":I
    const v3, 0x7ffe8001

    move/from16 v0, v58

    if-ne v0, v3, :cond_e

    .line 307
    const/4 v3, 0x1

    if-ne v8, v3, :cond_9

    .line 308
    const/16 v19, 0x1

    goto :goto_3

    .line 310
    :cond_9
    const/4 v8, 0x1

    .line 311
    new-instance v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v13, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 313
    .local v13, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v36

    .line 314
    .local v36, "ftype":I
    const/4 v3, 0x5

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v53

    .line 315
    .local v53, "shrt":I
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v16

    .line 316
    .local v16, "cpf":I
    const/4 v3, 0x1

    move/from16 v0, v36

    if-ne v0, v3, :cond_a

    const/16 v3, 0x1f

    move/from16 v0, v53

    if-ne v0, v3, :cond_a

    if-eqz v16, :cond_b

    .line 319
    :cond_a
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 322
    :cond_b
    const/4 v3, 0x7

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v44

    .line 323
    .local v44, "nblks":I
    add-int/lit8 v3, v44, 0x1

    mul-int/lit8 v3, v3, 0x20

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrame:I

    .line 324
    const/16 v3, 0xe

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v35

    .line 325
    .local v35, "fsize":I
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->frameSize:I

    add-int/lit8 v4, v35, 0x1

    add-int/2addr v3, v4

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->frameSize:I

    .line 326
    const/4 v3, 0x6

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v2

    .line 327
    const/4 v3, 0x4

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v52

    .line 329
    .local v52, "sfreq":I
    move-object/from16 v0, p0

    move/from16 v1, v52

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->getSampleRate(I)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplerate:I

    .line 331
    const/4 v3, 0x5

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v51

    .line 333
    .local v51, "rate":I
    move-object/from16 v0, p0

    move/from16 v1, v51

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->getBitRate(I)I

    move-result v3

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->bitrate:I

    .line 335
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v34

    .line 336
    .local v34, "fixedBit":I
    if-eqz v34, :cond_c

    .line 339
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 342
    :cond_c
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v20

    .line 343
    .local v20, "dynf":I
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v61

    .line 344
    .local v61, "timef":I
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v10

    .line 345
    .local v10, "auxf":I
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v38

    .line 346
    .local v38, "hdcd":I
    const/4 v3, 0x3

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v22

    .line 347
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v21

    .line 348
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v9

    .line 349
    .local v9, "aspf":I
    const/4 v3, 0x2

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v42

    .line 350
    .local v42, "lff":I
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v40

    .line 351
    .local v40, "hflag":I
    const/16 v37, 0x0

    .line 352
    .local v37, "hcrc":I
    const/4 v3, 0x1

    move/from16 v0, v16

    if-ne v0, v3, :cond_d

    .line 355
    const/16 v3, 0x10

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v37

    .line 358
    :cond_d
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v33

    .line 359
    .local v33, "filts":I
    const/4 v3, 0x4

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v63

    .line 360
    .local v63, "vernum":I
    const/4 v3, 0x2

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v14

    .line 361
    .local v14, "chist":I
    const/4 v3, 0x3

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v50

    .line 362
    .local v50, "pcmr":I
    packed-switch v50, :pswitch_data_0

    .line 381
    :pswitch_0
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 367
    :pswitch_1
    const/16 v3, 0x10

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleSize:I

    .line 384
    :goto_4
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v56

    .line 385
    .local v56, "sumf":I
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v57

    .line 386
    .local v57, "sums":I
    const/16 v17, 0x0

    .line 387
    .local v17, "dialnorm":I
    const/16 v18, 0x0

    .line 388
    .local v18, "dng":I
    packed-switch v63, :pswitch_data_1

    .line 402
    const/4 v3, 0x4

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 405
    :goto_5
    add-int v3, v49, v35

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v11, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto/16 :goto_3

    .line 372
    .end local v17    # "dialnorm":I
    .end local v18    # "dng":I
    .end local v56    # "sumf":I
    .end local v57    # "sums":I
    :pswitch_2
    const/16 v3, 0x14

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleSize:I

    goto :goto_4

    .line 377
    :pswitch_3
    const/16 v3, 0x18

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleSize:I

    goto :goto_4

    .line 392
    .restart local v17    # "dialnorm":I
    .restart local v18    # "dng":I
    .restart local v56    # "sumf":I
    .restart local v57    # "sums":I
    :pswitch_4
    const/4 v3, 0x4

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v17

    .line 393
    add-int/lit8 v3, v17, 0x10

    neg-int v0, v3

    move/from16 v18, v0

    .line 394
    goto :goto_5

    .line 397
    :pswitch_5
    const/4 v3, 0x4

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v17

    .line 398
    move/from16 v0, v17

    neg-int v0, v0

    move/from16 v18, v0

    .line 399
    goto :goto_5

    .line 407
    .end local v9    # "aspf":I
    .end local v10    # "auxf":I
    .end local v13    # "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    .end local v14    # "chist":I
    .end local v16    # "cpf":I
    .end local v17    # "dialnorm":I
    .end local v18    # "dng":I
    .end local v20    # "dynf":I
    .end local v33    # "filts":I
    .end local v34    # "fixedBit":I
    .end local v35    # "fsize":I
    .end local v36    # "ftype":I
    .end local v37    # "hcrc":I
    .end local v38    # "hdcd":I
    .end local v40    # "hflag":I
    .end local v42    # "lff":I
    .end local v44    # "nblks":I
    .end local v50    # "pcmr":I
    .end local v51    # "rate":I
    .end local v52    # "sfreq":I
    .end local v53    # "shrt":I
    .end local v56    # "sumf":I
    .end local v57    # "sums":I
    .end local v61    # "timef":I
    .end local v63    # "vernum":I
    :cond_e
    const v3, 0x64582025

    move/from16 v0, v58

    if-ne v0, v3, :cond_20

    .line 408
    const/4 v3, -0x1

    if-ne v8, v3, :cond_f

    .line 409
    const/4 v8, 0x0

    .line 410
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrameAtMaxFs:I

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrame:I

    .line 412
    :cond_f
    const/16 v25, 0x1

    .line 413
    new-instance v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-direct {v13, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 414
    .restart local v13    # "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/16 v3, 0x8

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v62

    .line 415
    .local v62, "userDefinedBits":I
    const/4 v3, 0x2

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v43

    .line 416
    .local v43, "nExtSSIndex":I
    const/4 v3, 0x1

    invoke-virtual {v13, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v39

    .line 417
    .local v39, "headerSizeType":I
    const/16 v46, 0xc

    .line 418
    .local v46, "nuBits4Header":I
    const/16 v45, 0x14

    .line 419
    .local v45, "nuBits4ExSSFsize":I
    if-nez v39, :cond_10

    .line 420
    const/16 v46, 0x8

    .line 421
    const/16 v45, 0x10

    .line 423
    :cond_10
    move/from16 v0, v46

    invoke-virtual {v13, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    add-int/lit8 v48, v3, 0x1

    .line 424
    .local v48, "nuExtSSHeaderSize":I
    move/from16 v0, v45

    invoke-virtual {v13, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    add-int/lit8 v47, v3, 0x1

    .line 425
    .local v47, "nuExtSSFsize":I
    add-int v3, v49, v48

    invoke-virtual {v11, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 426
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v26

    .line 427
    .local v26, "extSync":I
    const v3, 0x5a5a5a5a

    move/from16 v0, v26

    if-ne v0, v3, :cond_14

    .line 428
    const/4 v3, 0x1

    move/from16 v0, v30

    if-ne v0, v3, :cond_11

    .line 429
    const/16 v19, 0x1

    .line 431
    :cond_11
    const/16 v30, 0x1

    .line 463
    :cond_12
    :goto_6
    if-nez v19, :cond_13

    .line 464
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->frameSize:I

    add-int v3, v3, v47

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->frameSize:I

    .line 466
    :cond_13
    add-int v3, v49, v47

    invoke-virtual {v11, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto/16 :goto_3

    .line 432
    :cond_14
    const v3, 0x47004a03

    move/from16 v0, v26

    if-ne v0, v3, :cond_16

    .line 433
    const/4 v3, 0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_15

    .line 434
    const/16 v19, 0x1

    .line 436
    :cond_15
    const/16 v28, 0x1

    goto :goto_6

    .line 437
    :cond_16
    const v3, 0x1d95f262

    move/from16 v0, v26

    if-ne v0, v3, :cond_18

    .line 438
    const/4 v3, 0x1

    move/from16 v0, v27

    if-ne v0, v3, :cond_17

    .line 439
    const/16 v19, 0x1

    .line 441
    :cond_17
    const/16 v27, 0x1

    goto :goto_6

    .line 442
    :cond_18
    const v3, 0x655e315e

    move/from16 v0, v26

    if-ne v0, v3, :cond_1a

    .line 443
    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_19

    .line 444
    const/16 v19, 0x1

    .line 446
    :cond_19
    const/16 v29, 0x1

    goto :goto_6

    .line 447
    :cond_1a
    const v3, 0xa801921

    move/from16 v0, v26

    if-ne v0, v3, :cond_1c

    .line 448
    const/4 v3, 0x1

    move/from16 v0, v24

    if-ne v0, v3, :cond_1b

    .line 449
    const/16 v19, 0x1

    .line 451
    :cond_1b
    const/16 v24, 0x1

    goto :goto_6

    .line 452
    :cond_1c
    const v3, 0x41a29547

    move/from16 v0, v26

    if-ne v0, v3, :cond_1e

    .line 453
    const/4 v3, 0x1

    move/from16 v0, v31

    if-ne v0, v3, :cond_1d

    .line 454
    const/16 v19, 0x1

    .line 456
    :cond_1d
    const/16 v31, 0x1

    goto :goto_6

    .line 457
    :cond_1e
    const v3, 0x2b09261

    move/from16 v0, v26

    if-ne v0, v3, :cond_12

    .line 458
    const/4 v3, 0x1

    move/from16 v0, v23

    if-ne v0, v3, :cond_1f

    .line 459
    const/16 v19, 0x1

    .line 461
    :cond_1f
    const/16 v23, 0x1

    goto :goto_6

    .line 468
    .end local v13    # "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    .end local v26    # "extSync":I
    .end local v39    # "headerSizeType":I
    .end local v43    # "nExtSSIndex":I
    .end local v45    # "nuBits4ExSSFsize":I
    .end local v46    # "nuBits4Header":I
    .end local v47    # "nuExtSSFsize":I
    .end local v48    # "nuExtSSHeaderSize":I
    .end local v62    # "userDefinedBits":I
    :cond_20
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No DTS_SYNCWORD_* found at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 472
    .end local v49    # "offset":I
    .end local v58    # "sync":I
    :cond_21
    const/16 v32, -0x1

    .line 473
    .local v32, "fd":I
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrame:I

    sparse-switch v3, :sswitch_data_0

    .line 493
    :goto_7
    const/4 v3, -0x1

    move/from16 v0, v32

    if-ne v0, v3, :cond_22

    .line 496
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 477
    :sswitch_0
    const/16 v32, 0x0

    .line 478
    goto :goto_7

    .line 481
    :sswitch_1
    const/16 v32, 0x1

    .line 482
    goto :goto_7

    .line 485
    :sswitch_2
    const/16 v32, 0x2

    .line 486
    goto :goto_7

    .line 489
    :sswitch_3
    const/16 v32, 0x3

    goto :goto_7

    .line 499
    :cond_22
    const/16 v15, 0x1f

    .line 500
    .local v15, "coreLayout":I
    packed-switch v2, :pswitch_data_2

    .line 514
    :goto_8
    :pswitch_6
    const/16 v55, 0x0

    .line 515
    .local v55, "streamContruction":I
    if-nez v8, :cond_2c

    .line 516
    const/4 v3, 0x1

    move/from16 v0, v31

    if-ne v0, v3, :cond_28

    .line 517
    if-nez v23, :cond_27

    .line 518
    const/16 v55, 0x11

    .line 519
    const-string v3, "dtsl"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    .line 537
    :cond_23
    :goto_9
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->maxSampleRate:I

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplerate:I

    .line 538
    const/16 v3, 0x18

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleSize:I

    .line 600
    :cond_24
    :goto_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->maxSampleRate:I

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setDTSSamplingFrequency(J)V

    .line 601
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->isVBR:Z

    if-eqz v3, :cond_3a

    .line 602
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreBitRate:I

    move-object/from16 v0, p0

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extPeakBitrate:I

    add-int/2addr v4, v5

    mul-int/lit16 v4, v4, 0x3e8

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setMaxBitRate(J)V

    .line 606
    :goto_b
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreBitRate:I

    move-object/from16 v0, p0

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extAvgBitrate:I

    add-int/2addr v4, v5

    mul-int/lit16 v4, v4, 0x3e8

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setAvgBitRate(J)V

    .line 607
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleSize:I

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setPcmSampleDepth(I)V

    .line 608
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move/from16 v0, v32

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setFrameDuration(I)V

    .line 609
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move/from16 v0, v55

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setStreamConstruction(I)V

    .line 610
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreChannelMask:I

    and-int/lit8 v3, v3, 0x8

    if-gtz v3, :cond_25

    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreChannelMask:I

    and-int/lit16 v3, v3, 0x1000

    if-lez v3, :cond_3b

    .line 611
    :cond_25
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setCoreLFEPresent(I)V

    .line 615
    :goto_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    invoke-virtual {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setCoreLayout(I)V

    .line 616
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreFramePayloadInBytes:I

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setCoreSize(I)V

    .line 617
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setStereoDownmix(I)V

    .line 618
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setRepresentationType(I)V

    .line 619
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelMask:I

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setChannelLayout(I)V

    .line 620
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreMaxSampleRate:I

    if-lez v3, :cond_3c

    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extAvgBitrate:I

    if-lez v3, :cond_3c

    .line 621
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setMultiAssetFlag(I)V

    .line 625
    :goto_d
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->lbrCodingPresent:I

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setLBRDurationMod(I)V

    .line 626
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setReservedBoxPresent(I)V

    .line 628
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelCount:I

    .line 629
    const/4 v12, 0x0

    .local v12, "bit":I
    :goto_e
    const/16 v3, 0x10

    if-ge v12, v3, :cond_3d

    .line 630
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelMask:I

    shr-int/2addr v3, v12

    and-int/lit8 v3, v3, 0x1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_26

    .line 631
    packed-switch v12, :pswitch_data_3

    .line 643
    :pswitch_7
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelCount:I

    add-int/lit8 v3, v3, 0x2

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelCount:I

    .line 629
    :cond_26
    :goto_f
    add-int/lit8 v12, v12, 0x1

    goto :goto_e

    .line 511
    .end local v12    # "bit":I
    .end local v55    # "streamContruction":I
    :pswitch_8
    move v15, v2

    goto/16 :goto_8

    .line 521
    .restart local v55    # "streamContruction":I
    :cond_27
    const/16 v55, 0x15

    .line 522
    const-string v3, "dtsh"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    goto/16 :goto_9

    .line 524
    :cond_28
    const/4 v3, 0x1

    move/from16 v0, v24

    if-ne v0, v3, :cond_29

    .line 525
    const/16 v55, 0x12

    .line 526
    const-string v3, "dtse"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    goto/16 :goto_9

    .line 527
    :cond_29
    const/4 v3, 0x1

    move/from16 v0, v23

    if-ne v0, v3, :cond_23

    .line 528
    const-string v3, "dtsh"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    .line 529
    if-nez v28, :cond_2a

    if-nez v31, :cond_2a

    .line 530
    const/16 v55, 0x13

    goto/16 :goto_9

    .line 531
    :cond_2a
    const/4 v3, 0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_2b

    if-nez v31, :cond_2b

    .line 532
    const/16 v55, 0x14

    goto/16 :goto_9

    .line 533
    :cond_2b
    if-nez v28, :cond_23

    const/4 v3, 0x1

    move/from16 v0, v31

    if-ne v0, v3, :cond_23

    .line 534
    const/16 v55, 0x15

    goto/16 :goto_9

    .line 540
    :cond_2c
    const/4 v3, 0x1

    move/from16 v0, v25

    if-ge v0, v3, :cond_2e

    .line 541
    if-lez v21, :cond_2d

    .line 542
    sparse-switch v22, :sswitch_data_1

    .line 559
    const/16 v55, 0x0

    .line 560
    const-string v3, "dtsh"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    goto/16 :goto_a

    .line 544
    :sswitch_4
    const/16 v55, 0x2

    .line 545
    const-string v3, "dtsc"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    goto/16 :goto_a

    .line 549
    :sswitch_5
    const/16 v55, 0x4

    .line 550
    const-string v3, "dtsc"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    goto/16 :goto_a

    .line 554
    :sswitch_6
    const/16 v55, 0x3

    .line 555
    const-string v3, "dtsh"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    goto/16 :goto_a

    .line 564
    :cond_2d
    const/16 v55, 0x1

    .line 565
    const-string v3, "dtsc"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    goto/16 :goto_a

    .line 568
    :cond_2e
    const-string v3, "dtsh"

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->type:Ljava/lang/String;

    .line 569
    if-nez v21, :cond_34

    .line 570
    if-nez v23, :cond_2f

    const/4 v3, 0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_2f

    if-nez v27, :cond_2f

    if-nez v29, :cond_2f

    if-nez v31, :cond_2f

    if-nez v24, :cond_2f

    .line 571
    const/16 v55, 0x5

    goto/16 :goto_a

    .line 572
    :cond_2f
    if-nez v23, :cond_30

    if-nez v28, :cond_30

    if-nez v27, :cond_30

    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_30

    if-nez v31, :cond_30

    if-nez v24, :cond_30

    .line 573
    const/16 v55, 0x6

    goto/16 :goto_a

    .line 574
    :cond_30
    if-nez v23, :cond_31

    const/4 v3, 0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_31

    if-nez v27, :cond_31

    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_31

    if-nez v31, :cond_31

    if-nez v24, :cond_31

    .line 575
    const/16 v55, 0x9

    goto/16 :goto_a

    .line 576
    :cond_31
    if-nez v23, :cond_32

    if-nez v28, :cond_32

    const/4 v3, 0x1

    move/from16 v0, v27

    if-ne v0, v3, :cond_32

    if-nez v29, :cond_32

    if-nez v31, :cond_32

    if-nez v24, :cond_32

    .line 577
    const/16 v55, 0xa

    goto/16 :goto_a

    .line 578
    :cond_32
    if-nez v23, :cond_33

    const/4 v3, 0x1

    move/from16 v0, v28

    if-ne v0, v3, :cond_33

    const/4 v3, 0x1

    move/from16 v0, v27

    if-ne v0, v3, :cond_33

    if-nez v29, :cond_33

    if-nez v31, :cond_33

    if-nez v24, :cond_33

    .line 579
    const/16 v55, 0xd

    goto/16 :goto_a

    .line 580
    :cond_33
    if-nez v23, :cond_24

    if-nez v28, :cond_24

    if-nez v27, :cond_24

    if-nez v29, :cond_24

    const/4 v3, 0x1

    move/from16 v0, v31

    if-ne v0, v3, :cond_24

    if-nez v24, :cond_24

    .line 581
    const/16 v55, 0xe

    goto/16 :goto_a

    .line 584
    :cond_34
    if-nez v22, :cond_35

    if-nez v23, :cond_35

    if-nez v28, :cond_35

    if-nez v27, :cond_35

    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_35

    if-nez v31, :cond_35

    if-nez v24, :cond_35

    .line 585
    const/16 v55, 0x7

    goto/16 :goto_a

    .line 586
    :cond_35
    const/4 v3, 0x6

    move/from16 v0, v22

    if-ne v0, v3, :cond_36

    if-nez v23, :cond_36

    if-nez v28, :cond_36

    if-nez v27, :cond_36

    const/4 v3, 0x1

    move/from16 v0, v29

    if-ne v0, v3, :cond_36

    if-nez v31, :cond_36

    if-nez v24, :cond_36

    .line 587
    const/16 v55, 0x8

    goto/16 :goto_a

    .line 588
    :cond_36
    if-nez v22, :cond_37

    if-nez v23, :cond_37

    if-nez v28, :cond_37

    const/4 v3, 0x1

    move/from16 v0, v27

    if-ne v0, v3, :cond_37

    if-nez v29, :cond_37

    if-nez v31, :cond_37

    if-nez v24, :cond_37

    .line 589
    const/16 v55, 0xb

    goto/16 :goto_a

    .line 590
    :cond_37
    const/4 v3, 0x6

    move/from16 v0, v22

    if-ne v0, v3, :cond_38

    if-nez v23, :cond_38

    if-nez v28, :cond_38

    const/4 v3, 0x1

    move/from16 v0, v27

    if-ne v0, v3, :cond_38

    if-nez v29, :cond_38

    if-nez v31, :cond_38

    if-nez v24, :cond_38

    .line 591
    const/16 v55, 0xc

    goto/16 :goto_a

    .line 592
    :cond_38
    if-nez v22, :cond_39

    if-nez v23, :cond_39

    if-nez v28, :cond_39

    if-nez v27, :cond_39

    if-nez v29, :cond_39

    const/4 v3, 0x1

    move/from16 v0, v31

    if-ne v0, v3, :cond_39

    if-nez v24, :cond_39

    .line 593
    const/16 v55, 0xf

    goto/16 :goto_a

    .line 594
    :cond_39
    const/4 v3, 0x2

    move/from16 v0, v22

    if-ne v0, v3, :cond_24

    if-nez v23, :cond_24

    if-nez v28, :cond_24

    if-nez v27, :cond_24

    if-nez v29, :cond_24

    const/4 v3, 0x1

    move/from16 v0, v31

    if-ne v0, v3, :cond_24

    if-nez v24, :cond_24

    .line 595
    const/16 v55, 0x10

    goto/16 :goto_a

    .line 604
    :cond_3a
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->coreBitRate:I

    move-object/from16 v0, p0

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->extAvgBitrate:I

    add-int/2addr v4, v5

    mul-int/lit16 v4, v4, 0x3e8

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setMaxBitRate(J)V

    goto/16 :goto_b

    .line 613
    :cond_3b
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setCoreLFEPresent(I)V

    goto/16 :goto_c

    .line 623
    :cond_3c
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->ddts:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/DTSSpecificBox;->setMultiAssetFlag(I)V

    goto/16 :goto_d

    .line 639
    .restart local v12    # "bit":I
    :pswitch_9
    move-object/from16 v0, p0

    iget v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->channelCount:I

    goto/16 :goto_f

    .line 648
    :cond_3d
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-object/from16 v0, p0

    iget v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataOffset:I

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->generateSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;IJI)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samples:Ljava/util/List;

    .line 649
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samples:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [J

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleDurations:[J

    .line 650
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleDurations:[J

    move-object/from16 v0, p0

    iget v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samplesPerFrame:I

    int-to-long v4, v4

    invoke-static {v3, v4, v5}, Ljava/util/Arrays;->fill([JJ)V

    .line 652
    const/4 v3, 0x1

    goto/16 :goto_1

    .line 362
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_3
    .end packed-switch

    .line 388
    :pswitch_data_1
    .packed-switch 0x6
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 473
    :sswitch_data_0
    .sparse-switch
        0x200 -> :sswitch_0
        0x400 -> :sswitch_1
        0x800 -> :sswitch_2
        0x1000 -> :sswitch_3
    .end sparse-switch

    .line 500
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_8
        :pswitch_6
        :pswitch_8
        :pswitch_6
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_8
    .end packed-switch

    .line 631
    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_9
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_9
        :pswitch_7
        :pswitch_9
    .end packed-switch

    .line 542
    :sswitch_data_1
    .sparse-switch
        0x0 -> :sswitch_4
        0x2 -> :sswitch_5
        0x6 -> :sswitch_6
    .end sparse-switch
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
    .line 85
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 86
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
    .line 127
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 143
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
    .line 135
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->sampleDurations:[J

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
    .line 115
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 131
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/DTSTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method
