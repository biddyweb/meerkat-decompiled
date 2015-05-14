.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "GenericMediaHeaderTextAtom.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "text"


# instance fields
.field unknown_1:I

.field unknown_2:I

.field unknown_3:I

.field unknown_4:I

.field unknown_5:I

.field unknown_6:I

.field unknown_7:I

.field unknown_8:I

.field unknown_9:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/high16 v1, 0x10000

    .line 26
    const-string v0, "text"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 15
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_1:I

    .line 19
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_5:I

    .line 23
    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_9:I

    .line 27
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 49
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_1:I

    .line 50
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_2:I

    .line 51
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_3:I

    .line 52
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_4:I

    .line 53
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_5:I

    .line 54
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_6:I

    .line 55
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_7:I

    .line 56
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_8:I

    .line 57
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_9:I

    .line 58
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 36
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_1:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 37
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_2:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 38
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_3:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 39
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_4:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 40
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_5:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 41
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_6:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 42
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_7:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 43
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_8:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 44
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_9:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 45
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 31
    const-wide/16 v0, 0x24

    return-wide v0
.end method

.method public getUnknown_1()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_1:I

    return v0
.end method

.method public getUnknown_2()I
    .locals 1

    .prologue
    .line 69
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_2:I

    return v0
.end method

.method public getUnknown_3()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_3:I

    return v0
.end method

.method public getUnknown_4()I
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_4:I

    return v0
.end method

.method public getUnknown_5()I
    .locals 1

    .prologue
    .line 93
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_5:I

    return v0
.end method

.method public getUnknown_6()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_6:I

    return v0
.end method

.method public getUnknown_7()I
    .locals 1

    .prologue
    .line 109
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_7:I

    return v0
.end method

.method public getUnknown_8()I
    .locals 1

    .prologue
    .line 117
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_8:I

    return v0
.end method

.method public getUnknown_9()I
    .locals 1

    .prologue
    .line 125
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_9:I

    return v0
.end method

.method public setUnknown_1(I)V
    .locals 0
    .param p1, "unknown_1"    # I

    .prologue
    .line 65
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_1:I

    .line 66
    return-void
.end method

.method public setUnknown_2(I)V
    .locals 0
    .param p1, "unknown_2"    # I

    .prologue
    .line 73
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_2:I

    .line 74
    return-void
.end method

.method public setUnknown_3(I)V
    .locals 0
    .param p1, "unknown_3"    # I

    .prologue
    .line 81
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_3:I

    .line 82
    return-void
.end method

.method public setUnknown_4(I)V
    .locals 0
    .param p1, "unknown_4"    # I

    .prologue
    .line 89
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_4:I

    .line 90
    return-void
.end method

.method public setUnknown_5(I)V
    .locals 0
    .param p1, "unknown_5"    # I

    .prologue
    .line 97
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_5:I

    .line 98
    return-void
.end method

.method public setUnknown_6(I)V
    .locals 0
    .param p1, "unknown_6"    # I

    .prologue
    .line 105
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_6:I

    .line 106
    return-void
.end method

.method public setUnknown_7(I)V
    .locals 0
    .param p1, "unknown_7"    # I

    .prologue
    .line 113
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_7:I

    .line 114
    return-void
.end method

.method public setUnknown_8(I)V
    .locals 0
    .param p1, "unknown_8"    # I

    .prologue
    .line 121
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_8:I

    .line 122
    return-void
.end method

.method public setUnknown_9(I)V
    .locals 0
    .param p1, "unknown_9"    # I

    .prologue
    .line 129
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/GenericMediaHeaderTextAtom;->unknown_9:I

    .line 130
    return-void
.end method
