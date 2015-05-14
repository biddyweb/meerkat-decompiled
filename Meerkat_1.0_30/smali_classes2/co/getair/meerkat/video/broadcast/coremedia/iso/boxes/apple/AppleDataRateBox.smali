.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataRateBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AppleDataRateBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "rmdr"


# instance fields
.field private dataRate:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    const-string v0, "rmdr"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 34
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 42
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataRateBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 43
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    iput-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataRateBox;->dataRate:J

    .line 44
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataRateBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 49
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataRateBox;->dataRate:J

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt32(Ljava/nio/ByteBuffer;J)V

    .line 50
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 37
    const-wide/16 v0, 0x8

    return-wide v0
.end method

.method public getDataRate()J
    .locals 2

    .prologue
    .line 54
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/apple/AppleDataRateBox;->dataRate:J

    return-wide v0
.end method
