.class public Lcom/google/android/exoplayer/dash/DashChunkSource;
.super Ljava/lang/Object;
.source "DashChunkSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/ChunkSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;,
        Lcom/google/android/exoplayer/dash/DashChunkSource$InitializationLoadable;,
        Lcom/google/android/exoplayer/dash/DashChunkSource$NoAdaptationSetException;
    }
.end annotation


# static fields
.field public static final USE_ALL_TRACKS:I = -0x1


# instance fields
.field private final adaptationSetIndex:I

.field private currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

.field private final evaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

.field private fatalError:Ljava/io/IOException;

.field private finishedCurrentManifest:Z

.field private final formats:[Lcom/google/android/exoplayer/chunk/Format;

.field private final headerBuilder:Ljava/lang/StringBuilder;

.field private lastChunkWasInitialization:Z

.field private final liveEdgeLatencyUs:J

.field private final manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            ">;"
        }
    .end annotation
.end field

.field private final maxHeight:I

.field private final maxWidth:I

.field private final psshInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation
.end field

.field private final representationHolders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final representationIndices:[I

.field private final trackInfo:Lcom/google/android/exoplayer/TrackInfo;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;)V
    .locals 10
    .param p1, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p2, "adaptationSetIndex"    # I
    .param p3, "representationIndices"    # [I
    .param p4, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p5, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    .prologue
    .line 143
    const/4 v2, 0x0

    const-wide/16 v8, 0x0

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V

    .line 144
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;Ljava/util/List;)V
    .locals 6
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Representation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p3, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    invoke-static {p3}, Lcom/google/android/exoplayer/dash/DashChunkSource;->buildManifest(Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;)V

    .line 128
    return-void
.end method

