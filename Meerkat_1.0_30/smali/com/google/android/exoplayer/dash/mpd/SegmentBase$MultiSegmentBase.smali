.class public abstract Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;
.super Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
.source "SegmentBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "MultiSegmentBase"
.end annotation


# instance fields
.field final duration:J

.field final periodDurationMs:J

.field final segmentTimeline:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;",
            ">;"
        }
    .end annotation
.end field

.field final startNumber:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;)V
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
            ">;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p11, "segmentTimeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    invoke-direct/range {p0 .. p5}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJ)V

    .line 141
    iput-wide p6, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->periodDurationMs:J

    .line 142
    iput p8, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    .line 143
    iput-wide p9, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    .line 144
    iput-object p11, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    .line 145
    return-void
.end method


# virtual methods
.method public getFirstSegmentNum()I
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    return v0
.end method

.method public abstract getLastSegmentNum()I
.end method

.method public final getSegmentDurationUs(I)J
    .locals 6
    .param p1, "sequenceNumber"    # I

    .prologue
    const-wide/32 v4, 0xf4240

    .line 182
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 183
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    iget v3, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    sub-int v3, p1, v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;

    iget-wide v0, v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;->duration:J

    .line 184
    .local v0, "duration":J
    mul-long v2, v0, v4

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    div-long/2addr v2, v4

    .line 187
    .end local v0    # "duration":J
    :goto_0
    return-wide v2

    .line 186
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getLastSegmentNum()I

    move-result v2

    if-ne p1, v2, :cond_1

    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->periodDurationMs:J

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    .line 187
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getSegmentTimeUs(I)J

    move-result-wide v4

    sub-long/2addr v2, v4

    goto :goto_0

    :cond_1
    iget-wide v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    mul-long/2addr v2, v4

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    div-long/2addr v2, v4

    goto :goto_0
.end method

.method public getSegmentNum(J)I
    .locals 13
    .param p1, "timeUs"    # J

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getFirstSegmentNum()I

    move-result v3

    .line 152
    .local v3, "lowIndex":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getLastSegmentNum()I

    move-result v2

    .line 153
    .local v2, "highIndex":I
    iget-object v8, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-nez v8, :cond_2

    .line 155
    iget-wide v8, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    const-wide/32 v10, 0xf4240

    mul-long/2addr v8, v10

    iget-wide v10, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    div-long v0, v8, v10

    .line 156
    .local v0, "durationUs":J
    iget v8, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    div-long v10, p1, v0

    long-to-int v9, v10

    add-int v5, v8, v9

    .line 158
    .local v5, "segmentNum":I
    if-ge v5, v3, :cond_1

    move v5, v3

    .line 174
    .end local v0    # "durationUs":J
    .end local v5    # "segmentNum":I
    :cond_0
    :goto_0
    return v5

    .line 158
    .restart local v0    # "durationUs":J
    .restart local v5    # "segmentNum":I
    :cond_1
    const/4 v8, -0x1

    if-eq v2, v8, :cond_0

    if-le v5, v2, :cond_0

    move v5, v2

    goto :goto_0

    .line 163
    .end local v0    # "durationUs":J
    .end local v5    # "segmentNum":I
    :cond_2
    :goto_1
    if-gt v3, v2, :cond_5

    .line 164
    add-int v8, v3, v2

    div-int/lit8 v4, v8, 0x2

    .line 165
    .local v4, "midIndex":I
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->getSegmentTimeUs(I)J

    move-result-wide v6

    .line 166
    .local v6, "midTimeUs":J
    cmp-long v8, v6, p1

    if-gez v8, :cond_3

    .line 167
    add-int/lit8 v3, v4, 0x1

    goto :goto_1

    .line 168
    :cond_3
    cmp-long v8, v6, p1

    if-lez v8, :cond_4

    .line 169
    add-int/lit8 v2, v4, -0x1

    goto :goto_1

    :cond_4
    move v5, v4

    .line 171
    goto :goto_0

    .line 174
    .end local v4    # "midIndex":I
    .end local v6    # "midTimeUs":J
    :cond_5
    add-int/lit8 v5, v3, -0x1

    goto :goto_0
.end method

.method public final getSegmentTimeUs(I)J
    .locals 6
    .param p1, "sequenceNumber"    # I

    .prologue
    .line 197
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-eqz v2, :cond_0

    .line 198
    iget-object v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    iget v3, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    sub-int v3, p1, v3

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;

    iget-wide v2, v2, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;->startTime:J

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->presentationTimeOffset:J

    sub-long v0, v2, v4

    .line 203
    .local v0, "unscaledSegmentTime":J
    :goto_0
    const-wide/32 v2, 0xf4240

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->timescale:J

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v2

    return-wide v2

    .line 201
    .end local v0    # "unscaledSegmentTime":J
    :cond_0
    iget v2, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->startNumber:I

    sub-int v2, p1, v2

    int-to-long v2, v2

    iget-wide v4, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->duration:J

    mul-long v0, v2, v4

    .restart local v0    # "unscaledSegmentTime":J
    goto :goto_0
.end method

.method public abstract getSegmentUrl(Lcom/google/android/exoplayer/dash/mpd/Representation;I)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
.end method

.method public isExplicit()Z
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$MultiSegmentBase;->segmentTimeline:Ljava/util/List;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
