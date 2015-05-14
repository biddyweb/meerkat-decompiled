.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "AppleGPSCoordinatesBox.java"


# static fields
.field private static final DEFAULT_LANG:I = 0x15c7

.field public static final TYPE:Ljava/lang/String; = "\u00a9xyz"


# instance fields
.field coords:Ljava/lang/String;

.field lang:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "\u00a9xyz"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 16
    const/16 v0, 0x15c7

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->lang:I

    .line 20
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 45
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 46
    .local v1, "length":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v2

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->lang:I

    .line 47
    new-array v0, v1, [B

    .line 48
    .local v0, "bytes":[B
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 49
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert([B)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->coords:Ljava/lang/String;

    .line 50
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->coords:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 39
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->lang:I

    int-to-short v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 40
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->coords:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 41
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->coords:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    int-to-long v0, v0

    return-wide v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->coords:Ljava/lang/String;

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "iso6709String"    # Ljava/lang/String;

    .prologue
    .line 27
    const/16 v0, 0x15c7

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->lang:I

    .line 28
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->coords:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AppleGPSCoordinatesBox["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleGPSCoordinatesBox;->coords:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
