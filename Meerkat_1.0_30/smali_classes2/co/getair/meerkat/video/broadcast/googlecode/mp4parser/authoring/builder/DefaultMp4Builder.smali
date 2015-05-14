.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;
.super Ljava/lang/Object;
.source "DefaultMp4Builder.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/Mp4Builder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static LOG:Ljava/util/logging/Logger;


# instance fields
.field chunkOffsetBoxes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;",
            ">;"
        }
    .end annotation
.end field

.field private intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

.field sampleAuxiliaryInformationOffsetsBoxes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;",
            ">;"
        }
    .end annotation
.end field

.field track2Sample:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;>;"
        }
    .end annotation
.end field

.field track2SampleSizes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[J>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->$assertionsDisabled:Z

    .line 88
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    return-void

    .line 86
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->chunkOffsetBoxes:Ljava/util/Set;

    .line 90
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->sampleAuxiliaryInformationOffsetsBoxes:Ljava/util/Set;

    .line 91
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2Sample:Ljava/util/HashMap;

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2SampleSizes:Ljava/util/HashMap;

    .line 651
    return-void
.end method

.method public static gcd(JJ)J
    .locals 2
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    .line 112
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_0

    .line 115
    .end local p0    # "a":J
    :goto_0
    return-wide p0

    .restart local p0    # "a":J
    :cond_0
    rem-long v0, p0, p2

    invoke-static {p2, p3, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->gcd(JJ)J

    move-result-wide p0

    goto :goto_0
.end method

.method private static sum([I)J
    .locals 7
    .param p0, "ls"    # [I

    .prologue
    .line 96
    const-wide/16 v2, 0x0

    .line 97
    .local v2, "rc":J
    array-length v5, p0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_0

    aget v6, p0, v4

    int-to-long v0, v6

    .line 98
    .local v0, "l":J
    add-long/2addr v2, v0

    .line 97
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 100
    .end local v0    # "l":J
    :cond_0
    return-wide v2
.end method

.method private static sum([J)J
    .locals 6
    .param p0, "ls"    # [J

    .prologue
    .line 104
    const-wide/16 v2, 0x0

    .line 105
    .local v2, "rc":J
    array-length v5, p0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_0

    aget-wide v0, p0, v4

    .line 106
    .local v0, "l":J
    add-long/2addr v2, v0

    .line 105
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 108
    .end local v0    # "l":J
    :cond_0
    return-wide v2
.end method


# virtual methods
.method public build(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .locals 32
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 126
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    if-nez v5, :cond_0

    .line 127
    new-instance v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/TwoSecondIntersectionFinder;

    const/4 v6, 0x2

    move-object/from16 v0, p1

    invoke-direct {v5, v0, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/TwoSecondIntersectionFinder;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;I)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    .line 129
    :cond_0
    sget-object v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Creating movie "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 130
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 132
    .local v29, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface/range {v29 .. v29}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v25

    .line 133
    .local v25, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->putSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/List;)Ljava/util/List;

    .line 134
    invoke-interface/range {v25 .. v25}, Ljava/util/List;->size()I

    move-result v6

    new-array v0, v6, [J

    move-object/from16 v26, v0

    .line 135
    .local v26, "sizes":[J
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    move-object/from16 v0, v26

    array-length v6, v0

    if-ge v15, v6, :cond_1

    .line 136
    move-object/from16 v0, v25

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 137
    .local v11, "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v30

    aput-wide v30, v26, v15

    .line 135
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 139
    .end local v11    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :cond_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2SampleSizes:Ljava/util/HashMap;

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 143
    .end local v15    # "i":I
    .end local v25    # "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    .end local v26    # "sizes":[J
    .end local v29    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_2
    new-instance v18, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;

    invoke-direct/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;-><init>()V

    .line 145
    .local v18, "isoFile":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;
    invoke-virtual/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createFileTypeBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 147
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 148
    .local v7, "chunks":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[I>;"
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 149
    .restart local v29    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->getChunkSizes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)[I

    move-result-object v6

    move-object/from16 v0, v29

    invoke-interface {v7, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 151
    .end local v29    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createMovieBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    move-result-object v19

    .line 152
    .local v19, "moov":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual/range {v18 .. v19}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 153
    const-string v5, "trak/mdia/minf/stbl/stsz"

    move-object/from16 v0, v19

    invoke-static {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPaths(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;Ljava/lang/String;)Ljava/util/List;

    move-result-object v28

    .line 155
    .local v28, "stszs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;>;"
    const-wide/16 v8, 0x0

    .line 156
    .local v8, "contentSize":J
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    .line 157
    .local v27, "stsz":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;
    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->getSampleSizes()[J

    move-result-object v6

    invoke-static {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->sum([J)J

    move-result-wide v30

    add-long v8, v8, v30

    .line 159
    goto :goto_3

    .line 161
    .end local v27    # "stsz":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;
    :cond_4
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;

    const/4 v10, 0x0

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;JLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$1;)V

    .line 162
    .local v4, "mdat":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 168
    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->getDataOffset()J

    move-result-wide v16

    .line 169
    .local v16, "dataOffset":J
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->chunkOffsetBoxes:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;

    .line 170
    .local v14, "chunkOffsetBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;
    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->getChunkOffsets()[J

    move-result-object v22

    .line 171
    .local v22, "offsets":[J
    const/4 v15, 0x0

    .restart local v15    # "i":I
    :goto_4
    move-object/from16 v0, v22

    array-length v6, v0

    if-ge v15, v6, :cond_5

    .line 172
    aget-wide v30, v22, v15

    add-long v30, v30, v16

    aput-wide v30, v22, v15

    .line 171
    add-int/lit8 v15, v15, 0x1

    goto :goto_4

    .line 175
    .end local v14    # "chunkOffsetBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;
    .end local v15    # "i":I
    .end local v22    # "offsets":[J
    :cond_6
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->sampleAuxiliaryInformationOffsetsBoxes:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    .line 176
    .local v23, "saio":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getSize()J

    move-result-wide v20

    .line 177
    .local v20, "offset":J
    const-wide/16 v30, 0x2c

    add-long v20, v20, v30

    .line 179
    move-object/from16 v11, v23

    .local v11, "current":Ljava/lang/Object;
    :goto_6
    move-object v5, v11

    .line 182
    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v12

    .local v12, "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    move-object v5, v12

    .line 184
    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 185
    .local v13, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    if-ne v13, v11, :cond_8

    .line 191
    .end local v13    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_7
    instance-of v5, v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-nez v5, :cond_b

    .line 193
    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getOffsets()[J

    move-result-object v24

    .line 194
    .local v24, "saioOffsets":[J
    const/4 v15, 0x0

    .restart local v15    # "i":I
    :goto_8
    move-object/from16 v0, v24

    array-length v5, v0

    if-ge v15, v5, :cond_9

    .line 195
    aget-wide v30, v24, v15

    add-long v30, v30, v20

    aput-wide v30, v24, v15

    .line 194
    add-int/lit8 v15, v15, 0x1

    goto :goto_8

    .line 188
    .end local v15    # "i":I
    .end local v24    # "saioOffsets":[J
    .restart local v13    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_8
    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v30

    add-long v20, v20, v30

    .line 189
    goto :goto_7

    .line 198
    .end local v13    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .restart local v15    # "i":I
    .restart local v24    # "saioOffsets":[J
    :cond_9
    invoke-virtual/range {v23 .. v24}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->setOffsets([J)V

    goto :goto_5

    .line 202
    .end local v11    # "current":Ljava/lang/Object;
    .end local v12    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .end local v15    # "i":I
    .end local v20    # "offset":J
    .end local v23    # "saio":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    .end local v24    # "saioOffsets":[J
    :cond_a
    return-object v18

    .restart local v11    # "current":Ljava/lang/Object;
    .restart local v12    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .restart local v20    # "offset":J
    .restart local v23    # "saio":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    :cond_b
    move-object v11, v12

    .local v11, "b":Ljava/lang/Object;
    goto :goto_6
.end method

.method protected createCencBoxes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;[I)V
    .locals 16
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    .param p3, "chunkSizes"    # [I

    .prologue
    .line 451
    new-instance v10, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-direct {v10}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;-><init>()V

    .line 453
    .local v10, "saiz":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;
    const-string v14, "cenc"

    invoke-virtual {v10, v14}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setAuxInfoType(Ljava/lang/String;)V

    .line 454
    const/4 v14, 0x1

    invoke-virtual {v10, v14}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setFlags(I)V

    .line 455
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->getSampleEncryptionEntries()Ljava/util/List;

    move-result-object v11

    .line 456
    .local v11, "sampleEncryptionEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->hasSubSampleEncryption()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 457
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v14

    new-array v13, v14, [S

    .line 458
    .local v13, "sizes":[S
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v14, v13

    if-ge v2, v14, :cond_0

    .line 459
    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->getSize()I

    move-result v14

    int-to-short v14, v14

    aput-short v14, v13, v2

    .line 458
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 461
    :cond_0
    invoke-virtual {v10, v13}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setSampleInfoSizes([S)V

    .line 467
    .end local v2    # "i":I
    .end local v13    # "sizes":[S
    :goto_1
    new-instance v9, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;-><init>()V

    .line 468
    .local v9, "saio":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    new-instance v12, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;

    invoke-direct {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;-><init>()V

    .line 469
    .local v12, "senc":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->hasSubSampleEncryption()Z

    move-result v14

    invoke-virtual {v12, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;->setSubSampleEncryption(Z)V

    .line 470
    invoke-virtual {v12, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;->setEntries(Ljava/util/List;)V

    .line 472
    invoke-virtual {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;->getOffsetToFirstIV()I

    move-result v14

    int-to-long v6, v14

    .line 473
    .local v6, "offset":J
    const/4 v3, 0x0

    .line 474
    .local v3, "index":I
    move-object/from16 v0, p3

    array-length v14, v0

    new-array v8, v14, [J

    .line 477
    .local v8, "offsets":[J
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    move-object/from16 v0, p3

    array-length v14, v0

    if-ge v2, v14, :cond_3

    .line 478
    aput-wide v6, v8, v2

    .line 479
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_3
    aget v14, p3, v2

    if-ge v5, v14, :cond_2

    .line 480
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "index":I
    .local v4, "index":I
    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->getSize()I

    move-result v14

    int-to-long v14, v14

    add-long/2addr v6, v14

    .line 479
    add-int/lit8 v5, v5, 0x1

    move v3, v4

    .end local v4    # "index":I
    .restart local v3    # "index":I
    goto :goto_3

    .line 463
    .end local v2    # "i":I
    .end local v3    # "index":I
    .end local v5    # "j":I
    .end local v6    # "offset":J
    .end local v8    # "offsets":[J
    .end local v9    # "saio":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    .end local v12    # "senc":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;
    :cond_1
    const/16 v14, 0x8

    invoke-virtual {v10, v14}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setDefaultSampleInfoSize(I)V

    .line 464
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->getSamples()Ljava/util/List;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    invoke-virtual {v10, v14}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setSampleCount(I)V

    goto :goto_1

    .line 477
    .restart local v2    # "i":I
    .restart local v3    # "index":I
    .restart local v5    # "j":I
    .restart local v6    # "offset":J
    .restart local v8    # "offsets":[J
    .restart local v9    # "saio":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    .restart local v12    # "senc":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 483
    .end local v5    # "j":I
    :cond_3
    invoke-virtual {v9, v8}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->setOffsets([J)V

    .line 485
    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 486
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 487
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 488
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->sampleAuxiliaryInformationOffsetsBoxes:Ljava/util/Set;

    invoke-interface {v14, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 491
    return-void
.end method

.method protected createCtts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 3
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 586
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v0

    .line 587
    .local v0, "compositionTimeToSampleEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 588
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;-><init>()V

    .line 589
    .local v1, "ctts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;->setEntries(Ljava/util/List;)V

    .line 590
    invoke-virtual {p2, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 592
    .end local v1    # "ctts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;
    :cond_0
    return-void
.end method

.method protected createEdts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 12
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 365
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 366
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;-><init>()V

    .line 367
    .local v1, "elst":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;->setVersion(I)V

    .line 368
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 370
    .local v10, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;>;"
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    .line 371
    .local v8, "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;

    .line 372
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getSegmentDuration()D

    move-result-wide v2

    invoke-virtual {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTimescale()J

    move-result-wide v4

    long-to-double v4, v4

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    .line 373
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getMediaTime()J

    move-result-wide v4

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    mul-long/2addr v4, v6

    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getTimeScale()J

    move-result-wide v6

    div-long/2addr v4, v6

    .line 374
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getMediaRate()D

    move-result-wide v6

    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;JJD)V

    .line 371
    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 377
    .end local v8    # "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    :cond_0
    invoke-virtual {v1, v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;->setEntries(Ljava/util/List;)V

    .line 378
    new-instance v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;-><init>()V

    .line 379
    .local v9, "edts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;
    invoke-virtual {v9, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 382
    .end local v1    # "elst":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;
    .end local v9    # "edts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;
    .end local v10    # "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;>;"
    :goto_1
    return-object v9

    :cond_1
    const/4 v9, 0x0

    goto :goto_1
.end method

.method protected createFileTypeBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;
    .locals 6
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 210
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 212
    .local v0, "minorBrands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "isom"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    const-string v1, "iso2"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    const-string v1, "avc1"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;

    const-string v2, "isom"

    const-wide/16 v4, 0x0

    invoke-direct {v1, v2, v4, v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;-><init>(Ljava/lang/String;JLjava/util/List;)V

    return-object v1
.end method

.method protected createMovieBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;
    .locals 24
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[I>;)",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;"
        }
    .end annotation

    .prologue
    .line 220
    .local p2, "chunks":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[I>;"
    new-instance v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;-><init>()V

    .line 221
    .local v9, "movieBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;
    new-instance v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;

    invoke-direct {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;-><init>()V

    .line 223
    .local v12, "mvhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;
    new-instance v19, Ljava/util/Date;

    invoke-direct/range {v19 .. v19}, Ljava/util/Date;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 224
    new-instance v19, Ljava/util/Date;

    invoke-direct/range {v19 .. v19}, Ljava/util/Date;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 225
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getMatrix()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;)V

    .line 226
    invoke-virtual/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->getTimescale(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)J

    move-result-wide v10

    .line 227
    .local v10, "movieTimeScale":J
    const-wide/16 v6, 0x0

    .line 229
    .local v6, "duration":J
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_0
    :goto_0
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_4

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 230
    .local v13, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    const-wide/16 v16, 0x0

    .line 232
    .local v16, "tracksDuration":J
    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v20

    if-eqz v20, :cond_1

    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_2

    .line 233
    :cond_1
    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v20

    invoke-virtual/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->getTimescale(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)J

    move-result-wide v22

    mul-long v20, v20, v22

    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v22

    div-long v16, v20, v22

    .line 243
    :goto_1
    cmp-long v20, v16, v6

    if-lez v20, :cond_0

    .line 244
    move-wide/from16 v6, v16

    goto :goto_0

    .line 235
    :cond_2
    const-wide/16 v4, 0x0

    .line 236
    .local v4, "d":J
    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_2
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_3

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    .line 237
    .local v8, "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getSegmentDuration()D

    move-result-wide v22

    move-wide/from16 v0, v22

    double-to-long v0, v0

    move-wide/from16 v22, v0

    add-long v4, v4, v22

    .line 238
    goto :goto_2

    .line 239
    .end local v8    # "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    :cond_3
    invoke-virtual/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->getTimescale(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)J

    move-result-wide v20

    mul-long v16, v4, v20

    goto :goto_1

    .line 250
    .end local v4    # "d":J
    .end local v13    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .end local v16    # "tracksDuration":J
    :cond_4
    invoke-virtual {v12, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setDuration(J)V

    .line 251
    invoke-virtual {v12, v10, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setTimescale(J)V

    .line 253
    const-wide/16 v14, 0x0

    .line 254
    .local v14, "nextTrackId":J
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_3
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_6

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 255
    .restart local v13    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v20

    cmp-long v20, v14, v20

    if-gez v20, :cond_5

    invoke-interface {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v14

    .line 256
    :cond_5
    goto :goto_3

    .line 257
    .end local v13    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_6
    const-wide/16 v20, 0x1

    add-long v14, v14, v20

    invoke-virtual {v12, v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setNextTrackId(J)V

    .line 259
    invoke-virtual {v9, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 260
    invoke-virtual/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_4
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_7

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 261
    .restart local v13    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v13, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createTrackBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_4

    .line 264
    .end local v13    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_7
    invoke-virtual/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createUdta(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v18

    .line 265
    .local v18, "udta":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    if-eqz v18, :cond_8

    .line 266
    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 268
    :cond_8
    return-object v9
.end method

.method protected createSdtp(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 2
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 569
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 570
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;-><init>()V

    .line 571
    .local v0, "sdtp":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;->setEntries(Ljava/util/List;)V

    .line 572
    invoke-virtual {p2, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 574
    .end local v0    # "sdtp":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;
    :cond_0
    return-void
.end method

.method protected createStbl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 26
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[I>;)",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;"
        }
    .end annotation

    .prologue
    .line 387
    .local p3, "chunks":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[I>;"
    new-instance v18, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    invoke-direct/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;-><init>()V

    .line 389
    .local v18, "stbl":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createStsd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 390
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createStts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 391
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createCtts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 392
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createStss(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 393
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createSdtp(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 394
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, v18

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createStsc(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/Map;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 395
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createStsz(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 396
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createStco(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 398
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 399
    .local v8, "groupEntryFamilies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;>;"
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleGroups()Ljava/util/Map;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_0
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_1

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Map$Entry;

    .line 400
    .local v15, "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;[J>;"
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    invoke-virtual/range {v20 .. v20}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->getType()Ljava/lang/String;

    move-result-object v19

    .line 401
    .local v19, "type":Ljava/lang/String;
    move-object/from16 v0, v19

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 402
    .local v6, "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    if-nez v6, :cond_0

    .line 403
    new-instance v6, Ljava/util/ArrayList;

    .end local v6    # "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 404
    .restart local v6    # "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    move-object/from16 v0, v19

    invoke-interface {v8, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    :cond_0
    invoke-interface {v15}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 408
    .end local v6    # "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    .end local v15    # "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;[J>;"
    .end local v19    # "type":Ljava/lang/String;
    :cond_1
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_1
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_7

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Map$Entry;

    .line 409
    .local v16, "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;>;"
    new-instance v17, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;

    invoke-direct/range {v17 .. v17}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;-><init>()V

    .line 410
    .local v17, "sgdb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
    invoke-interface/range {v16 .. v16}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 411
    .restart local v19    # "type":Ljava/lang/String;
    invoke-interface/range {v16 .. v16}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/List;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->setGroupEntries(Ljava/util/List;)V

    .line 412
    new-instance v14, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;

    invoke-direct {v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;-><init>()V

    .line 413
    .local v14, "sbgp":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;
    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->setGroupingType(Ljava/lang/String;)V

    .line 414
    const/4 v12, 0x0

    .line 415
    .local v12, "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_2
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    move/from16 v0, v20

    if-ge v9, v0, :cond_6

    .line 416
    const/4 v10, 0x0

    .line 417
    .local v10, "index":I
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_3
    invoke-interface/range {v16 .. v16}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/List;

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_3

    .line 418
    invoke-interface/range {v16 .. v16}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/List;

    move-object/from16 v0, v20

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    .line 419
    .local v7, "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleGroups()Ljava/util/Map;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [J

    .line 420
    .local v13, "sampleNums":[J
    int-to-long v0, v9

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    invoke-static {v13, v0, v1}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v20

    if-ltz v20, :cond_2

    .line 421
    add-int/lit8 v10, v11, 0x1

    .line 417
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 424
    .end local v7    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    .end local v13    # "sampleNums":[J
    :cond_3
    if-eqz v12, :cond_4

    invoke-virtual {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getGroupDescriptionIndex()I

    move-result v20

    move/from16 v0, v20

    if-eq v0, v10, :cond_5

    .line 425
    :cond_4
    new-instance v12, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;

    .end local v12    # "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    const-wide/16 v22, 0x1

    move-wide/from16 v0, v22

    invoke-direct {v12, v0, v1, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;-><init>(JI)V

    .line 426
    .restart local v12    # "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->getEntries()Ljava/util/List;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    :goto_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 428
    :cond_5
    invoke-virtual {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getSampleCount()J

    move-result-wide v22

    const-wide/16 v24, 0x1

    add-long v22, v22, v24

    move-wide/from16 v0, v22

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->setSampleCount(J)V

    goto :goto_4

    .line 431
    .end local v10    # "index":I
    .end local v11    # "j":I
    :cond_6
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 432
    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_1

    .line 435
    .end local v9    # "i":I
    .end local v12    # "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    .end local v14    # "sbgp":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;
    .end local v16    # "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;>;"
    .end local v17    # "sgdb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
    .end local v19    # "type":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p1

    instance-of v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;

    move/from16 v20, v0

    if-eqz v20, :cond_8

    move-object/from16 v20, p1

    .line 436
    check-cast v20, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;

    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [I

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createCencBoxes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;[I)V

    .line 438
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createSubs(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 440
    return-object v18
.end method

.method protected createStco(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 20
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p4, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[I>;",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;",
            ")V"
        }
    .end annotation

    .prologue
    .line 498
    .local p3, "chunks":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[I>;"
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [I

    .line 504
    .local v12, "tracksChunkSizes":[I
    new-instance v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;-><init>()V

    .line 505
    .local v9, "stco":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->chunkOffsetBoxes:Ljava/util/Set;

    invoke-interface {v13, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 506
    const-wide/16 v10, 0x0

    .line 507
    .local v10, "offset":J
    array-length v13, v12

    new-array v2, v13, [J

    .line 509
    .local v2, "chunkOffset":[J
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    sget-object v14, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 510
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Calculating chunk offsets for track_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 514
    :cond_0
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v13, v12

    if-ge v5, v13, :cond_7

    .line 518
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    sget-object v14, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 519
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Calculating chunk offsets for track_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " chunk "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/logging/Logger;->finer(Ljava/lang/String;)V

    .line 521
    :cond_1
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 522
    .local v4, "current":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    sget-object v15, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v13, v15}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 523
    sget-object v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->LOG:Ljava/util/logging/Logger;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Adding offsets of track_"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-interface {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v16

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 525
    :cond_3
    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 526
    .local v3, "chunkSizes":[I
    const-wide/16 v6, 0x0

    .line 527
    .local v6, "firstSampleOfChunk":J
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    if-ge v8, v5, :cond_4

    .line 528
    aget v13, v3, v8

    int-to-long v0, v13

    move-wide/from16 v16, v0

    add-long v6, v6, v16

    .line 527
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 530
    :cond_4
    move-object/from16 v0, p1

    if-ne v4, v0, :cond_5

    .line 531
    aput-wide v10, v2, v5

    .line 533
    :cond_5
    invoke-static {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v8

    :goto_2
    int-to-long v0, v8

    move-wide/from16 v16, v0

    aget v13, v3, v5

    int-to-long v0, v13

    move-wide/from16 v18, v0

    add-long v18, v18, v6

    cmp-long v13, v16, v18

    if-gez v13, :cond_2

    .line 534
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2SampleSizes:Ljava/util/HashMap;

    invoke-virtual {v13, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [J

    aget-wide v16, v13, v8

    add-long v10, v10, v16

    .line 533
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 514
    .end local v3    # "chunkSizes":[I
    .end local v4    # "current":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .end local v6    # "firstSampleOfChunk":J
    .end local v8    # "j":I
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 538
    :cond_7
    invoke-virtual {v9, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;->setChunkOffsets([J)V

    .line 539
    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 540
    return-void
.end method

.method protected createStsc(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/Map;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 15
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p3, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[I>;",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;",
            ")V"
        }
    .end annotation

    .prologue
    .line 550
    .local p2, "chunks":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[I>;"
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [I

    .line 552
    .local v13, "tracksChunkSizes":[I
    new-instance v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    invoke-direct {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;-><init>()V

    .line 553
    .local v12, "stsc":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {v12, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->setEntries(Ljava/util/List;)V

    .line 554
    const-wide/32 v10, -0x80000000

    .line 555
    .local v10, "lastChunkSize":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v13

    if-ge v2, v3, :cond_1

    .line 560
    aget v3, v13, v2

    int-to-long v4, v3

    cmp-long v3, v10, v4

    if-eqz v3, :cond_0

    .line 561
    invoke-virtual {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;->getEntries()Ljava/util/List;

    move-result-object v14

    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;

    add-int/lit8 v4, v2, 0x1

    int-to-long v4, v4

    aget v6, v13, v2

    int-to-long v6, v6

    const-wide/16 v8, 0x1

    invoke-direct/range {v3 .. v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox$Entry;-><init>(JJJ)V

    invoke-interface {v14, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 562
    aget v3, v13, v2

    int-to-long v10, v3

    .line 555
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 565
    :cond_1
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 566
    return-void
.end method

.method protected createStsd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 1
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 494
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v0

    invoke-virtual {p2, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 495
    return-void
.end method

.method protected createStss(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 3
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 577
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v1

    .line 578
    .local v1, "syncSamples":[J
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    .line 579
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;-><init>()V

    .line 580
    .local v0, "stss":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->setSampleNumber([J)V

    .line 581
    invoke-virtual {p2, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 583
    .end local v0    # "stss":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;
    :cond_0
    return-void
.end method

.method protected createStsz(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 2
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 543
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;-><init>()V

    .line 544
    .local v0, "stsz":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2SampleSizes:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;->setSampleSizes([J)V

    .line 546
    invoke-virtual {p2, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 547
    return-void
.end method

.method protected createStts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 12
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    const-wide/16 v10, 0x1

    .line 595
    const/4 v3, 0x0

    .line 596
    .local v3, "lastEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 598
    .local v2, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v7, :cond_1

    aget-wide v0, v6, v5

    .line 599
    .local v0, "delta":J
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getDelta()J

    move-result-wide v8

    cmp-long v8, v8, v0

    if-nez v8, :cond_0

    .line 600
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v8

    add-long/2addr v8, v10

    invoke-virtual {v3, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->setCount(J)V

    .line 598
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 602
    :cond_0
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    .end local v3    # "lastEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    invoke-direct {v3, v10, v11, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    .line 603
    .restart local v3    # "lastEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 607
    .end local v0    # "delta":J
    :cond_1
    new-instance v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;-><init>()V

    .line 608
    .local v4, "stts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;
    invoke-virtual {v4, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->setEntries(Ljava/util/List;)V

    .line 609
    invoke-virtual {p2, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 610
    return-void
.end method

.method protected createSubs(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 1
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 444
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 445
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-result-object v0

    invoke-virtual {p2, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 447
    :cond_0
    return-void
.end method

.method protected createTrackBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    .locals 20
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[I>;)",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;"
        }
    .end annotation

    .prologue
    .line 284
    .local p3, "chunks":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[I>;"
    new-instance v13, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-direct {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;-><init>()V

    .line 285
    .local v13, "trackBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    new-instance v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    invoke-direct {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;-><init>()V

    .line 287
    .local v12, "tkhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setEnabled(Z)V

    .line 288
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setInMovie(Z)V

    .line 289
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setInPreview(Z)V

    .line 290
    const/4 v15, 0x1

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setInPoster(Z)V

    .line 291
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getMatrix()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    move-result-object v15

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;)V

    .line 293
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getGroup()I

    move-result v15

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setAlternateGroup(I)V

    .line 294
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getCreationTime()Ljava/util/Date;

    move-result-object v15

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 296
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v15

    if-eqz v15, :cond_0

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 297
    :cond_0
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v16

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->getTimescale(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)J

    move-result-wide v18

    mul-long v16, v16, v18

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v18

    div-long v16, v16, v18

    move-wide/from16 v0, v16

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setDuration(J)V

    .line 307
    :goto_0
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getHeight()D

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setHeight(D)V

    .line 308
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getWidth()D

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setWidth(D)V

    .line 309
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getLayer()I

    move-result v15

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setLayer(I)V

    .line 310
    new-instance v15, Ljava/util/Date;

    invoke-direct {v15}, Ljava/util/Date;-><init>()V

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 311
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setTrackId(J)V

    .line 312
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getVolume()F

    move-result v15

    invoke-virtual {v12, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setVolume(F)V

    .line 314
    invoke-virtual {v13, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 316
    invoke-virtual/range {p0 .. p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createEdts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v15

    invoke-virtual {v13, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 318
    new-instance v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;-><init>()V

    .line 319
    .local v9, "mdia":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;
    invoke-virtual {v13, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 320
    new-instance v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;

    invoke-direct {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;-><init>()V

    .line 321
    .local v8, "mdhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getCreationTime()Ljava/util/Date;

    move-result-object v15

    invoke-virtual {v8, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 322
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v8, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setDuration(J)V

    .line 323
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v8, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setTimescale(J)V

    .line 324
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getLanguage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setLanguage(Ljava/lang/String;)V

    .line 325
    invoke-virtual {v9, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 326
    new-instance v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;

    invoke-direct {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;-><init>()V

    .line 327
    .local v7, "hdlr":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;
    invoke-virtual {v9, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 329
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v7, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;->setHandlerType(Ljava/lang/String;)V

    .line 331
    new-instance v10, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;

    invoke-direct {v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;-><init>()V

    .line 332
    .local v10, "minf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v15

    const-string v16, "vide"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 333
    new-instance v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;-><init>()V

    invoke-virtual {v10, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 348
    :cond_1
    :goto_1
    new-instance v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;-><init>()V

    .line 349
    .local v4, "dinf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;

    invoke-direct {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;-><init>()V

    .line 350
    .local v5, "dref":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;
    invoke-virtual {v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 351
    new-instance v14, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;

    invoke-direct {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;-><init>()V

    .line 352
    .local v14, "url":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;->setFlags(I)V

    .line 353
    invoke-virtual {v5, v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 354
    invoke-virtual {v10, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 357
    invoke-virtual/range {p0 .. p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->createStbl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v11

    .line 358
    .local v11, "stbl":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual {v10, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 359
    invoke-virtual {v9, v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 361
    return-object v13

    .line 299
    .end local v4    # "dinf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;
    .end local v5    # "dref":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;
    .end local v7    # "hdlr":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;
    .end local v8    # "mdhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;
    .end local v9    # "mdia":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;
    .end local v10    # "minf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;
    .end local v11    # "stbl":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v14    # "url":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;
    :cond_2
    const-wide/16 v2, 0x0

    .line 300
    .local v2, "d":J
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_3

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    .line 301
    .local v6, "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getSegmentDuration()D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-long v0, v0

    move-wide/from16 v16, v0

    add-long v2, v2, v16

    .line 302
    goto :goto_2

    .line 303
    .end local v6    # "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    :cond_3
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v15

    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v16

    mul-long v16, v16, v2

    move-wide/from16 v0, v16

    invoke-virtual {v12, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setDuration(J)V

    goto/16 :goto_0

    .line 334
    .end local v2    # "d":J
    .restart local v7    # "hdlr":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;
    .restart local v8    # "mdhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;
    .restart local v9    # "mdia":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;
    .restart local v10    # "minf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;
    :cond_4
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v15

    const-string v16, "soun"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 335
    new-instance v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;-><init>()V

    invoke-virtual {v10, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_1

    .line 336
    :cond_5
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v15

    const-string v16, "text"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 337
    new-instance v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;-><init>()V

    invoke-virtual {v10, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_1

    .line 338
    :cond_6
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v15

    const-string v16, "subt"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 339
    new-instance v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;-><init>()V

    invoke-virtual {v10, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_1

    .line 340
    :cond_7
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v15

    const-string v16, "hint"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 341
    new-instance v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;-><init>()V

    invoke-virtual {v10, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_1

    .line 342
    :cond_8
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v15

    const-string v16, "sbtl"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 343
    new-instance v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;-><init>()V

    invoke-virtual {v10, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_1
.end method

.method protected createUdta(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 1
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 279
    const/4 v0, 0x0

    return-object v0
.end method

.method getChunkSizes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)[I
    .locals 12
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    const-wide/16 v10, 0x1

    .line 621
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    invoke-interface {v5, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;->sampleNumbers(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)[J

    move-result-object v4

    .line 622
    .local v4, "referenceChunkStarts":[J
    array-length v5, v4

    new-array v0, v5, [I

    .line 625
    .local v0, "chunkSizes":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v4

    if-ge v1, v5, :cond_1

    .line 626
    aget-wide v8, v4, v1

    sub-long v6, v8, v10

    .line 628
    .local v6, "start":J
    array-length v5, v4

    add-int/lit8 v8, v1, 0x1

    if-ne v5, v8, :cond_0

    .line 629
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    int-to-long v2, v5

    .line 634
    .local v2, "end":J
    :goto_1
    sub-long v8, v2, v6

    invoke-static {v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    aput v5, v0, v1

    .line 625
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 631
    .end local v2    # "end":J
    :cond_0
    add-int/lit8 v5, v1, 0x1

    aget-wide v8, v4, v5

    sub-long v2, v8, v10

    .restart local v2    # "end":J
    goto :goto_1

    .line 637
    .end local v2    # "end":J
    .end local v6    # "start":J
    :cond_1
    sget-boolean v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->$assertionsDisabled:Z

    if-nez v5, :cond_2

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2Sample:Ljava/util/HashMap;

    invoke-virtual {v5, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    int-to-long v8, v5

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->sum([I)J

    move-result-wide v10

    cmp-long v5, v8, v10

    if-eqz v5, :cond_2

    new-instance v5, Ljava/lang/AssertionError;

    const-string v8, "The number of samples and the sum of all chunk lengths must be equal"

    invoke-direct {v5, v8}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 638
    :cond_2
    return-object v0
.end method

.method public getTimescale(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)J
    .locals 6
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 644
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v0

    .line 645
    .local v0, "timescale":J
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 646
    .local v2, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v4

    invoke-static {v4, v5, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->gcd(JJ)J

    move-result-wide v0

    .line 647
    goto :goto_0

    .line 648
    .end local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    return-wide v0
.end method

.method protected putSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 206
    .local p2, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2Sample:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public setIntersectionFinder(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;)V
    .locals 0
    .param p1, "intersectionFinder"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    .prologue
    .line 119
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    .line 120
    return-void
.end method
