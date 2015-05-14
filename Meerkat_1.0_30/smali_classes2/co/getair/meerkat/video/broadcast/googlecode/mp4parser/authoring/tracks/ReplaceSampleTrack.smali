.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "ReplaceSampleTrack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;
    }
.end annotation


# instance fields
.field origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

.field private sampleContent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

.field private sampleNumber:J

.field private samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;JLjava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "origTrack"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "sampleNumber"    # J
    .param p4, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "replace("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 45
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 46
    iput-wide p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->sampleNumber:J

    .line 47
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;

    invoke-direct {v0, p4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->sampleContent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 48
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$ReplaceASingleEntryList;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack$1;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->samples:Ljava/util/List;

    .line 50
    return-void
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;)J
    .locals 2
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;

    .prologue
    .line 37
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->sampleNumber:J

    return-wide v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;

    .prologue
    .line 37
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->sampleContent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->close()V

    .line 54
    return-void
.end method

.method public getCompositionTimeEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSampleDependencies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getSampleDurations()[J
    .locals 1

    .prologue
    .line 65
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 57
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getSyncSamples()[J
    .locals 1

    .prologue
    .line 74
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/ReplaceSampleTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v0

    return-object v0
.end method
