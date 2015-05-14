.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "MovieExtendsHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "mehd"


# instance fields
.field private fragmentDuration:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    const-string v0, "mehd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 41
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 51
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt64(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->fragmentDuration:J

    .line 52
    return-void

    .line 51
    :cond_0
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    goto :goto_0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 57
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 58
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 59
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->fragmentDuration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt64(Ljava/nio/ByteBuffer;J)V

    .line 63
    :goto_0
    return-void

    .line 61
    :cond_0
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->fragmentDuration:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    goto :goto_0
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 45
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->getVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const-wide/16 v0, 0xc

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x8

    goto :goto_0
.end method

.method public getFragmentDuration()J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->fragmentDuration:J

    return-wide v0
.end method

.method public setFragmentDuration(J)V
    .locals 1
    .param p1, "fragmentDuration"    # J

    .prologue
    .line 70
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsHeaderBox;->fragmentDuration:J

    .line 71
    return-void
.end method
