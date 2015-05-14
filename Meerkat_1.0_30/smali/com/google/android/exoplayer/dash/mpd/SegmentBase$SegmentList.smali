.class public Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;
.super Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;
.source "SegmentBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SegmentList"
.end annotation


# instance fields
.field final mediaSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/RangedUri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;Ljava/util/List;)V
    .locals 0
    .param p1, "initialization"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "periodDurationMs"    # J
    .param p8, "startNumber"    # I
    .param p9, "duration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/dash/mpd/RangedUri;",
            "JJJIJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/RangedUri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 261
    .local p11, "segmentTimeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    .local p12, "mediaSegments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/RangedUri;>;"
    invoke-direct/range {p0 .. p11}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;)V

    .line 263
    iput-object p12, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->mediaSegments:Ljava/util/List;

    .line 264
    return-void
.end method


# virtual methods
.method public getLastSegmentNum()I
    .locals 2

    .prologue
    .line 273
    iget v0, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->startNumber:I

    iget-object v1, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->mediaSegments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getSegmentUrl(Lcom/google/android/exoplayer/dash/mpd/Representation;I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 2
    .param p1, "representation"    # Lcom/google/android/exoplayer/dash/mpd/Representation;
    .param p2, "sequenceNumber"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->mediaSegments:Ljava/util/List;

    iget v1, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->startNumber:I

    sub-int v1, p2, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    return-object v0
.end method

.method public isExplicit()Z
    .locals 1

    .prologue
    .line 278
    const/4 v0, 0x1

    return v0
.end method
