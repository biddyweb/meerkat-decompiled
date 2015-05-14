.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "CleanApertureAtom.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "clef"


# instance fields
.field height:D

.field width:D


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    const-string v0, "clef"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 23
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 41
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->width:D

    .line 42
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->height:D

    .line 43
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 34
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->width:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 35
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->height:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 36
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 28
    const-wide/16 v0, 0xc

    return-wide v0
.end method

.method public getHeight()D
    .locals 2

    .prologue
    .line 54
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->height:D

    return-wide v0
.end method

.method public getWidth()D
    .locals 2

    .prologue
    .line 46
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->width:D

    return-wide v0
.end method

.method public setHeight(D)V
    .locals 1
    .param p1, "height"    # D

    .prologue
    .line 58
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->height:D

    .line 59
    return-void
.end method

.method public setWidth(D)V
    .locals 1
    .param p1, "width"    # D

    .prologue
    .line 50
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/CleanApertureAtom;->width:D

    .line 51
    return-void
.end method
