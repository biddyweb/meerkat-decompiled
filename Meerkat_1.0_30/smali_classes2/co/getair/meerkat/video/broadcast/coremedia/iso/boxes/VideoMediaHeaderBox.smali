.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;
.source "VideoMediaHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "vmhd"


# instance fields
.field private graphicsmode:I

.field private opcolor:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    const-string v0, "vmhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;-><init>(Ljava/lang/String;)V

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->graphicsmode:I

    .line 31
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->opcolor:[I

    .line 36
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->setFlags(I)V

    .line 37
    return-void

    .line 31
    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v3, 0x3

    .line 54
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 55
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->graphicsmode:I

    .line 56
    new-array v1, v3, [I

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->opcolor:[I

    .line 57
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 58
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->opcolor:[I

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v2

    aput v2, v1, v0

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 60
    :cond_0
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 64
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 65
    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->graphicsmode:I

    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 66
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->opcolor:[I

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget v0, v2, v1

    .line 67
    .local v0, "anOpcolor":I
    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 66
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 69
    .end local v0    # "anOpcolor":I
    :cond_0
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 48
    const-wide/16 v0, 0xc

    return-wide v0
.end method

.method public getGraphicsmode()I
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->graphicsmode:I

    return v0
.end method

.method public getOpcolor()[I
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->opcolor:[I

    return-object v0
.end method

.method public setGraphicsmode(I)V
    .locals 0
    .param p1, "graphicsmode"    # I

    .prologue
    .line 80
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->graphicsmode:I

    .line 81
    return-void
.end method

.method public setOpcolor([I)V
    .locals 0
    .param p1, "opcolor"    # [I

    .prologue
    .line 76
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->opcolor:[I

    .line 77
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "VideoMediaHeaderBox[graphicsmode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->getGraphicsmode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";opcolor0="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->getOpcolor()[I

    move-result-object v1

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";opcolor1="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->getOpcolor()[I

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";opcolor2="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/VideoMediaHeaderBox;->getOpcolor()[I

    move-result-object v1

    const/4 v2, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
