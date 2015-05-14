.class public Lcom/google/android/exoplayer/hls/HlsChunkSource;
.super Ljava/lang/Object;
.source "HlsChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;,
        Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    }
.end annotation


# static fields
.field private static final AAC_FILE_EXTENSION:Ljava/lang/String; = ".aac"

.field public static final ADAPTIVE_MODE_ABRUPT:I = 0x3

.field public static final ADAPTIVE_MODE_NONE:I = 0x0

.field public static final ADAPTIVE_MODE_SPLICE:I = 0x1

.field private static final BANDWIDTH_FRACTION:F = 0.8f

.field public static final DEFAULT_MAX_BUFFER_TO_SWITCH_DOWN_MS:J = 0x4e20L

.field public static final DEFAULT_MIN_BUFFER_TO_SWITCH_UP_MS:J = 0x1388L

.field public static final DEFAULT_TARGET_BUFFER_DURATION_MS:J = 0x9c40L

.field public static final DEFAULT_TARGET_BUFFER_SIZE:I = 0x1200000

.field private static final TAG:Ljava/lang/String; = "HlsChunkSource"


# instance fields
.field private final adaptiveMode:I

.field private final bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

.field private final baseUri:Landroid/net/Uri;

.field private final bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

.field durationUs:J

.field private final enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

.field private encryptedDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private encryptedDataSourceIv:Ljava/lang/String;

