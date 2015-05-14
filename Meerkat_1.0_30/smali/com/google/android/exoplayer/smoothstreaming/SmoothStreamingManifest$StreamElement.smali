.class public Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;
.super Ljava/lang/Object;
.source "SmoothStreamingManifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StreamElement"
.end annotation


# static fields
.field public static final TYPE_AUDIO:I = 0x0

.field public static final TYPE_TEXT:I = 0x2

.field public static final TYPE_UNKNOWN:I = -0x1

.field public static final TYPE_VIDEO:I = 0x1

.field private static final URL_PLACEHOLDER_BITRATE:Ljava/lang/String; = "{bitrate}"

.field private static final URL_PLACEHOLDER_START_TIME:Ljava/lang/String; = "{start time}"


# instance fields
.field private final baseUri:Landroid/net/Uri;

.field public final chunkCount:I

.field private final chunkStartTimes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final chunkStartTimesUs:[J

.field private final chunkTemplate:Ljava/lang/String;

.field public final displayHeight:I

.field public final displayWidth:I

.field public final language:Ljava/lang/String;

.field private final lastChunkDurationUs:J

.field public final maxHeight:I

.field public final maxWidth:I

.field public final name:Ljava/lang/String;

.field public final qualityLevels:I

.field public final subType:Ljava/lang/String;

.field public final timescale:J

.field public final tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

.field public final type:I


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;ILjava/lang/String;JLjava/lang/String;IIIIILjava/lang/String;[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;Ljava/util/List;J)V
    .locals 9
    .param p1, "baseUri"    # Landroid/net/Uri;
    .param p2, "chunkTemplate"    # Ljava/lang/String;
    .param p3, "type"    # I
    .param p4, "subType"    # Ljava/lang/String;
    .param p5, "timescale"    # J
    .param p7, "name"    # Ljava/lang/String;
    .param p8, "qualityLevels"    # I
    .param p9, "maxWidth"    # I
    .param p10, "maxHeight"    # I
    .param p11, "displayWidth"    # I
    .param p12, "displayHeight"    # I
    .param p13, "language"    # Ljava/lang/String;
    .param p14, "tracks"    # [Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;
    .param p16, "lastChunkDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "IIIII",
            "Ljava/lang/String;",
            "[",
            "Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 210
    .local p15, "chunkStartTimes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    iput-object p1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->baseUri:Landroid/net/Uri;

    .line 212
    iput-object p2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkTemplate:Ljava/lang/String;

    .line 213
    iput p3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->type:I

    .line 214
    iput-object p4, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->subType:Ljava/lang/String;

    .line 215
    iput-wide p5, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->timescale:J

    .line 216
    move-object/from16 v0, p7

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->name:Ljava/lang/String;

    .line 217
    move/from16 v0, p8

    iput v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->qualityLevels:I

    .line 218
    move/from16 v0, p9

    iput v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->maxWidth:I

    .line 219
    move/from16 v0, p10

    iput v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->maxHeight:I

    .line 220
    move/from16 v0, p11

    iput v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->displayWidth:I

    .line 221
    move/from16 v0, p12

    iput v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->displayHeight:I

    .line 222
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->language:Ljava/lang/String;

    .line 223
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    .line 224
    invoke-interface/range {p15 .. p15}, Ljava/util/List;->size()I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    .line 225
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimes:Ljava/util/List;

    .line 226
    const-wide/32 v4, 0xf4240

    move-wide/from16 v2, p16

    move-wide v6, p5

    .line 227
    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->lastChunkDurationUs:J

    .line 228
    const-wide/32 v2, 0xf4240

    .line 229
    move-object/from16 v0, p15

    invoke-static {v0, v2, v3, p5, p6}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamps(Ljava/util/List;JJ)[J

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimesUs:[J

    .line 230
    return-void
.end method


# virtual methods
.method public buildRequestUri(II)Landroid/net/Uri;
    .locals 4
    .param p1, "track"    # I
    .param p2, "chunkIndex"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 271
    iget-object v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 272
    iget-object v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimes:Ljava/util/List;

    if-eqz v1, :cond_1

    move v1, v2

    :goto_1
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 273
    iget-object v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p2, v1, :cond_2

    :goto_2
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 274
    iget-object v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkTemplate:Ljava/lang/String;

    const-string v2, "{bitrate}"

    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->tracks:[Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;

    aget-object v3, v3, p1

    iget v3, v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$TrackElement;->bitrate:I

    .line 275
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "{start time}"

    iget-object v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimes:Ljava/util/List;

    .line 276
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 277
    .local v0, "chunkUrl":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->baseUri:Landroid/net/Uri;

    invoke-static {v1, v0}, Lcom/google/android/exoplayer/util/Util;->getMergedUri(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    return-object v1

    .end local v0    # "chunkUrl":Ljava/lang/String;
    :cond_0
    move v1, v3

    .line 271
    goto :goto_0

    :cond_1
    move v1, v3

    .line 272
    goto :goto_1

    :cond_2
    move v2, v3

    .line 273
    goto :goto_2
.end method

.method public getChunkDurationUs(I)J
    .locals 4
    .param p1, "chunkIndex"    # I

    .prologue
    .line 259
    iget v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkCount:I

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->lastChunkDurationUs:J

    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimesUs:[J

    add-int/lit8 v1, p1, 0x1

    aget-wide v0, v0, v1

    iget-object v2, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimesUs:[J

    aget-wide v2, v2, p1

    sub-long/2addr v0, v2

    goto :goto_0
.end method

.method public getChunkIndex(J)I
    .locals 3
    .param p1, "timeUs"    # J

    .prologue
    const/4 v1, 0x1

    .line 239
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimesUs:[J

    invoke-static {v0, p1, p2, v1, v1}, Lcom/google/android/exoplayer/util/Util;->binarySearchFloor([JJZZ)I

    move-result v0

    return v0
.end method

.method public getStartTimeUs(I)J
    .locals 2
    .param p1, "chunkIndex"    # I

    .prologue
    .line 249
    iget-object v0, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest$StreamElement;->chunkStartTimesUs:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method
