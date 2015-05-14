.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "TextTrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;
    }
.end annotation


# instance fields
.field sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field subs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;",
            ">;"
        }
    .end annotation
.end field

.field trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v4, 0x1

    .line 52
    const-string v2, "subtiles"

    invoke-direct {p0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 43
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 45
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->subs:Ljava/util/List;

    .line 53
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 54
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;

    const-string v2, "tx3g"

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;-><init>(Ljava/lang/String;)V

    .line 55
    .local v1, "tx3g":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;
    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->setDataReferenceIndex(I)V

    .line 56
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;-><init>()V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->setStyleRecord(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$StyleRecord;)V

    .line 57
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;-><init>()V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->setBoxRecord(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry$BoxRecord;)V

    .line 58
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v2, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 60
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;-><init>()V

    .line 61
    .local v0, "ftab":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;

    const-string v3, "Serif"

    invoke-direct {v2, v4, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox$FontRecord;-><init>(ILjava/lang/String;)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/threegpp26245/FontTableBox;->setEntries(Ljava/util/List;)V

    .line 63
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/TextSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 66
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 67
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 68
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 71
    return-void
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
    .line 75
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
    .line 130
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    const-string v0, "sbtl"

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
    .line 138
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 18

    .prologue
    .line 107
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .local v3, "decTimes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const-wide/16 v8, 0x0

    .line 110
    .local v8, "lastEnd":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->subs:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;

    .line 111
    .local v7, "sub":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;
    iget-wide v14, v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->from:J

    sub-long v10, v14, v8

    .line 112
    .local v10, "silentTime":J
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-lez v13, :cond_1

    .line 114
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-interface {v3, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    :cond_0
    iget-wide v14, v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->to:J

    iget-wide v0, v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->from:J

    move-wide/from16 v16, v0

    sub-long v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-interface {v3, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    iget-wide v8, v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->to:J

    .line 120
    goto :goto_0

    .line 115
    :cond_1
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-gez v13, :cond_0

    .line 116
    new-instance v12, Ljava/lang/Error;

    const-string v13, "Subtitle display times may not intersect"

    invoke-direct {v12, v13}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v12

    .line 121
    .end local v7    # "sub":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;
    .end local v10    # "silentTime":J
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    new-array v4, v12, [J

    .line 122
    .local v4, "decTimesArray":[J
    const/4 v5, 0x0

    .line 123
    .local v5, "index":I
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 124
    .local v2, "decTime":Ljava/lang/Long;
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .local v6, "index":I
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    aput-wide v14, v4, v5

    move v5, v6

    .line 125
    .end local v6    # "index":I
    .restart local v5    # "index":I
    goto :goto_1

    .line 126
    .end local v2    # "decTime":Ljava/lang/Long;
    :cond_3
    return-object v4
.end method

.method public getSamples()Ljava/util/List;
    .locals 14
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
    const-wide/16 v12, 0x0

    .line 78
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 79
    .local v3, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    const-wide/16 v4, 0x0

    .line 80
    .local v4, "lastEnd":J
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->subs:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;

    .line 81
    .local v8, "sub":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;
    iget-wide v10, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->from:J

    sub-long v6, v10, v4

    .line 82
    .local v6, "silentTime":J
    cmp-long v10, v6, v12

    if-lez v10, :cond_1

    .line 83
    new-instance v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;

    const/4 v11, 0x2

    new-array v11, v11, [B

    fill-array-data v11, :array_0

    invoke-static {v11}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v11

    invoke-direct {v10, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 88
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 90
    .local v1, "dos":Ljava/io/DataOutputStream;
    :try_start_0
    iget-object v10, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->text:Ljava/lang/String;

    const-string v11, "UTF-8"

    invoke-virtual {v10, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v10

    array-length v10, v10

    invoke-virtual {v1, v10}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 91
    iget-object v10, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->text:Ljava/lang/String;

    const-string v11, "UTF-8"

    invoke-virtual {v10, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/io/DataOutputStream;->write([B)V

    .line 92
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    new-instance v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    invoke-static {v11}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v11

    invoke-direct {v10, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    iget-wide v4, v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;->to:J

    .line 98
    goto :goto_0

    .line 84
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "dos":Ljava/io/DataOutputStream;
    :cond_1
    cmp-long v10, v6, v12

    if-gez v10, :cond_0

    .line 85
    new-instance v9, Ljava/lang/Error;

    const-string v10, "Subtitle display times may not intersect"

    invoke-direct {v9, v10}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v9

    .line 93
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "dos":Ljava/io/DataOutputStream;
    :catch_0
    move-exception v2

    .line 94
    .local v2, "e":Ljava/io/IOException;
    new-instance v9, Ljava/lang/Error;

    const-string v10, "VM is broken. Does not support UTF-8"

    invoke-direct {v9, v10}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v9

    .line 99
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "dos":Ljava/io/DataOutputStream;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v6    # "silentTime":J
    .end local v8    # "sub":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;
    :cond_2
    return-object v3

    .line 83
    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data
.end method

.method public getSubs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl$Line;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->subs:Ljava/util/List;

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 177
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 134
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/TextTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method
