.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrackExtendsBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "trex"


# instance fields
.field private defaultSampleDescriptionIndex:J

.field private defaultSampleDuration:J

.field private defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

.field private defaultSampleSize:J

.field private trackId:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    const-string v0, "trex"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 45
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 64
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 65
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->trackId:J

    .line 66
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDescriptionIndex:J

    .line 67
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDuration:J

    .line 68
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleSize:J

    .line 69
    new-instance v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-direct {v0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 70
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 55
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->trackId:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 56
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDescriptionIndex:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 57
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDuration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 58
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleSize:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 59
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-virtual {v0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->getContent(Ljava/nio/ByteBuffer;)V

    .line 60
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 49
    const-wide/16 v0, 0x18

    return-wide v0
.end method

.method public getDefaultSampleDescriptionIndex()J
    .locals 2

    .prologue
    .line 77
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDescriptionIndex:J

    return-wide v0
.end method

.method public getDefaultSampleDuration()J
    .locals 2

    .prologue
    .line 81
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDuration:J

    return-wide v0
.end method

.method public getDefaultSampleFlags()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    return-object v0
.end method

.method public getDefaultSampleFlagsStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultSampleSize()J
    .locals 2

    .prologue
    .line 85
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleSize:J

    return-wide v0
.end method

.method public getTrackId()J
    .locals 2

    .prologue
    .line 73
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->trackId:J

    return-wide v0
.end method

.method public setDefaultSampleDescriptionIndex(J)V
    .locals 1
    .param p1, "defaultSampleDescriptionIndex"    # J

    .prologue
    .line 101
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDescriptionIndex:J

    .line 102
    return-void
.end method

.method public setDefaultSampleDuration(J)V
    .locals 1
    .param p1, "defaultSampleDuration"    # J

    .prologue
    .line 105
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleDuration:J

    .line 106
    return-void
.end method

.method public setDefaultSampleFlags(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V
    .locals 0
    .param p1, "defaultSampleFlags"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .prologue
    .line 113
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleFlags:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;

    .line 115
    return-void
.end method

.method public setDefaultSampleSize(J)V
    .locals 1
    .param p1, "defaultSampleSize"    # J

    .prologue
    .line 109
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->defaultSampleSize:J

    .line 110
    return-void
.end method

.method public setTrackId(J)V
    .locals 1
    .param p1, "trackId"    # J

    .prologue
    .line 97
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox;->trackId:J

    .line 98
    return-void
.end method
