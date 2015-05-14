.class public final Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;
.super Ljava/lang/Object;
.source "Mp4TrackSampleTable.java"


# instance fields
.field public final flags:[I

.field public final offsets:[J

.field public final sizes:[I

.field public final timestampsUs:[J


# direct methods
.method constructor <init>([J[I[J[I)V
    .locals 4
    .param p1, "offsets"    # [J
    .param p2, "sizes"    # [I
    .param p3, "timestampsUs"    # [J
    .param p4, "flags"    # [I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    array-length v0, p2

    array-length v3, p3

    if-ne v0, v3, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 37
    array-length v0, p1

    array-length v3, p3

    if-ne v0, v3, :cond_1

    move v0, v1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 38
    array-length v0, p4

    array-length v3, p3

    if-ne v0, v3, :cond_2

    :goto_2
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 40
    iput-object p1, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->offsets:[J

    .line 41
    iput-object p2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->sizes:[I

    .line 42
    iput-object p3, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->timestampsUs:[J

    .line 43
    iput-object p4, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->flags:[I

    .line 44
    return-void

    :cond_0
    move v0, v2

    .line 36
    goto :goto_0

    :cond_1
    move v0, v2

    .line 37
    goto :goto_1

    :cond_2
    move v1, v2

    .line 38
    goto :goto_2
.end method


# virtual methods
.method public getIndexOfEarlierOrEqualSynchronizationSample(J)I
    .locals 5
    .param p1, "timeUs"    # J

    .prologue
    .line 59
    iget-object v2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->timestampsUs:[J

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, p1, p2, v3, v4}, Lcom/google/android/exoplayer/util/Util;->binarySearchFloor([JJZZ)I

    move-result v1

    .line 60
    .local v1, "startIndex":I
    move v0, v1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 61
    iget-object v2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->timestampsUs:[J

    aget-wide v2, v2, v0

    cmp-long v2, v2, p1

    if-gtz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->flags:[I

    aget v2, v2, v0

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 66
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 60
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 66
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public getIndexOfLaterOrEqualSynchronizationSample(J)I
    .locals 5
    .param p1, "timeUs"    # J

    .prologue
    .line 77
    iget-object v2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->timestampsUs:[J

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, p1, p2, v3, v4}, Lcom/google/android/exoplayer/util/Util;->binarySearchCeil([JJZZ)I

    move-result v1

    .line 78
    .local v1, "startIndex":I
    move v0, v1

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->timestampsUs:[J

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 79
    iget-object v2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->timestampsUs:[J

    aget-wide v2, v2, v0

    cmp-long v2, v2, p1

    if-ltz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->flags:[I

    aget v2, v2, v0

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    .line 84
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 78
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public getSampleCount()I
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/google/android/exoplayer/mp4/Mp4TrackSampleTable;->sizes:[I

    array-length v0, v0

    return v0
.end method