.method public varargs constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;[Lcom/google/android/exoplayer/dash/mpd/Representation;)V
    .locals 6
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p3, "representations"    # [Lcom/google/android/exoplayer/dash/mpd/Representation;

    .prologue
    .line 115
    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->buildManifest(Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V
    .locals 10
    .param p2, "adaptationSetIndex"    # I
    .param p3, "representationIndices"    # [I
    .param p4, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p5, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p6, "liveEdgeLatencyMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            ">;I[I",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p1, "manifestFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;>;"
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    const-wide/16 v0, 0x3e8

    mul-long v8, p6, v0

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer/dash/DashChunkSource;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V

    .line 171
    return-void
.end method

.method private constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V
    .locals 15
    .param p2, "initialManifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p3, "adaptationSetIndex"    # I
    .param p4, "representationIndices"    # [I
    .param p5, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p6, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p7, "liveEdgeLatencyUs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            ">;",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            "I[I",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p1, "manifestFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    move-object/from16 v0, p1

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    .line 178
    move-object/from16 v0, p2

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    .line 179
    move/from16 v0, p3

    iput v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->adaptationSetIndex:I

    .line 180
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationIndices:[I

    .line 181
    move-object/from16 v0, p5

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 182
    move-object/from16 v0, p6

    iput-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    .line 183
    move-wide/from16 v0, p7

    iput-wide v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->liveEdgeLatencyUs:J

    .line 184
    new-instance v9, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    invoke-direct {v9}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;-><init>()V

    iput-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    .line 185
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->headerBuilder:Ljava/lang/StringBuilder;

    .line 187
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move/from16 v0, p3

    invoke-static {v9, v0}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getPsshInfo(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)Ljava/util/Map;

    move-result-object v9

    iput-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->psshInfo:Ljava/util/Map;

    .line 188
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move/from16 v0, p3

    move-object/from16 v1, p4

    invoke-static {v9, v0, v1}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getFilteredRepresentations(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[I)[Lcom/google/android/exoplayer/dash/mpd/Representation;

    move-result-object v8

    .line 190
    .local v8, "representations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    const/4 v9, 0x0

    aget-object v9, v8, v9

    iget-wide v10, v9, Lcom/google/android/exoplayer/dash/mpd/Representation;->periodDurationMs:J

    const-wide/16 v12, -0x1

    cmp-long v9, v10, v12

    if-nez v9, :cond_0

    const-wide/16 v6, -0x1

    .line 192
    .local v6, "periodDurationUs":J
    :goto_0
    new-instance v9, Lcom/google/android/exoplayer/TrackInfo;

    const/4 v10, 0x0

    aget-object v10, v8, v10

    iget-object v10, v10, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v10, v10, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    invoke-direct {v9, v10, v6, v7}, Lcom/google/android/exoplayer/TrackInfo;-><init>(Ljava/lang/String;J)V

    iput-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->trackInfo:Lcom/google/android/exoplayer/TrackInfo;

    .line 194
    array-length v9, v8

    new-array v9, v9, [Lcom/google/android/exoplayer/chunk/Format;

    iput-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    .line 195
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    iput-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationHolders:Ljava/util/HashMap;

    .line 196
    const/4 v5, 0x0

    .line 197
    .local v5, "maxWidth":I
    const/4 v4, 0x0

    .line 198
    .local v4, "maxHeight":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v9, v8

    if-ge v3, v9, :cond_2

    .line 199
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    aget-object v10, v8, v3

    iget-object v10, v10, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    aput-object v10, v9, v3

    .line 200
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    aget-object v9, v9, v3

    iget v9, v9, Lcom/google/android/exoplayer/chunk/Format;->width:I

    invoke-static {v9, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 201
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    aget-object v9, v9, v3

    iget v9, v9, Lcom/google/android/exoplayer/chunk/Format;->height:I

    invoke-static {v9, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 202
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    aget-object v9, v9, v3

    iget-object v9, v9, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    invoke-direct {p0, v9}, Lcom/google/android/exoplayer/dash/DashChunkSource;->mimeTypeIsWebm(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    new-instance v2, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;

    invoke-direct {v2}, Lcom/google/android/exoplayer/chunk/parser/webm/WebmExtractor;-><init>()V

    .line 204
    .local v2, "extractor":Lcom/google/android/exoplayer/chunk/parser/Extractor;
    :goto_2
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationHolders:Ljava/util/HashMap;

    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    aget-object v10, v10, v3

    iget-object v10, v10, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    new-instance v11, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    aget-object v12, v8, v3

    invoke-direct {v11, v12, v2}, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;-><init>(Lcom/google/android/exoplayer/dash/mpd/Representation;Lcom/google/android/exoplayer/chunk/parser/Extractor;)V

    invoke-virtual {v9, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 190
    .end local v2    # "extractor":Lcom/google/android/exoplayer/chunk/parser/Extractor;
    .end local v3    # "i":I
    .end local v4    # "maxHeight":I
    .end local v5    # "maxWidth":I
    .end local v6    # "periodDurationUs":J
    :cond_0
    const/4 v9, 0x0

    aget-object v9, v8, v9

    iget-wide v10, v9, Lcom/google/android/exoplayer/dash/mpd/Representation;->periodDurationMs:J

    const-wide/16 v12, 0x3e8

    mul-long v6, v10, v12

    goto :goto_0

    .line 202
    .restart local v3    # "i":I
    .restart local v4    # "maxHeight":I
    .restart local v5    # "maxWidth":I
    .restart local v6    # "periodDurationUs":J
    :cond_1
    new-instance v2, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;

    invoke-direct {v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;-><init>()V

    goto :goto_2

    .line 207
    :cond_2
    iput v5, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->maxWidth:I

    .line 208
    iput v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->maxHeight:I

    .line 209
    iget-object v9, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    new-instance v10, Lcom/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator;

    invoke-direct {v10}, Lcom/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator;-><init>()V

    invoke-static {v9, v10}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 210
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/dash/DashChunkSource;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/dash/DashChunkSource;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationHolders:Ljava/util/HashMap;

    return-object v0
.end method

.method private static buildManifest(Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Representation;",
            ">;)",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;"
        }
    .end annotation

    .prologue
    .line 539
    .local p0, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 540
    .local v18, "firstRepresentation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    new-instance v17, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    const/4 v3, 0x0

    const/4 v4, -0x1

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v3, v4, v1}, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;-><init>(IILjava/util/List;)V

    .line 541
    .local v17, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    new-instance v2, Lcom/google/android/exoplayer/dash/mpd/Period;

    const/4 v3, 0x0

    move-object/from16 v0, v18

    iget-wide v4, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->periodStartMs:J

    move-object/from16 v0, v18

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->periodDurationMs:J

    .line 542
    invoke-static/range {v17 .. v17}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/dash/mpd/Period;-><init>(Ljava/lang/String;JJLjava/util/List;)V

    .line 543
    .local v2, "period":Lcom/google/android/exoplayer/dash/mpd/Period;
    move-object/from16 v0, v18

    iget-wide v4, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->periodDurationMs:J

    move-object/from16 v0, v18

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->periodStartMs:J

    sub-long v6, v4, v8

    .line 544
    .local v6, "duration":J
    new-instance v3, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    const-wide/16 v4, -0x1

    const-wide/16 v8, -0x1

    const/4 v10, 0x0

    const-wide/16 v11, -0x1

    const-wide/16 v13, -0x1

    const/4 v15, 0x0

    .line 545
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v16

    invoke-direct/range {v3 .. v16}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;-><init>(JJJZJJLcom/google/android/exoplayer/dash/mpd/UtcTimingElement;Ljava/util/List;)V

    return-object v3
.end method

.method private static getFilteredRepresentations(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[I)[Lcom/google/android/exoplayer/dash/mpd/Representation;
    .locals 7
    .param p0, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p1, "adaptationSetIndex"    # I
    .param p2, "representationIndices"    # [I

    .prologue
    .line 507
    iget-object v5, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->periods:Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/dash/mpd/Period;

    iget-object v5, v5, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .line 508
    .local v0, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    iget-object v4, v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->representations:Ljava/util/List;

    .line 509
    .local v4, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    if-nez p2, :cond_0

    .line 510
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v1, v5, [Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 511
    .local v1, "filteredRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    invoke-interface {v4, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-object v2, v1

    .line 518
    .end local v1    # "filteredRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    .local v2, "filteredRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    :goto_0
    return-object v2

    .line 514
    .end local v2    # "filteredRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    :cond_0
    array-length v5, p2

    new-array v1, v5, [Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 515
    .restart local v1    # "filteredRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v5, p2

    if-ge v3, v5, :cond_1

    .line 516
    aget v5, p2, v3

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/dash/mpd/Representation;

    aput-object v5, v1, v3

    .line 515
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    move-object v2, v1

    .line 518
    .end local v1    # "filteredRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    .restart local v2    # "filteredRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    goto :goto_0
.end method

.method private getLiveSeekPosition(JZZ)J
    .locals 13
    .param p1, "nowUs"    # J
    .param p3, "indexUnbounded"    # Z
    .param p4, "indexExplicit"    # Z

    .prologue
    .line 484
    if-eqz p3, :cond_1

    .line 485
    iget-object v7, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v8, v7, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->availabilityStartTime:J

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    sub-long v4, p1, v8

    .line 502
    .local v4, "liveEdgeTimestampUs":J
    :cond_0
    :goto_0
    iget-wide v8, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->liveEdgeLatencyUs:J

    sub-long v8, v4, v8

    return-wide v8

    .line 487
    .end local v4    # "liveEdgeTimestampUs":J
    :cond_1
    const-wide/high16 v4, -0x8000000000000000L

    .line 488
    .restart local v4    # "liveEdgeTimestampUs":J
    iget-object v7, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationHolders:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    .line 489
    .local v3, "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    iget-object v6, v3, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    .line 490
    .local v6, "segmentIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    invoke-interface {v6}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum()I

    move-result v2

    .line 491
    .local v2, "lastSegmentNum":I
    invoke-interface {v6, v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v8

    .line 492
    invoke-interface {v6, v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getDurationUs(I)J

    move-result-wide v10

    add-long v0, v8, v10

    .line 493
    .local v0, "indexLiveEdgeTimestampUs":J
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 494
    goto :goto_1

    .line 495
    .end local v0    # "indexLiveEdgeTimestampUs":J
    .end local v2    # "lastSegmentNum":I
    .end local v3    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    .end local v6    # "segmentIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    :cond_2
    if-nez p4, :cond_0

    .line 498
    iget-object v7, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v8, v7, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->availabilityStartTime:J

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    sub-long v8, p1, v8

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    goto :goto_0
.end method

.method private static getPsshInfo(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I)Ljava/util/Map;
    .locals 7
    .param p0, "manifest"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .param p1, "adaptationSetIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
            "I)",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 524
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->periods:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/dash/mpd/Period;

    iget-object v3, v3, Lcom/google/android/exoplayer/dash/mpd/Period;->adaptationSets:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    .line 525
    .local v0, "adaptationSet":Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 534
    :goto_0
    return-object v4

    .line 528
    :cond_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 529
    .local v2, "psshInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;->contentProtections:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    .line 530
    .local v1, "contentProtection":Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
    iget-object v5, v1, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    if-eqz v5, :cond_1

    iget-object v5, v1, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:[B

    if-eqz v5, :cond_1

    .line 531
    iget-object v5, v1, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->uuid:Ljava/util/UUID;

    iget-object v6, v1, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;->data:[B

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 534
    .end local v1    # "contentProtection":Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
    :cond_2
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    move-object v2, v4

    .end local v2    # "psshInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    :cond_3
    move-object v4, v2

    goto :goto_0
.end method

.method private mimeTypeIsWebm(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 401
    const-string v0, "video/webm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "audio/webm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private newInitializationChunk(Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/Representation;Lcom/google/android/exoplayer/chunk/parser/Extractor;Lcom/google/android/exoplayer/upstream/DataSource;I)Lcom/google/android/exoplayer/chunk/Chunk;
    .locals 15
    .param p1, "initializationUri"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p2, "indexUri"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p3, "representation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;
    .param p4, "extractor"    # Lcom/google/android/exoplayer/chunk/parser/Extractor;
    .param p5, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p6, "trigger"    # I

    .prologue
    .line 407
    const/4 v11, 0x2

    .line 408
    .local v11, "expectedExtractorResult":I
    const-wide/16 v12, 0x0

    .line 410
    .local v12, "indexAnchor":J
    if-eqz p1, :cond_2

    .line 413
    or-int/lit8 v11, v11, 0x8

    .line 414
    invoke-virtual/range {p1 .. p2}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->attemptMerge(Lcom/google/android/exoplayer/dash/mpd/RangedUri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v14

    .line 415
    .local v14, "requestUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    if-eqz v14, :cond_1

    .line 416
    or-int/lit8 v11, v11, 0x10

    .line 417
    invoke-interface/range {p4 .. p4}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->hasRelativeIndexOffsets()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 418
    move-object/from16 v0, p2

    iget-wide v4, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    add-long v12, v4, v6

    .line 430
    :cond_0
    :goto_0
    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-virtual {v14}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v3

    iget-wide v4, v14, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    iget-wide v6, v14, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    .line 431
    invoke-virtual/range {p3 .. p3}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v8

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 433
    .local v2, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    new-instance v4, Lcom/google/android/exoplayer/dash/DashChunkSource$InitializationLoadable;

    move-object/from16 v0, p3

    iget-object v9, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object v5, p0

    move-object/from16 v6, p5

    move-object v7, v2

    move/from16 v8, p6

    move-object/from16 v10, p4

    invoke-direct/range {v4 .. v13}, Lcom/google/android/exoplayer/dash/DashChunkSource$InitializationLoadable;-><init>(Lcom/google/android/exoplayer/dash/DashChunkSource;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;ILcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/parser/Extractor;IJ)V

    return-object v4

    .line 421
    .end local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :cond_1
    move-object/from16 v14, p1

    goto :goto_0

    .line 424
    .end local v14    # "requestUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    :cond_2
    move-object/from16 v14, p2

    .line 425
    .restart local v14    # "requestUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    invoke-interface/range {p4 .. p4}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->hasRelativeIndexOffsets()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 426
    move-object/from16 v0, p2

    iget-wide v4, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    add-long v12, v4, v6

    .line 428
    :cond_3
    or-int/lit8 v11, v11, 0x10

    goto :goto_0
.end method

.method private newMediaChunk(Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer/upstream/DataSource;II)Lcom/google/android/exoplayer/chunk/Chunk;
    .locals 26
    .param p1, "representationHolder"    # Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    .param p2, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p3, "segmentNum"    # I
    .param p4, "trigger"    # I

    .prologue
    .line 439
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    move-object/from16 v21, v0

    .line 440
    .local v21, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-object/from16 v22, v0

    .line 442
    .local v22, "segmentIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    move-object/from16 v0, v22

    move/from16 v1, p3

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v24

    .line 443
    .local v24, "startTimeUs":J
    move-object/from16 v0, v22

    move/from16 v1, p3

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getDurationUs(I)J

    move-result-wide v6

    add-long v12, v24, v6

    .line 445
    .local v12, "endTimeUs":J
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v5, v5, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-nez v5, :cond_1

    .line 446
    invoke-interface/range {v22 .. v22}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum()I

    move-result v5

    move/from16 v0, p3

    if-ne v0, v5, :cond_1

    const/16 v20, 0x1

    .line 447
    .local v20, "isLastSegment":Z
    :goto_0
    if-eqz v20, :cond_2

    const/4 v14, -0x1

    .line 450
    .local v14, "nextAbsoluteSegmentNum":I
    :goto_1
    move-object/from16 v0, v22

    move/from16 v1, p3

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentUrl(I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v23

    .line 451
    .local v23, "segmentUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    new-instance v4, Lcom/google/android/exoplayer/upstream/DataSpec;

    invoke-virtual/range {v23 .. v23}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->getUri()Landroid/net/Uri;

    move-result-object v5

    move-object/from16 v0, v23

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->start:J

    move-object/from16 v0, v23

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;->length:J

    .line 452
    invoke-virtual/range {v21 .. v21}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getCacheKey()Ljava/lang/String;

    move-result-object v10

    invoke-direct/range {v4 .. v10}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 454
    .local v4, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, v21

    iget-wide v0, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->presentationTimeOffsetUs:J

    move-wide/from16 v18, v0

    .line 455
    .local v18, "presentationTimeOffsetUs":J
    move-object/from16 v0, v21

    iget-object v5, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v5, v5, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    const-string v6, "text/vtt"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 456
    move-object/from16 v0, p1

    iget-wide v6, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->vttHeaderOffsetUs:J

    cmp-long v5, v6, v18

    if-eqz v5, :cond_0

    .line 458
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->headerBuilder:Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 459
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->headerBuilder:Ljava/lang/StringBuilder;

    const-string v6, "EXO-HEADER"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "OFFSET:"

    .line 460
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v18

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->headerBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    move-object/from16 v0, p1

    iput-object v5, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->vttHeader:[B

    .line 462
    move-wide/from16 v0, v18

    move-object/from16 v2, p1

    iput-wide v0, v2, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->vttHeaderOffsetUs:J

    .line 464
    :cond_0
    new-instance v5, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;

    move-object/from16 v0, v21

    iget-object v8, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    const/4 v9, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->vttHeader:[B

    move-object/from16 v16, v0

    move-object/from16 v6, p2

    move-object v7, v4

    move-wide/from16 v10, v24

    invoke-direct/range {v5 .. v16}, Lcom/google/android/exoplayer/chunk/SingleSampleMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/MediaFormat;[B)V

    .line 467
    :goto_2
    return-object v5

    .line 446
    .end local v4    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v14    # "nextAbsoluteSegmentNum":I
    .end local v18    # "presentationTimeOffsetUs":J
    .end local v20    # "isLastSegment":Z
    .end local v23    # "segmentUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    :cond_1
    const/16 v20, 0x0

    goto/16 :goto_0

    .line 447
    .restart local v20    # "isLastSegment":Z
    :cond_2
    move-object/from16 v0, p1

    iget v5, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    add-int v5, v5, p3

    add-int/lit8 v14, v5, 0x1

    goto/16 :goto_1

    .line 467
    .restart local v4    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .restart local v14    # "nextAbsoluteSegmentNum":I
    .restart local v18    # "presentationTimeOffsetUs":J
    .restart local v23    # "segmentUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    :cond_3
    new-instance v5, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;

    move-object/from16 v0, v21

    iget-object v8, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v0, p1

    iget-object v15, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->psshInfo:Ljava/util/Map;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v6, p2

    move-object v7, v4

    move/from16 v9, p4

    move-wide/from16 v10, v24

    invoke-direct/range {v5 .. v19}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/chunk/parser/Extractor;Ljava/util/Map;ZJ)V

    goto :goto_2
.end method


# virtual methods
.method public continueBuffering(J)V
    .locals 14
    .param p1, "playbackPositionUs"    # J

    .prologue
    .line 242
    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v10, :cond_0

    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v10, v10, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-eqz v10, :cond_0

    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v10, :cond_1

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 246
    :cond_1
    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    .line 247
    .local v4, "newManifest":Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    if-eq v10, v4, :cond_3

    if-eqz v4, :cond_3

    .line 248
    iget v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->adaptationSetIndex:I

    iget-object v11, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationIndices:[I

    invoke-static {v4, v10, v11}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getFilteredRepresentations(Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;I[I)[Lcom/google/android/exoplayer/dash/mpd/Representation;

    move-result-object v5

    .line 250
    .local v5, "newRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    array-length v11, v5

    const/4 v10, 0x0

    :goto_1
    if-ge v10, v11, :cond_2

    aget-object v7, v5, v10

    .line 251
    .local v7, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    iget-object v12, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationHolders:Ljava/util/HashMap;

    iget-object v13, v7, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v13, v13, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    .line 252
    invoke-virtual {v12, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    .line 253
    .local v8, "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    iget-object v6, v8, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    .line 254
    .local v6, "oldIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    invoke-virtual {v7}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-result-object v3

    .line 255
    .local v3, "newIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    invoke-interface {v3}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getFirstSegmentNum()I

    move-result v2

    .line 256
    .local v2, "newFirstSegmentNum":I
    invoke-interface {v3, v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getTimeUs(I)J

    move-result-wide v12

    invoke-interface {v6, v12, v13}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentNum(J)I

    move-result v12

    sub-int v9, v12, v2

    .line 258
    .local v9, "segmentNumShift":I
    iget v12, v8, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    add-int/2addr v12, v9

    iput v12, v8, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    .line 259
    iput-object v3, v8, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    .line 250
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 261
    .end local v2    # "newFirstSegmentNum":I
    .end local v3    # "newIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    .end local v6    # "oldIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    .end local v7    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    .end local v8    # "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    .end local v9    # "segmentNumShift":I
    :cond_2
    iput-object v4, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    .line 262
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->finishedCurrentManifest:Z

    .line 269
    .end local v5    # "newRepresentations":[Lcom/google/android/exoplayer/dash/mpd/Representation;
    :cond_3
    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v0, v10, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->minUpdatePeriod:J

    .line 270
    .local v0, "minUpdatePeriod":J
    const-wide/16 v10, 0x0

    cmp-long v10, v0, v10

    if-nez v10, :cond_4

    .line 271
    const-wide/16 v0, 0x1388

    .line 274
    :cond_4
    iget-boolean v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->finishedCurrentManifest:Z

    if-eqz v10, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    iget-object v12, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    .line 275
    invoke-virtual {v12}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifestLoadTimestamp()J

    move-result-wide v12

    add-long/2addr v12, v0

    cmp-long v10, v10, v12

    if-lez v10, :cond_0

    .line 276
    iget-object v10, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ManifestFetcher;->requestRefresh()V

    goto :goto_0
.end method

.method public disable(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 234
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/FormatEvaluator;->disable()V

    .line 235
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->disable()V

    .line 238
    :cond_0
    return-void
.end method

.method public enable()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    invoke-interface {v0}, Lcom/google/android/exoplayer/chunk/FormatEvaluator;->enable()V

    .line 227
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_0

    .line 228
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->enable()V

    .line 230
    :cond_0
    return-void
.end method

.method public final getChunkOperation(Ljava/util/List;JJLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V
    .locals 30
    .param p2, "seekPositionUs"    # J
    .param p4, "playbackPositionUs"    # J
    .param p6, "out"    # Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;",
            ">;JJ",
            "Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 283
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v4, :cond_1

    .line 284
    const/4 v4, 0x0

    move-object/from16 v0, p6

    iput-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 387
    :cond_0
    :goto_0
    return-void

    .line 288
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v9

    iput v9, v4, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    .line 289
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget-object v4, v4, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    if-eqz v4, :cond_2

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->lastChunkWasInitialization:Z

    if-nez v4, :cond_3

    .line 290
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->formats:[Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    move-object/from16 v5, p1

    move-wide/from16 v6, p4

    invoke-interface/range {v4 .. v9}, Lcom/google/android/exoplayer/chunk/FormatEvaluator;->evaluate(Ljava/util/List;J[Lcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;)V

    .line 292
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget-object v0, v4, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    move-object/from16 v25, v0

    .line 293
    .local v25, "selectedFormat":Lcom/google/android/exoplayer/chunk/Format;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget v4, v4, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    move-object/from16 v0, p6

    iput v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    .line 295
    if-nez v25, :cond_4

    .line 296
    const/4 v4, 0x0

    move-object/from16 v0, p6

    iput-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto :goto_0

    .line 298
    :cond_4
    move-object/from16 v0, p6

    iget v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v9

    if-ne v4, v9, :cond_5

    move-object/from16 v0, p6

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    if-eqz v4, :cond_5

    move-object/from16 v0, p6

    iget-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    iget-object v4, v4, Lcom/google/android/exoplayer/chunk/Chunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v4, v4, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    move-object/from16 v0, v25

    iget-object v9, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    .line 299
    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 305
    :cond_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->representationHolders:Ljava/util/HashMap;

    move-object/from16 v0, v25

    iget-object v9, v0, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    invoke-virtual {v4, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;

    .line 306
    .local v22, "representationHolder":Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;
    move-object/from16 v0, v22

    iget-object v7, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->representation:Lcom/google/android/exoplayer/dash/mpd/Representation;

    .line 307
    .local v7, "selectedRepresentation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSegmentIndex;

    move-object/from16 v23, v0

    .line 308
    .local v23, "segmentIndex":Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    move-object/from16 v0, v22

    iget-object v8, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->extractor:Lcom/google/android/exoplayer/chunk/parser/Extractor;

    .line 310
    .local v8, "extractor":Lcom/google/android/exoplayer/chunk/parser/Extractor;
    const/4 v5, 0x0

    .line 311
    .local v5, "pendingInitializationUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    const/4 v6, 0x0

    .line 313
    .local v6, "pendingIndexUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    invoke-interface {v8}, Lcom/google/android/exoplayer/chunk/parser/Extractor;->getFormat()Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v4

    if-nez v4, :cond_6

    .line 314
    invoke-virtual {v7}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getInitializationUri()Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v5

    .line 316
    :cond_6
    if-nez v23, :cond_7

    .line 317
    invoke-virtual {v7}, Lcom/google/android/exoplayer/dash/mpd/Representation;->getIndexUri()Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v6

    .line 320
    :cond_7
    if-nez v5, :cond_8

    if-eqz v6, :cond_9

    .line 322
    :cond_8
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget v10, v4, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v10}, Lcom/google/android/exoplayer/dash/DashChunkSource;->newInitializationChunk(Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/RangedUri;Lcom/google/android/exoplayer/dash/mpd/Representation;Lcom/google/android/exoplayer/chunk/parser/Extractor;Lcom/google/android/exoplayer/upstream/DataSource;I)Lcom/google/android/exoplayer/chunk/Chunk;

    move-result-object v15

    .line 324
    .local v15, "initializationChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->lastChunkWasInitialization:Z

    .line 325
    move-object/from16 v0, p6

    iput-object v15, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_0

    .line 330
    .end local v15    # "initializationChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v26

    const-wide/16 v28, 0x3e8

    mul-long v20, v26, v28

    .line 332
    .local v20, "nowUs":J
    invoke-interface/range {v23 .. v23}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getFirstSegmentNum()I

    move-result v11

    .line 333
    .local v11, "firstAvailableSegmentNum":I
    invoke-interface/range {v23 .. v23}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getLastSegmentNum()I

    move-result v16

    .line 334
    .local v16, "lastAvailableSegmentNum":I
    const/4 v4, -0x1

    move/from16 v0, v16

    if-ne v0, v4, :cond_d

    const/4 v14, 0x1

    .line 335
    .local v14, "indexUnbounded":Z
    :goto_1
    if-eqz v14, :cond_b

    .line 338
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v0, v4, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->availabilityStartTime:J

    move-wide/from16 v26, v0

    const-wide/16 v28, 0x3e8

    mul-long v26, v26, v28

    sub-long v18, v20, v26

    .line 339
    .local v18, "liveEdgeTimestampUs":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v0, v4, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->timeShiftBufferDepth:J

    move-wide/from16 v26, v0

    const-wide/16 v28, -0x1

    cmp-long v4, v26, v28

    if-eqz v4, :cond_a

    .line 340
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-wide v0, v4, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->timeShiftBufferDepth:J

    move-wide/from16 v26, v0

    const-wide/16 v28, 0x3e8

    mul-long v12, v26, v28

    .line 341
    .local v12, "bufferDepthUs":J
    sub-long v26, v18, v12

    .line 342
    move-object/from16 v0, v23

    move-wide/from16 v1, v26

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentNum(J)I

    move-result v4

    .line 341
    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 346
    .end local v12    # "bufferDepthUs":J
    :cond_a
    move-object/from16 v0, v23

    move-wide/from16 v1, v18

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentNum(J)I

    move-result v4

    add-int/lit8 v16, v4, -0x1

    .line 350
    .end local v18    # "liveEdgeTimestampUs":J
    :cond_b
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 351
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v4, v4, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-eqz v4, :cond_c

    .line 352
    invoke-interface/range {v23 .. v23}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->isExplicit()Z

    move-result v4

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-direct {v0, v1, v2, v14, v4}, Lcom/google/android/exoplayer/dash/DashChunkSource;->getLiveSeekPosition(JZZ)J

    move-result-wide p2

    .line 354
    :cond_c
    move-object/from16 v0, v23

    move-wide/from16 v1, p2

    invoke-interface {v0, v1, v2}, Lcom/google/android/exoplayer/dash/DashSegmentIndex;->getSegmentNum(J)I

    move-result v24

    .line 360
    .local v24, "segmentNum":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->currentManifest:Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    iget-boolean v4, v4, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;->dynamic:Z

    if-eqz v4, :cond_12

    .line 361
    move/from16 v0, v24

    if-ge v0, v11, :cond_f

    .line 363
    new-instance v4, Lcom/google/android/exoplayer/BehindLiveWindowException;

    invoke-direct {v4}, Lcom/google/android/exoplayer/BehindLiveWindowException;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    goto/16 :goto_0

    .line 334
    .end local v14    # "indexUnbounded":Z
    .end local v24    # "segmentNum":I
    :cond_d
    const/4 v14, 0x0

    goto :goto_1

    .line 356
    .restart local v14    # "indexUnbounded":Z
    :cond_e
    move-object/from16 v0, p6

    iget v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/chunk/MediaChunk;

    iget v4, v4, Lcom/google/android/exoplayer/chunk/MediaChunk;->nextChunkIndex:I

    move-object/from16 v0, v22

    iget v9, v0, Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;->segmentNumShift:I

    sub-int v24, v4, v9

    .restart local v24    # "segmentNum":I
    goto :goto_2

    .line 365
    :cond_f
    move/from16 v0, v24

    move/from16 v1, v16

    if-le v0, v1, :cond_11

    .line 369
    if-nez v14, :cond_10

    const/4 v4, 0x1

    :goto_3
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->finishedCurrentManifest:Z

    goto/16 :goto_0

    :cond_10
    const/4 v4, 0x0

    goto :goto_3

    .line 371
    :cond_11
    if-nez v14, :cond_12

    move/from16 v0, v24

    move/from16 v1, v16

    if-ne v0, v1, :cond_12

    .line 374
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->finishedCurrentManifest:Z

    .line 378
    :cond_12
    const/4 v4, -0x1

    move/from16 v0, v24

    if-ne v0, v4, :cond_13

    .line 379
    const/4 v4, 0x0

    move-object/from16 v0, p6

    iput-object v4, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_0

    .line 383
    :cond_13
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget v9, v9, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->trigger:I

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v24

    invoke-direct {v0, v1, v4, v2, v9}, Lcom/google/android/exoplayer/dash/DashChunkSource;->newMediaChunk(Lcom/google/android/exoplayer/dash/DashChunkSource$RepresentationHolder;Lcom/google/android/exoplayer/upstream/DataSource;II)Lcom/google/android/exoplayer/chunk/Chunk;

    move-result-object v17

    .line 385
    .local v17, "nextMediaChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/google/android/exoplayer/dash/DashChunkSource;->lastChunkWasInitialization:Z

    .line 386
    move-object/from16 v0, v17

    move-object/from16 v1, p6

    iput-object v0, v1, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_0
.end method

.method public getError()Ljava/io/IOException;
    .locals 1

    .prologue
    .line 391
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->fatalError:Ljava/io/IOException;

    .line 392
    :goto_0
    return-object v0

    .line 391
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    .line 392
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getError()Ljava/io/IOException;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getMaxVideoDimensions(Lcom/google/android/exoplayer/MediaFormat;)V
    .locals 2
    .param p1, "out"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->trackInfo:Lcom/google/android/exoplayer/TrackInfo;

    iget-object v0, v0, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    const-string v1, "video"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    iget v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->maxWidth:I

    iget v1, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->maxHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->setMaxVideoDimensions(II)V

    .line 217
    :cond_0
    return-void
.end method

.method public final getTrackInfo()Lcom/google/android/exoplayer/TrackInfo;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashChunkSource;->trackInfo:Lcom/google/android/exoplayer/TrackInfo;

    return-object v0
.end method

.method public onChunkLoadError(Lcom/google/android/exoplayer/chunk/Chunk;Ljava/lang/Exception;)V
    .locals 0
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 398
    return-void
.end method
