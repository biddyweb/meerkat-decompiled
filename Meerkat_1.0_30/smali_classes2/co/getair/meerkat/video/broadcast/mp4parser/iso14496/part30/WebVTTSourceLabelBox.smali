.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "WebVTTSourceLabelBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "vlab"


# instance fields
.field sourceLabel:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "vlab"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 20
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 34
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;->sourceLabel:Ljava/lang/String;

    .line 35
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;->sourceLabel:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 30
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 24
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;->sourceLabel:Ljava/lang/String;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getSourceLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;->sourceLabel:Ljava/lang/String;

    return-object v0
.end method

.method public setSourceLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "sourceLabel"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;->sourceLabel:Ljava/lang/String;

    .line 43
    return-void
.end method
