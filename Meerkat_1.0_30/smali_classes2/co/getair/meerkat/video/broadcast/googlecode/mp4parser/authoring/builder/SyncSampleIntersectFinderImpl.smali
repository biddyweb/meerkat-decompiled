.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;
.super Ljava/lang/Object;
.source "SyncSampleIntersectFinderImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/FragmentIntersectionFinder;


# static fields
.field private static LOG:Ljava/util/logging/Logger;


# instance fields
.field private final minFragmentDurationSeconds:I

.field private movie:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

.field private referenceTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;I)V
    .locals 0
    .param p1, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p2, "referenceTrack"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p3, "minFragmentDurationSeconds"    # I

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->movie:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .line 56
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->referenceTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 57
    iput p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->minFragmentDurationSeconds:I

    .line 58
    return-void
.end method

.method private static calculateTracktimesScalingFactor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)J
    .locals 8
    .param p0, "m"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 283
    const-wide/16 v0, 0x1

    .line 284
    .local v0, "timeScale":J
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 285
    .local v2, "track1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 286
    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v4

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v6

    invoke-virtual {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-eqz v4, :cond_0

    .line 287
    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v4

    invoke-static {v0, v1, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Math;->lcm(JJ)J

    move-result-wide v0

    goto :goto_0

    .line 291
    .end local v2    # "track1":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_1
    return-wide v0
.end method

.method static getFormat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Ljava/lang/String;
    .locals 4
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 61
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v1

    .line 62
    .local v1, "se":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;
    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/SampleEntry;->getType()Ljava/lang/String;

    move-result-object v2

    .line 63
    .local v2, "type":Ljava/lang/String;
    const-string v3, "encv"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "enca"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "encv"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 64
    :cond_0
    const-string v3, "sinf/frma"

    invoke-static {v1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Path;->getPath(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;

    .line 65
    .local v0, "frma":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;
    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->getDataFormat()Ljava/lang/String;

    move-result-object v2

    .line 67
    .end local v0    # "frma":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;
    :cond_1
    return-object v2
.end method

.method public static getSyncSamplesTimestamps(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Ljava/util/List;
    .locals 7
    .param p0, "movie"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            ")",
            "Ljava/util/List",
            "<[J>;"
        }
    .end annotation

    .prologue
    .line 169
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 170
    .local v3, "times":Ljava/util/List;, "Ljava/util/List<[J>;"
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 171
    .local v0, "currentTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 172
    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v1

    .line 173
    .local v1, "currentTrackSyncSamples":[J
    if-eqz v1, :cond_0

    array-length v5, v1

    if-lez v5, :cond_0

    .line 174
    invoke-static {v0, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->getTimes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)[J

    move-result-object v2

    .line 175
    .local v2, "currentTrackTimes":[J
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 179
    .end local v0    # "currentTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .end local v1    # "currentTrackSyncSamples":[J
    .end local v2    # "currentTrackTimes":[J
    :cond_1
    return-object v3
.end method

.method private static getTimes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)[J
    .locals 14
    .param p0, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p1, "m"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    .prologue
    .line 264
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v9

    .line 265
    .local v9, "syncSamples":[J
    array-length v10, v9

    new-array v8, v10, [J

    .line 267
    .local v8, "syncSampleTimes":[J
    const/4 v2, 0x1

    .line 268
    .local v2, "currentSample":I
    const-wide/16 v0, 0x0

    .line 269
    .local v0, "currentDuration":J
    const/4 v4, 0x0

    .line 271
    .local v4, "currentSyncSampleIndex":I
    invoke-static {p1, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->calculateTracktimesScalingFactor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)J

    move-result-wide v6

    .line 273
    .local v6, "scalingFactor":J
    :goto_0
    int-to-long v10, v2

    array-length v12, v9

    add-int/lit8 v12, v12, -0x1

    aget-wide v12, v9, v12

    cmp-long v10, v10, v12

    if-gtz v10, :cond_1

    .line 274
    int-to-long v10, v2

    aget-wide v12, v9, v4

    cmp-long v10, v10, v12

    if-nez v10, :cond_0

    .line 275
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "currentSyncSampleIndex":I
    .local v5, "currentSyncSampleIndex":I
    mul-long v10, v0, v6

    aput-wide v10, v8, v4

    move v4, v5

    .line 277
    .end local v5    # "currentSyncSampleIndex":I
    .restart local v4    # "currentSyncSampleIndex":I
    :cond_0
    invoke-interface {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v10

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "currentSample":I
    .local v3, "currentSample":I
    add-int/lit8 v11, v2, -0x1

    aget-wide v10, v10, v11

    add-long/2addr v0, v10

    move v2, v3

    .end local v3    # "currentSample":I
    .restart local v2    # "currentSample":I
    goto :goto_0

    .line 279
    :cond_1
    return-object v8
.end method


# virtual methods
.method public varargs getCommonIndices([J[JJ[[J)[J
    .locals 29
    .param p1, "syncSamples"    # [J
    .param p2, "syncSampleTimes"    # [J
    .param p3, "timeScale"    # J
    .param p5, "otherTracksTimes"    # [[J

    .prologue
    .line 183
    new-instance v19, Ljava/util/LinkedList;

    invoke-direct/range {v19 .. v19}, Ljava/util/LinkedList;-><init>()V

    .line 184
    .local v19, "nuSyncSamples":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    new-instance v17, Ljava/util/LinkedList;

    invoke-direct/range {v17 .. v17}, Ljava/util/LinkedList;-><init>()V

    .line 187
    .local v17, "nuSyncSampleTimes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v11, v0, :cond_3

    .line 188
    const/4 v10, 0x1

    .line 189
    .local v10, "foundInEveryRef":Z
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v24, v0

    const/16 v22, 0x0

    move/from16 v23, v22

    :goto_1
    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_1

    aget-object v21, p5, v23

    .line 190
    .local v21, "times":[J
    aget-wide v26, p2, v11

    move-object/from16 v0, v21

    move-wide/from16 v1, v26

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v22

    if-ltz v22, :cond_0

    const/16 v22, 0x1

    :goto_2
    and-int v10, v10, v22

    .line 189
    add-int/lit8 v22, v23, 0x1

    move/from16 v23, v22

    goto :goto_1

    .line 190
    :cond_0
    const/16 v22, 0x0

    goto :goto_2

    .line 193
    .end local v21    # "times":[J
    :cond_1
    if-eqz v10, :cond_2

    .line 195
    aget-wide v22, p1, v11

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    aget-wide v22, p2, v11

    invoke-static/range {v22 .. v23}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 204
    .end local v10    # "foundInEveryRef":Z
    :cond_3
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v22

    move/from16 v0, v22

    int-to-double v0, v0

    move-wide/from16 v22, v0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x3fd0000000000000L    # 0.25

    mul-double v24, v24, v26

    cmpg-double v22, v22, v24

    if-gez v22, :cond_6

    .line 205
    const-string v16, ""

    .line 206
    .local v16, "log":Ljava/lang/String;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "%5d - Common:  ["

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 207
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_3
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Long;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    .line 208
    .local v12, "l":J
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v24, "%10d,"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 209
    goto :goto_3

    .line 210
    .end local v12    # "l":J
    :cond_4
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 211
    sget-object v22, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->LOG:Ljava/util/logging/Logger;

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 212
    const-string v16, ""

    .line 214
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "%5d - In    :  ["

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 215
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v23, v0

    const/16 v22, 0x0

    :goto_4
    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_5

    aget-wide v12, p1, v22

    .line 216
    .restart local v12    # "l":J
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "%10d,"

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 215
    add-int/lit8 v22, v22, 0x1

    goto :goto_4

    .line 218
    .end local v12    # "l":J
    :cond_5
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 219
    sget-object v22, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->LOG:Ljava/util/logging/Logger;

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 220
    sget-object v22, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->LOG:Ljava/util/logging/Logger;

    const-string v23, "There are less than 25% of common sync samples in the given track."

    invoke-virtual/range {v22 .. v23}, Ljava/util/logging/Logger;->warning(Ljava/lang/String;)V

    .line 221
    new-instance v22, Ljava/lang/RuntimeException;

    const-string v23, "There are less than 25% of common sync samples in the given track."

    invoke-direct/range {v22 .. v23}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 222
    .end local v16    # "log":Ljava/lang/String;
    :cond_6
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v22

    move/from16 v0, v22

    int-to-double v0, v0

    move-wide/from16 v22, v0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x3fe0000000000000L    # 0.5

    mul-double v24, v24, v26

    cmpg-double v22, v22, v24

    if-gez v22, :cond_a

    .line 223
    sget-object v22, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->LOG:Ljava/util/logging/Logger;

    const-string v23, "There are less than 50% of common sync samples in the given track. This is implausible but I\'m ok to continue."

    invoke-virtual/range {v22 .. v23}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 230
    :cond_7
    :goto_5
    new-instance v9, Ljava/util/LinkedList;

    invoke-direct {v9}, Ljava/util/LinkedList;-><init>()V

    .line 232
    .local v9, "finalSampleList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    move-object/from16 v0, p0

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->minFragmentDurationSeconds:I

    move/from16 v22, v0

    if-lez v22, :cond_b

    .line 235
    const-wide/16 v14, -0x1

    .line 236
    .local v14, "lastSyncSampleTime":J
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .line 237
    .local v20, "nuSyncSamplesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .line 238
    .local v18, "nuSyncSampleTimesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    :cond_8
    :goto_6
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_c

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_c

    .line 239
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Long;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 240
    .local v4, "curSyncSample":J
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Long;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 241
    .local v6, "curSyncSampleTime":J
    const-wide/16 v22, -0x1

    cmp-long v22, v14, v22

    if-eqz v22, :cond_9

    sub-long v22, v6, v14

    div-long v22, v22, p3

    move-object/from16 v0, p0

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->minFragmentDurationSeconds:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    cmp-long v22, v22, v24

    if-ltz v22, :cond_8

    .line 242
    :cond_9
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    move-wide v14, v6

    goto :goto_6

    .line 224
    .end local v4    # "curSyncSample":J
    .end local v6    # "curSyncSampleTime":J
    .end local v9    # "finalSampleList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .end local v14    # "lastSyncSampleTime":J
    .end local v18    # "nuSyncSampleTimesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    .end local v20    # "nuSyncSamplesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    :cond_a
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v22

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_7

    .line 225
    sget-object v22, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->LOG:Ljava/util/logging/Logger;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Common SyncSample positions vs. this tracks SyncSample positions: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " vs. "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 249
    .restart local v9    # "finalSampleList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    :cond_b
    move-object/from16 v9, v19

    .line 254
    :cond_c
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v22

    move/from16 v0, v22

    new-array v8, v0, [J

    .line 255
    .local v8, "finalSampleArray":[J
    const/4 v11, 0x0

    :goto_7
    array-length v0, v8

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v11, v0, :cond_d

    .line 256
    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Long;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v22

    aput-wide v22, v8, v11

    .line 255
    add-int/lit8 v11, v11, 0x1

    goto :goto_7

    .line 258
    :cond_d
    return-object v8
.end method

.method public sampleNumbers(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)[J
    .locals 30
    .param p1, "track"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .prologue
    .line 80
    const-string v3, "vide"

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 81
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_1

    .line 82
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->movie:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    move-object/from16 v0, p1

    invoke-static {v3, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->getSyncSamplesTimestamps(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Ljava/util/List;

    move-result-object v27

    .line 83
    .local v27, "times":Ljava/util/List;, "Ljava/util/List<[J>;"
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->movie:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->getTimes(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;)[J

    move-result-object v5

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v6

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [[J

    move-object/from16 v0, v27

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [[J

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v8}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->getCommonIndices([J[JJ[[J)[J

    move-result-object v17

    .line 152
    .end local v27    # "times":Ljava/util/List;, "Ljava/util/List<[J>;"
    :cond_0
    return-object v17

    .line 85
    :cond_1
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Video Tracks need sync samples. Only tracks other than video may have no sync samples."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 87
    :cond_2
    const-string v3, "soun"

    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 88
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->referenceTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    if-nez v3, :cond_4

    .line 89
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->movie:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 90
    .local v9, "candidate":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v4

    if-eqz v4, :cond_3

    const-string v4, "vide"

    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v4

    array-length v4, v4

    if-lez v4, :cond_3

    .line 91
    move-object/from16 v0, p0

    iput-object v9, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->referenceTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    goto :goto_0

    .line 95
    .end local v9    # "candidate":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->referenceTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    if-eqz v3, :cond_8

    .line 98
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->referenceTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->sampleNumbers(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)[J

    move-result-object v16

    .line 100
    .local v16, "refSyncSamples":[J
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->referenceTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v13

    .line 102
    .local v13, "refSampleCount":I
    move-object/from16 v0, v16

    array-length v3, v0

    new-array v0, v3, [J

    move-object/from16 v17, v0

    .line 103
    .local v17, "syncSamples":[J
    const-wide/32 v14, 0x2ee00

    .line 104
    .local v14, "minSampleRate":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->movie:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 105
    .local v26, "testTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-static/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->getFormat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->getFormat(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 106
    invoke-interface/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v4

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    .line 107
    .local v2, "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v4

    cmp-long v4, v4, v14

    if-gez v4, :cond_5

    .line 108
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v14

    .line 109
    invoke-interface/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    int-to-long v0, v3

    move-wide/from16 v20, v0

    .line 110
    .local v20, "sc":J
    move-wide/from16 v0, v20

    long-to-double v4, v0

    int-to-double v6, v13

    div-double v24, v4, v6

    .line 112
    .local v24, "stretch":D
    invoke-interface/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v3

    const/4 v4, 0x0

    aget-wide v18, v3, v4

    .line 114
    .local v18, "samplesPerFrame":J
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1
    move-object/from16 v0, v17

    array-length v3, v0

    if-ge v12, v3, :cond_6

    .line 115
    aget-wide v4, v16, v12

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    long-to-double v4, v4

    mul-double v4, v4, v24

    move-wide/from16 v0, v18

    long-to-double v6, v0

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-long v0, v4

    move-wide/from16 v22, v0

    .line 116
    .local v22, "start":J
    aput-wide v22, v17, v12

    .line 114
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 123
    .end local v2    # "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    .end local v12    # "i":I
    .end local v18    # "samplesPerFrame":J
    .end local v20    # "sc":J
    .end local v22    # "start":J
    .end local v24    # "stretch":D
    .end local v26    # "testTrack":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    :cond_6
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v3

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    .line 125
    .restart local v2    # "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v3

    const/4 v4, 0x0

    aget-wide v18, v3, v4

    .line 126
    .restart local v18    # "samplesPerFrame":J
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->getSampleRate()J

    move-result-wide v4

    long-to-double v4, v4

    long-to-double v6, v14

    div-double v10, v4, v6

    .line 127
    .local v10, "factor":D
    invoke-static {v10, v11}, Ljava/lang/Math;->rint(D)D

    move-result-wide v4

    cmpl-double v3, v10, v4

    if-eqz v3, :cond_7

    .line 128
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Sample rates must be a multiple of the lowest sample rate to create a correct file!"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 130
    :cond_7
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_2
    move-object/from16 v0, v17

    array-length v3, v0

    if-ge v12, v3, :cond_0

    .line 131
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    aget-wide v6, v17, v12

    long-to-double v6, v6

    mul-double/2addr v6, v10

    move-wide/from16 v0, v18

    long-to-double v0, v0

    move-wide/from16 v28, v0

    div-double v6, v6, v28

    add-double/2addr v4, v6

    double-to-long v4, v4

    aput-wide v4, v17, v12

    .line 130
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 135
    .end local v2    # "ase":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    .end local v10    # "factor":D
    .end local v12    # "i":I
    .end local v13    # "refSampleCount":I
    .end local v14    # "minSampleRate":J
    .end local v16    # "refSyncSamples":[J
    .end local v17    # "syncSamples":[J
    .end local v18    # "samplesPerFrame":J
    :cond_8
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "There was absolutely no Track with sync samples. I can\'t work with that!"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 138
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->movie:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 139
    .restart local v9    # "candidate":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v4

    if-eqz v4, :cond_a

    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v4

    array-length v4, v4

    if-lez v4, :cond_a

    .line 140
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/builder/SyncSampleIntersectFinderImpl;->sampleNumbers(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)[J

    move-result-object v16

    .line 141
    .restart local v16    # "refSyncSamples":[J
    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v13

    .line 143
    .restart local v13    # "refSampleCount":I
    move-object/from16 v0, v16

    array-length v3, v0

    new-array v0, v3, [J

    move-object/from16 v17, v0

    .line 144
    .restart local v17    # "syncSamples":[J
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    int-to-long v0, v3

    move-wide/from16 v20, v0

    .line 145
    .restart local v20    # "sc":J
    move-wide/from16 v0, v20

    long-to-double v4, v0

    int-to-double v6, v13

    div-double v24, v4, v6

    .line 147
    .restart local v24    # "stretch":D
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_3
    move-object/from16 v0, v17

    array-length v3, v0

    if-ge v12, v3, :cond_0

    .line 148
    aget-wide v4, v16, v12

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    long-to-double v4, v4

    mul-double v4, v4, v24

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-long v4, v4

    const-wide/16 v6, 0x1

    add-long v22, v4, v6

    .line 149
    .restart local v22    # "start":J
    aput-wide v22, v17, v12

    .line 147
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 155
    .end local v9    # "candidate":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .end local v12    # "i":I
    .end local v13    # "refSampleCount":I
    .end local v16    # "refSyncSamples":[J
    .end local v17    # "syncSamples":[J
    .end local v20    # "sc":J
    .end local v22    # "start":J
    .end local v24    # "stretch":D
    :cond_b
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "There was absolutely no Track with sync samples. I can\'t work with that!"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
