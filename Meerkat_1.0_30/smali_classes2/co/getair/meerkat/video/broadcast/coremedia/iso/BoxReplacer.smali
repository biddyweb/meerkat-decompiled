.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxReplacer;
.super Ljava/lang/Object;
.source "BoxReplacer.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxReplacer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxReplacer;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static replace(Ljava/util/Map;Ljava/io/File;)V
    .locals 18
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "replacements":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    new-instance v11, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;

    new-instance v12, Ljava/io/RandomAccessFile;

    const-string v13, "r"

    move-object/from16 v0, p1

    invoke-direct {v12, v0, v13}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v12

    invoke-direct {v11, v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/FileDataSourceImpl;-><init>(Ljava/nio/channels/FileChannel;)V

    invoke-direct {v5, v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 20
    .local v5, "isoFile":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 21
    .local v10, "replacementSanitised":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 22
    .local v7, "positions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 23
    .local v3, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v5, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    .line 24
    .local v2, "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->createPath(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    invoke-interface {v10, v11, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->createPath(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getOffset()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-interface {v7, v11, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    sget-boolean v11, Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxReplacer;->$assertionsDisabled:Z

    if-nez v11, :cond_0

    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v14

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v16

    cmp-long v11, v14, v16

    if-eqz v11, :cond_0

    new-instance v11, Ljava/lang/AssertionError;

    invoke-direct {v11}, Ljava/lang/AssertionError;-><init>()V

    throw v11

    .line 28
    .end local v2    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v3    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    :cond_1
    invoke-virtual {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->close()V

    .line 29
    new-instance v11, Ljava/io/RandomAccessFile;

    const-string v12, "rw"

    move-object/from16 v0, p1

    invoke-direct {v11, v0, v12}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    .line 30
    .local v4, "fileChannel":Ljava/nio/channels/FileChannel;
    invoke-interface {v10}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 31
    .local v6, "path":Ljava/lang/String;
    invoke-interface {v10, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 32
    .restart local v2    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 33
    .local v8, "pos":J
    invoke-virtual {v4, v8, v9}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 34
    invoke-interface {v2, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    goto :goto_0

    .line 36
    .end local v2    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v6    # "path":Ljava/lang/String;
    .end local v8    # "pos":J
    :cond_2
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    .line 37
    return-void
.end method
