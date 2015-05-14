.class public Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;
.super Ljava/lang/Object;
.source "BoxWriter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BoxWriter"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBytes(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)[B
    .locals 6
    .param p0, "box"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .prologue
    .line 100
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v4

    long-to-int v3, v4

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 101
    .local v2, "outBytes":Ljava/nio/ByteBuffer;
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;

    invoke-direct {v0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/ByteBufferByteChannel;-><init>(Ljava/nio/ByteBuffer;)V

    .line 103
    .local v0, "channel":Ljava/nio/channels/WritableByteChannel;
    :try_start_0
    invoke-interface {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 104
    invoke-interface {v0}, Ljava/nio/channels/WritableByteChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :goto_0
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    return-object v3

    .line 105
    :catch_0
    move-exception v1

    .line 106
    .local v1, "e":Ljava/io/IOException;
    const-string v3, "BoxWriter"

    const-string v4, " Couldnt write box "

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static getFirstChunk(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[B)Ljava/util/List;
    .locals 1
    .param p0, "videoChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "videoDurations"    # [J
    .param p2, "audioChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
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
    .line 46
    invoke-static {p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/mp4writer/MoovBuilder;->createFirstMp4Chunk(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[B)Ljava/util/List;

    move-result-object v0

    .line 48
    .local v0, "firstChunkBoxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    return-object v0
.end method

.method public static getFirstChunkFromTestRecording(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p0, "filePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    :try_start_0
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    invoke-direct {v1, p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;-><init>(Ljava/lang/String;)V

    .line 57
    .local v1, "file":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    invoke-virtual {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getBoxes()Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 61
    .end local v1    # "file":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    :goto_0
    return-object v2

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "BoxWriter"

    const-string v3, "Error reading first chunk"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 61
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getFragment(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[BIJ)Ljava/util/List;
    .locals 1
    .param p0, "videoTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p1, "videoDurations"    # [J
    .param p2, "audioTrackChunk"    # Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;
    .param p3, "parameterSets"    # [B
    .param p4, "sequence"    # I
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
    .line 84
    invoke-static/range {p0 .. p6}, Lco/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder;->createFragment(Lco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[JLco/getair/meerkat/video/broadcast/mp4writer/MediaTrackChunk;[BIJ)Ljava/util/List;

    move-result-object v0

    .line 85
    .local v0, "fragment":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    return-object v0
.end method

.method public static getFtyp()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 6

    .prologue
    .line 29
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 30
    .local v0, "minorBrands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "mp41"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    const-string v1, "mp42"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    const-string v1, "isom"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;

    const-string v2, "mp42"

    const-wide/16 v4, 0x0

    invoke-direct {v1, v2, v4, v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FileTypeBox;-><init>(Ljava/lang/String;JLjava/util/List;)V

    return-object v1
.end method

.method public static getFtypBytes()[B
    .locals 1

    .prologue
    .line 39
    invoke-static {}, Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;->getFtyp()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/mp4writer/BoxWriter;->getBytes(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)[B

    move-result-object v0

    return-object v0
.end method

.method public static getTrackDuration(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)J
    .locals 4
    .param p0, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 94
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTimescale()J

    move-result-wide v2

    mul-long/2addr v0, v2

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v2

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v2

    div-long/2addr v0, v2

    return-wide v0
.end method
