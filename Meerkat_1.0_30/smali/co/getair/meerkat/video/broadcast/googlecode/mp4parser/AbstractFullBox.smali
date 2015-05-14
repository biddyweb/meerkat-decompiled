.class public abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "AbstractFullBox.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/FullBox;


# instance fields
.field private flags:I

.field private version:I


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "userType"    # [B

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;[B)V

    .line 40
    return-void
.end method


# virtual methods
.method public getFlags()I
    .locals 1
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 58
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->isParsed:Z

    if-nez v0, :cond_0

    .line 59
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->parseDetails()V

    .line 61
    :cond_0
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->flags:I

    return v0
.end method

.method public getVersion()I
    .locals 1
    .annotation runtime Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/annotations/DoNotParseDetail;
    .end annotation

    .prologue
    .line 45
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->isParsed:Z

    if-nez v0, :cond_0

    .line 46
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->parseDetails()V

    .line 48
    :cond_0
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->version:I

    return v0
.end method

.method protected final parseVersionAndFlags(Ljava/nio/ByteBuffer;)J
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 76
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->version:I

    .line 77
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt24(Ljava/nio/ByteBuffer;)I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->flags:I

    .line 78
    const-wide/16 v0, 0x4

    return-wide v0
.end method

.method public setFlags(I)V
    .locals 0
    .param p1, "flags"    # I

    .prologue
    .line 65
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->flags:I

    .line 66
    return-void
.end method

.method public setVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 52
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->version:I

    .line 53
    return-void
.end method

.method protected final writeVersionAndFlags(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 82
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->version:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt8(Ljava/nio/ByteBuffer;I)V

    .line 83
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;->flags:I

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt24(Ljava/nio/ByteBuffer;I)V

    .line 84
    return-void
.end method
