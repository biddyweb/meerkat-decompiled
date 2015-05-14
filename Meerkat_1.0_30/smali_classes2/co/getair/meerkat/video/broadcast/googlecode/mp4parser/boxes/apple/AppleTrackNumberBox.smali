.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;
.source "AppleTrackNumberBox.java"


# instance fields
.field a:I

.field b:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 10
    const-string v0, "trkn"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;-><init>(Ljava/lang/String;I)V

    .line 11
    return-void
.end method


# virtual methods
.method public getA()I
    .locals 1

    .prologue
    .line 17
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->a:I

    return v0
.end method

.method public getB()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->b:I

    return v0
.end method

.method protected getDataLength()I
    .locals 1

    .prologue
    .line 48
    const/16 v0, 0x8

    return v0
.end method

.method protected parseData(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 42
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->a:I

    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->b:I

    .line 44
    return-void
.end method

.method public setA(I)V
    .locals 0
    .param p1, "a"    # I

    .prologue
    .line 21
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->a:I

    .line 22
    return-void
.end method

.method public setB(I)V
    .locals 0
    .param p1, "b"    # I

    .prologue
    .line 29
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->b:I

    .line 30
    return-void
.end method

.method protected writeData()[B
    .locals 2

    .prologue
    .line 34
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 35
    .local v0, "bb":Ljava/nio/ByteBuffer;
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->a:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 36
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleTrackNumberBox;->b:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 37
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method
