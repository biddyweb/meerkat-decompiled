.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "ItemLocationBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;,
        Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;
    }
.end annotation


# static fields
.field public static final TYPE:Ljava/lang/String; = "iloc"


# instance fields
.field public baseOffsetSize:I

.field public indexSize:I

.field public items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;",
            ">;"
        }
    .end annotation
.end field

.field public lengthSize:I

.field public offsetSize:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 72
    const-string v0, "iloc"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 63
    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->offsetSize:I

    .line 64
    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->lengthSize:I

    .line 65
    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->indexSize:I

    .line 67
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->items:Ljava/util/List;

    .line 73
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 102
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 103
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 104
    .local v2, "tmp":I
    ushr-int/lit8 v3, v2, 0x4

    iput v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->offsetSize:I

    .line 105
    and-int/lit8 v3, v2, 0xf

    iput v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->lengthSize:I

    .line 106
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 107
    ushr-int/lit8 v3, v2, 0x4

    iput v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    .line 109
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->getVersion()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 110
    and-int/lit8 v3, v2, 0xf

    iput v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->indexSize:I

    .line 112
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 113
    .local v1, "itemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 114
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->items:Ljava/util/List;

    new-instance v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;

    invoke-direct {v4, p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;Ljava/nio/ByteBuffer;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 116
    :cond_1
    return-void
.end method

.method public createExtent(JJJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;
    .locals 9
    .param p1, "extentOffset"    # J
    .param p3, "extentLength"    # J
    .param p5, "extentIndex"    # J

    .prologue
    .line 286
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;JJJ)V

    return-object v0
.end method

.method createExtent(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;
    .locals 1
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 290
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;Ljava/nio/ByteBuffer;)V

    return-object v0
.end method

.method public createItem(IIIJLjava/util/List;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;
    .locals 10
    .param p1, "itemId"    # I
    .param p2, "constructionMethod"    # I
    .param p3, "dataReferenceIndex"    # I
    .param p4, "baseOffset"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIJ",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;",
            ">;)",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;"
        }
    .end annotation

    .prologue
    .line 161
    .local p6, "extents":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Extent;>;"
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move-wide v6, p4

    move-object/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;IIIJLjava/util/List;)V

    return-object v1
.end method

.method createItem(Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;
    .locals 1
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 165
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;

    invoke-direct {v0, p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;-><init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;Ljava/nio/ByteBuffer;)V

    return-object v0
.end method

.method public getBaseOffsetSize()I
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 87
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 88
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->offsetSize:I

    shl-int/lit8 v1, v1, 0x4

    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->lengthSize:I

    or-int/2addr v1, v2

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->getVersion()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 90
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    shl-int/lit8 v1, v1, 0x4

    iget v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->indexSize:I

    or-int/2addr v1, v2

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 94
    :goto_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 95
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;

    .line 96
    .local v0, "item":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;
    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;->getContent(Ljava/nio/ByteBuffer;)V

    goto :goto_1

    .line 92
    .end local v0    # "item":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;
    :cond_0
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    shl-int/lit8 v1, v1, 0x4

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    goto :goto_0

    .line 98
    :cond_1
    return-void
.end method

.method protected getContentSize()J
    .locals 6

    .prologue
    .line 77
    const-wide/16 v2, 0x8

    .line 78
    .local v2, "size":J
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;

    .line 79
    .local v0, "item":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;->getSize()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 80
    goto :goto_0

    .line 81
    .end local v0    # "item":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;
    :cond_0
    return-wide v2
.end method

.method public getIndexSize()I
    .locals 1

    .prologue
    .line 144
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->indexSize:I

    return v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->items:Ljava/util/List;

    return-object v0
.end method

.method public getLengthSize()I
    .locals 1

    .prologue
    .line 128
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->lengthSize:I

    return v0
.end method

.method public getOffsetSize()I
    .locals 1

    .prologue
    .line 120
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->offsetSize:I

    return v0
.end method

.method public setBaseOffsetSize(I)V
    .locals 0
    .param p1, "baseOffsetSize"    # I

    .prologue
    .line 140
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->baseOffsetSize:I

    .line 141
    return-void
.end method

.method public setIndexSize(I)V
    .locals 0
    .param p1, "indexSize"    # I

    .prologue
    .line 148
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->indexSize:I

    .line 149
    return-void
.end method

.method public setItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 156
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox$Item;>;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->items:Ljava/util/List;

    .line 157
    return-void
.end method

.method public setLengthSize(I)V
    .locals 0
    .param p1, "lengthSize"    # I

    .prologue
    .line 132
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->lengthSize:I

    .line 133
    return-void
.end method

.method public setOffsetSize(I)V
    .locals 0
    .param p1, "offsetSize"    # I

    .prologue
    .line 124
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ItemLocationBox;->offsetSize:I

    .line 125
    return-void
.end method
