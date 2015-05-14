.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "MovieFragmentRandomAccessOffsetBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "mfro"


# instance fields
.field private mfraSize:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const-string v0, "mfro"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 46
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 47
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;->mfraSize:J

    .line 48
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 53
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;->mfraSize:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 54
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 41
    const-wide/16 v0, 0x8

    return-wide v0
.end method

.method public getMfraSize()J
    .locals 2

    .prologue
    .line 57
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;->mfraSize:J

    return-wide v0
.end method

.method public setMfraSize(J)V
    .locals 1
    .param p1, "mfraSize"    # J

    .prologue
    .line 61
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieFragmentRandomAccessOffsetBox;->mfraSize:J

    .line 62
    return-void
.end method
