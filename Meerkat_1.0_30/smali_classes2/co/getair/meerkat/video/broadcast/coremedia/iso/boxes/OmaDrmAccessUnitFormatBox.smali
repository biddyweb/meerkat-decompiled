.class public final Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "OmaDrmAccessUnitFormatBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "odaf"


# instance fields
.field private allBits:B

.field private initVectorLength:I

.field private keyIndicatorLength:I

.field private selectiveEncryption:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    const-string v0, "odaf"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 73
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 74
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    int-to-byte v0, v0

    iput-byte v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->allBits:B

    .line 75
    iget-byte v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->allBits:B

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->selectiveEncryption:Z

    .line 76
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->keyIndicatorLength:I

    .line 77
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->initVectorLength:I

    .line 78
    return-void

    .line 75
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 83
    iget-byte v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->allBits:B

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 84
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->keyIndicatorLength:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 85
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->initVectorLength:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 86
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 39
    const-wide/16 v0, 0x7

    return-wide v0
.end method

.method public getInitVectorLength()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->initVectorLength:I

    return v0
.end method

.method public getKeyIndicatorLength()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->keyIndicatorLength:I

    return v0
.end method

.method public isSelectiveEncryption()Z
    .locals 1

    .prologue
    .line 47
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->selectiveEncryption:Z

    return v0
.end method

.method public setAllBits(B)V
    .locals 2
    .param p1, "allBits"    # B

    .prologue
    .line 67
    iput-byte p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->allBits:B

    .line 68
    and-int/lit16 v0, p1, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->selectiveEncryption:Z

    .line 69
    return-void

    .line 68
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setInitVectorLength(I)V
    .locals 0
    .param p1, "initVectorLength"    # I

    .prologue
    .line 59
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->initVectorLength:I

    .line 60
    return-void
.end method

.method public setKeyIndicatorLength(I)V
    .locals 0
    .param p1, "keyIndicatorLength"    # I

    .prologue
    .line 63
    iput p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OmaDrmAccessUnitFormatBox;->keyIndicatorLength:I

    .line 64
    return-void
.end method
