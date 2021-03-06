.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;
.super Ljava/util/AbstractList;
.source "DefaultMp4SampleList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_MAP_SIZE:J = 0x10000000L


# instance fields
.field cache:[[Ljava/nio/ByteBuffer;

.field chunkNumsStartSampleNum:[I

.field chunkOffsets:[J

.field chunkSizes:[J

.field lastChunk:I

.field sampleOffsetsWithinChunks:[[J

.field ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

.field topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

.field trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;


# direct methods
.method public constructor <init>(JLco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
    .locals 33
    .param p1, "track"    # J
    .param p3, "topLevel"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 35
    invoke-direct/range {p0 .. p0}, Ljava/util/AbstractList;-><init>()V

    .line 25
    const/16 v25, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    .line 26
    const/16 v25, 0x0

    check-cast v25, [[Ljava/nio/ByteBuffer;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->cache:[[Ljava/nio/ByteBuffer;

    .line 32
    const/16 v25, 0x0

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    .line 36
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .line 37
    const-class v25, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v25

    const/16 v26, 0x0

    invoke-interface/range {v25 .. v26}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    .line 38
    .local v12, "movieBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;
    const-class v25, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    move-object/from16 v0, v25

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v24

    .line 40
    .local v24, "trackBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v25

    :cond_0
    :goto_0
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_1

    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    .line 41
    .local v21, "tb":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    invoke-virtual/range {v21 .. v21}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v26

    cmp-long v26, v26, p1

    if-nez v26, :cond_0

    .line 42
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    goto :goto_0

    .line 45
    .end local v21    # "tb":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    move-object/from16 v25, v0

    if-nez v25, :cond_2

    .line 46
    new-instance v25, Ljava/lang/RuntimeException;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "This MP4 does not contain track "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    move-object/from16 v0, v26

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 48
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getSampleTableBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getChunkOffsetBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ChunkOffsetBox;->getChunkOffsets()[J

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkOffsets:[J

    .line 49
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkOffsets:[J

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v0, v0, [J

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkSizes:[J

    .line 51
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkOffsets:[J

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v0, v0, [[Ljava/nio/ByteBuffer;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->cache:[[Ljava/nio/ByteBuffer;

    .line 52
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkOffsets:[J

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v0, v0, [[J

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->sampleOffsetsWithinChunks:[[J

    .line 53
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getSampleTableBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSampleSizeBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    .line 54
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getSampleTableBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSampleToChunkBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->getEntries()Ljava/util/List;

    move-result-object v19

    .line 55
    .local v19, "s2chunkEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v25

    move/from16 v0, v25

    new-array v0, v0, [Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    move-object/from16 v25, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    .line 58
    .local v9, "entries":[Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    const/16 v17, 0x0

    .line 59
    .local v17, "s2cIndex":I
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "s2cIndex":I
    .local v18, "s2cIndex":I
    aget-object v13, v9, v17

    .line 60
    .local v13, "next":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;
    const/4 v5, 0x0

    .line 61
    .local v5, "currentChunkNo":I
    const/4 v8, 0x0

    .line 63
    .local v8, "currentSamplePerChunk":I
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getFirstChunk()J

    move-result-wide v14

    .line 64
    .local v14, "nextFirstChunk":J
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSamplesPerChunk()J

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v16

    .line 66
    .local v16, "nextSamplePerChunk":I
    const/4 v7, 0x1

    .line 67
    .local v7, "currentSampleNo":I
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->size()I

    move-result v11

    .line 72
    .local v11, "lastSampleNo":I
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 73
    int-to-long v0, v5

    move-wide/from16 v26, v0

    cmp-long v25, v26, v14

    if-nez v25, :cond_a

    .line 74
    move/from16 v8, v16

    .line 75
    array-length v0, v9

    move/from16 v25, v0

    move/from16 v0, v25

    move/from16 v1, v18

    if-le v0, v1, :cond_4

    .line 76
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "s2cIndex":I
    .restart local v17    # "s2cIndex":I
    aget-object v13, v9, v18

    .line 77
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSamplesPerChunk()J

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v16

    .line 78
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getFirstChunk()J

    move-result-wide v14

    .line 84
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->sampleOffsetsWithinChunks:[[J

    move-object/from16 v25, v0

    add-int/lit8 v26, v5, -0x1

    new-array v0, v8, [J

    move-object/from16 v27, v0

    aput-object v27, v25, v26

    .line 86
    add-int/2addr v7, v8

    if-le v7, v11, :cond_9

    .line 87
    add-int/lit8 v25, v5, 0x1

    move/from16 v0, v25

    new-array v0, v0, [I

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    .line 89
    const/16 v17, 0x0

    .line 90
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "s2cIndex":I
    .restart local v18    # "s2cIndex":I
    aget-object v13, v9, v17

    .line 91
    const/4 v5, 0x0

    .line 92
    const/4 v8, 0x0

    .line 94
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getFirstChunk()J

    move-result-wide v14

    .line 95
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSamplesPerChunk()J

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v16

    .line 97
    const/4 v7, 0x1

    move/from16 v17, v18

    .line 99
    .end local v18    # "s2cIndex":I
    .restart local v17    # "s2cIndex":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    move-object/from16 v25, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "currentChunkNo":I
    .local v6, "currentChunkNo":I
    aput v7, v25, v5

    .line 100
    int-to-long v0, v6

    move-wide/from16 v26, v0

    cmp-long v25, v26, v14

    if-nez v25, :cond_3

    .line 101
    move/from16 v8, v16

    .line 102
    array-length v0, v9

    move/from16 v25, v0

    move/from16 v0, v25

    move/from16 v1, v17

    if-le v0, v1, :cond_5

    .line 103
    add-int/lit8 v18, v17, 0x1

    .end local v17    # "s2cIndex":I
    .restart local v18    # "s2cIndex":I
    aget-object v13, v9, v17

    .line 104
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getSamplesPerChunk()J

    move-result-wide v26

    invoke-static/range {v26 .. v27}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v16

    .line 105
    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;->getFirstChunk()J

    move-result-wide v14

    move/from16 v17, v18

    .line 112
    .end local v18    # "s2cIndex":I
    .restart local v17    # "s2cIndex":I
    :cond_3
    :goto_4
    add-int/2addr v7, v8

    if-le v7, v11, :cond_8

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    move-object/from16 v25, v0

    const v26, 0x7fffffff

    aput v26, v25, v6

    .line 115
    const/4 v5, 0x0

    .line 116
    .end local v6    # "currentChunkNo":I
    .restart local v5    # "currentChunkNo":I
    const-wide/16 v22, 0x0

    .line 117
    .local v22, "sampleSum":J
    const/4 v10, 0x1

    .local v10, "i":I
    :goto_5
    int-to-long v0, v10

    move-wide/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleCount()J

    move-result-wide v28

    cmp-long v25, v26, v28

    if-gtz v25, :cond_7

    .line 118
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    move-object/from16 v25, v0

    aget v25, v25, v5

    move/from16 v0, v25

    if-ne v10, v0, :cond_6

    .line 120
    add-int/lit8 v5, v5, 0x1

    .line 121
    const-wide/16 v22, 0x0

    goto :goto_6

    .line 80
    .end local v10    # "i":I
    .end local v17    # "s2cIndex":I
    .end local v22    # "sampleSum":J
    .restart local v18    # "s2cIndex":I
    :cond_4
    const/16 v16, -0x1

    .line 81
    const-wide v14, 0x7fffffffffffffffL

    move/from16 v17, v18

    .end local v18    # "s2cIndex":I
    .restart local v17    # "s2cIndex":I
    goto/16 :goto_2

    .line 107
    .end local v5    # "currentChunkNo":I
    .restart local v6    # "currentChunkNo":I
    :cond_5
    const/16 v16, -0x1

    .line 108
    const-wide v14, 0x7fffffffffffffffL

    goto :goto_4

    .line 123
    .end local v6    # "currentChunkNo":I
    .restart local v5    # "currentChunkNo":I
    .restart local v10    # "i":I
    .restart local v22    # "sampleSum":J
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkSizes:[J

    move-object/from16 v25, v0

    add-int/lit8 v26, v5, -0x1

    aget-wide v28, v25, v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-object/from16 v27, v0

    add-int/lit8 v30, v10, -0x1

    move-object/from16 v0, v27

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleSizeAtIndex(I)J

    move-result-wide v30

    add-long v28, v28, v30

    aput-wide v28, v25, v26

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->sampleOffsetsWithinChunks:[[J

    move-object/from16 v25, v0

    add-int/lit8 v26, v5, -0x1

    aget-object v20, v25, v26

    .line 125
    .local v20, "sampleOffsetsWithinChunkscurrentChunkNo":[J
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    move-object/from16 v25, v0

    add-int/lit8 v26, v5, -0x1

    aget v4, v25, v26

    .line 126
    .local v4, "chunkNumsStartSampleNumcurrentChunkNo":I
    sub-int v25, v10, v4

    aput-wide v22, v20, v25

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-object/from16 v25, v0

    add-int/lit8 v26, v10, -0x1

    invoke-virtual/range {v25 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleSizeAtIndex(I)J

    move-result-wide v26

    add-long v22, v22, v26

    .line 117
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 130
    .end local v4    # "chunkNumsStartSampleNumcurrentChunkNo":I
    .end local v20    # "sampleOffsetsWithinChunkscurrentChunkNo":[J
    :cond_7
    return-void

    .end local v5    # "currentChunkNo":I
    .end local v10    # "i":I
    .end local v22    # "sampleSum":J
    .restart local v6    # "currentChunkNo":I
    :cond_8
    move v5, v6

    .end local v6    # "currentChunkNo":I
    .restart local v5    # "currentChunkNo":I
    goto/16 :goto_3

    :cond_9
    move/from16 v18, v17

    .end local v17    # "s2cIndex":I
    .restart local v18    # "s2cIndex":I
    goto/16 :goto_1

    :cond_a
    move/from16 v17, v18

    .end local v18    # "s2cIndex":I
    .restart local v17    # "s2cIndex":I
    goto/16 :goto_2
.end method


# virtual methods
.method public get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 34
    .param p1, "index"    # I

    .prologue
    .line 160
    move/from16 v0, p1

    int-to-long v4, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleCount()J

    move-result-wide v28

    cmp-long v4, v4, v28

    if-ltz v4, :cond_0

    .line 161
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v4}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v4

    .line 164
    :cond_0
    invoke-virtual/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->getChunkForSample(I)I

    move-result v14

    .line 165
    .local v14, "chunkNumber":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    aget v4, v4, v14

    add-int/lit8 v15, v4, -0x1

    .line 166
    .local v15, "chunkStartSample":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkOffsets:[J

    int-to-long v0, v14

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    aget-wide v16, v4, v5

    .line 167
    .local v16, "chunkOffset":J
    sub-int v23, p1, v15

    .line 168
    .local v23, "sampleInChunk":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->sampleOffsetsWithinChunks:[[J

    int-to-long v0, v14

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    aget-object v26, v4, v5

    .line 169
    .local v26, "sampleOffsetsWithinChunk":[J
    aget-wide v24, v26, v23

    .line 172
    .local v24, "offsetWithInChunk":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->cache:[[Ljava/nio/ByteBuffer;

    int-to-long v0, v14

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    aget-object v13, v4, v5

    .line 173
    .local v13, "chunkBuffers":[Ljava/nio/ByteBuffer;
    if-nez v13, :cond_3

    .line 174
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .local v11, "_chunkBuffers":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    const-wide/16 v20, 0x0

    .line 177
    .local v20, "currentStart":J
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_0
    :try_start_0
    move-object/from16 v0, v26

    array-length v4, v0

    move/from16 v0, v22

    if-ge v0, v4, :cond_2

    .line 178
    aget-wide v4, v26, v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-object/from16 v27, v0

    add-int v28, v22, v15

    invoke-virtual/range {v27 .. v28}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleSizeAtIndex(I)J

    move-result-wide v28

    add-long v4, v4, v28

    sub-long v4, v4, v20

    const-wide/32 v28, 0x10000000

    cmp-long v4, v4, v28

    if-lez v4, :cond_1

    .line 179
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    add-long v28, v16, v20

    aget-wide v30, v26, v22

    sub-long v30, v30, v20

    move-wide/from16 v0, v28

    move-wide/from16 v2, v30

    invoke-interface {v4, v0, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getByteBuffer(JJ)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-interface {v11, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    aget-wide v20, v26, v22

    .line 177
    :cond_1
    add-int/lit8 v22, v22, 0x1

    goto :goto_0

    .line 185
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    add-long v28, v16, v20

    move-wide/from16 v0, v20

    neg-long v0, v0

    move-wide/from16 v30, v0

    move-object/from16 v0, v26

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    aget-wide v32, v26, v5

    add-long v30, v30, v32

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v27, v0

    add-int v27, v27, v15

    add-int/lit8 v27, v27, -0x1

    .line 187
    move/from16 v0, v27

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleSizeAtIndex(I)J

    move-result-wide v32

    add-long v30, v30, v32

    .line 185
    move-wide/from16 v0, v28

    move-wide/from16 v2, v30

    invoke-interface {v4, v0, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getByteBuffer(JJ)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-interface {v11, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/nio/ByteBuffer;

    invoke-interface {v11, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, [Ljava/nio/ByteBuffer;

    move-object v13, v0

    .line 189
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->cache:[[Ljava/nio/ByteBuffer;

    int-to-long v0, v14

    move-wide/from16 v28, v0

    invoke-static/range {v28 .. v29}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    aput-object v13, v4, v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    .end local v11    # "_chunkBuffers":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    .end local v20    # "currentStart":J
    .end local v22    # "i":I
    :cond_3
    const/16 v18, 0x0

    .line 197
    .local v18, "correctPartOfChunk":Ljava/nio/ByteBuffer;
    array-length v5, v13

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v5, :cond_4

    aget-object v12, v13, v4

    .line 198
    .local v12, "chunkBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->limit()I

    move-result v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v28, v0

    cmp-long v27, v24, v28

    if-gez v27, :cond_5

    .line 199
    move-object/from16 v18, v12

    .line 206
    .end local v12    # "chunkBuffer":Ljava/nio/ByteBuffer;
    :cond_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->ssb:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleSizeAtIndex(I)J

    move-result-wide v6

    .line 207
    .local v6, "sampleSize":J
    move-object/from16 v8, v18

    .line 208
    .local v8, "finalCorrectPartOfChunk":Ljava/nio/ByteBuffer;
    move-wide/from16 v9, v24

    .line 209
    .local v9, "finalOffsetWithInChunk":J
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;

    move-object/from16 v5, p0

    invoke-direct/range {v4 .. v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;JLjava/nio/ByteBuffer;J)V

    return-object v4

    .line 190
    .end local v6    # "sampleSize":J
    .end local v8    # "finalCorrectPartOfChunk":Ljava/nio/ByteBuffer;
    .end local v9    # "finalOffsetWithInChunk":J
    .end local v18    # "correctPartOfChunk":Ljava/nio/ByteBuffer;
    .restart local v11    # "_chunkBuffers":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    .restart local v20    # "currentStart":J
    .restart local v22    # "i":I
    :catch_0
    move-exception v19

    .line 191
    .local v19, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/IndexOutOfBoundsException;

    invoke-virtual/range {v19 .. v19}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 202
    .end local v11    # "_chunkBuffers":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    .end local v19    # "e":Ljava/io/IOException;
    .end local v20    # "currentStart":J
    .end local v22    # "i":I
    .restart local v12    # "chunkBuffer":Ljava/nio/ByteBuffer;
    .restart local v18    # "correctPartOfChunk":Ljava/nio/ByteBuffer;
    :cond_5
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->limit()I

    move-result v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v28, v0

    sub-long v24, v24, v28

    .line 197
    add-int/lit8 v4, v4, 0x1

    goto :goto_1
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v0

    return-object v0
.end method

.method declared-synchronized getChunkForSample(I)I
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 133
    monitor-enter p0

    add-int/lit8 v0, p1, 0x1

    .line 135
    .local v0, "sampleNum":I
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    aget v1, v1, v2

    if-lt v0, v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    add-int/lit8 v2, v2, 0x1

    aget v1, v1, v2

    if-ge v0, v1, :cond_0

    .line 136
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    :goto_0
    monitor-exit p0

    return v1

    .line 137
    :cond_0
    :try_start_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    aget v1, v1, v2

    if-ge v0, v1, :cond_2

    .line 140
    const/4 v1, 0x0

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    .line 142
    :goto_1
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    add-int/lit8 v2, v2, 0x1

    aget v1, v1, v2

    if-gt v1, v0, :cond_1

    .line 143
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 133
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 145
    :cond_1
    :try_start_2
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    goto :goto_0

    .line 148
    :cond_2
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    .line 150
    :goto_2
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->chunkNumsStartSampleNum:[I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    add-int/lit8 v2, v2, 0x1

    aget v1, v1, v2

    if-gt v1, v0, :cond_3

    .line 151
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I

    goto :goto_2

    .line 153
    :cond_3
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->lastChunk:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public size()I
    .locals 2

    .prologue
    .line 232
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getSampleTableBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    move-result-object v0

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSampleSizeBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    move-result-object v0

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleCount()J

    move-result-wide v0

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v0

    return v0
.end method
