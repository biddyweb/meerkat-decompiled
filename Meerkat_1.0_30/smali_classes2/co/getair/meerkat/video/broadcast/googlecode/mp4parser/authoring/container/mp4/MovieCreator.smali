.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/container/mp4/MovieCreator;
.super Ljava/lang/Object;
.source "MovieCreator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static build(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .locals 11
    .param p0, "channel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 49
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    invoke-direct {v0, p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 50
    .local v0, "isoFile":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;-><init>()V

    .line 51
    .local v1, "m":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getMovieBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    move-result-object v5

    const-class v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    invoke-virtual {v5, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    .line 52
    .local v4, "trackBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;

    .line 53
    .local v3, "trackBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    const-string v6, "mdia[0]/minf[0]/stbl[0]/stsd[0]/enc.[0]/sinf[0]/schm[0]"

    invoke-static {v3, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;

    .line 54
    .local v2, "schm":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->getSchemeType()Ljava/lang/String;

    move-result-object v6

    const-string v7, "cenc"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->getSchemeType()Ljava/lang/String;

    move-result-object v6

    const-string v7, "cbc1"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 55
    :cond_0
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-array v8, v10, [Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    invoke-direct {v6, v7, v3, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl;-><init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;)V

    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->addTrack(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V

    goto :goto_0

    .line 57
    :cond_1
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;->getTrackHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;

    move-result-object v8

    invoke-virtual {v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;->getTrackId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-array v8, v10, [Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    invoke-direct {v6, v7, v3, v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Mp4TrackImpl;-><init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;[Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;)V

    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->addTrack(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V

    goto/16 :goto_0

    .line 60
    .end local v2    # "schm":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
    .end local v3    # "trackBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox;
    :cond_2
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getMovieBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox;->getMovieHeaderBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;

    move-result-object v5

    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox;->getMatrix()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;

    move-result-object v5

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->setMatrix(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Matrix;)V

    .line 61
    return-object v1
.end method

.method public static build(Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .locals 2
    .param p0, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;-><init>(Ljava/io/File;)V

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/container/mp4/MovieCreator;->build(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    move-result-object v0

    return-object v0
.end method
