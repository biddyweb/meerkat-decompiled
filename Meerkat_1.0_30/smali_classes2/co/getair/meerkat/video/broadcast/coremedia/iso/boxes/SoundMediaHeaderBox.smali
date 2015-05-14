.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;
.source "SoundMediaHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "smhd"


# instance fields
.field private balance:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    const-string v0, "smhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;-><init>(Ljava/lang/String;)V

    .line 34
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 46
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 47
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readFixedPoint88(Ljava/nio/ByteBuffer;)F

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;->balance:F

    .line 48
    invoke-static {p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readUInt16(Ljava/nio/ByteBuffer;)I

    .line 49
    return-void
.end method

.method public getBalance()F
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;->balance:F

    return v0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 54
    iget v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;->balance:F

    float-to-double v0, v0

    invoke-static {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeFixedPoint88(Ljava/nio/ByteBuffer;D)V

    .line 55
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeWriter;->writeUInt16(Ljava/nio/ByteBuffer;I)V

    .line 56
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 41
    const-wide/16 v0, 0x8

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SoundMediaHeaderBox[balance="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SoundMediaHeaderBox;->getBalance()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
