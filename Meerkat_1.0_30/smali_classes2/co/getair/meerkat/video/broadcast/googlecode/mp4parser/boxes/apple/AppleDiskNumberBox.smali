.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;
.source "AppleDiskNumberBox.java"


# instance fields
.field a:I

.field b:S


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 10
    const-string v0, "disk"

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
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->a:I

    return v0
.end method

.method public getB()S
    .locals 1

    .prologue
    .line 25
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->b:S

    return v0
.end method

.method protected getDataLength()I
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x6

    return v0
.end method

.method protected parseData(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 42
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->a:I

    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->b:S

    .line 44
    return-void
.end method

.method public setA(I)V
    .locals 0
    .param p1, "a"    # I

    .prologue
    .line 21
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->a:I

    .line 22
    return-void
.end method

.method public setB(S)V
    .locals 0
    .param p1, "b"    # S

    .prologue
    .line 29
    iput-short p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->b:S

    .line 30
    return-void
.end method

.method protected writeData()[B
    .locals 2

    .prologue
    .line 34
    const/4 v1, 0x6

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 35
    .local v0, "bb":Ljava/nio/ByteBuffer;
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->a:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 36
    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDiskNumberBox;->b:S

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 37
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    return-object v1
.end method
