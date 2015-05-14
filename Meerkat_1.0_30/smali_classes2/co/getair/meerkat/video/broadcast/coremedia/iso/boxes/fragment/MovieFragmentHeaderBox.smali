.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "MovieFragmentHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "mfhd"


# instance fields
.field private sequenceNumber:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    const-string v0, "mfhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 55
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->sequenceNumber:J

    .line 57
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 48
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->sequenceNumber:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 49
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 42
    const-wide/16 v0, 0x8

    return-wide v0
.end method

.method public getSequenceNumber()J
    .locals 2

    .prologue
    .line 60
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->sequenceNumber:J

    return-wide v0
.end method

.method public setSequenceNumber(J)V
    .locals 1
    .param p1, "sequenceNumber"    # J

    .prologue
    .line 64
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->sequenceNumber:J

    .line 65
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MovieFragmentHeaderBox{sequenceNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentHeaderBox;->sequenceNumber:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
