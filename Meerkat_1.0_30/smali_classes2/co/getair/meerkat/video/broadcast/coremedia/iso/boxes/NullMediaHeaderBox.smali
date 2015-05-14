.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;
.source "NullMediaHeaderBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "nmhd"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    const-string v0, "nmhd"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/AbstractMediaHeaderBox;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 40
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/NullMediaHeaderBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 45
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 34
    const-wide/16 v0, 0x4

    return-wide v0
.end method
