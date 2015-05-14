.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "Amf0Track.java"


# instance fields
.field rawSamples:Ljava/util/SortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedMap",
            "<",
            "Ljava/lang/Long;",
            "[B>;"
        }
    .end annotation
.end field

.field private trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "[B>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "rawSamples":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;[B>;"
    const-string v0, "amf0"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 40
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track$1;

    invoke-direct {v0, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->rawSamples:Ljava/util/SortedMap;

    .line 42
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 52
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->rawSamples:Ljava/util/SortedMap;

    .line 53
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 54
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 55
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 56
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    const-string v1, "eng"

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 57
    return-void
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
    .line 69
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
    .line 94
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    const-string v0, "data"

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
    .line 104
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 3

    .prologue
    .line 72
    new-instance v1, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    .line 73
    .local v1, "stsd":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;

    invoke-direct {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;-><init>()V

    .line 74
    .local v0, "amf0":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/adobe/ActionMessageFormat0SampleEntryBox;->setDataReferenceIndex(I)V

    .line 75
    invoke-virtual {v1, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 76
    return-object v1
.end method

.method public getSampleDurations()[J
    .locals 10

    .prologue
    .line 80
    new-instance v3, Ljava/util/LinkedList;

    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->rawSamples:Ljava/util/SortedMap;

    invoke-interface {v9}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-direct {v3, v9}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 81
    .local v3, "keys":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/Long;>;"
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 82
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v9

    new-array v8, v9, [J

    .line 83
    .local v8, "rc":[J
    const-wide/16 v6, 0x0

    .line 84
    .local v6, "lastTimeStamp":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-ge v2, v9, :cond_0

    .line 85
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 86
    .local v4, "key":J
    sub-long v0, v4, v6

    .line 87
    .local v0, "delta":J
    aput-wide v0, v8, v2

    .line 84
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 89
    .end local v0    # "delta":J
    .end local v4    # "key":J
    :cond_0
    return-object v8
.end method

.method public getSamples()Ljava/util/List;
    .locals 5
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
    .line 60
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 61
    .local v1, "samples":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->rawSamples:Ljava/util/SortedMap;

    invoke-interface {v2}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 62
    .local v0, "bytes":[B
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-direct {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/SampleImpl;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 64
    .end local v0    # "bytes":[B
    :cond_0
    return-object v1
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 99
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/Amf0Track;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method
