.class public interface abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
.super Ljava/lang/Object;
.source "Track.java"

# interfaces
.implements Ljava/io/Closeable;


# virtual methods
.method public abstract getCompositionTimeEntries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDuration()J
.end method

.method public abstract getEdits()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getHandler()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getSampleDependencies()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
.end method

.method public abstract getSampleDurations()[J
.end method

.method public abstract getSampleGroups()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            "[J>;"
        }
    .end annotation
.end method

.method public abstract getSamples()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
.end method

.method public abstract getSyncSamples()[J
.end method

.method public abstract getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
.end method
