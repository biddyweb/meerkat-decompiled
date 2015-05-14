.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "BaseMediaInfoAtom.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "gmin"


# instance fields
.field balance:S

.field graphicsMode:S

.field opColorB:I

.field opColorG:I

.field opColorR:I

.field reserved:S


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const v1, 0x8000

    .line 23
    const-string v0, "gmin"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 15
    const/16 v0, 0x40

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->graphicsMode:S

    .line 16
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorR:I

    .line 17
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorG:I

    .line 18
    iput v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorB:I

    .line 24
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 45
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->graphicsMode:S

    .line 46
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorR:I

    .line 47
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorG:I

    .line 48
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorB:I

    .line 49
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->balance:S

    .line 50
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    iput-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->reserved:S

    .line 52
    return-void
.end method

.method public getBalance()S
    .locals 1

    .prologue
    .line 87
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->balance:S

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 34
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->graphicsMode:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 35
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorR:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 36
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorG:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 37
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorB:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 38
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->balance:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 39
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->reserved:S

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 40
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 28
    const-wide/16 v0, 0x10

    return-wide v0
.end method

.method public getGraphicsMode()S
    .locals 1

    .prologue
    .line 55
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->graphicsMode:S

    return v0
.end method

.method public getOpColorB()I
    .locals 1

    .prologue
    .line 79
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorB:I

    return v0
.end method

.method public getOpColorG()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorG:I

    return v0
.end method

.method public getOpColorR()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorR:I

    return v0
.end method

.method public getReserved()S
    .locals 1

    .prologue
    .line 95
    iget-short v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->reserved:S

    return v0
.end method

.method public setBalance(S)V
    .locals 0
    .param p1, "balance"    # S

    .prologue
    .line 91
    iput-short p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->balance:S

    .line 92
    return-void
.end method

.method public setGraphicsMode(S)V
    .locals 0
    .param p1, "graphicsMode"    # S

    .prologue
    .line 59
    iput-short p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->graphicsMode:S

    .line 60
    return-void
.end method

.method public setOpColorB(I)V
    .locals 0
    .param p1, "opColorB"    # I

    .prologue
    .line 83
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorB:I

    .line 84
    return-void
.end method

.method public setOpColorG(I)V
    .locals 0
    .param p1, "opColorG"    # I

    .prologue
    .line 75
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorG:I

    .line 76
    return-void
.end method

.method public setOpColorR(I)V
    .locals 0
    .param p1, "opColorR"    # I

    .prologue
    .line 67
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorR:I

    .line 68
    return-void
.end method

.method public setReserved(S)V
    .locals 0
    .param p1, "reserved"    # S

    .prologue
    .line 99
    iput-short p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->reserved:S

    .line 100
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BaseMediaInfoAtom{graphicsMode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->graphicsMode:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", opColorR="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorR:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", opColorG="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorG:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", opColorB="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->opColorB:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", balance="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->balance:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", reserved="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-short v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/BaseMediaInfoAtom;->reserved:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
