.class public Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;
.super Ljava/lang/Object;
.source "MoovBuilder.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MoovBuilder"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static createDinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;
    .locals 4
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 411
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;-><init>()V

    .line 412
    .local v0, "dinf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;-><init>()V

    .line 413
    .local v1, "dref":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 414
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;-><init>()V

    .line 415
    .local v2, "url":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;->setFlags(I)V

    .line 416
    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 417
    return-object v0
.end method

.method protected static createEdts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 11
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p1, "timeOffset"    # J

    .prologue
    .line 286
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;-><init>()V

    .line 287
    .local v1, "elst":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;->setVersion(I)V

    .line 288
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 290
    .local v9, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;>;"
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;

    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v2

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    move-wide v4, p1

    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;JJD)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    invoke-virtual {v1, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;->setEntries(Ljava/util/List;)V

    .line 293
    new-instance v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;

    invoke-direct {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;-><init>()V

    .line 294
    .local v8, "edts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;
    invoke-virtual {v8, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 295
    return-object v8
.end method

.method public static createFirstMp4Chunk(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[B)Ljava/util/List;
    .locals 5
    .param p0, "videoChunkTrack"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "videoDurations"    # [J
    .param p2, "audioChunkTrack"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p3, "parameterSets"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;",
            "[J",
            "Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;",
            "[B)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 62
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v2

    array-length v3, p3

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 63
    .local v1, "videoChunk":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, p3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 64
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 65
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 66
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 73
    invoke-virtual {p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 74
    .local v0, "audioChunk":Ljava/nio/ByteBuffer;
    invoke-virtual {p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 75
    invoke-virtual {p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 76
    invoke-virtual {p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getData()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 82
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-static {v2, p1, v3}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createFirstMp4Chunk([B[J[B)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method public static createFirstMp4Chunk([B[J[B)Ljava/util/List;
    .locals 46
    .param p0, "videoChunk"    # [B
    .param p1, "videoDurations"    # [J
    .param p2, "audioChunk"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B[J[B)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .local v19, "firstMp4Chunk":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-static {}, Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;->getFtyp()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v22

    .line 90
    .local v22, "ftyp":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    new-instance v27, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    invoke-direct/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;-><init>()V

    .line 94
    .local v27, "movieBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;
    new-instance v31, Ljava/util/Date;

    invoke-direct/range {v31 .. v31}, Ljava/util/Date;-><init>()V

    .line 95
    .local v31, "time":Ljava/util/Date;
    new-instance v29, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;

    invoke-direct/range {v29 .. v29}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;-><init>()V

    .line 96
    .local v29, "mvhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;
    const/16 v42, 0x1

    move-object/from16 v0, v29

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setVersion(I)V

    .line 97
    move-object/from16 v0, v29

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 98
    move-object/from16 v0, v29

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 99
    const-wide/32 v42, 0xac44

    move-object/from16 v0, v29

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setDuration(J)V

    .line 100
    const-wide/32 v42, 0xac44

    move-object/from16 v0, v29

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setTimescale(J)V

    .line 101
    const-wide/16 v42, 0x3

    move-object/from16 v0, v29

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setNextTrackId(J)V

    .line 102
    move-object/from16 v0, v27

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 103
    const/16 v23, 0x0

    .line 104
    .local v23, "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    invoke-interface/range {v22 .. v22}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v42

    const-wide/16 v44, 0x8

    add-long v20, v42, v44

    .line 105
    .local v20, "firstChunkOffset":J
    new-instance v25, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;-><init>([B)V

    .line 106
    .local v25, "h264TrackData":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    const-string v42, "MoovBuilder"

    new-instance v43, Ljava/lang/StringBuilder;

    invoke-direct/range {v43 .. v43}, Ljava/lang/StringBuilder;-><init>()V

    const-string v44, "video chunk length "

    invoke-virtual/range {v43 .. v44}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v43

    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v44, v0

    invoke-virtual/range {v43 .. v44}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v43

    invoke-virtual/range {v43 .. v43}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v43

    invoke-static/range {v42 .. v43}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :try_start_0
    new-instance v24, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;

    invoke-direct/range {v24 .. v25}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v23    # "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    .local v24, "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    :try_start_1
    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->setSampleDurations([J)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v23, v24

    .line 114
    .end local v24    # "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    .restart local v23    # "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    :goto_0
    const/4 v6, 0x0

    .line 115
    .local v6, "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    new-instance v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;

    move-object/from16 v0, p2

    invoke-direct {v8, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;-><init>([B)V

    .line 117
    .local v8, "aacTrackData":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    :try_start_2
    new-instance v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    invoke-direct {v7, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .end local v6    # "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    .local v7, "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    move-object v6, v7

    .line 122
    .end local v7    # "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    .restart local v6    # "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    :goto_1
    new-instance v28, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;

    invoke-direct/range {v28 .. v28}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;-><init>()V

    .line 124
    .local v28, "mvex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;
    const/16 v33, 0x0

    .line 125
    .local v33, "videoMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    const-wide/16 v10, 0x0

    .line 126
    .local v10, "audioDuration":D
    const-wide/16 v34, 0x0

    .line 127
    .local v34, "videoDuration":D
    const-wide/16 v36, 0x0

    .line 128
    .local v36, "videoRawDuration":J
    const-wide/16 v12, 0x0

    .line 129
    .local v12, "audioRawDuration":J
    const-wide/16 v40, 0x0

    .line 130
    .local v40, "videoTimeScale":J
    const-wide/16 v16, 0x0

    .line 131
    .local v16, "audioTimeScale":J
    const-wide/16 v14, 0x0

    .line 132
    .local v14, "audioTimeOffset":J
    const-wide/16 v38, 0x0

    .line 134
    .local v38, "videoTimeOffset":J
    if-eqz v6, :cond_0

    .line 136
    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v16

    .line 137
    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->getDuration()J

    move-result-wide v12

    .line 138
    long-to-double v0, v12

    move-wide/from16 v42, v0

    move-wide/from16 v0, v16

    long-to-double v0, v0

    move-wide/from16 v44, v0

    div-double v10, v42, v44

    .line 141
    :cond_0
    if-eqz v23, :cond_1

    .line 142
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v40

    .line 143
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;->getDuration()J

    move-result-wide v36

    .line 144
    move-wide/from16 v0, v36

    long-to-double v0, v0

    move-wide/from16 v42, v0

    move-wide/from16 v0, v40

    long-to-double v0, v0

    move-wide/from16 v44, v0

    div-double v34, v42, v44

    .line 147
    :cond_1
    if-eqz v23, :cond_3

    .line 148
    const-wide/16 v42, 0x0

    cmpl-double v42, v10, v42

    if-lez v42, :cond_2

    const-wide/16 v42, 0x0

    cmpl-double v42, v34, v42

    if-lez v42, :cond_2

    cmpl-double v42, v10, v34

    if-lez v42, :cond_2

    .line 149
    const-wide/16 v38, 0x0

    .line 153
    :cond_2
    move-object/from16 v0, v23

    move-wide/from16 v1, v20

    move-wide/from16 v3, v38

    invoke-static {v0, v1, v2, v3, v4}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createTrak(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;JJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v33

    .end local v33    # "videoMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    check-cast v33, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    .line 154
    .restart local v33    # "videoMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    invoke-virtual/range {v33 .. v33}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v42

    const/16 v43, 0x1

    invoke-virtual/range {v42 .. v43}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setInPoster(Z)V

    .line 155
    move-object/from16 v0, v27

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 156
    new-instance v32, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    invoke-direct/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;-><init>()V

    .line 157
    .local v32, "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    const-wide/16 v42, 0x1

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setTrackId(J)V

    .line 158
    const-wide/16 v42, 0x1

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleDescriptionIndex(J)V

    .line 159
    const-wide/16 v42, 0x0

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleDuration(J)V

    .line 160
    const-wide/16 v42, 0x0

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleSize(J)V

    .line 161
    new-instance v30, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>()V

    .line 162
    .local v30, "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V

    .line 163
    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 166
    .end local v30    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .end local v32    # "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    :cond_3
    const/4 v9, 0x0

    .line 167
    .local v9, "audioMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    if-eqz v6, :cond_5

    .line 168
    const-wide/16 v42, 0x0

    cmpl-double v42, v10, v42

    if-lez v42, :cond_4

    const-wide/16 v42, 0x0

    cmpl-double v42, v34, v42

    if-lez v42, :cond_4

    cmpl-double v42, v34, v10

    if-lez v42, :cond_4

    .line 169
    const-wide/16 v14, 0x0

    .line 172
    :cond_4
    move-wide/from16 v0, v20

    invoke-static {v6, v0, v1, v14, v15}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createTrak(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;JJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v9

    .end local v9    # "audioMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    check-cast v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    .line 173
    .restart local v9    # "audioMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 175
    new-instance v32, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    invoke-direct/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;-><init>()V

    .line 176
    .restart local v32    # "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    const-wide/16 v42, 0x2

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setTrackId(J)V

    .line 177
    const-wide/16 v42, 0x1

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleDescriptionIndex(J)V

    .line 178
    const-wide/16 v42, 0x0

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleDuration(J)V

    .line 179
    const-wide/16 v42, 0x0

    move-object/from16 v0, v32

    move-wide/from16 v1, v42

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleSize(J)V

    .line 180
    new-instance v30, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>()V

    .line 181
    .restart local v30    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    const/16 v42, 0x2

    move-object/from16 v0, v30

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleDependsOn(I)V

    .line 182
    const/16 v42, 0x2

    move-object/from16 v0, v30

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDependedOn(I)V

    .line 183
    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V

    .line 184
    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 186
    .end local v30    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .end local v32    # "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    :cond_5
    const-string v42, "MoovBuilder"

    new-instance v43, Ljava/lang/StringBuilder;

    invoke-direct/range {v43 .. v43}, Ljava/lang/StringBuilder;-><init>()V

    const-string v44, "Durations A:"

    invoke-virtual/range {v43 .. v44}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v43

    move-object/from16 v0, v43

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v43

    const-string v44, " V:"

    invoke-virtual/range {v43 .. v44}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v43

    move-object/from16 v0, v43

    move-wide/from16 v1, v34

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v43

    invoke-virtual/range {v43 .. v43}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v43

    invoke-static/range {v42 .. v43}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    invoke-virtual/range {v27 .. v28}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 191
    move-object/from16 v0, v23

    invoke-static {v0, v6}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createMdat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v26

    .line 192
    .local v26, "mdat":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    move-object/from16 v0, v19

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    invoke-static/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->getChunkSize(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)I

    move-result v42

    move/from16 v0, v42

    int-to-long v0, v0

    move-wide/from16 v42, v0

    add-long v20, v20, v42

    .line 202
    if-eqz v9, :cond_6

    .line 204
    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getSampleTableBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getStaticChunkOffsetBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->getChunkOffsets()[J

    move-result-object v42

    const/16 v43, 0x0

    aput-wide v20, v42, v43

    .line 206
    :cond_6
    return-object v19

    .line 110
    .end local v6    # "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    .end local v8    # "aacTrackData":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .end local v9    # "audioMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    .end local v10    # "audioDuration":D
    .end local v12    # "audioRawDuration":J
    .end local v14    # "audioTimeOffset":J
    .end local v16    # "audioTimeScale":J
    .end local v26    # "mdat":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v28    # "mvex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;
    .end local v33    # "videoMoovTrack":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    .end local v34    # "videoDuration":D
    .end local v36    # "videoRawDuration":J
    .end local v38    # "videoTimeOffset":J
    .end local v40    # "videoTimeScale":J
    :catch_0
    move-exception v18

    .line 111
    .local v18, "e":Ljava/io/IOException;
    :goto_2
    const-string v42, "MoovBuilder"

    const-string v43, "Error on starting h264 track"

    move-object/from16 v0, v42

    move-object/from16 v1, v43

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_0

    .line 119
    .end local v18    # "e":Ljava/io/IOException;
    .restart local v6    # "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    .restart local v8    # "aacTrackData":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    :catch_1
    move-exception v18

    .line 120
    .restart local v18    # "e":Ljava/io/IOException;
    const-string v42, "MoovBuilder"

    const-string v43, "Error on starting aac track"

    move-object/from16 v0, v42

    move-object/from16 v1, v43

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1

    .line 110
    .end local v6    # "aacTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
    .end local v8    # "aacTrackData":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .end local v18    # "e":Ljava/io/IOException;
    .end local v23    # "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    .restart local v24    # "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    :catch_2
    move-exception v18

    move-object/from16 v23, v24

    .end local v24    # "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    .restart local v23    # "h264Track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    goto :goto_2
.end method

.method protected static createMdat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 1
    .param p0, "videoTrack"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;
    .param p1, "audioTrack"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    .prologue
    .line 268
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder$1Mdat;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)V

    return-object v0
.end method

.method protected static createMdhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 4
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 401
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;-><init>()V

    .line 402
    .local v0, "mdhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getCreationTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 403
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 404
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setDuration(J)V

    .line 405
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setTimescale(J)V

    .line 406
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setLanguage(Ljava/lang/String;)V

    .line 407
    return-object v0
.end method

.method protected static createMdia(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 3
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p1, "firstChunkOffset"    # J

    .prologue
    .line 393
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;-><init>()V

    .line 394
    .local v0, "mdia":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;
    invoke-static {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createMdhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 395
    invoke-static {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createMdiaHdlr(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 396
    invoke-static {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createMinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 397
    return-object v0
.end method

.method protected static createMdiaHdlr(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 2
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 387
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;-><init>()V

    .line 388
    .local v0, "hdlr":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;->setHandlerType(Ljava/lang/String;)V

    .line 389
    return-object v0
.end method

.method protected static createMinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 3
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p1, "firstChunkOffset"    # J

    .prologue
    .line 367
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;-><init>()V

    .line 368
    .local v0, "minf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "vide"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 369
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 381
    :cond_0
    :goto_0
    invoke-static {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createDinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 382
    invoke-static {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createStbl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 383
    return-object v0

    .line 370
    :cond_1
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "soun"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 371
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 372
    :cond_2
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "text"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 373
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 374
    :cond_3
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "subt"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 375
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 376
    :cond_4
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "hint"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 377
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 378
    :cond_5
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sbtl"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 379
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0
.end method

.method protected static createStbl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 21
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p1, "firstChunkOffset"    # J

    .prologue
    .line 322
    new-instance v13, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    invoke-direct {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;-><init>()V

    .line 323
    .local v13, "stbl":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    invoke-interface/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v12

    .line 324
    .local v12, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    move-object/from16 v0, p0

    invoke-static {v0, v13}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createStsd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 326
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 328
    .local v10, "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    invoke-interface/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v4

    array-length v4, v4

    if-ge v11, v4, :cond_0

    .line 329
    new-instance v19, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    const-wide/16 v4, 0x1

    invoke-interface/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v6

    aget-wide v6, v6, v11

    move-object/from16 v0, v19

    invoke-direct {v0, v4, v5, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    .line 330
    .local v19, "sttsEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 333
    .end local v19    # "sttsEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    :cond_0
    new-instance v18, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    invoke-direct/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;-><init>()V

    .line 334
    .local v18, "stts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;
    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->setEntries(Ljava/util/List;)V

    .line 335
    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 336
    new-instance v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;-><init>()V

    .line 337
    .local v15, "stsc":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 338
    .local v16, "stscEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;>;"
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    const-wide/16 v4, 0x1

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v6

    int-to-long v6, v6

    const-wide/16 v8, 0x1

    invoke-direct/range {v3 .. v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;-><init>(JJJ)V

    .line 339
    .local v3, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 340
    invoke-virtual/range {v15 .. v16}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->setEntries(Ljava/util/List;)V

    .line 341
    invoke-virtual {v13, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 342
    new-instance v17, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    invoke-direct/range {v17 .. v17}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;-><init>()V

    .line 343
    .local v17, "stsz":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;
    invoke-static/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->getSampleSizes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)[J

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->setSampleSizes([J)V

    .line 344
    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 345
    new-instance v14, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;

    invoke-direct {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;-><init>()V

    .line 346
    .local v14, "stco":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;
    const/4 v4, 0x1

    new-array v2, v4, [J

    .line 347
    .local v2, "chunkOffsets":[J
    const/4 v4, 0x0

    aput-wide p1, v2, v4

    .line 348
    invoke-virtual {v14, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->setChunkOffsets([J)V

    .line 349
    invoke-virtual {v13, v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 350
    return-object v13
.end method

.method protected static createStsd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 1
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p1, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 363
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v0

    invoke-virtual {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 364
    return-void
.end method

.method protected static createTkhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 4
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 302
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;-><init>()V

    .line 303
    .local v0, "tkhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setVersion(I)V

    .line 304
    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    .line 306
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getGroup()I

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setAlternateGroup(I)V

    .line 307
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getCreationTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 308
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setDuration(J)V

    .line 309
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getHeight()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setHeight(D)V

    .line 310
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getWidth()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setWidth(D)V

    .line 311
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getLayer()I

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setLayer(I)V

    .line 312
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 313
    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setTrackId(J)V

    .line 314
    instance-of v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    if-eqz v1, :cond_0

    .line 315
    const-wide/16 v2, 0x2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setTrackId(J)V

    .line 317
    :cond_0
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getVolume()F

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setVolume(F)V

    .line 318
    return-object v0
.end method

.method protected static createTrak(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;JJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 5
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p1, "firstChunkOffset"    # J
    .param p3, "timeOffset"    # J

    .prologue
    .line 272
    const-string v2, "MoovBuilder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating Track "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;-><init>()V

    .line 274
    .local v1, "trackBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    invoke-static {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createTkhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 275
    invoke-static {p0, p3, p4}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createEdts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    .line 276
    .local v0, "edts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 279
    :cond_0
    invoke-static {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createMdia(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;J)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 280
    return-object v1
.end method

.method protected static getSampleSizes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)[J
    .locals 6
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 354
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v2

    .line 355
    .local v2, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v1, v3, [J

    .line 356
    .local v1, "sampleSizes":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 357
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v4

    aput-wide v4, v1, v0

    .line 356
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 359
    :cond_0
    return-object v1
.end method
