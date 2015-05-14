.class public Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;
.super Ljava/lang/Object;
.source "DashWrappingSegmentIndex.java"

# interfaces
.implements Lcom/google/android/exoplayer/dash/DashSegmentIndex;


# instance fields
.field private final indexAnchor:J

.field private final segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

.field private final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;Landroid/net/Uri;J)V
    .locals 1
    .param p1, "segmentIndex"    # Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "indexAnchor"    # J

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    .line 42
    iput-object p2, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->uri:Landroid/net/Uri;

    .line 43
    iput-wide p3, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->indexAnchor:J

    .line 44
    return-void
.end method


# virtual methods
.method public getDurationUs(I)J
    .locals 2
    .param p1, "segmentNum"    # I

    .prologue
    .line 63
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->durationsUs:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getFirstSegmentNum()I
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x0

    return v0
.end method

.method public getLastSegmentNum()I
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    iget v0, v0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->length:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getSegmentNum(J)I
    .locals 3
    .param p1, "timeUs"    # J

    .prologue
    const/4 v1, 0x1

    .line 74
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->timesUs:[J

    invoke-static {v0, p1, p2, v1, v1}, Lcom/google/android/exoplayer/util/Util;->binarySearchFloor([JJZZ)I

    move-result v0

    return v0
.end method

.method public getSegmentUrl(I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 8
    .param p1, "segmentNum"    # I

    .prologue
    .line 68
    new-instance v1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    iget-object v2, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->uri:Landroid/net/Uri;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->indexAnchor:J

    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->offsets:[J

    aget-wide v6, v0, p1

    add-long/2addr v4, v6

    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->sizes:[I

    aget v0, v0, p1

    int-to-long v6, v0

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Landroid/net/Uri;Ljava/lang/String;JJ)V

    return-object v1
.end method

.method public getTimeUs(I)J
    .locals 2
    .param p1, "segmentNum"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/DashWrappingSegmentIndex;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;->timesUs:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public isExplicit()Z
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x1

    return v0
.end method
