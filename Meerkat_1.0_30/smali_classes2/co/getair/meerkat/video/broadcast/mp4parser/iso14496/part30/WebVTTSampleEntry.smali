.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;
.source "WebVTTSampleEntry.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "wvtt"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "wvtt"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;-><init>(Ljava/lang/String;)V

    .line 20
    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 1
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;->getHeader()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 30
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 31
    return-void
.end method

.method public getConfig()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTConfigurationBox;
    .locals 1

    .prologue
    .line 34
    const-string v0, "vttC"

    invoke-static {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTConfigurationBox;

    return-object v0
.end method

.method public getSourceLabel()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;
    .locals 1

    .prologue
    .line 38
    const-string v0, "vlab"

    invoke-static {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;

    return-object v0
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 1
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contentSize"    # J
    .param p5, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-virtual {p0, p1, p3, p4, p5}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;->initContainer(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V

    .line 25
    return-void
.end method