.field private encryptedDataSourceSecretKey:[B

.field private encryptionKeyUri:Landroid/net/Uri;

.field final lastMediaPlaylistLoadTimesMs:[J

.field live:Z

.field private final maxBufferDurationToSwitchDownUs:J

.field private final maxHeight:I

.field private final maxWidth:I

.field final mediaPlaylistBlacklistFlags:[Z

.field final mediaPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

.field private final minBufferDurationToSwitchUpUs:J

.field private final playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

.field scratchSpace:[B

.field private final targetBufferDurationUs:J

.field private final targetBufferSize:I

.field private final upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

.field private variantIndex:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/upstream/BandwidthMeter;[II)V
    .locals 14
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "playlistUrl"    # Ljava/lang/String;
    .param p3, "playlist"    # Lcom/google/android/exoplayer/hls/HlsPlaylist;
    .param p4, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;
    .param p5, "variantIndices"    # [I
    .param p6, "adaptiveMode"    # I

    .prologue
    .line 142
    const/high16 v7, 0x1200000

    const-wide/32 v8, 0x9c40

    const-wide/16 v10, 0x1388

    const-wide/16 v12, 0x4e20

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    invoke-direct/range {v0 .. v13}, Lcom/google/android/exoplayer/hls/HlsChunkSource;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/upstream/BandwidthMeter;[IIIJJJ)V

    .line 145
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/upstream/BandwidthMeter;[IIIJJJ)V
    .locals 16
    .param p1, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;
    .param p2, "playlistUrl"    # Ljava/lang/String;
    .param p3, "playlist"    # Lcom/google/android/exoplayer/hls/HlsPlaylist;
    .param p4, "bandwidthMeter"    # Lcom/google/android/exoplayer/upstream/BandwidthMeter;
    .param p5, "variantIndices"    # [I
    .param p6, "adaptiveMode"    # I
    .param p7, "targetBufferSize"    # I
    .param p8, "targetBufferDurationMs"    # J
    .param p10, "minBufferDurationToSwitchUpMs"    # J
    .param p12, "maxBufferDurationToSwitchDownMs"    # J

    .prologue
    .line 169
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 170
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 171
    move-object/from16 v0, p4

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    .line 172
    move/from16 v0, p6

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    .line 173
    move/from16 v0, p7

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->targetBufferSize:I

    .line 174
    const-wide/16 v2, 0x3e8

    mul-long v2, v2, p8

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->targetBufferDurationUs:J

    .line 175
    const-wide/16 v2, 0x3e8

    mul-long v2, v2, p10

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->minBufferDurationToSwitchUpUs:J

    .line 176
    const-wide/16 v2, 0x3e8

    mul-long v2, v2, p12

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxBufferDurationToSwitchDownUs:J

    .line 177
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsPlaylist;->baseUri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->baseUri:Landroid/net/Uri;

    .line 178
    new-instance v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    invoke-direct {v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    .line 179
    new-instance v2, Lcom/google/android/exoplayer/upstream/BufferPool;

    const/high16 v3, 0x40000

    invoke-direct {v2, v3}, Lcom/google/android/exoplayer/upstream/BufferPool;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    .line 181
    move-object/from16 v0, p3

    iget v2, v0, Lcom/google/android/exoplayer/hls/HlsPlaylist;->type:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 182
    const/4 v2, 0x1

    new-array v14, v2, [Lcom/google/android/exoplayer/hls/Variant;

    const/4 v15, 0x0

    new-instance v2, Lcom/google/android/exoplayer/hls/Variant;

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v8, -0x1

    move-object/from16 v4, p2

    invoke-direct/range {v2 .. v8}, Lcom/google/android/exoplayer/hls/Variant;-><init>(ILjava/lang/String;I[Ljava/lang/String;II)V

    aput-object v2, v14, v15

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    .line 183
    const/4 v2, 0x1

    new-array v2, v2, [Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .line 184
    const/4 v2, 0x1

    new-array v2, v2, [Z

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    .line 185
    const/4 v2, 0x1

    new-array v2, v2, [J

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->lastMediaPlaylistLoadTimesMs:[J

    .line 186
    const/4 v2, 0x0

    check-cast p3, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .end local p3    # "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v2, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->setMediaPlaylist(ILcom/google/android/exoplayer/hls/HlsMediaPlaylist;)V

    .line 195
    :goto_0
    const/4 v11, -0x1

    .line 196
    .local v11, "maxWidth":I
    const/4 v10, -0x1

    .line 198
    .local v10, "maxHeight":I
    const-wide/32 v12, 0x7fffffff

    .line 199
    .local v12, "minOriginalVariantIndex":J
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v2, v2

    if-ge v9, v2, :cond_3

    .line 200
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v2, v2, v9

    iget v2, v2, Lcom/google/android/exoplayer/hls/Variant;->index:I

    int-to-long v2, v2

    cmp-long v2, v2, v12

    if-gez v2, :cond_0

    .line 201
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v2, v2, v9

    iget v2, v2, Lcom/google/android/exoplayer/hls/Variant;->index:I

    int-to-long v12, v2

    .line 202
    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    .line 204
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v2, v2, v9

    iget v2, v2, Lcom/google/android/exoplayer/hls/Variant;->width:I

    invoke-static {v2, v11}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 205
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v2, v2, v9

    iget v2, v2, Lcom/google/android/exoplayer/hls/Variant;->height:I

    invoke-static {v2, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 199
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 188
    .end local v9    # "i":I
    .end local v10    # "maxHeight":I
    .end local v11    # "maxWidth":I
    .end local v12    # "minOriginalVariantIndex":J
    .restart local p3    # "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    :cond_1
    move-object/from16 v0, p3

    iget v2, v0, Lcom/google/android/exoplayer/hls/HlsPlaylist;->type:I

    if-nez v2, :cond_2

    const/4 v2, 0x1

    :goto_2
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 189
    check-cast p3, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    .end local p3    # "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->filterVariants(Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;[I)[Lcom/google/android/exoplayer/hls/Variant;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    .line 190
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v2, v2

    new-array v2, v2, [Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .line 191
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v2, v2

    new-array v2, v2, [Z

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    .line 192
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v2, v2

    new-array v2, v2, [J

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->lastMediaPlaylistLoadTimesMs:[J

    goto :goto_0

    .line 188
    .restart local p3    # "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    :cond_2
    const/4 v2, 0x0

    goto :goto_2

    .line 208
    .end local p3    # "playlist":Lcom/google/android/exoplayer/hls/HlsPlaylist;
    .restart local v9    # "i":I
    .restart local v10    # "maxHeight":I
    .restart local v11    # "maxWidth":I
    .restart local v12    # "minOriginalVariantIndex":J
    :cond_3
    if-lez v11, :cond_4

    .end local v11    # "maxWidth":I
    :goto_3
    move-object/from16 v0, p0

    iput v11, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxWidth:I

    .line 209
    if-lez v10, :cond_5

    .end local v10    # "maxHeight":I
    :goto_4
    move-object/from16 v0, p0

    iput v10, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxHeight:I

    .line 210
    return-void

    .line 208
    .restart local v10    # "maxHeight":I
    .restart local v11    # "maxWidth":I
    :cond_4
    const/16 v11, 0x780

    goto :goto_3

    .line 209
    .end local v11    # "maxWidth":I
    :cond_5
    const/16 v10, 0x438

    goto :goto_4
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/hls/HlsChunkSource;)Lcom/google/android/exoplayer/hls/HlsPlaylistParser;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/hls/HlsChunkSource;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->playlistParser:Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    return-object v0
.end method

.method private allPlaylistsBlacklisted()Z
    .locals 2

    .prologue
    .line 536
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 537
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    aget-boolean v1, v1, v0

    if-nez v1, :cond_0

    .line 538
    const/4 v1, 0x0

    .line 541
    :goto_1
    return v1

    .line 536
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 541
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private clearEncryptedDataSource()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 466
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    .line 467
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 468
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSourceIv:Ljava/lang/String;

    .line 469
    iput-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSourceSecretKey:[B

    .line 470
    return-void
.end method

.method private static filterVariants(Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;[I)[Lcom/google/android/exoplayer/hls/Variant;
    .locals 9
    .param p0, "masterPlaylist"    # Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    .param p1, "variantIndices"    # [I

    .prologue
    .line 480
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;->variants:Ljava/util/List;

    .line 481
    .local v5, "masterVariants":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/Variant;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 482
    .local v2, "enabledVariants":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    if-eqz p1, :cond_0

    .line 483
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, p1

    if-ge v4, v7, :cond_1

    .line 484
    aget v7, p1, v4

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 483
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 488
    .end local v4    # "i":I
    :cond_0
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 491
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 492
    .local v1, "definiteVideoVariants":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 493
    .local v0, "definiteAudioOnlyVariants":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/hls/Variant;>;"
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v4, v7, :cond_5

    .line 494
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/exoplayer/hls/Variant;

    .line 495
    .local v6, "variant":Lcom/google/android/exoplayer/hls/Variant;
    iget v7, v6, Lcom/google/android/exoplayer/hls/Variant;->height:I

    if-gtz v7, :cond_2

    const-string v7, "avc"

    invoke-static {v6, v7}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantHasExplicitCodecWithPrefix(Lcom/google/android/exoplayer/hls/Variant;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 496
    :cond_2
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 493
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 497
    :cond_4
    const-string v7, "mp4a"

    invoke-static {v6, v7}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantHasExplicitCodecWithPrefix(Lcom/google/android/exoplayer/hls/Variant;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 498
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 502
    .end local v6    # "variant":Lcom/google/android/exoplayer/hls/Variant;
    :cond_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_7

    .line 506
    move-object v2, v1

    .line 515
    :cond_6
    :goto_3
    new-instance v7, Lcom/google/android/exoplayer/hls/Variant$DecreasingBandwidthComparator;

    invoke-direct {v7}, Lcom/google/android/exoplayer/hls/Variant$DecreasingBandwidthComparator;-><init>()V

    invoke-static {v2, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 517
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v3, v7, [Lcom/google/android/exoplayer/hls/Variant;

    .line 518
    .local v3, "enabledVariantsArray":[Lcom/google/android/exoplayer/hls/Variant;
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 519
    return-object v3

    .line 507
    .end local v3    # "enabledVariantsArray":[Lcom/google/android/exoplayer/hls/Variant;
    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v7, v8, :cond_6

    .line 510
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    goto :goto_3
.end method

.method private getLiveStartChunkMediaSequence(I)I
    .locals 4
    .param p1, "variantIndex"    # I

    .prologue
    .line 428
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aget-object v1, v2, p1

    .line 429
    .local v1, "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    iget-object v2, v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    iget-object v2, v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x3

    .line 430
    .local v0, "chunkIndex":I
    :goto_0
    iget v2, v1, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    add-int/2addr v2, v0

    return v2

    .line 429
    .end local v0    # "chunkIndex":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getNextVariantIndex(Lcom/google/android/exoplayer/hls/TsChunk;J)I
    .locals 8
    .param p1, "previousTsChunk"    # Lcom/google/android/exoplayer/hls/TsChunk;
    .param p2, "playbackPositionUs"    # J

    .prologue
    .line 383
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bandwidthMeter:Lcom/google/android/exoplayer/upstream/BandwidthMeter;

    .line 384
    invoke-interface {v5}, Lcom/google/android/exoplayer/upstream/BandwidthMeter;->getBitrateEstimate()J

    move-result-wide v6

    long-to-float v5, v6

    const v6, 0x3f4ccccd    # 0.8f

    mul-float/2addr v5, v6

    float-to-int v5, v5

    .line 383
    invoke-direct {p0, v5}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getVariantIndexForBandwdith(I)I

    move-result v4

    .line 385
    .local v4, "idealVariantIndex":I
    iget v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    if-ne v4, v5, :cond_1

    .line 387
    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    .line 402
    .end local v4    # "idealVariantIndex":I
    :cond_0
    :goto_0
    return v4

    .line 391
    .restart local v4    # "idealVariantIndex":I
    :cond_1
    if-nez p1, :cond_4

    move-wide v0, p2

    .line 394
    .local v0, "bufferedPositionUs":J
    :goto_1
    sub-long v2, v0, p2

    .line 395
    .local v2, "bufferedUs":J
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    iget v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    aget-boolean v5, v5, v6

    if-nez v5, :cond_0

    iget v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    if-le v4, v5, :cond_2

    iget-wide v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxBufferDurationToSwitchDownUs:J

    cmp-long v5, v2, v6

    if-ltz v5, :cond_0

    :cond_2
    iget v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    if-ge v4, v5, :cond_3

    iget-wide v6, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->minBufferDurationToSwitchUpUs:J

    cmp-long v5, v2, v6

    if-gtz v5, :cond_0

    .line 402
    :cond_3
    iget v4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    goto :goto_0

    .line 391
    .end local v0    # "bufferedPositionUs":J
    .end local v2    # "bufferedUs":J
    :cond_4
    iget v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_5

    iget-wide v0, p1, Lcom/google/android/exoplayer/hls/TsChunk;->startTimeUs:J

    goto :goto_1

    :cond_5
    iget-wide v0, p1, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    goto :goto_1
.end method

.method private getVariantIndexForBandwdith(I)I
    .locals 3
    .param p1, "bandwidth"    # I

    .prologue
    .line 406
    const/4 v1, 0x0

    .line 407
    .local v1, "lowestQualityEnabledVariant":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 408
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    aget-boolean v2, v2, v0

    if-nez v2, :cond_1

    .line 409
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v2, v2, v0

    iget v2, v2, Lcom/google/android/exoplayer/hls/Variant;->bandwidth:I

    if-gt v2, p1, :cond_0

    .line 415
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 412
    .restart local v0    # "i":I
    :cond_0
    move v1, v0

    .line 407
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    move v0, v1

    .line 415
    goto :goto_1
.end method

.method private newEncryptionKeyChunk(Landroid/net/Uri;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;
    .locals 7
    .param p1, "keyUri"    # Landroid/net/Uri;
    .param p2, "iv"    # Ljava/lang/String;

    .prologue
    .line 441
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 442
    .local v0, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    new-instance v1, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-direct {v1, p0, v2, v0, p2}, Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Ljava/lang/String;)V

    return-object v1
.end method

.method private newMediaPlaylistChunk(I)Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    .locals 8
    .param p1, "variantIndex"    # I

    .prologue
    .line 434
    iget-object v2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->baseUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    aget-object v3, v3, p1

    iget-object v3, v3, Lcom/google/android/exoplayer/hls/Variant;->url:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/exoplayer/util/Util;->getMergedUri(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 435
    .local v1, "mediaPlaylistUri":Landroid/net/Uri;
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 436
    .local v0, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->parseBaseUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 437
    .local v7, "baseUri":Landroid/net/Uri;
    new-instance v2, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object v3, p0

    move v4, p1

    move-object v6, v0

    invoke-direct/range {v2 .. v7}, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;ILcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Landroid/net/Uri;)V

    return-object v2
.end method

.method private shouldRerequestMediaPlaylist(I)Z
    .locals 8
    .param p1, "variantIndex"    # I

    .prologue
    .line 420
    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aget-object v0, v1, p1

    .line 422
    .local v0, "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-object v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->lastMediaPlaylistLoadTimesMs:[J

    aget-wide v6, v1, p1

    sub-long v2, v4, v6

    .line 423
    .local v2, "timeSinceLastMediaPlaylistLoadMs":J
    iget v1, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->targetDurationSecs:I

    mul-int/lit16 v1, v1, 0x3e8

    div-int/lit8 v1, v1, 0x2

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static variantHasExplicitCodecWithPrefix(Lcom/google/android/exoplayer/hls/Variant;Ljava/lang/String;)Z
    .locals 4
    .param p0, "variant"    # Lcom/google/android/exoplayer/hls/Variant;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 523
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/Variant;->codecs:[Ljava/lang/String;

    .line 524
    .local v0, "codecs":[Ljava/lang/String;
    if-nez v0, :cond_1

    .line 532
    :cond_0
    :goto_0
    return v2

    .line 527
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 528
    aget-object v3, v0, v1

    invoke-virtual {v3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 529
    const/4 v2, 0x1

    goto :goto_0

    .line 527
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public getChunkOperation(Lcom/google/android/exoplayer/hls/TsChunk;JJ)Lcom/google/android/exoplayer/hls/HlsChunk;
    .locals 28
    .param p1, "previousTsChunk"    # Lcom/google/android/exoplayer/hls/TsChunk;
    .param p2, "seekPositionUs"    # J
    .param p4, "playbackPositionUs"    # J

    .prologue
    .line 239
    if-eqz p1, :cond_0

    move-object/from16 v0, p1

    iget-boolean v6, v0, Lcom/google/android/exoplayer/hls/TsChunk;->isLastChunk:Z

    if-nez v6, :cond_1

    move-object/from16 v0, p1

    iget-wide v6, v0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    sub-long v6, v6, p4

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->targetBufferDurationUs:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_1

    :cond_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    .line 241
    invoke-virtual {v6}, Lcom/google/android/exoplayer/upstream/BufferPool;->getAllocatedSize()I

    move-result v6

    move-object/from16 v0, p0

    iget v7, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->targetBufferSize:I

    if-lt v6, v7, :cond_2

    .line 243
    :cond_1
    const/16 v27, 0x0

    .line 347
    :goto_0
    return-object v27

    .line 246
    :cond_2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    move/from16 v23, v0

    .line 247
    .local v23, "nextVariantIndex":I
    const/16 v25, 0x0

    .line 248
    .local v25, "switchingVariant":Z
    const/16 v26, 0x0

    .line 249
    .local v26, "switchingVariantSpliced":Z
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    if-nez v6, :cond_3

    .line 257
    :goto_1
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aget-object v22, v6, v23

    .line 258
    .local v22, "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    if-nez v22, :cond_6

    .line 260
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->newMediaPlaylistChunk(I)Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    move-result-object v27

    goto :goto_0

    .line 252
    .end local v22    # "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getNextVariantIndex(Lcom/google/android/exoplayer/hls/TsChunk;J)I

    move-result v23

    .line 253
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    move/from16 v0, v23

    if-eq v0, v6, :cond_4

    const/16 v25, 0x1

    .line 254
    :goto_2
    if-eqz v25, :cond_5

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->adaptiveMode:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_5

    const/16 v26, 0x1

    :goto_3
    goto :goto_1

    .line 253
    :cond_4
    const/16 v25, 0x0

    goto :goto_2

    .line 254
    :cond_5
    const/16 v26, 0x0

    goto :goto_3

    .line 263
    .restart local v22    # "mediaPlaylist":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    :cond_6
    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    .line 264
    const/16 v16, 0x0

    .line 265
    .local v16, "chunkMediaSequence":I
    const/16 v21, 0x0

    .line 266
    .local v21, "liveDiscontinuity":Z
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    if-eqz v6, :cond_a

    .line 267
    if-nez p1, :cond_8

    .line 268
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getLiveStartChunkMediaSequence(I)I

    move-result v16

    .line 289
    :cond_7
    :goto_4
    move-object/from16 v0, v22

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    sub-int v18, v16, v6

    .line 290
    .local v18, "chunkIndex":I
    move-object/from16 v0, v22

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    move/from16 v0, v18

    if-lt v0, v6, :cond_e

    .line 291
    move-object/from16 v0, v22

    iget-boolean v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->live:Z

    if-eqz v6, :cond_d

    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->shouldRerequestMediaPlaylist(I)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 292
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->newMediaPlaylistChunk(I)Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    move-result-object v27

    goto/16 :goto_0

    .line 270
    .end local v18    # "chunkIndex":I
    :cond_8
    if-eqz v26, :cond_9

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    move/from16 v16, v0

    .line 272
    :goto_5
    move-object/from16 v0, v22

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    move/from16 v0, v16

    if-ge v0, v6, :cond_7

    .line 274
    move-object/from16 v0, p0

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->getLiveStartChunkMediaSequence(I)I

    move-result v16

    .line 275
    const/16 v21, 0x1

    goto :goto_4

    .line 270
    :cond_9
    move-object/from16 v0, p1

    iget v6, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    add-int/lit8 v16, v6, 0x1

    goto :goto_5

    .line 280
    :cond_a
    if-nez p1, :cond_b

    .line 281
    move-object/from16 v0, v22

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const/4 v8, 0x1

    const/4 v9, 0x1

    invoke-static {v6, v7, v8, v9}, Lcom/google/android/exoplayer/util/Util;->binarySearchFloor(Ljava/util/List;Ljava/lang/Object;ZZ)I

    move-result v6

    move-object/from16 v0, v22

    iget v7, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->mediaSequence:I

    add-int v16, v6, v7

    goto :goto_4

    .line 284
    :cond_b
    if-eqz v26, :cond_c

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    move/from16 v16, v0

    :goto_6
    goto :goto_4

    :cond_c
    move-object/from16 v0, p1

    iget v6, v0, Lcom/google/android/exoplayer/hls/TsChunk;->chunkIndex:I

    add-int/lit8 v16, v6, 0x1

    goto :goto_6

    .line 294
    .restart local v18    # "chunkIndex":I
    :cond_d
    const/16 v27, 0x0

    goto/16 :goto_0

    .line 298
    :cond_e
    move-object/from16 v0, v22

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;

    .line 299
    .local v24, "segment":Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;
    move-object/from16 v0, v22

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->baseUri:Landroid/net/Uri;

    move-object/from16 v0, v24

    iget-object v7, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->url:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/google/android/exoplayer/util/Util;->getMergedUri(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 302
    .local v5, "chunkUri":Landroid/net/Uri;
    const-string v6, "AES-128"

    move-object/from16 v0, v24

    iget-object v7, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionMethod:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 303
    move-object/from16 v0, v22

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->baseUri:Landroid/net/Uri;

    move-object/from16 v0, v24

    iget-object v7, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionKeyUri:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/google/android/exoplayer/util/Util;->getMergedUri(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v20

    .line 304
    .local v20, "keyUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_f

    .line 306
    move-object/from16 v0, v24

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->newEncryptionKeyChunk(Landroid/net/Uri;Ljava/lang/String;)Lcom/google/android/exoplayer/hls/HlsChunkSource$EncryptionKeyChunk;

    move-result-object v27

    .line 307
    .local v27, "toReturn":Lcom/google/android/exoplayer/hls/HlsChunk;
    goto/16 :goto_0

    .line 309
    .end local v27    # "toReturn":Lcom/google/android/exoplayer/hls/HlsChunk;
    :cond_f
    move-object/from16 v0, v24

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSourceIv:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    .line 310
    move-object/from16 v0, v24

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSourceSecretKey:[B

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v6, v7}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->initEncryptedDataSource(Landroid/net/Uri;Ljava/lang/String;[B)V

    .line 317
    .end local v20    # "keyUri":Landroid/net/Uri;
    :cond_10
    :goto_7
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    if-eqz v6, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v19, v0

    .line 318
    .local v19, "dataSource":Lcom/google/android/exoplayer/upstream/DataSource;
    :goto_8
    new-instance v4, Lcom/google/android/exoplayer/upstream/DataSpec;

    move-object/from16 v0, v24

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->byterangeOffset:I

    int-to-long v6, v6

    move-object/from16 v0, v24

    iget v8, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->byterangeLength:I

    int-to-long v8, v8

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v10}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 323
    .local v4, "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    if-eqz v6, :cond_16

    .line 324
    if-nez p1, :cond_14

    .line 325
    const-wide/16 v12, 0x0

    .line 334
    .local v12, "startTimeUs":J
    :goto_9
    move-object/from16 v0, v24

    iget-wide v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->durationSecs:D

    const-wide v8, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v6, v8

    double-to-long v6, v6

    add-long v14, v12, v6

    .line 335
    .local v14, "endTimeUs":J
    move-object/from16 v0, v22

    iget-boolean v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->live:Z

    if-nez v6, :cond_17

    move-object/from16 v0, v22

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    move/from16 v0, v18

    if-ne v0, v6, :cond_17

    const/16 v17, 0x1

    .line 339
    .local v17, "isLastChunk":Z
    :goto_a
    if-eqz p1, :cond_11

    move-object/from16 v0, v24

    iget-boolean v6, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->discontinuity:Z

    if-nez v6, :cond_11

    if-nez v25, :cond_11

    if-eqz v21, :cond_19

    .line 340
    :cond_11
    invoke-virtual {v5}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    const-string v7, ".aac"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_18

    new-instance v10, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    move/from16 v0, v26

    invoke-direct {v10, v0, v12, v13, v6}, Lcom/google/android/exoplayer/hls/parser/AdtsExtractor;-><init>(ZJLcom/google/android/exoplayer/upstream/BufferPool;)V

    .line 347
    .local v10, "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    :goto_b
    new-instance v7, Lcom/google/android/exoplayer/hls/TsChunk;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->enabledVariants:[Lcom/google/android/exoplayer/hls/Variant;

    move-object/from16 v0, p0

    iget v8, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->variantIndex:I

    aget-object v6, v6, v8

    iget v11, v6, Lcom/google/android/exoplayer/hls/Variant;->index:I

    move-object/from16 v8, v19

    move-object v9, v4

    invoke-direct/range {v7 .. v17}, Lcom/google/android/exoplayer/hls/TsChunk;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;Lcom/google/android/exoplayer/hls/parser/HlsExtractor;IJJIZ)V

    move-object/from16 v27, v7

    goto/16 :goto_0

    .line 313
    .end local v4    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .end local v10    # "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    .end local v12    # "startTimeUs":J
    .end local v14    # "endTimeUs":J
    .end local v17    # "isLastChunk":Z
    .end local v19    # "dataSource":Lcom/google/android/exoplayer/upstream/DataSource;
    :cond_12
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->clearEncryptedDataSource()V

    goto/16 :goto_7

    .line 317
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    move-object/from16 v19, v0

    goto/16 :goto_8

    .line 326
    .restart local v4    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    .restart local v19    # "dataSource":Lcom/google/android/exoplayer/upstream/DataSource;
    :cond_14
    if-eqz v26, :cond_15

    .line 327
    move-object/from16 v0, p1

    iget-wide v12, v0, Lcom/google/android/exoplayer/hls/TsChunk;->startTimeUs:J

    .restart local v12    # "startTimeUs":J
    goto :goto_9

    .line 329
    .end local v12    # "startTimeUs":J
    :cond_15
    move-object/from16 v0, p1

    iget-wide v12, v0, Lcom/google/android/exoplayer/hls/TsChunk;->endTimeUs:J

    .restart local v12    # "startTimeUs":J
    goto :goto_9

    .line 332
    .end local v12    # "startTimeUs":J
    :cond_16
    move-object/from16 v0, v24

    iget-wide v12, v0, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;->startTimeUs:J

    .restart local v12    # "startTimeUs":J
    goto :goto_9

    .line 335
    .restart local v14    # "endTimeUs":J
    :cond_17
    const/16 v17, 0x0

    goto :goto_a

    .line 340
    .restart local v17    # "isLastChunk":Z
    :cond_18
    new-instance v10, Lcom/google/android/exoplayer/hls/parser/TsExtractor;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->bufferPool:Lcom/google/android/exoplayer/upstream/BufferPool;

    move/from16 v0, v26

    invoke-direct {v10, v0, v12, v13, v6}, Lcom/google/android/exoplayer/hls/parser/TsExtractor;-><init>(ZJLcom/google/android/exoplayer/upstream/BufferPool;)V

    goto :goto_b

    .line 344
    :cond_19
    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/google/android/exoplayer/hls/TsChunk;->extractor:Lcom/google/android/exoplayer/hls/parser/HlsExtractor;

    .restart local v10    # "extractor":Lcom/google/android/exoplayer/hls/parser/HlsExtractor;
    goto :goto_b
.end method

.method public getDurationUs()J
    .locals 2

    .prologue
    .line 213
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->durationUs:J

    goto :goto_0
.end method

.method public getMaxVideoDimensions(Lcom/google/android/exoplayer/MediaFormat;)V
    .locals 2
    .param p1, "out"    # Lcom/google/android/exoplayer/MediaFormat;

    .prologue
    .line 225
    iget v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxWidth:I

    iget v1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->maxHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer/MediaFormat;->setMaxVideoDimensions(II)V

    .line 226
    return-void
.end method

.method initEncryptedDataSource(Landroid/net/Uri;Ljava/lang/String;[B)V
    .locals 7
    .param p1, "keyUri"    # Landroid/net/Uri;
    .param p2, "iv"    # Ljava/lang/String;
    .param p3, "secretKey"    # [B

    .prologue
    const/16 v6, 0x10

    .line 447
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "0x"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 448
    const/4 v4, 0x2

    invoke-virtual {p2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 453
    .local v3, "trimmedIv":Ljava/lang/String;
    :goto_0
    new-instance v4, Ljava/math/BigInteger;

    invoke-direct {v4, v3, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 454
    .local v0, "ivData":[B
    new-array v1, v6, [B

    .line 455
    .local v1, "ivDataWithPadding":[B
    array-length v4, v0

    if-le v4, v6, :cond_1

    array-length v4, v0

    add-int/lit8 v2, v4, -0x10

    .line 456
    .local v2, "offset":I
    :goto_1
    array-length v4, v1

    array-length v5, v0

    sub-int/2addr v4, v5

    add-int/2addr v4, v2

    array-length v5, v0

    sub-int/2addr v5, v2

    invoke-static {v0, v2, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 459
    new-instance v4, Lcom/google/android/exoplayer/upstream/Aes128DataSource;

    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->upstreamDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-direct {v4, p3, v1, v5}, Lcom/google/android/exoplayer/upstream/Aes128DataSource;-><init>([B[BLcom/google/android/exoplayer/upstream/DataSource;)V

    iput-object v4, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSource:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 460
    iput-object p1, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    .line 461
    iput-object p2, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSourceIv:Ljava/lang/String;

    .line 462
    iput-object p3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->encryptedDataSourceSecretKey:[B

    .line 463
    return-void

    .line 450
    .end local v0    # "ivData":[B
    .end local v1    # "ivDataWithPadding":[B
    .end local v2    # "offset":I
    .end local v3    # "trimmedIv":Ljava/lang/String;
    :cond_0
    move-object v3, p2

    .restart local v3    # "trimmedIv":Ljava/lang/String;
    goto :goto_0

    .line 455
    .restart local v0    # "ivData":[B
    .restart local v1    # "ivDataWithPadding":[B
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public onLoadError(Lcom/google/android/exoplayer/hls/HlsChunk;Ljava/io/IOException;)Z
    .locals 7
    .param p1, "chunk"    # Lcom/google/android/exoplayer/hls/HlsChunk;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 359
    instance-of v5, p1, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    if-eqz v5, :cond_2

    instance-of v5, p2, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;

    if-eqz v5, :cond_2

    move-object v2, p2

    .line 360
    check-cast v2, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;

    .line 361
    .local v2, "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    iget v1, v2, Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    .line 362
    .local v1, "responseCode":I
    const/16 v5, 0x194

    if-eq v1, v5, :cond_0

    const/16 v5, 0x19a

    if-ne v1, v5, :cond_2

    :cond_0
    move-object v0, p1

    .line 363
    check-cast v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;

    .line 364
    .local v0, "playlistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    iget-object v5, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    iget v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->variantIndex:I

    aput-boolean v3, v5, v6

    .line 365
    invoke-direct {p0}, Lcom/google/android/exoplayer/hls/HlsChunkSource;->allPlaylistsBlacklisted()Z

    move-result v5

    if-nez v5, :cond_1

    .line 367
    const-string v4, "HlsChunkSource"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Blacklisted playlist ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v6, v6, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    .end local v0    # "playlistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    .end local v1    # "responseCode":I
    .end local v2    # "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    :goto_0
    return v3

    .line 372
    .restart local v0    # "playlistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    .restart local v1    # "responseCode":I
    .restart local v2    # "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    :cond_1
    const-string v3, "HlsChunkSource"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Final playlist not blacklisted ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v6, v6, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    iget-object v3, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylistBlacklistFlags:[Z

    iget v5, v0, Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;->variantIndex:I

    aput-boolean v4, v3, v5

    move v3, v4

    .line 375
    goto :goto_0

    .end local v0    # "playlistChunk":Lcom/google/android/exoplayer/hls/HlsChunkSource$MediaPlaylistChunk;
    .end local v1    # "responseCode":I
    .end local v2    # "responseCodeException":Lcom/google/android/exoplayer/upstream/HttpDataSource$InvalidResponseCodeException;
    :cond_2
    move v3, v4

    .line 379
    goto :goto_0
.end method

.method setMediaPlaylist(ILcom/google/android/exoplayer/hls/HlsMediaPlaylist;)V
    .locals 4
    .param p1, "variantIndex"    # I
    .param p2, "mediaPlaylist"    # Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .prologue
    .line 473
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->lastMediaPlaylistLoadTimesMs:[J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    aput-wide v2, v0, p1

    .line 474
    iget-object v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->mediaPlaylists:[Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    aput-object p2, v0, p1

    .line 475
    iget-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    iget-boolean v1, p2, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->live:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->live:Z

    .line 476
    iget-wide v0, p2, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;->durationUs:J

    iput-wide v0, p0, Lcom/google/android/exoplayer/hls/HlsChunkSource;->durationUs:J

    .line 477
    return-void
.end method
