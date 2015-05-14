.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "Mp4TrackImpl.java"


# instance fields
.field private compositionTimeEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private decodingTimes:[J

.field fragments:[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

.field private handler:Ljava/lang/String;

.field private sampleDependencies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

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

.field private subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

.field private syncSamples:[J

.field trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

.field private trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method public varargs constructor <init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;)V
    .locals 56
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "trackBox"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    .param p3, "fragments"    # [Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    .prologue
    .line 80
    invoke-direct/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 65
    const/4 v3, 0x0

    new-array v3, v3, [J

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    .line 67
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 69
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    .line 81
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v46

    .line 82
    .local v46, "trackId":J
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {v3, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->samples:Ljava/util/List;

    .line 83
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getMediaBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->getMediaInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->getSampleTableBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    move-result-object v36

    .line 85
    .local v36, "stbl":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getMediaBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->getHandlerBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;->getHandlerType()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->handler:Ljava/lang/String;

    .line 87
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v2, "decodingTimeEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    .line 89
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleDependencies:Ljava/util/List;

    .line 91
    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getTimeToSampleBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->getEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 92
    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getCompositionTimeToSample()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 93
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getCompositionTimeToSample()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample;->getEntries()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 95
    :cond_0
    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSampleDependencyTypeBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 96
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleDependencies:Ljava/util/List;

    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSampleDependencyTypeBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox;->getEntries()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 98
    :cond_1
    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSyncSampleBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 99
    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSyncSampleBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SyncSampleBox;->getSampleNumber()[J

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    .line 101
    :cond_2
    const-string v3, "subs"

    move-object/from16 v0, v36

    invoke-static {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    .line 104
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v26, "movieFragmentBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;>;"
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v3

    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    invoke-interface {v3, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, v26

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 106
    move-object/from16 v0, p3

    array-length v4, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_3

    aget-object v18, p3, v3

    .line 107
    .local v18, "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    const-class v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-interface {v0, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 106
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 110
    .end local v18    # "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    :cond_3
    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 111
    const/16 v22, 0x0

    .line 112
    .local v22, "lastSubsSample":I
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v3

    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;

    invoke-interface {v3, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v24

    .line 113
    .local v24, "movieExtendsBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1b

    .line 114
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;

    .line 115
    .local v27, "mvex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;
    const-class v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v44

    .line 116
    .local v44, "trackExtendsBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;>;"
    invoke-interface/range {v44 .. v44}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    .line 117
    .local v49, "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    invoke-virtual/range {v49 .. v49}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->getTrackId()J

    move-result-wide v6

    cmp-long v3, v6, v46

    if-nez v3, :cond_5

    .line 118
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v3

    const-string v6, "/moof/traf/subs"

    invoke-static {v3, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPaths(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Ljava/util/List;

    move-result-object v39

    .line 119
    .local v39, "subss":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;>;"
    invoke-interface/range {v39 .. v39}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_6

    .line 120
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    .line 122
    :cond_6
    new-instance v40, Ljava/util/LinkedList;

    invoke-direct/range {v40 .. v40}, Ljava/util/LinkedList;-><init>()V

    .line 124
    .local v40, "syncSampleList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const-wide/16 v32, 0x1

    .line 125
    .local v32, "sampleNumber":J
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 126
    .local v25, "movieFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    const-class v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v48

    .line 127
    .local v48, "trafs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;>;"
    invoke-interface/range {v48 .. v48}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v45

    check-cast v45, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 128
    .local v45, "traf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-virtual/range {v45 .. v45}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getTrackId()J

    move-result-wide v8

    cmp-long v3, v8, v46

    if-nez v3, :cond_8

    .line 131
    const-string v3, "subs"

    move-object/from16 v0, v45

    invoke-static {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v38

    check-cast v38, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    .line 132
    .local v38, "subs":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    if-eqz v38, :cond_a

    .line 133
    move/from16 v0, v22

    int-to-long v8, v0

    sub-long v8, v32, v8

    const-wide/16 v10, 0x1

    sub-long v12, v8, v10

    .line 134
    .local v12, "difFromLastFragment":J
    invoke-virtual/range {v38 .. v38}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->getEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;

    .line 135
    .local v37, "subSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    new-instance v34, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;

    invoke-direct/range {v34 .. v34}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;-><init>()V

    .line 136
    .local v34, "se":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    invoke-virtual/range {v34 .. v34}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleEntries()Ljava/util/List;

    move-result-object v8

    invoke-virtual/range {v37 .. v37}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleEntries()Ljava/util/List;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 137
    const-wide/16 v8, 0x0

    cmp-long v8, v12, v8

    if-eqz v8, :cond_9

    .line 138
    invoke-virtual/range {v37 .. v37}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSampleDelta()J

    move-result-wide v8

    add-long/2addr v8, v12

    move-object/from16 v0, v34

    invoke-virtual {v0, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->setSampleDelta(J)V

    .line 139
    const-wide/16 v12, 0x0

    .line 143
    :goto_2
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->getEntries()Ljava/util/List;

    move-result-object v8

    move-object/from16 v0, v34

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 141
    :cond_9
    invoke-virtual/range {v37 .. v37}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSampleDelta()J

    move-result-wide v8

    move-object/from16 v0, v34

    invoke-virtual {v0, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->setSampleDelta(J)V

    goto :goto_2

    .line 147
    .end local v12    # "difFromLastFragment":J
    .end local v34    # "se":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    .end local v37    # "subSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    :cond_a
    const-class v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v51

    .line 148
    .local v51, "truns":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;>;"
    invoke-interface/range {v51 .. v51}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    .line 149
    .local v50, "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    invoke-virtual/range {v50 .. v50}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v42

    .line 150
    .local v42, "tfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
    const/16 v17, 0x1

    .line 151
    .local v17, "first":Z
    invoke-virtual/range {v50 .. v50}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .line 152
    .local v16, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    invoke-virtual/range {v50 .. v50}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleDurationPresent()Z

    move-result v3

    if-eqz v3, :cond_11

    .line 153
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_c

    .line 154
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getDelta()J

    move-result-wide v10

    invoke-virtual/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleDuration()J

    move-result-wide v52

    cmp-long v3, v10, v52

    if-eqz v3, :cond_10

    .line 155
    :cond_c
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    const-wide/16 v10, 0x1

    invoke-virtual/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleDuration()J

    move-result-wide v52

    move-wide/from16 v0, v52

    invoke-direct {v3, v10, v11, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    :goto_4
    invoke-virtual/range {v50 .. v50}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleCompositionTimeOffsetPresent()Z

    move-result v3

    if-eqz v3, :cond_e

    .line 169
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-eqz v3, :cond_d

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v10, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    .line 170
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getOffset()I

    move-result v3

    int-to-long v10, v3

    invoke-virtual/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleCompositionTimeOffset()J

    move-result-wide v52

    cmp-long v3, v10, v52

    if-eqz v3, :cond_13

    .line 171
    :cond_d
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    new-instance v10, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    const/4 v11, 0x1

    invoke-virtual/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleCompositionTimeOffset()J

    move-result-wide v52

    invoke-static/range {v52 .. v53}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v52

    move/from16 v0, v52

    invoke-direct {v10, v11, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;-><init>(II)V

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    :cond_e
    :goto_5
    invoke-virtual/range {v50 .. v50}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleFlagsPresent()Z

    move-result v3

    if-eqz v3, :cond_14

    .line 179
    invoke-virtual/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v30

    .line 191
    .local v30, "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :goto_6
    if-eqz v30, :cond_f

    invoke-virtual/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->isSampleIsDifferenceSample()Z

    move-result v3

    if-nez v3, :cond_f

    .line 193
    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v40

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    :cond_f
    const-wide/16 v10, 0x1

    add-long v32, v32, v10

    .line 196
    const/16 v17, 0x0

    .line 197
    goto/16 :goto_3

    .line 157
    .end local v30    # "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_10
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    .line 158
    .local v14, "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v10

    const-wide/16 v52, 0x1

    add-long v10, v10, v52

    invoke-virtual {v14, v10, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->setCount(J)V

    goto/16 :goto_4

    .line 161
    .end local v14    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    :cond_11
    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->hasDefaultSampleDuration()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 162
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    const-wide/16 v10, 0x1

    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getDefaultSampleDuration()J

    move-result-wide v52

    move-wide/from16 v0, v52

    invoke-direct {v3, v10, v11, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 164
    :cond_12
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    const-wide/16 v10, 0x1

    invoke-virtual/range {v49 .. v49}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->getDefaultSampleDuration()J

    move-result-wide v52

    move-wide/from16 v0, v52

    invoke-direct {v3, v10, v11, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 173
    :cond_13
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v10, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    .line 174
    .local v14, "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v14, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->setCount(I)V

    goto/16 :goto_5

    .line 181
    .end local v14    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    :cond_14
    if-eqz v17, :cond_15

    invoke-virtual/range {v50 .. v50}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isFirstSampleFlagsPresent()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 182
    invoke-virtual/range {v50 .. v50}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFirstSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v30

    .restart local v30    # "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    goto/16 :goto_6

    .line 184
    .end local v30    # "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_15
    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->hasDefaultSampleFlags()Z

    move-result v3

    if-eqz v3, :cond_16

    .line 185
    invoke-virtual/range {v42 .. v42}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getDefaultSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v30

    .restart local v30    # "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    goto/16 :goto_6

    .line 187
    .end local v30    # "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_16
    invoke-virtual/range {v49 .. v49}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->getDefaultSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v30

    .restart local v30    # "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    goto/16 :goto_6

    .line 203
    .end local v16    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .end local v17    # "first":Z
    .end local v25    # "movieFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    .end local v30    # "sampleFlags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .end local v38    # "subs":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .end local v42    # "tfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
    .end local v45    # "traf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    .end local v48    # "trafs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;>;"
    .end local v50    # "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    .end local v51    # "truns":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;>;"
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    move-object/from16 v29, v0

    .line 204
    .local v29, "oldSS":[J
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    array-length v3, v3

    invoke-interface/range {v40 .. v40}, Ljava/util/List;->size()I

    move-result v6

    add-int/2addr v3, v6

    new-array v3, v3, [J

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    .line 205
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    const/4 v7, 0x0

    move-object/from16 v0, v29

    array-length v8, v0

    move-object/from16 v0, v29

    invoke-static {v0, v3, v6, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 206
    invoke-interface/range {v40 .. v40}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .line 207
    .local v21, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v19, v0

    .line 208
    .local v19, "i":I
    :goto_7
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 209
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Ljava/lang/Long;

    .line 210
    .local v41, "syncSampleNumber":Ljava/lang/Long;
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    add-int/lit8 v20, v19, 0x1

    .end local v19    # "i":I
    .local v20, "i":I
    invoke-virtual/range {v41 .. v41}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    aput-wide v6, v3, v19

    move/from16 v19, v20

    .line 211
    .end local v20    # "i":I
    .restart local v19    # "i":I
    goto :goto_7

    .line 215
    .end local v19    # "i":I
    .end local v21    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    .end local v27    # "mvex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;
    .end local v29    # "oldSS":[J
    .end local v32    # "sampleNumber":J
    .end local v39    # "subss":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;>;"
    .end local v40    # "syncSampleList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v41    # "syncSampleNumber":Ljava/lang/Long;
    .end local v44    # "trackExtendsBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;>;"
    .end local v49    # "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    :cond_18
    new-instance v35, Ljava/util/ArrayList;

    invoke-direct/range {v35 .. v35}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v35, "sgpds":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;>;"
    new-instance v31, Ljava/util/ArrayList;

    invoke-direct/range {v31 .. v31}, Ljava/util/ArrayList;-><init>()V

    .line 217
    .local v31, "sbgps":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;>;"
    invoke-interface/range {v26 .. v26}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_19
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 218
    .restart local v25    # "movieFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1a
    :goto_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_19

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v45

    check-cast v45, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 219
    .restart local v45    # "traf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-virtual/range {v45 .. v45}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getTrackId()J

    move-result-wide v6

    cmp-long v5, v6, v46

    if-nez v5, :cond_1a

    .line 220
    const-string v5, "sgpd"

    move-object/from16 v0, v45

    invoke-static {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPaths(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    const-string v6, "sbgp"

    move-object/from16 v0, v45

    invoke-static {v0, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPaths(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleGroups:Ljava/util/Map;

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->getSampleGroups(Ljava/util/List;Ljava/util/List;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleGroups:Ljava/util/Map;

    goto :goto_8

    .line 225
    .end local v25    # "movieFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    .end local v31    # "sbgps":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;>;"
    .end local v35    # "sgpds":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;>;"
    .end local v45    # "traf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    :cond_1b
    const-class v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v3

    const-class v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;

    move-object/from16 v0, v36

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleGroups:Ljava/util/Map;

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->getSampleGroups(Ljava/util/List;Ljava/util/List;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleGroups:Ljava/util/Map;

    .line 228
    :cond_1c
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;->blowupTimeToSamples(Ljava/util/List;)[J

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->decodingTimes:[J

    .line 230
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getMediaBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->getMediaHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;

    move-result-object v23

    .line 231
    .local v23, "mdhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v43

    .line 233
    .local v43, "tkhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v43 .. v43}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTrackId(J)V

    .line 234
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->getCreationTime()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 235
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->getLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 237
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->getModificationTime()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 238
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->getTimescale()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 239
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v43 .. v43}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getHeight()D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setHeight(D)V

    .line 240
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v43 .. v43}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getWidth()D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setWidth(D)V

    .line 241
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v43 .. v43}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getLayer()I

    move-result v4

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLayer(I)V

    .line 242
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual/range {v43 .. v43}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getMatrix()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    move-result-object v4

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;)V

    .line 243
    const-string v3, "edts/elst"

    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v15

    check-cast v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;

    .line 244
    .local v15, "elst":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;
    const-string v3, "../mvhd"

    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v28

    check-cast v28, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;

    .line 245
    .local v28, "mvhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;
    if-eqz v15, :cond_1d

    .line 246
    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;->getEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v52

    :goto_9
    invoke-interface/range {v52 .. v52}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface/range {v52 .. v52}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;

    .line 247
    .local v14, "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->edits:Ljava/util/List;

    move-object/from16 v53, v0

    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;

    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;->getMediaTime()J

    move-result-wide v4

    invoke-virtual/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->getTimescale()J

    move-result-wide v6

    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;->getMediaRate()D

    move-result-wide v8

    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;->getSegmentDuration()J

    move-result-wide v10

    long-to-double v10, v10

    invoke-virtual/range {v28 .. v28}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getTimescale()J

    move-result-wide v54

    move-wide/from16 v0, v54

    long-to-double v0, v0

    move-wide/from16 v54, v0

    div-double v10, v10, v54

    invoke-direct/range {v3 .. v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;-><init>(JJDD)V

    move-object/from16 v0, v53

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 251
    .end local v14    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;
    :cond_1d
    return-void
.end method

.method private getSampleGroups(Ljava/util/List;Ljava/util/List;Ljava/util/Map;)Ljava/util/Map;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            "[J>;)",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            "[J>;"
        }
    .end annotation

    .prologue
    .line 255
    .local p1, "sgdbs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;>;"
    .local p2, "sbgps":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;>;"
    .local p3, "sampleGroups":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;[J>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;

    .line 256
    .local v10, "sgdb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
    const/4 v3, 0x0

    .line 257
    .local v3, "found":Z
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;

    .line 258
    .local v9, "sbgp":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;
    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->getGroupingType()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getGroupEntries()Ljava/util/List;

    move-result-object v11

    const/4 v15, 0x0

    invoke-interface {v11, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    invoke-virtual {v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->getType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v14, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 259
    const/4 v3, 0x1

    .line 260
    const/4 v7, 0x0

    .line 261
    .local v7, "sampleNum":I
    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->getEntries()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;

    .line 262
    .local v2, "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getGroupDescriptionIndex()I

    move-result v14

    if-lez v14, :cond_4

    .line 263
    invoke-virtual {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getGroupEntries()Ljava/util/List;

    move-result-object v14

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getGroupDescriptionIndex()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    .line 264
    .local v4, "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [J

    .line 265
    .local v8, "samples":[J
    if-nez v8, :cond_2

    .line 266
    const/4 v14, 0x0

    new-array v8, v14, [J

    .line 269
    :cond_2
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getSampleCount()J

    move-result-wide v14

    invoke-static {v14, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v14

    array-length v15, v8

    add-int/2addr v14, v15

    new-array v6, v14, [J

    .line 270
    .local v6, "nuSamples":[J
    const/4 v14, 0x0

    const/4 v15, 0x0

    array-length v0, v8

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v8, v14, v6, v15, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 271
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    int-to-long v14, v5

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getSampleCount()J

    move-result-wide v16

    cmp-long v14, v14, v16

    if-gez v14, :cond_3

    .line 272
    array-length v14, v8

    add-int/2addr v14, v5

    add-int v15, v7, v5

    int-to-long v0, v15

    move-wide/from16 v16, v0

    aput-wide v16, v6, v14

    .line 271
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 274
    :cond_3
    move-object/from16 v0, p3

    invoke-interface {v0, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    .end local v4    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    .end local v5    # "i":I
    .end local v6    # "nuSamples":[J
    .end local v8    # "samples":[J
    :cond_4
    int-to-long v14, v7

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getSampleCount()J

    move-result-wide v16

    add-long v14, v14, v16

    long-to-int v7, v14

    .line 278
    goto :goto_0

    .line 282
    .end local v2    # "entry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    .end local v7    # "sampleNum":I
    .end local v9    # "sbgp":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;
    :cond_5
    if-nez v3, :cond_0

    .line 283
    new-instance v12, Ljava/lang/RuntimeException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Could not find SampleToGroupBox for "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->getGroupEntries()Ljava/util/List;

    move-result-object v11

    const/4 v14, 0x0

    invoke-interface {v11, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    invoke-virtual {v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->getType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, "."

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v12, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 286
    .end local v3    # "found":Z
    .end local v10    # "sgdb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
    :cond_6
    return-object p3
.end method


# virtual methods
.method public close()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v0

    .line 291
    .local v0, "c":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    instance-of v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;

    if-eqz v2, :cond_0

    .line 292
    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;

    .end local v0    # "c":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->close()V

    .line 294
    :cond_0
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->fragments:[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v1, v3, v2

    .line 295
    .local v1, "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->close()V

    .line 294
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 299
    .end local v1    # "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    :cond_1
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
    .line 314
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->compositionTimeEntries:Ljava/util/List;

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->handler:Ljava/lang/String;

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
    .line 326
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleDependencies:Ljava/util/List;

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public declared-synchronized getSampleDurations()[J
    .locals 1

    .prologue
    .line 306
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->decodingTimes:[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 302
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 2

    .prologue
    .line 318
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    array-length v0, v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->samples:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 319
    const/4 v0, 0x0

    .line 321
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->syncSamples:[J

    goto :goto_0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method
