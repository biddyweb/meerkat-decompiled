.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "TrackProductionApertureDimensionsAtom.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "prof"


# instance fields
.field height:D

.field width:D


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "prof"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 22
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 40
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->width:D

    .line 41
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint1616(Ljava/nio/ByteBuffer;)D

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->height:D

    .line 42
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 33
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->width:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 34
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->height:D

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint1616(Ljava/nio/ByteBuffer;D)V

    .line 35
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 27
    const-wide/16 v0, 0xc

    return-wide v0
.end method

.method public getHeight()D
    .locals 2

    .prologue
    .line 53
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->height:D

    return-wide v0
.end method

.method public getWidth()D
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->width:D

    return-wide v0
.end method

.method public setHeight(D)V
    .locals 1
    .param p1, "height"    # D

    .prologue
    .line 57
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->height:D

    .line 58
    return-void
.end method

.method public setWidth(D)V
    .locals 1
    .param p1, "width"    # D

    .prologue
    .line 49
    iput-wide p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackProductionApertureDimensionsAtom;->width:D

    .line 50
    return-void
.end method
