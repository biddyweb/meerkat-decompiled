.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrackFragmentBaseMediaDecodeTimeBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "tfdt"


# instance fields
.field private baseMediaDecodeTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    const-string v0, "tfdt"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 35
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 55
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 56
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 57
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->baseMediaDecodeTime:J

    .line 62
    :goto_0
    return-void

    .line 59
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->baseMediaDecodeTime:J

    goto :goto_0
.end method

.method public getBaseMediaDecodeTime()J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->baseMediaDecodeTime:J

    return-wide v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 45
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 46
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->baseMediaDecodeTime:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 50
    :goto_0
    return-void

    .line 48
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->baseMediaDecodeTime:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 39
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->getVersion()I

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x8

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0xc

    goto :goto_0
.end method

.method public setBaseMediaDecodeTime(J)V
    .locals 1
    .param p1, "baseMediaDecodeTime"    # J

    .prologue
    .line 70
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->baseMediaDecodeTime:J

    .line 71
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TrackFragmentBaseMediaDecodeTimeBox{baseMediaDecodeTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackFragmentBaseMediaDecodeTimeBox;->baseMediaDecodeTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
