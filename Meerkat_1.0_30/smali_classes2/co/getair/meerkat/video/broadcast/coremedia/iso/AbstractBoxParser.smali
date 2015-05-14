.class public abstract Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;
.super Ljava/lang/Object;
.source "AbstractBoxParser.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;


# static fields
.field private static LOG:Ljava/util/logging/Logger;


# instance fields
.field header:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser$1;

    invoke-direct {v0, p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser$1;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    return-void
.end method


# virtual methods
.method public abstract createBox(Ljava/lang/String;[BLjava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
.end method

.method public parseBox(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 20
    .param p1, "byteChannel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v14

    .line 53
    .local v14, "startPos":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 55
    const/4 v9, 0x0

    .line 56
    .local v9, "bytesRead":I
    const/4 v2, 0x0

    .line 57
    .local v2, "b":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    const/16 v4, 0x8

    if-eq v2, v4, :cond_1

    .line 58
    if-gez v2, :cond_0

    .line 59
    move-object/from16 v0, p1

    invoke-interface {v0, v14, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    .line 60
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4

    .line 62
    :cond_0
    add-int/2addr v9, v2

    goto :goto_0

    .line 65
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 67
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v12

    .line 69
    .local v12, "size":J
    const-wide/16 v4, 0x8

    cmp-long v4, v12, v4

    if-gez v4, :cond_2

    const-wide/16 v4, 0x1

    cmp-long v4, v12, v4

    if-lez v4, :cond_2

    .line 70
    sget-object v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->LOG:Ljava/util/logging/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Plausibility check failed: size < 8 (size = "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, "). Stop parsing!"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 71
    const/4 v3, 0x0

    .line 108
    :goto_1
    return-object v3

    .line 75
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->read4cc(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v11

    .line 77
    .local v11, "type":Ljava/lang/String;
    const/16 v16, 0x0

    .line 80
    .local v16, "usertype":[B
    const-wide/16 v4, 0x1

    cmp-long v4, v12, v4

    if-nez v4, :cond_3

    .line 81
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 82
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 83
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 84
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-static {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v12

    .line 85
    const-wide/16 v4, 0x10

    sub-long v6, v12, v4

    .line 92
    .local v6, "contentSize":J
    :goto_2
    const-string v4, "uuid"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 93
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v5}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    add-int/lit8 v5, v5, 0x10

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 94
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    .line 95
    const/16 v4, 0x10

    new-array v0, v4, [B

    move-object/from16 v16, v0

    .line 96
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/lit8 v10, v4, -0x10

    .local v10, "i":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-ge v10, v4, :cond_5

    .line 97
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/lit8 v4, v4, -0x10

    sub-int v5, v10, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-virtual {v4, v10}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    aput-byte v4, v16, v5

    .line 96
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 86
    .end local v6    # "contentSize":J
    .end local v10    # "i":I
    :cond_3
    const-wide/16 v4, 0x0

    cmp-long v4, v12, v4

    if-nez v4, :cond_4

    .line 87
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->size()J

    move-result-wide v4

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v18

    sub-long v6, v4, v18

    .line 88
    .restart local v6    # "contentSize":J
    const-wide/16 v4, 0x8

    add-long v12, v6, v4

    goto/16 :goto_2

    .line 90
    .end local v6    # "contentSize":J
    :cond_4
    const-wide/16 v4, 0x8

    sub-long v6, v12, v4

    .restart local v6    # "contentSize":J
    goto/16 :goto_2

    .line 99
    .restart local v10    # "i":I
    :cond_5
    const-wide/16 v4, 0x10

    sub-long/2addr v6, v4

    .line 101
    .end local v10    # "i":I
    :cond_6
    move-object/from16 v0, p2

    instance-of v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    if-eqz v4, :cond_7

    move-object/from16 v4, p2

    check-cast v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    invoke-interface {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->getType()Ljava/lang/String;

    move-result-object v4

    :goto_4
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v11, v1, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->createBox(Ljava/lang/String;[BLjava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v3

    .line 102
    .local v3, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    move-object/from16 v0, p2

    invoke-interface {v3, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V

    .line 105
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 107
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;->header:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    move-object/from16 v4, p1

    move-object/from16 v8, p0

    invoke-interface/range {v3 .. v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;->parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    goto/16 :goto_1

    .line 101
    .end local v3    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :cond_7
    const-string v4, ""

    goto :goto_4
.end method
