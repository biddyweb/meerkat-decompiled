.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;
.source "Avc1ToAvc3TrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;
    }
.end annotation


# instance fields
.field avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

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

.field stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V
    .locals 4
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V

    .line 36
    const-string v2, "avc1"

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 37
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Only avc1 tracks can be converted to avc3 tracks"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 40
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 41
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v2

    invoke-static {v0}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v3

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 42
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;-><init>([B)V

    invoke-direct {v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    .line 43
    .local v1, "isoFile":Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;
    const-string v2, "stsd"

    invoke-static {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 44
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    const-string v3, "avc3"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setType(Ljava/lang/String;)V

    .line 46
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    const-string v3, "avc./avcC"

    invoke-static {v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractContainerBox;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->avcC:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    .line 48
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl$ReplaceSyncSamplesList;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;Ljava/util/List;)V

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->samples:Ljava/util/List;

    .line 49
    return-void
.end method


# virtual methods
.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

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
    .line 56
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Avc1ToAvc3TrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method
