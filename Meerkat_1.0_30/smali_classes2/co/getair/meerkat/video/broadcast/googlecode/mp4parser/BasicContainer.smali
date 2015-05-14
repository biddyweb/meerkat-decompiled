.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;
.super Ljava/lang/Object;
.source "BasicContainer.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
.implements Ljava/io/Closeable;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;",
        "Ljava/util/Iterator",
        "<",
        "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
        ">;",
        "Ljava/io/Closeable;"
    }
.end annotation


# static fields
.field private static final EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

.field private static LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;


# instance fields
.field protected boxParser:Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;

.field private boxes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation
.end field

.field protected dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

.field endPosition:J

.field lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

.field parsePosition:J

.field startPosition:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 28
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer$1;

    const-string v1, "eof "

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 43
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;->getLogger(Ljava/lang/Class;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->LOG:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 47
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->parsePosition:J

    .line 48
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->startPosition:J

    .line 49
    iput-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->endPosition:J

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    .line 53
    return-void
.end method


# virtual methods
.method public addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V
    .locals 2
    .param p1, "box"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .prologue
    .line 137
    if-eqz p1, :cond_0

    .line 138
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    .line 139
    invoke-interface {p1, p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V

    .line 140
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    :cond_0
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 265
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 266
    return-void
.end method

.method public getBoxes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    sget-object v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-eq v0, v1, :cond_0

    .line 57
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    invoke-direct {v0, v1, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;-><init>(Ljava/util/List;Ljava/util/Iterator;)V

    .line 59
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    goto :goto_0
.end method

.method public getBoxes(Ljava/lang/Class;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v2, 0x0

    .line 82
    .local v2, "boxesToBeReturned":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v4, 0x0

    .line 83
    .local v4, "oneBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;, "TT;"
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->getBoxes()Ljava/util/List;

    move-result-object v1

    .line 84
    .local v1, "boxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_3

    .line 85
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 89
    .local v0, "boxe":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 90
    if-nez v4, :cond_1

    .line 91
    move-object v4, v0

    .line 84
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 93
    :cond_1
    if-nez v2, :cond_2

    .line 94
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "boxesToBeReturned":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v5, 0x2

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 95
    .restart local v2    # "boxesToBeReturned":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_2
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 101
    .end local v0    # "boxe":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_3
    if-eqz v2, :cond_4

    .line 106
    .end local v2    # "boxesToBeReturned":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :goto_2
    return-object v2

    .line 103
    .restart local v2    # "boxesToBeReturned":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_4
    if-eqz v4, :cond_5

    .line 104
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_2

    .line 106
    :cond_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_2
.end method

.method public getBoxes(Ljava/lang/Class;Z)Ljava/util/List;
    .locals 5
    .param p2, "recursive"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;Z)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    const/4 v4, 0x2

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 113
    .local v2, "boxesToBeReturned":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->getBoxes()Ljava/util/List;

    move-result-object v1

    .line 114
    .local v1, "boxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 115
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 119
    .local v0, "boxe":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 120
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    :cond_0
    if-eqz p2, :cond_1

    instance-of v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    if-eqz v4, :cond_1

    .line 124
    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .end local v0    # "boxe":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-interface {v0, p1, p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;Z)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 114
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 127
    :cond_2
    return-object v2
.end method

.method public getByteBuffer(JJ)Ljava/nio/ByteBuffer;
    .locals 21
    .param p1, "rangeStart"    # J
    .param p3, "size"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    if-eqz v15, :cond_0

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-object/from16 v16, v0

    monitor-enter v16

    .line 227
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->startPosition:J

    move-wide/from16 v18, v0

    add-long v18, v18, p1

    move-wide/from16 v0, v18

    move-wide/from16 v2, p3

    invoke-interface {v15, v0, v1, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->map(JJ)Ljava/nio/ByteBuffer;

    move-result-object v15

    monitor-exit v16

    .line 260
    :goto_0
    return-object v15

    .line 228
    :catchall_0
    move-exception v15

    monitor-exit v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v15

    .line 230
    :cond_0
    invoke-static/range {p3 .. p4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v15

    invoke-static {v15}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 231
    .local v11, "out":Ljava/nio/ByteBuffer;
    add-long v12, p1, p3

    .line 233
    .local v12, "rangeEnd":J
    const-wide/16 v6, 0x0

    .line 234
    .local v6, "boxEnd":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_1
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 235
    .local v5, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    move-wide v8, v6

    .line 236
    .local v8, "boxStart":J
    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v16

    add-long v6, v8, v16

    .line 237
    cmp-long v16, v6, p1

    if-lez v16, :cond_1

    cmp-long v16, v8, v12

    if-gez v16, :cond_1

    .line 238
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 239
    .local v4, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {v4}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v14

    .line 240
    .local v14, "wbc":Ljava/nio/channels/WritableByteChannel;
    invoke-interface {v5, v14}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 241
    invoke-interface {v14}, Ljava/nio/channels/WritableByteChannel;->close()V

    .line 243
    cmp-long v16, v8, p1

    if-ltz v16, :cond_2

    cmp-long v16, v6, v12

    if-gtz v16, :cond_2

    .line 244
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 246
    :cond_2
    cmp-long v16, v8, p1

    if-gez v16, :cond_3

    cmp-long v16, v6, v12

    if-lez v16, :cond_3

    .line 248
    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v16

    sub-long v18, p1, v8

    sub-long v16, v16, v18

    sub-long v18, v6, v12

    sub-long v16, v16, v18

    invoke-static/range {v16 .. v17}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v10

    .line 249
    .local v10, "length":I
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v16

    sub-long v18, p1, v8

    invoke-static/range {v18 .. v19}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v17

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v11, v0, v1, v10}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    goto :goto_1

    .line 250
    .end local v10    # "length":I
    :cond_3
    cmp-long v16, v8, p1

    if-gez v16, :cond_4

    cmp-long v16, v6, v12

    if-gtz v16, :cond_4

    .line 252
    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v16

    sub-long v18, p1, v8

    sub-long v16, v16, v18

    invoke-static/range {v16 .. v17}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v10

    .line 253
    .restart local v10    # "length":I
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v16

    sub-long v18, p1, v8

    invoke-static/range {v18 .. v19}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v17

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v11, v0, v1, v10}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    goto/16 :goto_1

    .line 254
    .end local v10    # "length":I
    :cond_4
    cmp-long v16, v8, p1

    if-ltz v16, :cond_1

    cmp-long v16, v6, v12

    if-lez v16, :cond_1

    .line 255
    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v16

    sub-long v18, v6, v12

    sub-long v16, v16, v18

    invoke-static/range {v16 .. v17}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v10

    .line 256
    .restart local v10    # "length":I
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v16

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v11, v0, v1, v10}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    goto/16 :goto_1

    .line 260
    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v8    # "boxStart":J
    .end local v10    # "length":I
    .end local v14    # "wbc":Ljava/nio/channels/WritableByteChannel;
    :cond_5
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v15

    check-cast v15, Ljava/nio/ByteBuffer;

    goto/16 :goto_0
.end method

.method protected getContainerSize()J
    .locals 6

    .prologue
    .line 70
    const-wide/16 v0, 0x0

    .line 71
    .local v0, "contentSize":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->getBoxes()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 74
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getSize()J

    move-result-wide v4

    add-long/2addr v0, v4

    .line 71
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 76
    :cond_0
    return-wide v0
.end method

.method public hasNext()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 158
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    sget-object v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-ne v3, v4, :cond_0

    .line 169
    :goto_0
    return v1

    .line 161
    :cond_0
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-eqz v3, :cond_1

    move v1, v2

    .line 162
    goto :goto_0

    .line 165
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->next()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v3

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v2

    .line 166
    goto :goto_0

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Ljava/util/NoSuchElementException;
    sget-object v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    goto :goto_0
.end method

.method public initContainer(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 2
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "containerSize"    # J
    .param p4, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 147
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->startPosition:J

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->parsePosition:J

    .line 148
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v0

    add-long/2addr v0, p2

    invoke-interface {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 149
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->endPosition:J

    .line 150
    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxParser:Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;

    .line 151
    return-void
.end method

.method public next()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 6

    .prologue
    .line 175
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    sget-object v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-eq v2, v3, :cond_0

    .line 176
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 177
    .local v0, "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    const/4 v2, 0x0

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 192
    :goto_0
    return-object v0

    .line 181
    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    if-eqz v2, :cond_1

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->parsePosition:J

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->endPosition:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    .line 182
    :cond_1
    sget-object v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 183
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2

    .line 187
    :cond_2
    :try_start_0
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    monitor-enter v3
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 188
    :try_start_1
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    iget-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->parsePosition:J

    invoke-interface {v2, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 189
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxParser:Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v2, v4, p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;->parseBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    .line 191
    .restart local v0    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v4

    iput-wide v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->parsePosition:J

    .line 192
    monitor-exit v3

    goto :goto_0

    .line 193
    .end local v0    # "b":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 194
    :catch_0
    move-exception v1

    .line 195
    .local v1, "e":Ljava/io/EOFException;
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2

    .line 196
    .end local v1    # "e":Ljava/io/EOFException;
    :catch_1
    move-exception v1

    .line 197
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->next()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 154
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setBoxes(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "boxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    .line 65
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->EOF:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->lookahead:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 67
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 208
    if-lez v1, :cond_0

    .line 209
    const-string v2, ";"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->boxes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 213
    :cond_1
    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public final writeContainer(Ljava/nio/channels/WritableByteChannel;)V
    .locals 3
    .param p1, "bb"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/BasicContainer;->getBoxes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 220
    .local v0, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    invoke-interface {v0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    goto :goto_0

    .line 222
    .end local v0    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_0
    return-void
.end method
