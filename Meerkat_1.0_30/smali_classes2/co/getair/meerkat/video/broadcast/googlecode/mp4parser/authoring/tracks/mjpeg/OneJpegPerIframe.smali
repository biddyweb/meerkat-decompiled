.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "OneJpegPerIframe.java"


# instance fields
.field jpegs:[Ljava/io/File;

.field sampleDurations:[J

.field stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field syncSamples:[J

.field trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Ljava/io/File;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V
    .locals 35
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "jpegs"    # [Ljava/io/File;
    .param p3, "alignTo"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 31
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 39
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->jpegs:[Ljava/io/File;

    .line 40
    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v3

    array-length v3, v3

    move-object/from16 v0, p2

    array-length v4, v0

    if-eq v3, v4, :cond_0

    .line 41
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Number of sync samples doesn\'t match the number of stills ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v5

    array-length v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " vs. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    array-length v5, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 50
    :cond_0
    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v33

    .line 51
    .local v33, "sampleDurationsToiAlignTo":[J
    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v34

    .line 52
    .local v34, "syncSamples":[J
    const/16 v22, 0x1

    .line 53
    .local v22, "currentSyncSample":I
    const-wide/16 v26, 0x0

    .line 54
    .local v26, "duration":J
    move-object/from16 v0, v34

    array-length v3, v0

    new-array v3, v3, [J

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->sampleDurations:[J

    .line 56
    const/16 v29, 0x1

    .local v29, "i":I
    :goto_0
    move-object/from16 v0, v33

    array-length v3, v0

    move/from16 v0, v29

    if-ge v0, v3, :cond_2

    .line 57
    move-object/from16 v0, v34

    array-length v3, v0

    move/from16 v0, v22

    if-ge v0, v3, :cond_1

    move/from16 v0, v29

    int-to-long v4, v0

    aget-wide v6, v34, v22

    cmp-long v3, v4, v6

    if-nez v3, :cond_1

    .line 58
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->sampleDurations:[J

    add-int/lit8 v4, v22, -0x1

    aput-wide v26, v3, v4

    .line 59
    const-wide/16 v26, 0x0

    .line 60
    add-int/lit8 v22, v22, 0x1

    .line 62
    :cond_1
    aget-wide v4, v33, v29

    add-long v26, v26, v4

    .line 56
    add-int/lit8 v29, v29, 0x1

    goto :goto_0

    .line 64
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->sampleDurations:[J

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->sampleDurations:[J

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    aput-wide v26, v3, v4

    .line 66
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 67
    new-instance v31, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    const-string v3, "mp4v"

    move-object/from16 v0, v31

    invoke-direct {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;-><init>(Ljava/lang/String;)V

    .line 68
    .local v31, "mp4v":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 69
    new-instance v28, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;

    invoke-direct/range {v28 .. v28}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;-><init>()V

    .line 70
    .local v28, "esds":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
    const-string v3, "038080801B000100048080800D6C11000000000A1CB4000A1CB4068080800102"

    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Hex;->decodeHex(Ljava/lang/String;)[B

    move-result-object v3

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->setData(Ljava/nio/ByteBuffer;)V

    .line 71
    const/4 v3, -0x1

    const-string v4, "038080801B000100048080800D6C11000000000A1CB4000A1CB4068080800102"

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Hex;->decodeHex(Ljava/lang/String;)[B

    move-result-object v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-static {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ObjectDescriptorFactory;->createFrom(ILjava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->setEsDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;)V

    .line 72
    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 73
    move-object/from16 v0, p2

    array-length v3, v0

    new-array v3, v3, [J

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->syncSamples:[J

    .line 74
    const/16 v29, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->syncSamples:[J

    array-length v3, v3

    move/from16 v0, v29

    if-ge v0, v3, :cond_3

    .line 75
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->syncSamples:[J

    add-int/lit8 v4, v29, 0x1

    int-to-long v4, v4

    aput-wide v4, v3, v29

    .line 74
    add-int/lit8 v29, v29, 0x1

    goto :goto_1

    .line 79
    :cond_3
    const-wide/16 v10, 0x0

    .line 80
    .local v10, "earliestTrackPresentationTime":D
    const/4 v2, 0x1

    .line 81
    .local v2, "acceptDwell":Z
    const/4 v12, 0x1

    .line 82
    .local v12, "acceptEdit":Z
    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    .line 83
    .local v23, "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getMediaTime()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_4

    if-nez v2, :cond_4

    .line 84
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Cannot accept edit list for processing (1)"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 86
    :cond_4
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getMediaTime()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-ltz v4, :cond_5

    if-nez v12, :cond_5

    .line 87
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Cannot accept edit list for processing (2)"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 89
    :cond_5
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getMediaTime()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_6

    .line 90
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getSegmentDuration()D

    move-result-wide v4

    add-double/2addr v10, v4

    goto :goto_2

    .line 92
    :cond_6
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getMediaTime()J

    move-result-wide v4

    long-to-double v4, v4

    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getTimeScale()J

    move-result-wide v6

    long-to-double v6, v6

    div-double/2addr v4, v6

    sub-double/2addr v10, v4

    .line 93
    const/4 v12, 0x0

    .line 94
    const/4 v2, 0x0

    goto :goto_2

    .line 97
    .end local v23    # "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    :cond_7
    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_9

    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_9

    .line 98
    const-wide/16 v24, 0x0

    .line 99
    .local v24, "currentTime":J
    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;->blowupCompositionTimes(Ljava/util/List;)[I

    move-result-object v3

    const/4 v4, 0x0

    const/16 v5, 0x32

    invoke-static {v3, v4, v5}, Ljava/util/Arrays;->copyOfRange([III)[I

    move-result-object v32

    .line 100
    .local v32, "ptss":[I
    const/16 v30, 0x0

    .local v30, "j":I
    :goto_3
    move-object/from16 v0, v32

    array-length v3, v0

    move/from16 v0, v30

    if-ge v0, v3, :cond_8

    .line 101
    aget v3, v32, v30

    int-to-long v4, v3

    add-long v4, v4, v24

    long-to-int v3, v4

    aput v3, v32, v30

    .line 102
    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v3

    aget-wide v4, v3, v30

    add-long v24, v24, v4

    .line 100
    add-int/lit8 v30, v30, 0x1

    goto :goto_3

    .line 104
    :cond_8
    invoke-static/range {v32 .. v32}, Ljava/util/Arrays;->sort([I)V

    .line 105
    const/4 v3, 0x0

    aget v3, v32, v3

    int-to-double v4, v3

    invoke-interface/range {p3 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    long-to-double v6, v6

    div-double/2addr v4, v6

    add-double/2addr v10, v4

    .line 109
    .end local v24    # "currentTime":J
    .end local v30    # "j":I
    .end local v32    # "ptss":[I
    :cond_9
    const-wide/16 v4, 0x0

    cmpg-double v3, v10, v4

    if-gez v3, :cond_b

    .line 110
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getEdits()Ljava/util/List;

    move-result-object v13

    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    neg-double v4, v10

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    long-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-long v4, v4

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getDuration()J

    move-result-wide v14

    long-to-double v14, v14

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v10, v14, v16

    invoke-direct/range {v3 .. v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;-><init>(JJDD)V

    .end local v10    # "earliestTrackPresentationTime":D
    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_a
    :goto_4
    return-void

    .line 111
    .restart local v10    # "earliestTrackPresentationTime":D
    :cond_b
    const-wide/16 v4, 0x0

    cmpl-double v3, v10, v4

    if-lez v3, :cond_a

    .line 112
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getEdits()Ljava/util/List;

    move-result-object v13

    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    const-wide/16 v4, -0x1

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-direct/range {v3 .. v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;-><init>(JJDD)V

    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getEdits()Ljava/util/List;

    move-result-object v3

    new-instance v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    const-wide/16 v14, 0x0

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v16

    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getDuration()J

    move-result-wide v4

    long-to-double v4, v4

    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    long-to-double v6, v6

    div-double v20, v4, v6

    invoke-direct/range {v13 .. v21}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;-><init>(JJDD)V

    invoke-interface {v3, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    return-void
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    const-string v0, "vide"

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->sampleDurations:[J

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
    .line 141
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1;

    invoke-direct {v0, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;)V

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->syncSamples:[J

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/mjpeg/OneJpegPerIframe;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method
