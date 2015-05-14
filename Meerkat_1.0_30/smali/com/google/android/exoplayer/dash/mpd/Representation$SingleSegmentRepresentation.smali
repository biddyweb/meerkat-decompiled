.class public Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;
.super Lcom/google/android/exoplayer/dash/mpd/Representation;
.source "Representation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/mpd/Representation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SingleSegmentRepresentation"
.end annotation


# instance fields
.field public final contentLength:J

.field private final indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

.field private final segmentIndex:Lcom/google/android/exoplayer/dash/DashSingleSegmentIndex;

.field public final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(JJLjava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;J)V
    .locals 15
    .param p1, "periodStartMs"    # J
    .param p3, "periodDurationMs"    # J
    .param p5, "contentId"    # Ljava/lang/String;
    .param p6, "revisionId"    # J
    .param p8, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p9, "segmentBase"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;
    .param p10, "contentLength"    # J

    .prologue
    .line 199
    const/4 v13, 0x0

    move-object v3, p0

    move-wide/from16 v4, p1

    move-wide/from16 v6, p3

    move-object/from16 v8, p5

    move-wide/from16 v9, p6

    move-object/from16 v11, p8

    move-object/from16 v12, p9

    invoke-direct/range {v3 .. v13}, Lcom/google/android/exoplayer/dash/mpd/Representation;-><init>(JJLjava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase;Lcom/google/android/exoplayer/dash/mpd/Representation$1;)V

    .line 200
    move-object/from16 v0, p9

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->uri:Landroid/net/Uri;

    iput-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->uri:Landroid/net/Uri;

    .line 201
    invoke-virtual/range {p9 .. p9}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->getIndex()Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    .line 202
    move-wide/from16 v0, p10

    iput-wide v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->contentLength:J

    .line 205
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    iput-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSingleSegmentIndex;

    .line 207
    return-void

    .line 205
    :cond_0
    new-instance v2, Lcom/google/android/exoplayer/dash/DashSingleSegmentIndex;

    const-wide/16 v4, 0x3e8

    mul-long v10, p1, v4

    const-wide/16 v4, 0x3e8

    mul-long v12, p3, v4

    new-instance v3, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    iget-object v4, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->uri:Landroid/net/Uri;

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, -0x1

    invoke-direct/range {v3 .. v9}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Landroid/net/Uri;Ljava/lang/String;JJ)V

    move-object v5, v2

    move-wide v6, v10

    move-wide v8, v12

    move-object v10, v3

    invoke-direct/range {v5 .. v10}, Lcom/google/android/exoplayer/dash/DashSingleSegmentIndex;-><init>(JJLcom/google/android/exoplayer/dash/mpd/RangedUri;)V

    goto :goto_0
.end method

.method public static newInstance(JJLjava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Landroid/net/Uri;JJJJJ)Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;
    .locals 15
    .param p0, "periodStartMs"    # J
    .param p2, "periodDurationMs"    # J
    .param p4, "contentId"    # Ljava/lang/String;
    .param p5, "revisionId"    # J
    .param p7, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p8, "uri"    # Landroid/net/Uri;
    .param p9, "initializationStart"    # J
    .param p11, "initializationEnd"    # J
    .param p13, "indexStart"    # J
    .param p15, "indexEnd"    # J
    .param p17, "contentLength"    # J

    .prologue
    .line 179
    new-instance v1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    const/4 v3, 0x0

    sub-long v4, p11, p9

    const-wide/16 v6, 0x1

    add-long/2addr v6, v4

    move-object/from16 v2, p8

    move-wide/from16 v4, p9

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Landroid/net/Uri;Ljava/lang/String;JJ)V

    .line 181
    .local v1, "rangedUri":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    const-wide/16 v2, 0x1

    const-wide/16 v4, 0x0

    sub-long v6, p15, p13

    const-wide/16 v8, 0x1

    add-long v9, v6, v8

    move-object/from16 v6, p8

    move-wide/from16 v7, p13

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJLandroid/net/Uri;JJ)V

    .line 183
    .local v0, "segmentBase":Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;
    new-instance v2, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;

    move-wide v3, p0

    move-wide/from16 v5, p2

    move-object/from16 v7, p4

    move-wide/from16 v8, p5

    move-object/from16 v10, p7

    move-object v11, v0

    move-wide/from16 v12, p17

    invoke-direct/range {v2 .. v13}, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;-><init>(JJLjava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;J)V

    return-object v2
.end method


# virtual methods
.method public getIndex()Lcom/google/android/exoplayer/dash/DashSegmentIndex;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->segmentIndex:Lcom/google/android/exoplayer/dash/DashSingleSegmentIndex;

    return-object v0
.end method

.method public getIndexUri()Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/Representation$SingleSegmentRepresentation;->indexUri:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    return-object v0
.end method
