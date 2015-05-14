.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TfxdBox.java"


# instance fields
.field public fragmentAbsoluteDuration:J

.field public fragmentAbsoluteTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    const-string v0, "uuid"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 41
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 56
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 58
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 59
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteTime:J

    .line 60
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteDuration:J

    .line 65
    :goto_0
    return-void

    .line 62
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteTime:J

    .line 63
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteDuration:J

    goto :goto_0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 69
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 70
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 71
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteTime:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 72
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteDuration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 77
    :goto_0
    return-void

    .line 74
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteTime:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 75
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteDuration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 51
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-wide/16 v0, 0x14

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0xc

    goto :goto_0
.end method

.method public getFragmentAbsoluteDuration()J
    .locals 2

    .prologue
    .line 84
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteDuration:J

    return-wide v0
.end method

.method public getFragmentAbsoluteTime()J
    .locals 2

    .prologue
    .line 80
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/TfxdBox;->fragmentAbsoluteTime:J

    return-wide v0
.end method

.method public getUserType()[B
    .locals 1

    .prologue
    .line 45
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x6dt
        0x1dt
        -0x65t
        0x5t
        0x42t
        -0x2bt
        0x44t
        -0x1at
        -0x80t
        -0x1et
        0x14t
        0x1dt
        -0x51t
        -0x9t
        0x57t
        -0x4et
    .end array-data
.end method
