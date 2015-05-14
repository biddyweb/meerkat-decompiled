.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;
.source "SubtitleMediaHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "sthd"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    const-string v0, "sthd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;-><init>(Ljava/lang/String;)V

    .line 14
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 23
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubtitleMediaHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 28
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 17
    const-wide/16 v0, 0x4

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    const-string v0, "SubtitleMediaHeaderBox"

    return-object v0
.end method
