.class public Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;
.super Ljava/lang/Object;
.source "ChunkBuilder.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ChunkBuilder"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFragment(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[BIJ)Ljava/util/List;
    .locals 1
    .param p0, "videoTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "videoDurations"    # [J
    .param p2, "audioTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p3, "parameterSets"    # [B
    .param p4, "index"    # I
    .param p5, "baseFileOffset"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;",
            "[J",
            "Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;",
            "[BIJ)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation

    .prologue
    .line 36
    invoke-static {p0, p2, p4, p5, p6}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createMoofMdat(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;IJ)Ljava/util/List;

    move-result-object v0

    .line 37
    .local v0, "fragmentBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    return-object v0
.end method

.method protected static createMdat(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 1
    .param p0, "videoTrack"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "audioTrack"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;

    .prologue
    .line 217
    new-instance v0, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder$1Mdat;-><init>(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;)V

    return-object v0
.end method

.method protected static createMfhd(ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V
    .locals 4
    .param p0, "sequenceNumber"    # I
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .prologue
    .line 161
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;-><init>()V

    .line 162
    .local v0, "mfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;
    int-to-long v2, p0

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->setSequenceNumber(J)V

    .line 163
    invoke-virtual {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 164
    return-void
.end method

.method protected static createMoof(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;IJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 1
    .param p0, "videoTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "audioTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p2, "sequence"    # I
    .param p3, "baseFileOffset"    # J

    .prologue
    .line 54
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;-><init>()V

    .line 55
    .local v0, "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    invoke-static {p2, v0}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createMfhd(ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V

    .line 56
    invoke-static {p0, p1, p3, p4, v0}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createTrafs(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;JLco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V

    .line 58
    return-object v0
.end method

.method protected static createMoofMdat(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;IJ)Ljava/util/List;
    .locals 7
    .param p0, "videoTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "audioTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p2, "index"    # I
    .param p3, "baseFileOffset"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;",
            "Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;",
            "IJ)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 45
    .local v2, "moofsMdats":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-static {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createMdat(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    .line 46
    .local v0, "mdat":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    const-wide/16 v4, 0x8

    add-long/2addr v4, p3

    invoke-static {p0, p1, p2, v4, v5}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createMoof(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;IJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    .line 47
    .local v1, "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    return-object v2
.end method

.method protected static createTfhd(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 4
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 150
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;-><init>()V

    .line 151
    .local v1, "tfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>()V

    .line 153
    .local v0, "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setDefaultSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V

    .line 154
    const-wide/16 v2, -0x1

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setBaseDataOffset(J)V

    .line 155
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getTrackId()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setTrackId(J)V

    .line 156
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setDefaultBaseIsMoof(Z)V

    .line 157
    invoke-virtual {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 158
    return-void
.end method

.method protected static createTrafs(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;JLco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V
    .locals 8
    .param p0, "videoTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "audioTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p2, "baseDataOffset"    # J
    .param p4, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .prologue
    const/4 v6, 0x0

    .line 63
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;-><init>()V

    .line 64
    .local v1, "trafVideo":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-static {p0, v1}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createTfhd(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    .line 65
    invoke-static {p0, v6, v1}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createTrun(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    .line 66
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v3

    const-wide/16 v4, 0x1

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setTrackId(J)V

    .line 68
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;-><init>()V

    .line 69
    .local v0, "trafAudio":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createTfhd(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    .line 70
    invoke-static {p1, v6, v0}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createTrun(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    .line 71
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v3

    const-wide/16 v4, 0x2

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setTrackId(J)V

    .line 73
    invoke-virtual {p4, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 74
    invoke-virtual {p4, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 75
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSize()I

    move-result v2

    .line 76
    .local v2, "videoChunkSize":I
    invoke-virtual {p4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getTrackFragmentHeaderBoxes()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    invoke-virtual {v3, p2, p3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setBaseDataOffset(J)V

    .line 77
    invoke-virtual {p4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getTrackFragmentHeaderBoxes()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    int-to-long v4, v2

    add-long/2addr v4, p2

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setBaseDataOffset(J)V

    .line 79
    return-void
.end method

.method protected static createTrun(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 16
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "mdatDataOffset"    # I
    .param p2, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 91
    new-instance v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    invoke-direct {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;-><init>()V

    .line 92
    .local v12, "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setVersion(I)V

    .line 93
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSampleSizes()[I

    move-result-object v10

    .line 95
    .local v10, "sampleSizes":[I
    move/from16 v0, p1

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setDataOffset(I)V

    .line 96
    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setDataOffsetPresent(Z)V

    .line 97
    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleDurationPresent(Z)V

    .line 98
    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleSizePresent(Z)V

    .line 99
    new-instance v2, Ljava/util/ArrayList;

    array-length v13, v10

    invoke-direct {v2, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 100
    .local v2, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;>;"
    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleCompositionTimeOffsetPresent(Z)V

    .line 101
    const/4 v9, 0x0

    .line 102
    .local v9, "sampleFlagsRequired":Z
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getIFrameIndexes()[I

    move-result-object v5

    .line 103
    .local v5, "iFramesIndexes":[I
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getTrackId()I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_0

    .line 104
    const/4 v9, 0x1

    .line 107
    :cond_0
    invoke-virtual {v12, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleFlagsPresent(Z)V

    .line 109
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getSampleDurations()[I

    move-result-object v8

    .line 110
    .local v8, "sampleDurations":[I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v13, v10

    if-ge v4, v13, :cond_6

    .line 111
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;-><init>()V

    .line 112
    .local v3, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    aget v13, v10, v4

    int-to-long v14, v13

    invoke-virtual {v3, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->setSampleSize(J)V

    .line 113
    if-eqz v9, :cond_3

    .line 114
    new-instance v11, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>()V

    .line 115
    .local v11, "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    const/4 v6, 0x0

    .line 116
    .local v6, "isIDR":Z
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;->getTrackId()I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_2

    .line 117
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_1
    array-length v13, v5

    if-ge v7, v13, :cond_1

    .line 118
    aget v13, v5, v7

    if-ne v13, v4, :cond_4

    .line 119
    const/4 v6, 0x1

    .line 123
    :cond_1
    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleHasRedundancy(I)V

    .line 124
    if-eqz v6, :cond_5

    .line 125
    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDifferenceSample(Z)V

    .line 126
    const/4 v13, 0x2

    invoke-virtual {v11, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleDependsOn(I)V

    .line 127
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDependedOn(I)V

    .line 135
    .end local v7    # "j":I
    :cond_2
    :goto_2
    invoke-virtual {v3, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->setSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V

    .line 139
    .end local v6    # "isIDR":Z
    .end local v11    # "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_3
    aget v13, v8, v4

    int-to-long v14, v13

    invoke-virtual {v3, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->setSampleDuration(J)V

    .line 141
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 117
    .restart local v6    # "isIDR":Z
    .restart local v7    # "j":I
    .restart local v11    # "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 129
    :cond_5
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDifferenceSample(Z)V

    .line 130
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleDependsOn(I)V

    .line 131
    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDependedOn(I)V

    goto :goto_2

    .line 144
    .end local v3    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .end local v6    # "isIDR":Z
    .end local v7    # "j":I
    .end local v11    # "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_6
    invoke-virtual {v12, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setEntries(Ljava/util/List;)V

    .line 146
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 147
    return-void
.end method

.method public static getChunkSize(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)I
    .locals 8
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 82
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v2

    .line 83
    .local v2, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    const/4 v0, 0x0

    .line 84
    .local v0, "chunkSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 85
    int-to-long v4, v0

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v6

    add-long/2addr v4, v6

    long-to-int v0, v4

    .line 84
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 87
    :cond_0
    return v0
.end method
