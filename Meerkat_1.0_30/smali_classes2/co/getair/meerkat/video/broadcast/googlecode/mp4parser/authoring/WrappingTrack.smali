.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;
.super Ljava/lang/Object;
.source "WrappingTrack.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;


# instance fields
.field parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)V
    .locals 0
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 22
    return-void
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
    .line 73
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->close()V

    .line 74
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
    .line 37
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getEdits()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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
    .line 45
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v0

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v0

    return-object v0
.end method

.method public getSampleGroups()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            "[J>;"
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleGroups()Ljava/util/Map;

    move-result-object v0

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
    .line 57
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-result-object v0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/WrappingTrack;->parent:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v0

    return-object v0
.end method
