.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;
.source "AppleCoverBox.java"


# static fields
.field private static final IMAGE_TYPE_JPG:I = 0xd

.field private static final IMAGE_TYPE_PNG:I = 0xe


# instance fields
.field private data:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 18
    const-string v0, "covr"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;-><init>(Ljava/lang/String;I)V

    .line 19
    return-void
.end method

.method private setImageData([BI)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "dataType"    # I

    .prologue
    .line 50
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->data:[B

    .line 51
    iput p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->dataType:I

    .line 52
    return-void
.end method


# virtual methods
.method public getCoverData()[B
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->data:[B

    return-object v0
.end method

.method protected getDataLength()I
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->data:[B

    array-length v0, v0

    return v0
.end method

.method protected parseData(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 40
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->data:[B

    .line 41
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->data:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 42
    return-void
.end method

.method public setJpg([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 26
    const/16 v0, 0xd

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->setImageData([BI)V

    .line 27
    return-void
.end method

.method public setPng([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 30
    const/16 v0, 0xe

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->setImageData([BI)V

    .line 31
    return-void
.end method

.method protected writeData()[B
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleCoverBox;->data:[B

    return-object v0
.end method
