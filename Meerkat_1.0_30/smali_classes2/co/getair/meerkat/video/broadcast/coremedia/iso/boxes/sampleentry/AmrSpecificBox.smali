.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "AmrSpecificBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "damr"


# instance fields
.field private decoderVersion:I

.field private framesPerSample:I

.field private modeChangePeriod:I

.field private modeSet:I

.field private vendor:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    const-string v0, "damr"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 72
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 73
    .local v0, "v":[B
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 74
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->bytesToFourCC([B)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->vendor:Ljava/lang/String;

    .line 76
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->decoderVersion:I

    .line 77
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->modeSet:I

    .line 78
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->modeChangePeriod:I

    .line 79
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v1

    iput v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->framesPerSample:I

    .line 81
    return-void
.end method

.method public getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 85
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->vendor:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->fourCCtoBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 86
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->decoderVersion:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 87
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->modeSet:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 88
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->modeChangePeriod:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 89
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->framesPerSample:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 90
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 67
    const-wide/16 v0, 0x9

    return-wide v0
.end method

.method public getDecoderVersion()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->decoderVersion:I

    return v0
.end method

.method public getFramesPerSample()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->framesPerSample:I

    return v0
.end method

.method public getModeChangePeriod()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->modeChangePeriod:I

    return v0
.end method

.method public getModeSet()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->modeSet:I

    return v0
.end method

.method public getVendor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->vendor:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "AmrSpecificBox[vendor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->getVendor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    const-string v1, ";decoderVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->getDecoderVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, ";modeSet="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->getModeSet()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, ";modeChangePeriod="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->getModeChangePeriod()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    const-string v1, ";framesPerSample="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AmrSpecificBox;->getFramesPerSample()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
