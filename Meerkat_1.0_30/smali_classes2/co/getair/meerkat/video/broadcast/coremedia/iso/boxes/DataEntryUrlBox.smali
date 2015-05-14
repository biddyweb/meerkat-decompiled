.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "DataEntryUrlBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "url "


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    const-string v0, "url "

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 34
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 38
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 39
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/DataEntryUrlBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 45
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 48
    const-wide/16 v0, 0x4

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    const-string v0, "DataEntryUrlBox[]"

    return-object v0
.end method
