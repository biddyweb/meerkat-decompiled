.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;
.super Ljava/lang/Object;
.source "DefaultMp4Builder.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InterleaveChunkMdat"
.end annotation


# instance fields
.field chunkList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;>;"
        }
    .end annotation
.end field

.field contentSize:J

.field parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;

.field tracks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;J)V
    .locals 14
    .param p2, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p4, "contentSize"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "[I>;J)V"
        }
    .end annotation

    .prologue
    .line 658
    .local p3, "chunks":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;[I>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 653
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iput-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->chunkList:Ljava/util/List;

    .line 659
    move-wide/from16 v0, p4

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->contentSize:J

    .line 660
    invoke-virtual/range {p2 .. p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v9

    iput-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->tracks:Ljava/util/List;

    .line 662
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [I

    array-length v9, v9

    if-ge v6, v9, :cond_2

    .line 663
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->tracks:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 665
    .local v8, "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    move-object/from16 v0, p3

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 666
    .local v3, "chunkSizes":[I
    const-wide/16 v4, 0x0

    .line 667
    .local v4, "firstSampleOfChunk":J
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    if-ge v7, v6, :cond_0

    .line 668
    aget v9, v3, v7

    int-to-long v12, v9

    add-long/2addr v4, v12

    .line 667
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 670
    :cond_0
    iget-object v9, p1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->track2Sample:Ljava/util/HashMap;

    invoke-virtual {v9, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v11

    aget v12, v3, v6

    int-to-long v12, v12

    add-long/2addr v12, v4

    invoke-static {v12, v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v12

    invoke-interface {v9, v11, v12}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    .line 671
    .local v2, "chunk":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->chunkList:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 662
    .end local v2    # "chunk":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    .end local v3    # "chunkSizes":[I
    .end local v4    # "firstSampleOfChunk":J
    .end local v7    # "j":I
    .end local v8    # "track":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 676
    :cond_2
    return-void
.end method

.method synthetic constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;JLco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$1;)V
    .locals 0
    .param p1, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;
    .param p2, "x1"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p3, "x2"    # Ljava/util/Map;
    .param p4, "x3"    # J
    .param p6, "x4"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$1;

    .prologue
    .line 651
    invoke-direct/range {p0 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Ljava/util/Map;J)V

    return-void
.end method

.method private isSmallBox(J)Z
    .locals 5
    .param p1, "contentSize"    # J

    .prologue
    .line 718
    const-wide/16 v0, 0x8

    add-long/2addr v0, p1

    const-wide v2, 0x100000000L

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 8
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 723
    const/16 v3, 0x10

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 724
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->getSize()J

    move-result-wide v4

    .line 725
    .local v4, "size":J
    invoke-direct {p0, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->isSmallBox(J)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 726
    invoke-static {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 730
    :goto_0
    const-string v3, "mdat"

    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 731
    invoke-direct {p0, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->isSmallBox(J)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 732
    const/16 v3, 0x8

    new-array v3, v3, [B

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 736
    :goto_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 737
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 738
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->chunkList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 739
    .local v2, "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 740
    .local v1, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->writeTo(Ljava/nio/channels/WritableByteChannel;)V

    goto :goto_2

    .line 728
    .end local v1    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .end local v2    # "samples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    :cond_1
    const-wide/16 v6, 0x1

    invoke-static {v0, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0

    .line 734
    :cond_2
    invoke-static {v0, v4, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    goto :goto_1

    .line 744
    :cond_3
    return-void
.end method

.method public getDataOffset()J
    .locals 8

    .prologue
    .line 694
    move-object v0, p0

    .line 695
    .local v0, "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;
    const-wide/16 v2, 0x10

    .line 696
    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;
    .local v2, "offset":J
    :goto_0
    instance-of v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-eqz v4, :cond_2

    move-object v4, v0

    .line 697
    check-cast v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v4

    invoke-interface {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 698
    .local v1, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    if-ne v0, v1, :cond_1

    .line 703
    .end local v1    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_0
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    move-result-object v0

    .local v0, "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    goto :goto_0

    .line 701
    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .restart local v1    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_1
    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v6

    add-long/2addr v2, v6

    .line 702
    goto :goto_1

    .line 705
    .end local v1    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_2
    return-wide v2
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 687
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Doesn\'t have any meaning for programmatically created boxes"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .locals 1

    .prologue
    .line 679
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    return-object v0
.end method

.method public getSize()J
    .locals 4

    .prologue
    .line 714
    const-wide/16 v0, 0x10

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->contentSize:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 710
    const-string v0, "mdat"

    return-object v0
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 0
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contentSize"    # J
    .param p5, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 691
    return-void
.end method

.method public setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
    .locals 0
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 683
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/DefaultMp4Builder$InterleaveChunkMdat;->parent:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .line 684
    return-void
.end method
