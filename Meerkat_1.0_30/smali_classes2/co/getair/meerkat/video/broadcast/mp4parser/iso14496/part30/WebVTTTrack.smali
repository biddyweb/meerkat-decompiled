.class public Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "WebVTTTrack.java"


# instance fields
.field sampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;

.field samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field subs:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 8
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 23
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->samples:Ljava/util/List;

    .line 28
    new-instance v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;-><init>()V

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->sampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;

    .line 29
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->sampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;

    new-instance v5, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTConfigurationBox;

    invoke-direct {v5}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTConfigurationBox;-><init>()V

    invoke-virtual {v4, v5}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 30
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->sampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;

    new-instance v5, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;

    invoke-direct {v5}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSourceLabelBox;-><init>()V

    invoke-virtual {v4, v5}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 32
    const-wide/16 v4, 0x0

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->size()J

    move-result-wide v6

    invoke-static {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v6

    int-to-long v6, v6

    invoke-interface {p1, v4, v5, v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->map(JJ)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 33
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->size()J

    move-result-wide v4

    invoke-static {v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v4

    new-array v2, v4, [B

    .line 34
    .local v2, "content":[B
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 35
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert([B)Ljava/lang/String;

    move-result-object v4

    const-string v5, "\\r?\\n"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->subs:[Ljava/lang/String;

    .line 39
    const-string v1, ""

    .line 40
    .local v1, "config":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->subs:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_0

    .line 41
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->subs:[Ljava/lang/String;

    aget-object v5, v5, v3

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 42
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->subs:[Ljava/lang/String;

    add-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->subs:[Ljava/lang/String;

    add-int/lit8 v5, v3, 0x2

    aget-object v4, v4, v5

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 47
    :cond_0
    :goto_1
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->subs:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_1

    .line 48
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/WebVTTTrack;->subs:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 54
    :cond_1
    return-void

    .line 40
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 47
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    return-void
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    new-array v0, v0, [J

    return-object v0
.end method

.method public getSamples()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    return-object v0
.end method
