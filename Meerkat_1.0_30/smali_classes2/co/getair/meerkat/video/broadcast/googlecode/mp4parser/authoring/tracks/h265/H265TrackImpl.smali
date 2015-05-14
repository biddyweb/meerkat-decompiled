.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;
.source "H265TrackImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitTypes;


# instance fields
.field pps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field samples:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field sps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field vps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 12
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 40
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 32
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->sps:Ljava/util/ArrayList;

    .line 33
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->pps:Ljava/util/ArrayList;

    .line 34
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->vps:Ljava/util/ArrayList;

    .line 35
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->samples:Ljava/util/ArrayList;

    .line 41
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v3, "nals":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/nio/ByteBuffer;>;"
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;

    invoke-direct {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 44
    .local v1, "la":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;
    new-array v5, v10, [Z

    aput-boolean v9, v5, v9

    .line 45
    .local v5, "vclNalUnitSeenInAU":[Z
    new-array v0, v10, [Z

    aput-boolean v10, v0, v9

    .line 48
    .local v0, "isIdr":[Z
    :goto_0
    invoke-virtual {p0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->findNextNal(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AbstractH26XTrack$LookAhead;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .local v2, "nal":Ljava/nio/ByteBuffer;
    if-eqz v2, :cond_3

    .line 50
    invoke-virtual {p0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->getNalUnitHeader(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;

    move-result-object v4

    .line 52
    .local v4, "unitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;
    aget-boolean v6, v5, v9

    if-eqz v6, :cond_0

    .line 54
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->isVcl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 55
    invoke-virtual {v2, v11}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v6

    and-int/lit8 v6, v6, -0x80

    if-eqz v6, :cond_0

    .line 56
    invoke-virtual {p0, v3, v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->wrapUp(Ljava/util/List;[Z[Z)V

    .line 86
    :cond_0
    :goto_1
    iget v6, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    packed-switch v6, :pswitch_data_0

    .line 110
    :goto_2
    :pswitch_0
    iget v6, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    packed-switch v6, :pswitch_data_1

    .line 121
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Adding "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 122
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    :pswitch_1
    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->isVcl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 125
    iget v6, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    packed-switch v6, :pswitch_data_2

    .line 131
    aput-boolean v9, v0, v9

    .line 135
    :cond_1
    :goto_3
    aget-boolean v6, v5, v9

    invoke-virtual {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->isVcl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;)Z

    move-result v7

    or-int/2addr v6, v7

    aput-boolean v6, v5, v9

    goto :goto_0

    .line 59
    :cond_2
    iget v6, v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    packed-switch v6, :pswitch_data_3

    :pswitch_2
    goto :goto_1

    .line 80
    :pswitch_3
    invoke-virtual {p0, v3, v5, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->wrapUp(Ljava/util/List;[Z[Z)V

    goto :goto_1

    .line 88
    :pswitch_4
    invoke-virtual {v2, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 89
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->pps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v7, "Stored PPS"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 93
    :pswitch_5
    invoke-virtual {v2, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 94
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->vps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v7, "Stored VPS"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 98
    :pswitch_6
    invoke-virtual {v2, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 99
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->sps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    invoke-virtual {v2, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 101
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SequenceParameterSetRbsp;

    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-direct {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-static {v7}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SequenceParameterSetRbsp;-><init>(Ljava/io/InputStream;)V

    .line 102
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v7, "Stored SPS"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 105
    :pswitch_7
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SEIMessage;

    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-direct {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-direct {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/SEIMessage;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;)V

    goto/16 :goto_2

    .line 128
    :pswitch_8
    aget-boolean v6, v0, v9

    and-int/lit8 v6, v6, 0x1

    aput-boolean v6, v0, v9

    goto :goto_3

    .line 138
    .end local v4    # "unitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;
    :cond_3
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->createSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v6

    iput-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 139
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->samples:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [J

    iput-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->decodingTimes:[J

    .line 140
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v6

    const-wide/16 v8, 0x19

    invoke-virtual {v6, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 141
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->decodingTimes:[J

    const-wide/16 v8, 0x1

    invoke-static {v6, v8, v9}, Ljava/util/Arrays;->fill([JJ)V

    .line 142
    return-void

    .line 86
    nop

    :pswitch_data_0
    .packed-switch 0x20
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
    .end packed-switch

    .line 110
    :pswitch_data_1
    .packed-switch 0x20
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 125
    :pswitch_data_2
    .packed-switch 0x13
        :pswitch_8
        :pswitch_8
    .end packed-switch

    .line 59
    :pswitch_data_3
    .packed-switch 0x20
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private createSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 15

    .prologue
    const/16 v14, 0x22

    const-wide/high16 v12, 0x4052000000000000L    # 72.0

    const/4 v11, 0x1

    .line 146
    new-instance v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    iput-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 147
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    const-string v8, "hvc1"

    invoke-direct {v5, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;-><init>(Ljava/lang/String;)V

    .line 148
    .local v5, "visualSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    invoke-virtual {v5, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setDataReferenceIndex(I)V

    .line 149
    const/16 v8, 0x18

    invoke-virtual {v5, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setDepth(I)V

    .line 150
    invoke-virtual {v5, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setFrameCount(I)V

    .line 151
    invoke-virtual {v5, v12, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setHorizresolution(D)V

    .line 152
    invoke-virtual {v5, v12, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setVertresolution(D)V

    .line 153
    const/16 v8, 0x280

    invoke-virtual {v5, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setWidth(I)V

    .line 154
    const/16 v8, 0x1e0

    invoke-virtual {v5, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setHeight(I)V

    .line 155
    const-string v8, "HEVC Coding"

    invoke-virtual {v5, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setCompressorname(Ljava/lang/String;)V

    .line 157
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;-><init>()V

    .line 159
    .local v0, "hevcConfigurationBox":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;
    new-instance v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;-><init>()V

    .line 160
    .local v4, "spsArray":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;
    iput-boolean v11, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->array_completeness:Z

    .line 161
    const/16 v8, 0x21

    iput v8, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nal_unit_type:I

    .line 162
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    .line 163
    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->sps:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 164
    .local v3, "sp":Ljava/nio/ByteBuffer;
    iget-object v9, v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->toArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 167
    .end local v3    # "sp":Ljava/nio/ByteBuffer;
    :cond_0
    new-instance v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;-><init>()V

    .line 168
    .local v2, "ppsArray":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;
    iput-boolean v11, v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->array_completeness:Z

    .line 169
    iput v14, v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nal_unit_type:I

    .line 170
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    .line 171
    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->pps:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 172
    .local v1, "pp":Ljava/nio/ByteBuffer;
    iget-object v9, v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->toArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 175
    .end local v1    # "pp":Ljava/nio/ByteBuffer;
    :cond_1
    new-instance v7, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    invoke-direct {v7}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;-><init>()V

    .line 176
    .local v7, "vpsArray":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;
    iput-boolean v11, v7, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->array_completeness:Z

    .line 177
    iput v14, v7, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nal_unit_type:I

    .line 178
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, v7, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    .line 179
    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->vps:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/nio/ByteBuffer;

    .line 180
    .local v6, "vp":Ljava/nio/ByteBuffer;
    iget-object v9, v7, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;->nalUnits:Ljava/util/List;

    invoke-static {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->toArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 183
    .end local v6    # "vp":Ljava/nio/ByteBuffer;
    :cond_2
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->getArrays()Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x3

    new-array v9, v9, [Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcDecoderConfigurationRecord$Array;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    aput-object v7, v9, v11

    const/4 v10, 0x2

    aput-object v2, v9, v10

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 185
    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 186
    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v8, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 188
    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v8
.end method

.method public static main([Ljava/lang/String;)V
    .locals 6
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 240
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;

    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;

    const-string v5, "c:\\content\\test-UHD-HEVC_01_FMV_Med_track1.hvc"

    invoke-direct {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 241
    .local v3, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;-><init>()V

    .line 242
    .local v1, "movie":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    invoke-virtual {v1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->addTrack(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V

    .line 243
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;-><init>()V

    .line 244
    .local v2, "mp4Builder":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;
    invoke-virtual {v2, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->build(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v0

    .line 245
    .local v0, "c":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    new-instance v4, Ljava/io/FileOutputStream;

    const-string v5, "output.mp4"

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    invoke-interface {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 247
    return-void
.end method


# virtual methods
.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 213
    const-string v0, "vide"

    return-object v0
.end method

.method public getNalUnitHeader(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;
    .locals 3
    .param p1, "nal"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 226
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 227
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 230
    .local v1, "nal_unit_header":I
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;-><init>()V

    .line 231
    .local v0, "nalUnitHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;
    const v2, 0x8000

    and-int/2addr v2, v1

    shr-int/lit8 v2, v2, 0xf

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->forbiddenZeroFlag:I

    .line 232
    and-int/lit16 v2, v1, 0x7e00

    shr-int/lit8 v2, v2, 0x9

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    .line 233
    and-int/lit16 v2, v1, 0x1f8

    shr-int/lit8 v2, v2, 0x3

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nuhLayerId:I

    .line 234
    and-int/lit8 v2, v1, 0x7

    iput v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nuhTemporalIdPlusOne:I

    .line 235
    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 208
    const/4 v0, 0x0

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
    .line 217
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->samples:Ljava/util/ArrayList;

    return-object v0
.end method

.method isVcl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;)Z
    .locals 2
    .param p1, "nalUnitHeader"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;

    .prologue
    .line 222
    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    if-ltz v0, :cond_0

    iget v0, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/NalUnitHeader;->nalUnitType:I

    const/16 v1, 0x1f

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public wrapUp(Ljava/util/List;[Z[Z)V
    .locals 4
    .param p2, "vclNalUnitSeenInAU"    # [Z
    .param p3, "isIdr"    # [Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;[Z[Z)V"
        }
    .end annotation

    .prologue
    .local p1, "nals":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    const/4 v3, 0x0

    .line 194
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->samples:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/h265/H265TrackImpl;->createSampleObject(Ljava/util/List;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Create AU from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " NALs"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 196
    aget-boolean v0, p3, v3

    if-eqz v0, :cond_0

    .line 197
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "  IDR"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 201
    :goto_0
    aput-boolean v3, p2, v3

    .line 202
    const/4 v0, 0x1

    aput-boolean v0, p3, v3

    .line 203
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 204
    return-void

    .line 199
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    goto :goto_0
.end method
