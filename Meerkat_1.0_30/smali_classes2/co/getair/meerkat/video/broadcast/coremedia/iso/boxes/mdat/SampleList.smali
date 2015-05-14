.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;
.super Ljava/util/AbstractList;
.source "SampleList.java"


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
.field samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;)V
    .locals 4
    .param p1, "trackBox"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    .param p2, "additionalFragments"    # [Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 24
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v0

    .line 26
    .local v0, "topLevel":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v1

    const-class v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;

    invoke-interface {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 27
    array-length v1, p2

    if-lez v1, :cond_0

    .line 28
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "The TrackBox comes from a standard MP4 file. Only use the additionalFragments param if you are dealing with ( fragmented MP4 files AND additional fragments in standalone files )"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 30
    :cond_0
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;

    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v2

    invoke-direct {v1, v2, v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/DefaultMp4SampleList;-><init>(JLco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;->samples:Ljava/util/List;

    .line 34
    :goto_0
    return-void

    .line 32
    :cond_1
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;

    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v2

    invoke-direct {v1, v2, v3, v0, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/samples/FragmentedMp4SampleList;-><init>(JLco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;)V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;->samples:Ljava/util/List;

    goto :goto_0
.end method


# virtual methods
.method public get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;->samples:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 18
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/mdat/SampleList;->samples:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
