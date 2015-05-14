.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "PriotityRangeBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "svpr"


# instance fields
.field max_priorityId:I

.field min_priorityId:I

.field reserved1:I

.field reserved2:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 21
    const-string v0, "svpr"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 15
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved1:I

    .line 17
    iput v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved2:I

    .line 22
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 37
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->min_priorityId:I

    .line 38
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->min_priorityId:I

    and-int/lit16 v0, v0, 0xc0

    shr-int/lit8 v0, v0, 0x6

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved1:I

    .line 39
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->min_priorityId:I

    and-int/lit8 v0, v0, 0x3f

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->min_priorityId:I

    .line 40
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->max_priorityId:I

    .line 41
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->max_priorityId:I

    and-int/lit16 v0, v0, 0xc0

    shr-int/lit8 v0, v0, 0x6

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved2:I

    .line 42
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->max_priorityId:I

    and-int/lit8 v0, v0, 0x3f

    iput v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->max_priorityId:I

    .line 43
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 31
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved1:I

    shl-int/lit8 v0, v0, 0x6

    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->min_priorityId:I

    add-int/2addr v0, v1

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 32
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved2:I

    shl-int/lit8 v0, v0, 0x6

    iget v1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->max_priorityId:I

    add-int/2addr v0, v1

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 33
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 26
    const-wide/16 v0, 0x2

    return-wide v0
.end method

.method public getMax_priorityId()I
    .locals 1

    .prologue
    .line 70
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->max_priorityId:I

    return v0
.end method

.method public getMin_priorityId()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->min_priorityId:I

    return v0
.end method

.method public getReserved1()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved1:I

    return v0
.end method

.method public getReserved2()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved2:I

    return v0
.end method

.method public setMax_priorityId(I)V
    .locals 0
    .param p1, "max_priorityId"    # I

    .prologue
    .line 74
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->max_priorityId:I

    .line 75
    return-void
.end method

.method public setMin_priorityId(I)V
    .locals 0
    .param p1, "min_priorityId"    # I

    .prologue
    .line 58
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->min_priorityId:I

    .line 59
    return-void
.end method

.method public setReserved1(I)V
    .locals 0
    .param p1, "reserved1"    # I

    .prologue
    .line 50
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved1:I

    .line 51
    return-void
.end method

.method public setReserved2(I)V
    .locals 0
    .param p1, "reserved2"    # I

    .prologue
    .line 66
    iput p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/PriotityRangeBox;->reserved2:I

    .line 67
    return-void
.end method
