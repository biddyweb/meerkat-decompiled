.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;
.super Ljava/util/AbstractList;
.source "FragmentedMp4SampleList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
        ">;"
    }
.end annotation


# instance fields
.field private allTrafs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;",
            ">;"
        }
    .end annotation
.end field

.field private firstSamples:[I

.field fragments:[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

.field private sampleCache:[Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field private size_:I

.field topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

.field trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

.field trex:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

.field private trunDataCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>(JLco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;)V
    .locals 11
    .param p1, "track"    # J
    .param p3, "topLevel"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .param p4, "fragments"    # [Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    .prologue
    const/4 v4, 0x0

    .line 43
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 34
    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    .line 35
    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trex:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    .line 38
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trunDataCache:Ljava/util/Map;

    .line 41
    const/4 v4, -0x1

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->size_:I

    .line 44
    iput-object p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .line 45
    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->fragments:[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    .line 46
    const-string v4, "moov[0]/trak"

    invoke-static {p3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPaths(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 47
    .local v2, "tbs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    .line 48
    .local v1, "tb":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v6

    cmp-long v5, v6, p1

    if-nez v5, :cond_0

    .line 49
    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    goto :goto_0

    .line 52
    .end local v1    # "tb":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    :cond_1
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    if-nez v4, :cond_2

    .line 53
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "This MP4 does not contain track "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 56
    :cond_2
    const-string v4, "moov[0]/mvex[0]/trex"

    invoke-static {p3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPaths(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 57
    .local v3, "trexs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    .line 58
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->getTrackId()J

    move-result-wide v6

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-nez v5, :cond_3

    .line 59
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trex:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    goto :goto_1

    .line 62
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    :cond_4
    const-class v4, Ljava/lang/ref/SoftReference;

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->size()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/ref/SoftReference;

    check-cast v4, [Ljava/lang/ref/SoftReference;

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->sampleCache:[Ljava/lang/ref/SoftReference;

    .line 63
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->initAllFragments()Ljava/util/List;

    .line 64
    return-void
.end method

.method private getTrafSize(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)I
    .locals 6
    .param p1, "traf"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 100
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes()Ljava/util/List;

    move-result-object v1

    .line 101
    .local v1, "boxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    const/4 v3, 0x0

    .line 102
    .local v3, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 103
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 104
    .local v0, "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    if-eqz v4, :cond_0

    .line 105
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getSampleCount()J

    move-result-wide v4

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v4

    add-int/2addr v3, v4

    .line 102
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    :cond_1
    return v3
.end method

.method private initAllFragments()Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->allTrafs:Ljava/util/List;

    if-eqz v8, :cond_1

    .line 68
    move-object/from16 v0, p0

    iget-object v7, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->allTrafs:Ljava/util/List;

    .line 96
    :cond_0
    return-object v7

    .line 70
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .local v7, "trafs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;>;"
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    const-class v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    invoke-interface {v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 72
    .local v5, "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    const-class v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-virtual {v5, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_3
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 73
    .local v6, "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v10

    invoke-virtual {v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getTrackId()J

    move-result-wide v10

    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v12

    invoke-virtual {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-nez v10, :cond_3

    .line 74
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 78
    .end local v5    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    .end local v6    # "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    :cond_4
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->fragments:[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    if-eqz v8, :cond_8

    .line 79
    move-object/from16 v0, p0

    iget-object v9, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->fragments:[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    array-length v10, v9

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v10, :cond_8

    aget-object v3, v9, v8

    .line 80
    .local v3, "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    const-class v11, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    invoke-virtual {v3, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_5
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 81
    .restart local v5    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    const-class v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-virtual {v5, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_6
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 82
    .restart local v6    # "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v13

    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getTrackId()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v13

    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-nez v13, :cond_6

    .line 83
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 79
    .end local v5    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    .end local v6    # "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 89
    .end local v3    # "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    :cond_8
    move-object/from16 v0, p0

    iput-object v7, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->allTrafs:Ljava/util/List;

    .line 90
    const/4 v2, 0x1

    .line 91
    .local v2, "firstSample":I
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->allTrafs:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [I

    move-object/from16 v0, p0

    iput-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->firstSamples:[I

    .line 92
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->allTrafs:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v4, v8, :cond_0

    .line 93
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->firstSamples:[I

    aput v2, v8, v4

    .line 94
    move-object/from16 v0, p0

    iget-object v8, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->allTrafs:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->getTrafSize(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)I

    move-result v8

    add-int/2addr v2, v8

    .line 92
    add-int/lit8 v4, v4, 0x1

    goto :goto_3
.end method


# virtual methods
.method public get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 38
    .param p1, "index"    # I

    .prologue
    .line 115
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->sampleCache:[Ljava/lang/ref/SoftReference;

    aget-object v5, v5, p1

    if-eqz v5, :cond_0

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->sampleCache:[Ljava/lang/ref/SoftReference;

    aget-object v5, v5, p1

    invoke-virtual {v5}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .local v12, "cachedSample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    if-eqz v12, :cond_0

    .line 221
    .end local v12    # "cachedSample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    :goto_0
    return-object v12

    .line 120
    :cond_0
    add-int/lit8 v26, p1, 0x1

    .line 121
    .local v26, "targetIndex":I
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->firstSamples:[I

    array-length v5, v5

    add-int/lit8 v18, v5, -0x1

    .line 122
    .local v18, "j":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->firstSamples:[I

    aget v5, v5, v18

    sub-int v5, v26, v5

    if-gez v5, :cond_1

    .line 123
    add-int/lit8 v18, v18, -0x1

    goto :goto_1

    .line 125
    :cond_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->allTrafs:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 127
    .local v28, "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->firstSamples:[I

    aget v5, v5, v18

    sub-int v23, v26, v5

    .line 128
    .local v23, "sampleIndexWithInTraf":I
    const/16 v22, 0x0

    .line 129
    .local v22, "previousTrunsSize":I
    invoke-virtual/range {v28 .. v28}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v19

    check-cast v19, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 131
    .local v19, "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    invoke-virtual/range {v28 .. v28}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v33

    if-eqz v33, :cond_10

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 132
    .local v11, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v0, v11, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    move/from16 v33, v0

    if-eqz v33, :cond_2

    move-object/from16 v30, v11

    .line 133
    check-cast v30, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    .line 136
    .local v30, "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    invoke-virtual/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v33

    invoke-interface/range {v33 .. v33}, Ljava/util/List;->size()I

    move-result v33

    sub-int v34, v23, v22

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_3

    .line 137
    invoke-virtual/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v33

    invoke-interface/range {v33 .. v33}, Ljava/util/List;->size()I

    move-result v33

    add-int v22, v22, v33

    goto :goto_2

    .line 142
    :cond_3
    invoke-virtual/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v29

    .line 143
    .local v29, "trackRunEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;>;"
    invoke-virtual/range {v28 .. v28}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v27

    .line 144
    .local v27, "tfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
    invoke-virtual/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleSizePresent()Z

    move-result v24

    .line 145
    .local v24, "sampleSizePresent":Z
    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->hasDefaultSampleSize()Z

    move-result v16

    .line 146
    .local v16, "hasDefaultSampleSize":Z
    const-wide/16 v14, 0x0

    .line 147
    .local v14, "defaultSampleSize":J
    if-nez v24, :cond_4

    .line 148
    if-eqz v16, :cond_6

    .line 149
    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getDefaultSampleSize()J

    move-result-wide v14

    .line 158
    :cond_4
    :goto_3
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trunDataCache:Ljava/util/Map;

    move-object/from16 v0, v30

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/ref/SoftReference;

    .line 159
    .local v32, "trunDataRef":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Ljava/nio/ByteBuffer;>;"
    if-eqz v32, :cond_8

    invoke-virtual/range {v32 .. v32}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    move-object/from16 v31, v5

    .line 160
    .local v31, "trunData":Ljava/nio/ByteBuffer;
    :goto_4
    if-nez v31, :cond_c

    .line 161
    const-wide/16 v20, 0x0

    .line 163
    .local v20, "offset":J
    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->hasBaseDataOffset()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 164
    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getBaseDataOffset()J

    move-result-wide v34

    add-long v20, v20, v34

    .line 165
    invoke-virtual/range {v19 .. v19}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v10

    .line 170
    .local v10, "base":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    :goto_5
    invoke-virtual/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isDataOffsetPresent()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 171
    invoke-virtual/range {v30 .. v30}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getDataOffset()I

    move-result v5

    int-to-long v0, v5

    move-wide/from16 v34, v0

    add-long v20, v20, v34

    .line 173
    :cond_5
    const/16 v25, 0x0

    .line 174
    .local v25, "size":I
    invoke-interface/range {v29 .. v29}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v33

    if-eqz v33, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .line 175
    .local v13, "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    if-eqz v24, :cond_a

    .line 176
    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v34, v0

    invoke-virtual {v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleSize()J

    move-result-wide v36

    add-long v34, v34, v36

    move-wide/from16 v0, v34

    long-to-int v0, v0

    move/from16 v25, v0

    goto :goto_6

    .line 151
    .end local v10    # "base":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .end local v13    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .end local v20    # "offset":J
    .end local v25    # "size":I
    .end local v31    # "trunData":Ljava/nio/ByteBuffer;
    .end local v32    # "trunDataRef":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Ljava/nio/ByteBuffer;>;"
    :cond_6
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trex:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    if-nez v5, :cond_7

    .line 152
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v33, "File doesn\'t contain trex box but track fragments aren\'t fully self contained. Cannot determine sample size."

    move-object/from16 v0, v33

    invoke-direct {v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 154
    :cond_7
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trex:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->getDefaultSampleSize()J

    move-result-wide v14

    goto :goto_3

    .line 159
    .restart local v32    # "trunDataRef":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Ljava/nio/ByteBuffer;>;"
    :cond_8
    const/16 v31, 0x0

    goto :goto_4

    .line 167
    .restart local v20    # "offset":J
    .restart local v31    # "trunData":Ljava/nio/ByteBuffer;
    :cond_9
    move-object/from16 v10, v19

    .restart local v10    # "base":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    goto :goto_5

    .line 178
    .restart local v13    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .restart local v25    # "size":I
    :cond_a
    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v34, v34, v14

    move-wide/from16 v0, v34

    long-to-int v0, v0

    move/from16 v25, v0

    goto :goto_6

    .line 182
    .end local v13    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    :cond_b
    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v34, v0

    :try_start_0
    move-wide/from16 v0, v20

    move-wide/from16 v2, v34

    invoke-interface {v10, v0, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getByteBuffer(JJ)Ljava/nio/ByteBuffer;

    move-result-object v31

    .line 183
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trunDataCache:Ljava/util/Map;

    new-instance v33, Ljava/lang/ref/SoftReference;

    move-object/from16 v0, v33

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    move-object/from16 v0, v30

    move-object/from16 v1, v33

    invoke-interface {v5, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    .end local v10    # "base":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .end local v20    # "offset":J
    .end local v25    # "size":I
    :cond_c
    const/16 v20, 0x0

    .line 190
    .local v20, "offset":I
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_7
    sub-int v5, v23, v22

    move/from16 v0, v17

    if-ge v0, v5, :cond_e

    .line 191
    if-eqz v24, :cond_d

    .line 192
    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v34, v0

    move-object/from16 v0, v29

    move/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleSize()J

    move-result-wide v36

    add-long v34, v34, v36

    move-wide/from16 v0, v34

    long-to-int v0, v0

    move/from16 v20, v0

    .line 190
    :goto_8
    add-int/lit8 v17, v17, 0x1

    goto :goto_7

    .line 184
    .end local v17    # "i":I
    .restart local v10    # "base":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .local v20, "offset":J
    .restart local v25    # "size":I
    :catch_0
    move-exception v13

    .line 185
    .local v13, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 194
    .end local v10    # "base":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .end local v13    # "e":Ljava/io/IOException;
    .end local v25    # "size":I
    .restart local v17    # "i":I
    .local v20, "offset":I
    :cond_d
    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v34, v0

    add-long v34, v34, v14

    move-wide/from16 v0, v34

    long-to-int v0, v0

    move/from16 v20, v0

    goto :goto_8

    .line 198
    :cond_e
    if-eqz v24, :cond_f

    .line 199
    sub-int v5, v23, v22

    move-object/from16 v0, v29

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleSize()J

    move-result-wide v6

    .line 204
    .local v6, "sampleSize":J
    :goto_9
    move-object/from16 v8, v31

    .line 205
    .local v8, "finalTrunData":Ljava/nio/ByteBuffer;
    move/from16 v9, v20

    .line 206
    .local v9, "finalOffset":I
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList$1;

    move-object/from16 v5, p0

    invoke-direct/range {v4 .. v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;JLjava/nio/ByteBuffer;I)V

    .line 220
    .local v4, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->sampleCache:[Ljava/lang/ref/SoftReference;

    new-instance v33, Ljava/lang/ref/SoftReference;

    move-object/from16 v0, v33

    invoke-direct {v0, v4}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    aput-object v33, v5, p1

    move-object v12, v4

    .line 221
    goto/16 :goto_0

    .line 201
    .end local v4    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .end local v6    # "sampleSize":J
    .end local v8    # "finalTrunData":Ljava/nio/ByteBuffer;
    .end local v9    # "finalOffset":I
    :cond_f
    move-wide v6, v14

    .restart local v6    # "sampleSize":J
    goto :goto_9

    .line 226
    .end local v6    # "sampleSize":J
    .end local v11    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v14    # "defaultSampleSize":J
    .end local v16    # "hasDefaultSampleSize":Z
    .end local v17    # "i":I
    .end local v20    # "offset":I
    .end local v24    # "sampleSizePresent":Z
    .end local v27    # "tfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
    .end local v29    # "trackRunEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;>;"
    .end local v30    # "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    .end local v31    # "trunData":Ljava/nio/ByteBuffer;
    .end local v32    # "trunDataRef":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Ljava/nio/ByteBuffer;>;"
    :cond_10
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v33, "Couldn\'t find sample in the traf I was looking"

    move-object/from16 v0, v33

    invoke-direct {v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 14

    .prologue
    .line 231
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->size_:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 232
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->size_:I

    .line 252
    :goto_0
    return v1

    .line 234
    :cond_0
    const/4 v1, 0x0

    .line 235
    .local v1, "i":I
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->topLevel:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    const-class v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    invoke-interface {v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 236
    .local v2, "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-virtual {v2, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 237
    .local v3, "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getTrackId()J

    move-result-wide v8

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v10

    cmp-long v4, v8, v10

    if-nez v4, :cond_2

    .line 238
    int-to-long v8, v1

    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    const/4 v7, 0x0

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getSampleCount()J

    move-result-wide v10

    add-long/2addr v8, v10

    long-to-int v1, v8

    goto :goto_1

    .line 242
    .end local v2    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    .end local v3    # "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    :cond_3
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->fragments:[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    array-length v7, v6

    const/4 v4, 0x0

    move v5, v4

    :goto_2
    if-ge v5, v7, :cond_7

    aget-object v0, v6, v5

    .line 243
    .local v0, "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 244
    .restart local v2    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-virtual {v2, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_5
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 245
    .restart local v3    # "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getTrackId()J

    move-result-wide v10

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->trackBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v12

    cmp-long v4, v10, v12

    if-nez v4, :cond_5

    .line 246
    int-to-long v10, v1

    const-class v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    const/4 v12, 0x0

    invoke-interface {v4, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getSampleCount()J

    move-result-wide v12

    add-long/2addr v10, v12

    long-to-int v1, v10

    goto :goto_3

    .line 242
    .end local v2    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    .end local v3    # "trackFragmentBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    :cond_6
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    goto :goto_2

    .line 251
    .end local v0    # "fragment":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    :cond_7
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;->size_:I

    goto/16 :goto_0
.end method
