.class public Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;
.super Ljava/lang/Object;
.source "SmoothStreamingChunkSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/ChunkSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;
    }
.end annotation


# static fields
.field private static final INITIALIZATION_VECTOR_SIZE:I = 0x8

.field private static final MINIMUM_MANIFEST_REFRESH_PERIOD_MS:I = 0x1388


# instance fields
.field private currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

.field private currentManifestChunkOffset:I

.field private final dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private final evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

.field private final extractors:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;",
            ">;"
        }
    .end annotation
.end field

.field private fatalError:Ljava/io/IOException;

.field private finishedCurrentManifest:Z

.field private final formatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

.field private final formats:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

.field private final liveEdgeLatencyUs:J

.field private final manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;",
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

.field private final streamElementIndex:I

.field private final trackInfo:Lcom/google/android/exoplayer/TrackInfo;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;)V
    .locals 10
    .param p1, "manifest"    # Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
    .param p2, "streamElementIndex"    # I
    .param p3, "trackIndices"    # [I
    .param p4, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p5, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    .prologue
    .line 123
    const/4 v2, 0x0

    const-wide/16 v8, 0x0

    move-object v1, p0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V

    .line 124
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V
    .locals 10
    .param p2, "streamElementIndex"    # I
    .param p3, "trackIndices"    # [I
    .param p4, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p5, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p6, "liveEdgeLatencyMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;",
            ">;I[I",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "manifestFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;>;"
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    move-object v1, p0

    move-object v2, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-wide/from16 v8, p6

    invoke-direct/range {v1 .. v9}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;-><init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V

    .line 108
    return-void
.end method

