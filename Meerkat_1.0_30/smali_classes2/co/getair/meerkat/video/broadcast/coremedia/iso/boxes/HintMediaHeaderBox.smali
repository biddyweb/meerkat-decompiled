.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;
.source "HintMediaHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "hmhd"


# instance fields
.field private avgBitrate:J

.field private avgPduSize:I

.field private maxBitrate:J

.field private maxPduSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    const-string v0, "hmhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;-><init>(Ljava/lang/String;)V

    .line 40
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 64
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 65
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxPduSize:I

    .line 66
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgPduSize:I

    .line 67
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxBitrate:J

    .line 68
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgBitrate:J

    .line 69
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    .line 71
    return-void
.end method

.method public getAvgBitrate()J
    .locals 2

    .prologue
    .line 55
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgBitrate:J

    return-wide v0
.end method

.method public getAvgPduSize()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgPduSize:I

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 76
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxPduSize:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 77
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgPduSize:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 78
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxBitrate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 79
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgBitrate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 80
    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 81
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 59
    const-wide/16 v0, 0x14

    return-wide v0
.end method

.method public getMaxBitrate()J
    .locals 2

    .prologue
    .line 51
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxBitrate:J

    return-wide v0
.end method

.method public getMaxPduSize()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxPduSize:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HintMediaHeaderBox{maxPduSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxPduSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", avgPduSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgPduSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxBitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->maxBitrate:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", avgBitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/HintMediaHeaderBox;->avgBitrate:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
