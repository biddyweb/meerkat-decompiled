.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;
.super Ljava/lang/Object;
.source "FragmentedMp4Builder.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/Mp4Builder;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final LOG:Ljava/util/logging/Logger;


# instance fields
.field protected intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 100
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->$assertionsDisabled:Z

    .line 101
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->LOG:Ljava/util/logging/Logger;

    return-void

    .line 100
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    return-void
.end method

.method private getTrackDuration(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)J
    .locals 4
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 794
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v0

    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTimescale()J

    move-result-wide v2

    mul-long/2addr v0, v2

    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v2

    div-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public build(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .locals 7
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 205
    sget-object v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->LOG:Ljava/util/logging/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Creating movie "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 206
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    if-nez v4, :cond_2

    .line 207
    const/4 v2, 0x0

    .line 208
    .local v2, "refTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 209
    .local v3, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v5

    const-string v6, "vide"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 210
    move-object v2, v3

    .line 214
    .end local v3    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_1
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;

    const/4 v5, -0x1

    invoke-direct {v4, p1, v2, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)V

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    .line 216
    .end local v2    # "refTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_2
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;-><init>()V

    .line 219
    .local v1, "isoFile":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createFtyp(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 221
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMoov(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 223
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMoofMdat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 224
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 226
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_3
    invoke-virtual {p0, p1, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMfra(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 228
    return-object v1
.end method

.method protected createDinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;
    .locals 4
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 895
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;-><init>()V

    .line 896
    .local v0, "dinf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;-><init>()V

    .line 897
    .local v1, "dref":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 898
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;-><init>()V

    .line 899
    .local v2, "url":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;->setFlags(I)V

    .line 900
    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataReferenceBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 901
    return-object v0
.end method

.method protected createEdts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 12
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 873
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 874
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;-><init>()V

    .line 875
    .local v1, "elst":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;->setVersion(I)V

    .line 876
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 878
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

    .line 879
    .local v8, "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;

    .line 880
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getSegmentDuration()D

    move-result-wide v2

    invoke-virtual {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTimescale()J

    move-result-wide v4

    long-to-double v4, v4

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    .line 881
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

    .line 882
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;->getMediaRate()D

    move-result-wide v6

    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;JJD)V

    .line 879
    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 885
    .end local v8    # "edit":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;
    :cond_0
    invoke-virtual {v1, v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;->setEntries(Ljava/util/List;)V

    .line 886
    new-instance v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;

    invoke-direct {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;-><init>()V

    .line 887
    .local v9, "edts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;
    invoke-virtual {v9, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 890
    .end local v1    # "elst":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox;
    .end local v9    # "edts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditBox;
    .end local v10    # "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/EditListBox$Entry;>;"
    :goto_1
    return-object v9

    :cond_1
    const/4 v9, 0x0

    goto :goto_1
.end method

.method protected createFragment(Ljava/util/List;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[JII)I
    .locals 8
    .param p2, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p3, "startSamples"    # [J
    .param p4, "cycle"    # I
    .param p5, "sequence"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[JII)I"
        }
    .end annotation

    .prologue
    .line 186
    .local p1, "moofsMdats":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    array-length v1, p3

    if-ge p4, v1, :cond_0

    .line 188
    aget-wide v2, p3, p4

    .line 190
    .local v2, "startSample":J
    add-int/lit8 v1, p4, 0x1

    array-length v6, p3

    if-ge v1, v6, :cond_1

    add-int/lit8 v1, p4, 0x1

    aget-wide v4, p3, v1

    .line 193
    .local v4, "endSample":J
    :goto_0
    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    move-object v1, p0

    move-object v6, p2

    move v7, p5

    .line 194
    invoke-virtual/range {v1 .. v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMoof(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    add-int/lit8 v0, p5, 0x1

    .end local p5    # "sequence":I
    .local v0, "sequence":I
    move-object v1, p0

    move-object v6, p2

    move v7, p5

    invoke-virtual/range {v1 .. v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMdat(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move p5, v0

    .line 198
    .end local v0    # "sequence":I
    .end local v2    # "startSample":J
    .end local v4    # "endSample":J
    .restart local p5    # "sequence":I
    :cond_0
    return p5

    .line 190
    .restart local v2    # "startSample":J
    :cond_1
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    int-to-long v4, v1

    goto :goto_0
.end method

.method public createFtyp(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 6
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 113
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 114
    .local v0, "minorBrands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "isom"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    const-string v1, "iso2"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    const-string v1, "avc1"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;

    const-string v2, "isom"

    const-wide/16 v4, 0x0

    invoke-direct {v1, v2, v4, v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;-><init>(Ljava/lang/String;JLjava/util/List;)V

    return-object v1
.end method

.method protected createMdat(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 9
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "i"    # I

    .prologue
    .line 283
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1Mdat;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)V

    return-object v0
.end method

.method protected createMdhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 4
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 798
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;-><init>()V

    .line 799
    .local v0, "mdhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getCreationTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 800
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 801
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setDuration(J)V

    .line 802
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setTimescale(J)V

    .line 803
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaHeaderBox;->setLanguage(Ljava/lang/String;)V

    .line 804
    return-object v0
.end method

.method protected createMdia(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 2
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 849
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;-><init>()V

    .line 850
    .local v0, "mdia":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;
    invoke-virtual {p0, p2, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMdhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 853
    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMdiaHdlr(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 856
    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 857
    return-object v0
.end method

.method protected createMdiaHdlr(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 2
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 843
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;-><init>()V

    .line 844
    .local v0, "hdlr":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HandlerBox;->setHandlerType(Ljava/lang/String;)V

    .line 845
    return-object v0
.end method

.method protected createMfhd(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V
    .locals 4
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "sequenceNumber"    # I
    .param p7, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .prologue
    .line 298
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;-><init>()V

    .line 299
    .local v0, "mfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;
    int-to-long v2, p6

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->setSequenceNumber(J)V

    .line 300
    invoke-virtual {p7, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 301
    return-void
.end method

.method protected createMfra(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 6
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "isoFile"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 718
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessBox;-><init>()V

    .line 719
    .local v0, "mfra":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessBox;
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

    .line 720
    .local v2, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-virtual {p0, v2, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTfra(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v4

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 723
    .end local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;-><init>()V

    .line 724
    .local v1, "mfro":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 725
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessBox;->getSize()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;->setMfraSize(J)V

    .line 726
    return-object v0
.end method

.method protected createMinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 3
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 823
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;-><init>()V

    .line 824
    .local v0, "minf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "vide"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 825
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 837
    :cond_0
    :goto_0
    invoke-virtual {p0, p2, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createDinf(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataInformationBox;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 838
    invoke-virtual {p0, p2, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createStbl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 839
    return-object v0

    .line 826
    :cond_1
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "soun"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 827
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 828
    :cond_2
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "text"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 829
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 830
    :cond_3
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "subt"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 831
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 832
    :cond_4
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "hint"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 833
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 834
    :cond_5
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sbtl"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 835
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MediaInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0
.end method

.method protected createMoof(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 9
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "sequenceNumber"    # I

    .prologue
    .line 570
    new-instance v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    invoke-direct {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;-><init>()V

    .local v8, "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move v7, p6

    .line 571
    invoke-virtual/range {v1 .. v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMfhd(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move v7, p6

    .line 572
    invoke-virtual/range {v1 .. v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTraf(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V

    .line 574
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getTrackRunBoxes()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    .line 575
    .local v0, "firstTrun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setDataOffset(I)V

    .line 576
    const-wide/16 v2, 0x8

    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    long-to-int v1, v2

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setDataOffset(I)V

    .line 578
    return-object v8
.end method

.method protected createMoofMdat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Ljava/util/List;
    .locals 11
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;",
            ")",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation

    .prologue
    .line 159
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 160
    .local v1, "moofsMdats":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 161
    .local v6, "intersectionMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[J>;"
    const/4 v8, 0x0

    .line 162
    .local v8, "maxNumberOfFragments":I
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 163
    .local v2, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    iget-object v10, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    invoke-interface {v10, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;->sampleNumbers(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)[J

    move-result-object v7

    .line 164
    .local v7, "intersects":[J
    invoke-virtual {v6, v2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    array-length v10, v7

    invoke-static {v8, v10}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 166
    goto :goto_0

    .line 169
    .end local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .end local v7    # "intersects":[J
    :cond_0
    const/4 v5, 0x1

    .line 172
    .local v5, "sequence":I
    const/4 v4, 0x0

    .local v4, "cycle":I
    :goto_1
    if-ge v4, v8, :cond_2

    .line 174
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, v4, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->sortTracksInSequence(Ljava/util/List;ILjava/util/Map;)Ljava/util/List;

    move-result-object v9

    .line 176
    .local v9, "sortedTracks":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 177
    .restart local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [J

    .local v3, "startSamples":[J
    move-object v0, p0

    .line 178
    invoke-virtual/range {v0 .. v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createFragment(Ljava/util/List;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[JII)I

    move-result v5

    .line 179
    goto :goto_2

    .line 172
    .end local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .end local v3    # "startSamples":[J
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 181
    .end local v9    # "sortedTracks":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;>;"
    :cond_2
    return-object v1
.end method

.method protected createMoov(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 4
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 616
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;-><init>()V

    .line 618
    .local v0, "movieBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMvhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 619
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 620
    .local v1, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-virtual {p0, v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTrak(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v3

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_0

    .line 622
    .end local v1    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_0
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMvex(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 625
    return-object v0
.end method

.method protected createMvex(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 8
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 756
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;-><init>()V

    .line 757
    .local v1, "mvex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;-><init>()V

    .line 758
    .local v0, "mved":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->setVersion(I)V

    .line 759
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 760
    .local v2, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-direct {p0, p1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getTrackDuration(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)J

    move-result-wide v4

    .line 761
    .local v4, "trackDuration":J
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->getFragmentDuration()J

    move-result-wide v6

    cmp-long v6, v6, v4

    if-gez v6, :cond_0

    .line 762
    invoke-virtual {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->setFragmentDuration(J)V

    goto :goto_0

    .line 765
    .end local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .end local v4    # "trackDuration":J
    :cond_1
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 767
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 768
    .restart local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-virtual {p0, p1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTrex(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v6

    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto :goto_1

    .line 770
    .end local v2    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_2
    return-object v1
.end method

.method protected createMvhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 10
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 588
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;-><init>()V

    .line 589
    .local v2, "mvhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setVersion(I)V

    .line 590
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getDate()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v2, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 591
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getDate()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v2, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 592
    const-wide/16 v6, 0x0

    invoke-virtual {v2, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setDuration(J)V

    .line 593
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTimescale()J

    move-result-wide v0

    .line 594
    .local v0, "movieTimeScale":J
    invoke-virtual {v2, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setTimescale(J)V

    .line 596
    const-wide/16 v4, 0x0

    .line 597
    .local v4, "nextTrackId":J
    invoke-virtual {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 598
    .local v3, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v7

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v8

    cmp-long v7, v4, v8

    if-gez v7, :cond_0

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v7

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v4

    .line 599
    :cond_0
    goto :goto_0

    .line 600
    .end local v3    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_1
    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->setNextTrackId(J)V

    .line 601
    return-object v2
.end method

.method protected createSaio(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 12
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;
    .param p6, "sequenceNumber"    # I
    .param p7, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 368
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v8

    const-string v9, "enc.[0]/sinf[0]/schm[0]"

    invoke-static {v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;

    .line 370
    .local v7, "schm":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
    new-instance v6, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    invoke-direct {v6}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;-><init>()V

    .line 371
    .local v6, "saio":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    move-object/from16 v0, p7

    invoke-virtual {v0, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 372
    sget-boolean v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->$assertionsDisabled:Z

    if-nez v8, :cond_0

    const-class v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    move-object/from16 v0, p7

    invoke-virtual {v0, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-eq v8, v9, :cond_0

    new-instance v8, Ljava/lang/AssertionError;

    const-string v9, "Don\'t know how to deal with multiple Track Run Boxes when encrypting"

    invoke-direct {v8, v9}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v8

    .line 373
    :cond_0
    const-string v8, "cenc"

    invoke-virtual {v6, v8}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->setAuxInfoType(Ljava/lang/String;)V

    .line 374
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->setFlags(I)V

    .line 375
    const-wide/16 v4, 0x0

    .line 376
    .local v4, "offset":J
    const-wide/16 v8, 0x8

    add-long/2addr v4, v8

    .line 377
    invoke-virtual/range {p7 .. p7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 378
    .local v2, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v9, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;

    if-eqz v9, :cond_3

    .line 379
    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;

    .end local v2    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;->getOffsetToFirstIV()I

    move-result v8

    int-to-long v8, v8

    add-long/2addr v4, v8

    .line 385
    :cond_1
    invoke-virtual/range {p7 .. p7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .line 386
    .local v3, "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    const-wide/16 v8, 0x10

    add-long/2addr v4, v8

    .line 387
    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 388
    .restart local v2    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    move-object/from16 v0, p7

    if-ne v2, v0, :cond_4

    .line 396
    .end local v2    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_2
    const/4 v8, 0x1

    new-array v8, v8, [J

    const/4 v9, 0x0

    aput-wide v4, v8, v9

    invoke-virtual {v6, v8}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->setOffsets([J)V

    .line 398
    return-void

    .line 382
    .end local v3    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    .restart local v2    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_3
    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v10

    add-long/2addr v4, v10

    .line 384
    goto :goto_0

    .line 391
    .restart local v3    # "moof":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;
    :cond_4
    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v10

    add-long/2addr v4, v10

    .line 394
    goto :goto_1
.end method

.method protected createSaiz(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 15
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;
    .param p6, "sequenceNumber"    # I
    .param p7, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 401
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v5

    .line 402
    .local v5, "sampleDescriptionBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    const-string v9, "enc.[0]/sinf[0]/schm[0]"

    invoke-static {v5, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;

    .line 403
    .local v6, "schm":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
    const-string v9, "enc.[0]/sinf[0]/schi[0]/tenc[0]"

    invoke-static {v5, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;

    .line 405
    .local v8, "tenc":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;
    new-instance v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;-><init>()V

    .line 406
    .local v4, "saiz":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;
    const-string v9, "cenc"

    invoke-virtual {v4, v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setAuxInfoType(Ljava/lang/String;)V

    .line 407
    const/4 v9, 0x1

    invoke-virtual {v4, v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setFlags(I)V

    .line 408
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->hasSubSampleEncryption()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 409
    sub-long v10, p3, p1

    invoke-static {v10, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v9

    new-array v7, v9, [S

    .line 411
    .local v7, "sizes":[S
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->getSampleEncryptionEntries()Ljava/util/List;

    move-result-object v9

    const-wide/16 v10, 0x1

    sub-long v10, p1, v10

    invoke-static {v10, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v10

    const-wide/16 v12, 0x1

    sub-long v12, p3, v12

    invoke-static {v12, v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v11

    invoke-interface {v9, v10, v11}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    .line 412
    .local v2, "auxs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v9, v7

    if-ge v3, v9, :cond_0

    .line 413
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->getSize()I

    move-result v9

    int-to-short v9, v9

    aput-short v9, v7, v3

    .line 412
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 415
    :cond_0
    invoke-virtual {v4, v7}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setSampleInfoSizes([S)V

    .line 420
    .end local v2    # "auxs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    .end local v3    # "i":I
    .end local v7    # "sizes":[S
    :goto_1
    move-object/from16 v0, p7

    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 421
    return-void

    .line 417
    :cond_1
    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;->getDefaultIvSize()I

    move-result v9

    invoke-virtual {v4, v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setDefaultSampleInfoSize(I)V

    .line 418
    sub-long v10, p3, p1

    invoke-static {v10, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v9

    invoke-virtual {v4, v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->setSampleCount(I)V

    goto :goto_1
.end method

.method protected createSenc(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 7
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;
    .param p6, "sequenceNumber"    # I
    .param p7, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    const-wide/16 v4, 0x1

    .line 361
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;-><init>()V

    .line 362
    .local v0, "senc":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;
    invoke-interface {p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->hasSubSampleEncryption()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;->setSubSampleEncryption(Z)V

    .line 363
    invoke-interface {p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;->getSampleEncryptionEntries()Ljava/util/List;

    move-result-object v1

    sub-long v2, p1, v4

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v2

    sub-long v4, p3, v4

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v3

    invoke-interface {v1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/dece/SampleEncryptionBox;->setEntries(Ljava/util/List;)V

    .line 364
    invoke-virtual {p7, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 365
    return-void
.end method

.method protected createStbl(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 2
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 808
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;-><init>()V

    .line 810
    .local v0, "stbl":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    invoke-virtual {p0, p2, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createStsd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V

    .line 811
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 812
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleToChunkBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 813
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleSizeBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 814
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 815
    return-object v0
.end method

.method protected createStsd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;)V
    .locals 1
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "stbl"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;

    .prologue
    .line 819
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v0

    invoke-virtual {p2, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 820
    return-void
.end method

.method protected createTfdt(JLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 9
    .param p1, "startSample"    # J
    .param p3, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p4, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 459
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;-><init>()V

    .line 460
    .local v1, "tfdt":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->setVersion(I)V

    .line 461
    const-wide/16 v2, 0x0

    .line 462
    .local v2, "startTime":J
    invoke-interface {p3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v4

    .line 463
    .local v4, "times":[J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    int-to-long v6, v0

    cmp-long v5, v6, p1

    if-gez v5, :cond_0

    .line 464
    add-int/lit8 v5, v0, -0x1

    aget-wide v6, v4, v5

    add-long/2addr v2, v6

    .line 463
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 466
    :cond_0
    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->setBaseMediaDecodeTime(J)V

    .line 467
    invoke-virtual {p4, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 468
    return-void
.end method

.method protected createTfhd(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 4
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "sequenceNumber"    # I
    .param p7, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 287
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;-><init>()V

    .line 288
    .local v1, "tfhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>()V

    .line 290
    .local v0, "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setDefaultSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V

    .line 291
    const-wide/16 v2, -0x1

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setBaseDataOffset(J)V

    .line 292
    invoke-interface {p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setTrackId(J)V

    .line 293
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->setDefaultBaseIsMoof(Z)V

    .line 294
    invoke-virtual {p7, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 295
    return-void
.end method

.method protected createTfra(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 30
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "isoFile"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 638
    new-instance v21, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;

    invoke-direct/range {v21 .. v21}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;-><init>()V

    .line 639
    .local v21, "tfra":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;
    const/4 v3, 0x1

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->setVersion(I)V

    .line 640
    new-instance v18, Ljava/util/LinkedList;

    invoke-direct/range {v18 .. v18}, Ljava/util/LinkedList;-><init>()V

    .line 642
    .local v18, "offset2timeEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;>;"
    const/16 v24, 0x0

    .line 643
    .local v24, "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    const-string v3, "moov/mvex/trex"

    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPaths(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Ljava/util/List;

    move-result-object v25

    .line 644
    .local v25, "trexs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;>;"
    invoke-interface/range {v25 .. v25}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    .line 645
    .local v15, "innerTrex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    invoke-virtual {v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->getTrackId()J

    move-result-wide v8

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v10

    invoke-virtual {v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-nez v8, :cond_0

    .line 646
    move-object/from16 v24, v15

    goto :goto_0

    .line 650
    .end local v15    # "innerTrex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    :cond_1
    const-wide/16 v6, 0x0

    .line 651
    .local v6, "offset":J
    const-wide/16 v4, 0x0

    .line 653
    .local v4, "duration":J
    invoke-interface/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v29

    :goto_1
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 654
    .local v2, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v3, v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    if-eqz v3, :cond_a

    move-object v3, v2

    .line 655
    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    const-class v8, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-virtual {v3, v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v23

    .line 656
    .local v23, "trafs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;>;"
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_2
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v3

    if-ge v14, v3, :cond_a

    .line 657
    move-object/from16 v0, v23

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .line 659
    .local v22, "traf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    invoke-virtual/range {v22 .. v22}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getTrackFragmentHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentHeaderBox;->getTrackId()J

    move-result-wide v8

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v10

    cmp-long v3, v8, v10

    if-nez v3, :cond_9

    .line 662
    const-class v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v28

    .line 663
    .local v28, "truns":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;>;"
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_3
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v16

    if-ge v0, v3, :cond_9

    .line 664
    new-instance v19, Ljava/util/LinkedList;

    invoke-direct/range {v19 .. v19}, Ljava/util/LinkedList;-><init>()V

    .line 665
    .local v19, "offset2timeEntriesThisTrun":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;>;"
    move-object/from16 v0, v28

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    .line 666
    .local v26, "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    const/16 v17, 0x0

    .local v17, "k":I
    :goto_4
    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v17

    if-ge v0, v3, :cond_7

    .line 667
    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v3

    move/from16 v0, v17

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    .line 669
    .local v27, "trunEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    if-nez v17, :cond_2

    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isFirstSampleFlagsPresent()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 670
    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getFirstSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v20

    .line 676
    .local v20, "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :goto_5
    if-nez v20, :cond_4

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v3

    const-string v8, "vide"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 677
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v8, "Cannot find SampleFlags for video track but it\'s required to build tfra"

    invoke-direct {v3, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 671
    .end local v20    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_2
    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->isSampleFlagsPresent()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 672
    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v20

    .restart local v20    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    goto :goto_5

    .line 674
    .end local v20    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_3
    invoke-virtual/range {v24 .. v24}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->getDefaultSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    move-result-object v20

    .restart local v20    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    goto :goto_5

    .line 679
    :cond_4
    if-eqz v20, :cond_5

    invoke-virtual/range {v20 .. v20}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->getSampleDependsOn()I

    move-result v3

    const/4 v8, 0x2

    if-ne v3, v8, :cond_6

    .line 680
    :cond_5
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;

    add-int/lit8 v8, v14, 0x1

    int-to-long v8, v8

    add-int/lit8 v10, v16, 0x1

    int-to-long v10, v10

    add-int/lit8 v12, v17, 0x1

    int-to-long v12, v12

    invoke-direct/range {v3 .. v13}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;-><init>(JJJJJ)V

    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 685
    :cond_6
    invoke-virtual/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->getSampleDuration()J

    move-result-wide v8

    add-long/2addr v4, v8

    .line 666
    add-int/lit8 v17, v17, 0x1

    goto :goto_4

    .line 687
    .end local v20    # "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .end local v27    # "trunEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    :cond_7
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ne v3, v8, :cond_8

    invoke-virtual/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->getEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_8

    .line 691
    const/4 v3, 0x0

    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 663
    :goto_6
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_3

    .line 693
    :cond_8
    invoke-interface/range {v18 .. v19}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_6

    .line 656
    .end local v16    # "j":I
    .end local v17    # "k":I
    .end local v19    # "offset2timeEntriesThisTrun":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox$Entry;>;"
    .end local v26    # "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    .end local v28    # "truns":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;>;"
    :cond_9
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_2

    .line 701
    .end local v14    # "i":I
    .end local v22    # "traf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    .end local v23    # "trafs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;>;"
    :cond_a
    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v8

    add-long/2addr v6, v8

    .line 702
    goto/16 :goto_1

    .line 703
    .end local v2    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_b
    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->setEntries(Ljava/util/List;)V

    .line 704
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v8

    move-object/from16 v0, v21

    invoke-virtual {v0, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentRandomAccessBox;->setTrackId(J)V

    .line 705
    return-object v21
.end method

.method protected createTkhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 4
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 774
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;-><init>()V

    .line 775
    .local v0, "tkhd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setVersion(I)V

    .line 776
    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setFlags(I)V

    .line 778
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getGroup()I

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setAlternateGroup(I)V

    .line 779
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getCreationTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setCreationTime(Ljava/util/Date;)V

    .line 783
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setDuration(J)V

    .line 784
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getHeight()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setHeight(D)V

    .line 785
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getWidth()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setWidth(D)V

    .line 786
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getLayer()I

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setLayer(I)V

    .line 787
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setModificationTime(Ljava/util/Date;)V

    .line 788
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setTrackId(J)V

    .line 789
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v1

    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getVolume()F

    move-result v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->setVolume(F)V

    .line 790
    return-object v0
.end method

.method protected createTraf(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;)V
    .locals 25
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "sequenceNumber"    # I
    .param p7, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;

    .prologue
    .line 304
    new-instance v12, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    invoke-direct {v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;-><init>()V

    .line 305
    .local v12, "traf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;
    move-object/from16 v0, p7

    invoke-virtual {v0, v12}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    move-object/from16 v5, p0

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    move-object/from16 v10, p5

    move/from16 v11, p6

    .line 306
    invoke-virtual/range {v5 .. v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTfhd(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    .line 307
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3, v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTfdt(JLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    move-object/from16 v5, p0

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    move-object/from16 v10, p5

    move/from16 v11, p6

    .line 308
    invoke-virtual/range {v5 .. v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTrun(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    .line 310
    move-object/from16 v0, p5

    instance-of v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;

    if-eqz v5, :cond_0

    move-object/from16 v10, p5

    .line 311
    check-cast v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;

    move-object/from16 v5, p0

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    move/from16 v11, p6

    invoke-virtual/range {v5 .. v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createSaiz(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    move-object/from16 v10, p5

    .line 312
    check-cast v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;

    move-object/from16 v5, p0

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    move/from16 v11, p6

    invoke-virtual/range {v5 .. v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createSenc(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    move-object/from16 v10, p5

    .line 313
    check-cast v10, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;

    move-object/from16 v5, p0

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    move/from16 v11, p6

    invoke-virtual/range {v5 .. v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createSaio(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V

    .line 317
    :cond_0
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 318
    .local v14, "groupEntryFamilies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;>;"
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleGroups()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/Map$Entry;

    .line 319
    .local v21, "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;[J>;"
    invoke-interface/range {v21 .. v21}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;->getType()Ljava/lang/String;

    move-result-object v24

    .line 320
    .local v24, "type":Ljava/lang/String;
    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 321
    .local v4, "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    if-nez v4, :cond_1

    .line 322
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 323
    .restart local v4    # "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    move-object/from16 v0, v24

    invoke-interface {v14, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    :cond_1
    invoke-interface/range {v21 .. v21}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 329
    .end local v4    # "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;"
    .end local v21    # "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;[J>;"
    .end local v24    # "type":Ljava/lang/String;
    :cond_2
    invoke-interface {v14}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/util/Map$Entry;

    .line 330
    .local v22, "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;>;"
    new-instance v23, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;

    invoke-direct/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;-><init>()V

    .line 331
    .local v23, "sgpd":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
    invoke-interface/range {v22 .. v22}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    .line 332
    .restart local v24    # "type":Ljava/lang/String;
    invoke-interface/range {v22 .. v22}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;->setGroupEntries(Ljava/util/List;)V

    .line 333
    new-instance v20, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;

    invoke-direct/range {v20 .. v20}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;-><init>()V

    .line 334
    .local v20, "sbgp":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;
    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->setGroupingType(Ljava/lang/String;)V

    .line 335
    const/16 v18, 0x0

    .line 336
    .local v18, "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    const-wide/16 v8, 0x1

    sub-long v8, p1, v8

    invoke-static {v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v15

    .local v15, "i":I
    :goto_2
    const-wide/16 v8, 0x1

    sub-long v8, p3, v8

    invoke-static {v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    if-ge v15, v5, :cond_7

    .line 337
    const/16 v16, 0x0

    .line 338
    .local v16, "index":I
    const/16 v17, 0x0

    .local v17, "j":I
    :goto_3
    invoke-interface/range {v22 .. v22}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    move/from16 v0, v17

    if-ge v0, v5, :cond_4

    .line 339
    invoke-interface/range {v22 .. v22}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    move/from16 v0, v17

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    .line 340
    .local v13, "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleGroups()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, [J

    .line 341
    .local v19, "sampleNums":[J
    int-to-long v8, v15

    move-object/from16 v0, v19

    invoke-static {v0, v8, v9}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v5

    if-ltz v5, :cond_3

    .line 342
    add-int/lit8 v16, v17, 0x1

    .line 338
    :cond_3
    add-int/lit8 v17, v17, 0x1

    goto :goto_3

    .line 345
    .end local v13    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    .end local v19    # "sampleNums":[J
    :cond_4
    if-eqz v18, :cond_5

    invoke-virtual/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getGroupDescriptionIndex()I

    move-result v5

    move/from16 v0, v16

    if-eq v5, v0, :cond_6

    .line 346
    :cond_5
    new-instance v18, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;

    .end local v18    # "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    const-wide/16 v8, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-direct {v0, v8, v9, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;-><init>(JI)V

    .line 347
    .restart local v18    # "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    invoke-virtual/range {v20 .. v20}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;->getEntries()Ljava/util/List;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    :goto_4
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 349
    :cond_6
    invoke-virtual/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->getSampleCount()J

    move-result-wide v8

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    move-object/from16 v0, v18

    invoke-virtual {v0, v8, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;->setSampleCount(J)V

    goto :goto_4

    .line 352
    .end local v16    # "index":I
    .end local v17    # "j":I
    :cond_7
    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 353
    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    goto/16 :goto_1

    .line 358
    .end local v15    # "i":I
    .end local v18    # "last":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox$Entry;
    .end local v20    # "sbgp":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleToGroupBox;
    .end local v22    # "sg":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;>;>;"
    .end local v23    # "sgpd":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/SampleGroupDescriptionBox;
    .end local v24    # "type":Ljava/lang/String;
    :cond_8
    return-void
.end method

.method protected createTrak(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 5
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 861
    sget-object v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->LOG:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating Track "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 862
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;-><init>()V

    .line 863
    .local v1, "trackBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    invoke-virtual {p0, p2, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createTkhd(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 864
    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createEdts(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    .line 865
    .local v0, "edts":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    if-eqz v0, :cond_0

    .line 866
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 868
    :cond_0
    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->createMdia(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 869
    return-object v1
.end method

.method protected createTrex(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 8
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v4, 0x2

    .line 730
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;-><init>()V

    .line 731
    .local v1, "trex":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTrackId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setTrackId(J)V

    .line 732
    const-wide/16 v2, 0x1

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleDescriptionIndex(J)V

    .line 733
    invoke-virtual {v1, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleDuration(J)V

    .line 734
    invoke-virtual {v1, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleSize(J)V

    .line 735
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>()V

    .line 736
    .local v0, "sf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    const-string v2, "soun"

    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "subt"

    invoke-interface {p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 740
    :cond_0
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleDependsOn(I)V

    .line 741
    invoke-virtual {v0, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDependedOn(I)V

    .line 743
    :cond_1
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->setDefaultSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V

    .line 744
    return-object v1
.end method

.method protected createTrun(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;ILco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;)V
    .locals 25
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "sequenceNumber"    # I
    .param p7, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;

    .prologue
    .line 480
    new-instance v17, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;

    invoke-direct/range {v17 .. v17}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;-><init>()V

    .line 481
    .local v17, "trun":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;
    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setVersion(I)V

    .line 482
    invoke-virtual/range {p0 .. p6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getSampleSizes(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)[J

    move-result-object v15

    .line 484
    .local v15, "sampleSizes":[J
    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleDurationPresent(Z)V

    .line 485
    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleSizePresent(Z)V

    .line 486
    new-instance v10, Ljava/util/ArrayList;

    sub-long v18, p3, p1

    invoke-static/range {v18 .. v19}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v18

    move/from16 v0, v18

    invoke-direct {v10, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 489
    .local v10, "entries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;>;"
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v4

    .line 490
    .local v4, "compositionTimeEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    const/4 v8, 0x0

    .line 491
    .local v8, "compositionTimeQueueIndex":I
    if-eqz v4, :cond_1

    .line 492
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v18

    if-lez v18, :cond_1

    .line 493
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v18

    move/from16 v0, v18

    new-array v0, v0, [Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v18

    check-cast v18, [Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    move-object/from16 v5, v18

    .line 494
    .local v5, "compositionTimeQueue":[Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    :goto_0
    if-eqz v5, :cond_2

    aget-object v18, v5, v8

    invoke-virtual/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v18

    move/from16 v0, v18

    int-to-long v6, v0

    .line 497
    .local v6, "compositionTimeEntriesLeft":J
    :goto_1
    const-wide/16 v18, 0x0

    cmp-long v18, v6, v18

    if-lez v18, :cond_3

    const/16 v18, 0x1

    :goto_2
    invoke-virtual/range {v17 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleCompositionTimeOffsetPresent(Z)V

    .line 500
    const-wide/16 v12, 0x1

    .local v12, "i":J
    :goto_3
    cmp-long v18, v12, p1

    if-gez v18, :cond_4

    .line 501
    if-eqz v5, :cond_0

    .line 503
    const-wide/16 v18, 0x1

    sub-long v6, v6, v18

    const-wide/16 v18, 0x0

    cmp-long v18, v6, v18

    if-nez v18, :cond_0

    array-length v0, v5

    move/from16 v18, v0

    sub-int v18, v18, v8

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_0

    .line 504
    add-int/lit8 v8, v8, 0x1

    .line 505
    aget-object v18, v5, v8

    invoke-virtual/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v18

    move/from16 v0, v18

    int-to-long v6, v0

    .line 500
    :cond_0
    const-wide/16 v18, 0x1

    add-long v12, v12, v18

    goto :goto_3

    .line 493
    .end local v5    # "compositionTimeQueue":[Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    .end local v6    # "compositionTimeEntriesLeft":J
    .end local v12    # "i":J
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 494
    .restart local v5    # "compositionTimeQueue":[Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    :cond_2
    const-wide/16 v6, -0x1

    goto :goto_1

    .line 497
    .restart local v6    # "compositionTimeEntriesLeft":J
    :cond_3
    const/16 v18, 0x0

    goto :goto_2

    .line 510
    .restart local v12    # "i":J
    :cond_4
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v18

    if-eqz v18, :cond_5

    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_6

    .line 511
    :cond_5
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v18

    if-eqz v18, :cond_b

    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v18

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    if-eqz v18, :cond_b

    :cond_6
    const/4 v14, 0x1

    .line 513
    .local v14, "sampleFlagsRequired":Z
    :goto_4
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setSampleFlagsPresent(Z)V

    .line 515
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_5
    array-length v0, v15

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v12, v0, :cond_d

    .line 516
    new-instance v11, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;

    invoke-direct {v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;-><init>()V

    .line 517
    .local v11, "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    aget-wide v18, v15, v12

    move-wide/from16 v0, v18

    invoke-virtual {v11, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->setSampleSize(J)V

    .line 518
    if-eqz v14, :cond_9

    .line 520
    new-instance v16, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct/range {v16 .. v16}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>()V

    .line 522
    .local v16, "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v18

    if-eqz v18, :cond_7

    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_7

    .line 523
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;

    .line 524
    .local v9, "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;
    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;->getSampleDependsOn()I

    move-result v18

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleDependsOn(I)V

    .line 525
    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;->getSampleIsDependentOn()I

    move-result v18

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDependedOn(I)V

    .line 526
    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;->getSampleHasRedundancy()I

    move-result v18

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleHasRedundancy(I)V

    .line 528
    .end local v9    # "e":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;
    :cond_7
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v18

    if-eqz v18, :cond_8

    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v18

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    if-lez v18, :cond_8

    .line 530
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v18

    int-to-long v0, v12

    move-wide/from16 v20, v0

    add-long v20, v20, p1

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v18

    if-ltz v18, :cond_c

    .line 531
    const/16 v18, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDifferenceSample(Z)V

    .line 532
    const/16 v18, 0x2

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleDependsOn(I)V

    .line 539
    :cond_8
    :goto_6
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->setSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V

    .line 543
    .end local v16    # "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_9
    invoke-interface/range {p5 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v18

    int-to-long v0, v12

    move-wide/from16 v20, v0

    add-long v20, v20, p1

    const-wide/16 v22, 0x1

    sub-long v20, v20, v22

    invoke-static/range {v20 .. v21}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v19

    aget-wide v18, v18, v19

    move-wide/from16 v0, v18

    invoke-virtual {v11, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->setSampleDuration(J)V

    .line 545
    if-eqz v5, :cond_a

    .line 546
    aget-object v18, v5, v8

    invoke-virtual/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getOffset()I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v11, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;->setSampleCompositionTimeOffset(I)V

    .line 547
    const-wide/16 v18, 0x1

    sub-long v6, v6, v18

    const-wide/16 v18, 0x0

    cmp-long v18, v6, v18

    if-nez v18, :cond_a

    array-length v0, v5

    move/from16 v18, v0

    sub-int v18, v18, v8

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_a

    .line 548
    add-int/lit8 v8, v8, 0x1

    .line 549
    aget-object v18, v5, v8

    invoke-virtual/range {v18 .. v18}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v18

    move/from16 v0, v18

    int-to-long v6, v0

    .line 552
    :cond_a
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 515
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_5

    .line 511
    .end local v11    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .end local v14    # "sampleFlagsRequired":Z
    .local v12, "i":J
    :cond_b
    const/4 v14, 0x0

    goto/16 :goto_4

    .line 534
    .restart local v11    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .local v12, "i":I
    .restart local v14    # "sampleFlagsRequired":Z
    .restart local v16    # "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_c
    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleIsDifferenceSample(Z)V

    .line 535
    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->setSampleDependsOn(I)V

    goto :goto_6

    .line 555
    .end local v11    # "entry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox$Entry;
    .end local v16    # "sflags":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    :cond_d
    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackRunBox;->setEntries(Ljava/util/List;)V

    .line 557
    move-object/from16 v0, p7

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 558
    return-void
.end method

.method public getDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 109
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method public getFragmentIntersectionFinder()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;
    .locals 1

    .prologue
    .line 905
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    return-object v0
.end method

.method protected getSampleSizes(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)[J
    .locals 7
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "sequenceNumber"    # I

    .prologue
    .line 449
    invoke-virtual/range {p0 .. p6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->getSamples(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Ljava/util/List;

    move-result-object v2

    .line 451
    .local v2, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v1, v3, [J

    .line 452
    .local v1, "sampleSizes":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 453
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v4

    aput-wide v4, v1, v0

    .line 452
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 455
    :cond_0
    return-object v1
.end method

.method protected getSamples(JJLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)Ljava/util/List;
    .locals 3
    .param p1, "startSample"    # J
    .param p3, "endSample"    # J
    .param p5, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p6, "sequenceNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "I)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 436
    invoke-interface {p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v0

    invoke-static {p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p3, p4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setIntersectionFinder(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;)V
    .locals 0
    .param p1, "intersectionFinder"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    .prologue
    .line 909
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;->intersectionFinder:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;

    .line 910
    return-void
.end method

.method protected sortTracksInSequence(Ljava/util/List;ILjava/util/Map;)Ljava/util/List;
    .locals 2
    .param p2, "cycle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            ">;I",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[J>;)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    .local p1, "tracks":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;>;"
    .local p3, "intersectionMap":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[J>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0, p1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 130
    .end local p1    # "tracks":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;>;"
    .local v0, "tracks":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;>;"
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1;

    invoke-direct {v1, p0, p3, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentedMp4Builder;Ljava/util/Map;I)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 154
    return-object v0
.end method