.method private constructor <init>(Lcom/google/android/exoplayer/util/ManifestFetcher;Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;I[ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/chunk/FormatEvaluator;J)V
    .locals 27
    .param p2, "initialManifest"    # Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
    .param p3, "streamElementIndex"    # I
    .param p4, "trackIndices"    # [I
    .param p5, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p6, "formatEvaluator"    # Lcom/google/android/exoplayer/chunk/FormatEvaluator;
    .param p7, "liveEdgeLatencyMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/util/ManifestFetcher",
            "<",
            "Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;",
            ">;",
            "Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;",
            "I[I",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "Lcom/google/android/exoplayer/chunk/FormatEvaluator;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "manifestFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 129
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    .line 130
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->streamElementIndex:I

    .line 131
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    .line 132
    move-object/from16 v0, p5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 133
    move-object/from16 v0, p6

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->formatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    .line 134
    const-wide/16 v2, 0x3e8

    mul-long v2, v2, p7

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->liveEdgeLatencyUs:J

    .line 136
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->getElement(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;)Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    move-result-object v24

    .line 137
    .local v24, "streamElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    new-instance v2, Lcom/google/android/exoplayer/TrackInfo;

    move-object/from16 v0, v24

    iget-object v3, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    iget-object v3, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->mimeType:Ljava/lang/String;

    move-object/from16 v0, p2

    iget-wide v4, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->durationUs:J

    invoke-direct {v2, v3, v4, v5}, Lcom/google/android/exoplayer/TrackInfo;-><init>(Ljava/lang/String;J)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->trackInfo:Lcom/google/android/exoplayer/TrackInfo;

    .line 138
    new-instance v2, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    invoke-direct {v2}, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    .line 140
    const/16 v17, 0x0

    .line 141
    .local v17, "trackEncryptionBoxes":[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->protectionElement:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;

    move-object/from16 v23, v0

    .line 142
    .local v23, "protectionElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;
    if-eqz v23, :cond_0

    .line 143
    move-object/from16 v0, v23

    iget-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;->data:[B

    invoke-static {v2}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->getKeyId([B)[B

    move-result-object v20

    .line 144
    .local v20, "keyId":[B
    const/4 v2, 0x1

    new-array v0, v2, [Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    move-object/from16 v17, v0

    .line 145
    const/4 v2, 0x0

    new-instance v3, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    const/4 v4, 0x1

    const/16 v5, 0x8

    move-object/from16 v0, v20

    invoke-direct {v3, v4, v5, v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;-><init>(ZI[B)V

    aput-object v3, v17, v2

    .line 146
    move-object/from16 v0, v23

    iget-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;->uuid:Ljava/util/UUID;

    move-object/from16 v0, v23

    iget-object v3, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$ProtectionElement;->data:[B

    invoke-static {v2, v3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->psshInfo:Ljava/util/Map;

    .line 151
    .end local v20    # "keyId":[B
    :goto_0
    if-eqz p4, :cond_1

    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v25, v0

    .line 152
    .local v25, "trackCount":I
    :goto_1
    move/from16 v0, v25

    new-array v2, v0, [Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->formats:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

    .line 153
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->extractors:Landroid/util/SparseArray;

    .line 154
    const/16 v22, 0x0

    .line 155
    .local v22, "maxWidth":I
    const/16 v21, 0x0

    .line 156
    .local v21, "maxHeight":I
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_2
    move/from16 v0, v19

    move/from16 v1, v25

    if-ge v0, v1, :cond_4

    .line 157
    if-eqz p4, :cond_2

    aget v10, p4, v19

    .line 158
    .local v10, "trackIndex":I
    :goto_3
    move-object/from16 v0, v24

    iget-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    aget-object v26, v2, v10

    .line 159
    .local v26, "trackElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->formats:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

    new-instance v2, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->mimeType:Ljava/lang/String;

    move-object/from16 v0, v26

    iget v5, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxWidth:I

    move-object/from16 v0, v26

    iget v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxHeight:I

    move-object/from16 v0, v26

    iget v7, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->numChannels:I

    move-object/from16 v0, v26

    iget v8, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->sampleRate:I

    move-object/from16 v0, v26

    iget v9, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->bitrate:I

    invoke-direct/range {v2 .. v10}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;-><init>(Ljava/lang/String;Ljava/lang/String;IIIIII)V

    aput-object v2, v12, v19

    .line 162
    move-object/from16 v0, v26

    iget v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxWidth:I

    move/from16 v0, v22

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v22

    .line 163
    move-object/from16 v0, v26

    iget v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxHeight:I

    move/from16 v0, v21

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v21

    .line 165
    move-object/from16 v0, v24

    invoke-static {v0, v10}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->getMediaFormat(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;I)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v16

    .line 166
    .local v16, "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    move-object/from16 v0, v24

    iget v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->type:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    const v11, 0x76696465

    .line 168
    .local v11, "trackType":I
    :goto_4
    new-instance v18, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;

    const/4 v2, 0x1

    move-object/from16 v0, v18

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;-><init>(I)V

    .line 170
    .local v18, "extractor":Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;
    new-instance v9, Lcom/google/android/exoplayer/mp4/Track;

    move-object/from16 v0, v24

    iget-wide v12, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->timescale:J

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->durationUs:J

    invoke-direct/range {v9 .. v17}, Lcom/google/android/exoplayer/mp4/Track;-><init>(IIJJLcom/google/android/exoplayer/MediaFormat;[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;)V

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->setTrack(Lcom/google/android/exoplayer/mp4/Track;)V

    .line 172
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->extractors:Landroid/util/SparseArray;

    move-object/from16 v0, v18

    invoke-virtual {v2, v10, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 156
    add-int/lit8 v19, v19, 0x1

    goto :goto_2

    .line 148
    .end local v10    # "trackIndex":I
    .end local v11    # "trackType":I
    .end local v16    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v18    # "extractor":Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;
    .end local v19    # "i":I
    .end local v21    # "maxHeight":I
    .end local v22    # "maxWidth":I
    .end local v25    # "trackCount":I
    .end local v26    # "trackElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;
    :cond_0
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->psshInfo:Ljava/util/Map;

    goto/16 :goto_0

    .line 151
    :cond_1
    move-object/from16 v0, v24

    iget-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    array-length v0, v2

    move/from16 v25, v0

    goto/16 :goto_1

    .restart local v19    # "i":I
    .restart local v21    # "maxHeight":I
    .restart local v22    # "maxWidth":I
    .restart local v25    # "trackCount":I
    :cond_2
    move/from16 v10, v19

    .line 157
    goto/16 :goto_3

    .line 166
    .restart local v10    # "trackIndex":I
    .restart local v16    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .restart local v26    # "trackElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;
    :cond_3
    const v11, 0x736f756e

    goto :goto_4

    .line 174
    .end local v10    # "trackIndex":I
    .end local v16    # "mediaFormat":Lcom/google/android/exoplayer/MediaFormat;
    .end local v26    # "trackElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;
    :cond_4
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->maxHeight:I

    .line 175
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->maxWidth:I

    .line 176
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->formats:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

    new-instance v3, Lcom/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator;

    invoke-direct {v3}, Lcom/google/android/exoplayer/chunk/Format$DecreasingBandwidthComparator;-><init>()V

    invoke-static {v2, v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 177
    return-void
.end method

.method private getElement(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;)Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    .locals 2
    .param p1, "manifest"    # Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    .prologue
    .line 339
    iget-object v0, p1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->streamElements:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    iget v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->streamElementIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method private static getKeyId([B)[B
    .locals 8
    .param p0, "initData"    # [B

    .prologue
    const/4 v7, 0x0

    .line 381
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 382
    .local v2, "initDataStringBuilder":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p0

    if-ge v0, v5, :cond_0

    .line 383
    aget-byte v5, p0, v0

    int-to-char v5, v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 382
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 385
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 386
    .local v1, "initDataString":Ljava/lang/String;
    const-string v5, "<KID>"

    .line 387
    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x5

    const-string v6, "</KID>"

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 386
    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 388
    .local v4, "keyIdString":Ljava/lang/String;
    invoke-static {v4, v7}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v3

    .line 389
    .local v3, "keyId":[B
    const/4 v5, 0x3

    invoke-static {v3, v7, v5}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->swap([BII)V

    .line 390
    const/4 v5, 0x1

    const/4 v6, 0x2

    invoke-static {v3, v5, v6}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->swap([BII)V

    .line 391
    const/4 v5, 0x4

    const/4 v6, 0x5

    invoke-static {v3, v5, v6}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->swap([BII)V

    .line 392
    const/4 v5, 0x6

    const/4 v6, 0x7

    invoke-static {v3, v5, v6}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->swap([BII)V

    .line 393
    return-object v3
.end method

.method private getLiveSeekPosition()J
    .locals 10

    .prologue
    .line 325
    const-wide/high16 v4, -0x8000000000000000L

    .line 326
    .local v4, "liveEdgeTimestampUs":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v6, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    iget-object v6, v6, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->streamElements:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    array-length v6, v6

    if-ge v2, v6, :cond_1

    .line 327
    iget-object v6, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    iget-object v6, v6, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->streamElements:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    aget-object v3, v6, v2

    .line 328
    .local v3, "streamElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    iget v6, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    if-lez v6, :cond_0

    .line 329
    iget v6, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    add-int/lit8 v6, v6, -0x1

    .line 330
    invoke-virtual {v3, v6}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->getStartTimeUs(I)J

    move-result-wide v6

    iget v8, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    add-int/lit8 v8, v8, -0x1

    .line 331
    invoke-virtual {v3, v8}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->getChunkDurationUs(I)J

    move-result-wide v8

    add-long v0, v6, v8

    .line 332
    .local v0, "elementLiveEdgeTimestampUs":J
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 326
    .end local v0    # "elementLiveEdgeTimestampUs":J
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 335
    .end local v3    # "streamElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    :cond_1
    iget-wide v6, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->liveEdgeLatencyUs:J

    sub-long v6, v4, v6

    return-wide v6
.end method

.method private static getMediaFormat(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;I)Lcom/google/android/exoplayer/MediaFormat;
    .locals 8
    .param p0, "streamElement"    # Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    .param p1, "trackIndex"    # I

    .prologue
    const/4 v7, -0x1

    .line 343
    iget-object v4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    aget-object v3, v4, p1

    .line 344
    .local v3, "trackElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;
    iget-object v2, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->mimeType:Ljava/lang/String;

    .line 345
    .local v2, "mimeType":Ljava/lang/String;
    iget v4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->type:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 346
    iget v4, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxWidth:I

    iget v5, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->maxHeight:I

    iget-object v6, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->csd:[[B

    .line 347
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 346
    invoke-static {v2, v7, v4, v5, v6}, Lcom/google/android/exoplayer/MediaFormat;->createVideoFormat(Ljava/lang/String;IIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    .line 348
    .local v1, "format":Lcom/google/android/exoplayer/MediaFormat;
    iget v4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->maxWidth:I

    iget v5, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->maxHeight:I

    invoke-virtual {v1, v4, v5}, Lcom/google/android/exoplayer/MediaFormat;->setMaxVideoDimensions(II)V

    .line 364
    .end local v1    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :goto_0
    return-object v1

    .line 350
    :cond_0
    iget v4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->type:I

    if-nez v4, :cond_2

    .line 352
    iget-object v4, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->csd:[[B

    if-eqz v4, :cond_1

    .line 353
    iget-object v4, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->csd:[[B

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 358
    .local v0, "csd":Ljava/util/List;, "Ljava/util/List<[B>;"
    :goto_1
    iget v4, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->numChannels:I

    iget v5, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->sampleRate:I

    invoke-static {v2, v7, v4, v5, v0}, Lcom/google/android/exoplayer/MediaFormat;->createAudioFormat(Ljava/lang/String;IIILjava/util/List;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    .line 360
    .restart local v1    # "format":Lcom/google/android/exoplayer/MediaFormat;
    goto :goto_0

    .line 355
    .end local v0    # "csd":Ljava/util/List;, "Ljava/util/List<[B>;"
    .end local v1    # "format":Lcom/google/android/exoplayer/MediaFormat;
    :cond_1
    iget v4, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->sampleRate:I

    iget v5, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->numChannels:I

    invoke-static {v4, v5}, Lcom/google/android/exoplayer/util/CodecSpecificDataUtil;->buildAudioSpecificConfig(II)[B

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .restart local v0    # "csd":Ljava/util/List;, "Ljava/util/List<[B>;"
    goto :goto_1

    .line 361
    .end local v0    # "csd":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_2
    iget v4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->type:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_3

    .line 362
    iget-object v4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    aget-object v4, v4, p1

    iget-object v4, v4, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->mimeType:Ljava/lang/String;

    invoke-static {v4}, Lcom/google/android/exoplayer/MediaFormat;->createFormatForMimeType(Ljava/lang/String;)Lcom/google/android/exoplayer/MediaFormat;

    move-result-object v1

    goto :goto_0

    .line 364
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static newMediaChunk(Lcom/google/android/exoplayer/chunk/Format;Landroid/net/Uri;Ljava/lang/String;Lcom/google/android/exoplayer/chunk/parser/Extractor;Ljava/util/Map;Lcom/google/android/exoplayer/upstream/DataSource;IZJJI)Lcom/google/android/exoplayer/chunk/MediaChunk;
    .locals 22
    .param p0, "formatInfo"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "cacheKey"    # Ljava/lang/String;
    .param p3, "extractor"    # Lcom/google/android/exoplayer/chunk/parser/Extractor;
    .param p5, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p6, "chunkIndex"    # I
    .param p7, "isLast"    # Z
    .param p8, "chunkStartTimeUs"    # J
    .param p10, "nextChunkStartTimeUs"    # J
    .param p12, "trigger"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/chunk/Format;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/chunk/parser/Extractor;",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;",
            "Lcom/google/android/exoplayer/upstream/DataSource;",
            "IZJJI)",
            "Lcom/google/android/exoplayer/chunk/MediaChunk;"
        }
    .end annotation

    .prologue
    .line 370
    .local p4, "psshInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    if-eqz p7, :cond_0

    const/16 v16, -0x1

    .line 371
    .local v16, "nextChunkIndex":I
    :goto_0
    if-eqz p7, :cond_1

    const-wide/16 v14, -0x1

    .line 372
    .local v14, "nextStartTimeUs":J
    :goto_1
    const-wide/16 v4, 0x0

    .line 373
    .local v4, "offset":J
    new-instance v2, Lcom/google/android/exoplayer/upstream/DataSpec;

    const-wide/16 v6, -0x1

    move-object/from16 v3, p1

    move-object/from16 v8, p2

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 376
    .local v2, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    new-instance v7, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;

    const/16 v19, 0x0

    move-wide/from16 v0, p8

    neg-long v0, v0

    move-wide/from16 v20, v0

    move-object/from16 v8, p5

    move-object v9, v2

    move-object/from16 v10, p0

    move/from16 v11, p12

    move-wide/from16 v12, p8

    move-object/from16 v17, p3

    move-object/from16 v18, p4

    invoke-direct/range {v7 .. v21}, Lcom/google/android/exoplayer/chunk/ContainerMediaChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/chunk/Format;IJJILcom/google/android/exoplayer/chunk/parser/Extractor;Ljava/util/Map;ZJ)V

    return-object v7

    .line 370
    .end local v2    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v4    # "offset":J
    .end local v14    # "nextStartTimeUs":J
    .end local v16    # "nextChunkIndex":I
    :cond_0
    add-int/lit8 v16, p6, 0x1

    goto :goto_0

    .restart local v16    # "nextChunkIndex":I
    :cond_1
    move-wide/from16 v14, p10

    .line 371
    goto :goto_1
.end method

.method private static swap([BII)V
    .locals 2
    .param p0, "data"    # [B
    .param p1, "firstPosition"    # I
    .param p2, "secondPosition"    # I

    .prologue
    .line 397
    aget-byte v0, p0, p1

    .line 398
    .local v0, "temp":B
    aget-byte v1, p0, p2

    aput-byte v1, p0, p1

    .line 399
    aput-byte v0, p0, p2

    .line 400
    return-void
.end method


# virtual methods
.method public continueBuffering(J)V
    .locals 10
    .param p1, "playbackPositionUs"    # J

    .prologue
    const/4 v6, 0x0

    .line 208
    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    iget-boolean v3, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->isLive:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v3, :cond_1

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 212
    :cond_1
    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifest()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    .line 213
    .local v2, "newManifest":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    if-eq v3, v2, :cond_3

    if-eqz v2, :cond_3

    .line 214
    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->getElement(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;)Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    move-result-object v0

    .line 215
    .local v0, "currentElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->getElement(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;)Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    move-result-object v1

    .line 216
    .local v1, "newElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    iget v3, v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    if-nez v3, :cond_4

    .line 217
    iget v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifestChunkOffset:I

    iget v4, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifestChunkOffset:I

    .line 221
    :cond_2
    :goto_1
    iput-object v2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    .line 222
    iput-boolean v6, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->finishedCurrentManifest:Z

    .line 225
    .end local v0    # "currentElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    .end local v1    # "newElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    :cond_3
    iget-boolean v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->finishedCurrentManifest:Z

    if-eqz v3, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    .line 226
    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ManifestFetcher;->getManifestLoadTimestamp()J

    move-result-wide v6

    const-wide/16 v8, 0x1388

    add-long/2addr v6, v8

    cmp-long v3, v4, v6

    if-lez v3, :cond_0

    .line 227
    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v3}, Lcom/google/android/exoplayer/util/ManifestFetcher;->requestRefresh()V

    goto :goto_0

    .line 218
    .restart local v0    # "currentElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    .restart local v1    # "newElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    :cond_4
    iget v3, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    if-lez v3, :cond_2

    .line 219
    iget v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifestChunkOffset:I

    invoke-virtual {v1, v6}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->getStartTimeUs(I)J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->getChunkIndex(J)I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifestChunkOffset:I

    goto :goto_1
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
    .line 201
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->disable()V

    .line 204
    :cond_0
    return-void
.end method

.method public enable()V
    .locals 1

    .prologue
    .line 193
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->fatalError:Ljava/io/IOException;

    .line 194
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->enable()V

    .line 197
    :cond_0
    return-void
.end method

.method public final getChunkOperation(Ljava/util/List;JJLcom/google/android/exoplayer/chunk/ChunkOperationHolder;)V
    .locals 20
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
    .line 234
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/MediaChunk;>;"
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v6, :cond_1

    .line 235
    const/4 v6, 0x0

    move-object/from16 v0, p6

    iput-object v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 305
    :cond_0
    :goto_0
    return-void

    .line 239
    :cond_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v7

    iput v7, v6, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    .line 240
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->formatEvaluator:Lcom/google/android/exoplayer/chunk/FormatEvaluator;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->formats:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    move-object/from16 v5, p1

    move-wide/from16 v6, p4

    invoke-interface/range {v4 .. v9}, Lcom/google/android/exoplayer/chunk/FormatEvaluator;->evaluate(Ljava/util/List;J[Lcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;)V

    .line 241
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget-object v4, v6, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    check-cast v4, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;

    .line 242
    .local v4, "selectedFormat":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget v6, v6, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->queueSize:I

    move-object/from16 v0, p6

    iput v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    .line 244
    if-nez v4, :cond_2

    .line 245
    const/4 v6, 0x0

    move-object/from16 v0, p6

    iput-object v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto :goto_0

    .line 247
    :cond_2
    move-object/from16 v0, p6

    iget v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v7

    if-ne v6, v7, :cond_3

    move-object/from16 v0, p6

    iget-object v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    if-eqz v6, :cond_3

    move-object/from16 v0, p6

    iget-object v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    iget-object v6, v6, Lcom/google/android/exoplayer/chunk/Chunk;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v6, v6, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->evaluation:Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;

    iget-object v7, v7, Lcom/google/android/exoplayer/chunk/FormatEvaluator$Evaluation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v7, v7, Lcom/google/android/exoplayer/chunk/Format;->id:Ljava/lang/String;

    .line 248
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 256
    :cond_3
    const/4 v6, 0x0

    move-object/from16 v0, p6

    iput-object v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    .line 258
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->getElement(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;)Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;

    move-result-object v19

    .line 259
    .local v19, "streamElement":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
    move-object/from16 v0, v19

    iget v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    if-nez v6, :cond_4

    .line 261
    const/4 v6, 0x1

    move-object/from16 v0, p0

    iput-boolean v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->finishedCurrentManifest:Z

    goto :goto_0

    .line 266
    :cond_4
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 267
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    iget-boolean v6, v6, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->isLive:Z

    if-eqz v6, :cond_5

    .line 268
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->getLiveSeekPosition()J

    move-result-wide p2

    .line 270
    :cond_5
    move-object/from16 v0, v19

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->getChunkIndex(J)I

    move-result v17

    .line 275
    .local v17, "chunkIndex":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    iget-boolean v6, v6, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->isLive:Z

    if-eqz v6, :cond_a

    .line 276
    if-gez v17, :cond_7

    .line 278
    new-instance v6, Lcom/google/android/exoplayer/BehindLiveWindowException;

    invoke-direct {v6}, Lcom/google/android/exoplayer/BehindLiveWindowException;-><init>()V

    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->fatalError:Ljava/io/IOException;

    goto/16 :goto_0

    .line 272
    .end local v17    # "chunkIndex":I
    :cond_6
    move-object/from16 v0, p6

    iget v6, v0, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->queueSize:I

    add-int/lit8 v6, v6, -0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/chunk/MediaChunk;

    iget v6, v6, Lcom/google/android/exoplayer/chunk/MediaChunk;->nextChunkIndex:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifestChunkOffset:I

    sub-int v17, v6, v7

    .restart local v17    # "chunkIndex":I
    goto :goto_1

    .line 280
    :cond_7
    move-object/from16 v0, v19

    iget v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    move/from16 v0, v17

    if-lt v0, v6, :cond_8

    .line 282
    const/4 v6, 0x1

    move-object/from16 v0, p0

    iput-boolean v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->finishedCurrentManifest:Z

    goto/16 :goto_0

    .line 284
    :cond_8
    move-object/from16 v0, v19

    iget v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    add-int/lit8 v6, v6, -0x1

    move/from16 v0, v17

    if-ne v0, v6, :cond_9

    .line 287
    const/4 v6, 0x1

    move-object/from16 v0, p0

    iput-boolean v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->finishedCurrentManifest:Z

    .line 294
    :cond_9
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifest:Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    iget-boolean v6, v6, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;->isLive:Z

    if-nez v6, :cond_b

    move-object/from16 v0, v19

    iget v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    add-int/lit8 v6, v6, -0x1

    move/from16 v0, v17

    if-ne v0, v6, :cond_b

    const/4 v11, 0x1

    .line 295
    .local v11, "isLastChunk":Z
    :goto_2
    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->getStartTimeUs(I)J

    move-result-wide v12

    .line 296
    .local v12, "chunkStartTimeUs":J
    if-eqz v11, :cond_c

    const-wide/16 v14, -0x1

    .line 298
    .local v14, "nextChunkStartTimeUs":J
    :goto_3
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->currentManifestChunkOffset:I

    add-int v10, v17, v6

    .line 300
    .local v10, "currentAbsoluteChunkIndex":I
    iget v6, v4, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;->trackIndex:I

    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-virtual {v0, v6, v1}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->buildRequestUri(II)Landroid/net/Uri;

    move-result-object v5

    .line 301
    .local v5, "uri":Landroid/net/Uri;
    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->extractors:Landroid/util/SparseArray;

    iget-object v8, v4, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource$SmoothStreamingFormat;->id:Ljava/lang/String;

    .line 302
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/exoplayer/chunk/parser/Extractor;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->psshInfo:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->dataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    const/16 v16, 0x0

    .line 301
    invoke-static/range {v4 .. v16}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->newMediaChunk(Lcom/google/android/exoplayer/chunk/Format;Landroid/net/Uri;Ljava/lang/String;Lcom/google/android/exoplayer/chunk/parser/Extractor;Ljava/util/Map;Lcom/google/android/exoplayer/upstream/DataSource;IZJJI)Lcom/google/android/exoplayer/chunk/MediaChunk;

    move-result-object v18

    .line 304
    .local v18, "mediaChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    move-object/from16 v0, v18

    move-object/from16 v1, p6

    iput-object v0, v1, Lcom/google/android/exoplayer/chunk/ChunkOperationHolder;->chunk:Lcom/google/android/exoplayer/chunk/Chunk;

    goto/16 :goto_0

    .line 289
    .end local v5    # "uri":Landroid/net/Uri;
    .end local v10    # "currentAbsoluteChunkIndex":I
    .end local v11    # "isLastChunk":Z
    .end local v12    # "chunkStartTimeUs":J
    .end local v14    # "nextChunkStartTimeUs":J
    .end local v18    # "mediaChunk":Lcom/google/android/exoplayer/chunk/Chunk;
    :cond_a
    const/4 v6, -0x1

    move/from16 v0, v17

    if-ne v0, v6, :cond_9

    goto/16 :goto_0

    .line 294
    :cond_b
    const/4 v11, 0x0

    goto :goto_2

    .line 297
    .restart local v11    # "isLastChunk":Z
    .restart local v12    # "chunkStartTimeUs":J
    :cond_c
    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->getChunkDurationUs(I)J

    move-result-wide v6

    add-long v14, v12, v6

    goto :goto_3
.end method

.method public getError()Ljava/io/IOException;
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->fatalError:Ljava/io/IOException;

    .line 310
    :goto_0
    return-object v0

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->manifestFetcher:Lcom/google/android/exoplayer/util/ManifestFetcher;

    .line 310
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
    .line 181
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->trackInfo:Lcom/google/android/exoplayer/TrackInfo;

    iget-object v0, v0, Lcom/google/android/exoplayer/TrackInfo;->mimeType:Ljava/lang/String;

    const-string v1, "video"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    iget v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->maxWidth:I

    iget v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->maxHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->setMaxVideoDimensions(II)V

    .line 184
    :cond_0
    return-void
.end method

.method public final getTrackInfo()Lcom/google/android/exoplayer/TrackInfo;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingChunkSource;->trackInfo:Lcom/google/android/exoplayer/TrackInfo;

    return-object v0
.end method

.method public onChunkLoadError(Lcom/google/android/exoplayer/chunk/Chunk;Ljava/lang/Exception;)V
    .locals 0
    .param p1, "chunk"    # Lcom/google/android/exoplayer/chunk/Chunk;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 316
    return-void
.end method
