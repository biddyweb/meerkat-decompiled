.class Lcom/google/android/exoplayer/MediaClock;
.super Ljava/lang/Object;
.source "MediaClock.java"


# instance fields
.field private deltaUs:J

.field private positionUs:J

.field private started:Z


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private elapsedRealtimeMinus(J)J
    .locals 5
    .param p1, "toSubtractUs"    # J

    .prologue
    .line 76
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    sub-long/2addr v0, p1

    return-wide v0
.end method


# virtual methods
.method public getPositionUs()J
    .locals 2

    .prologue
    .line 72
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaClock;->started:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaClock;->deltaUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/MediaClock;->elapsedRealtimeMinus(J)J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaClock;->positionUs:J

    goto :goto_0
.end method

.method public setPositionUs(J)V
    .locals 3
    .param p1, "timeUs"    # J

    .prologue
    .line 64
    iput-wide p1, p0, Lcom/google/android/exoplayer/MediaClock;->positionUs:J

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/MediaClock;->elapsedRealtimeMinus(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaClock;->deltaUs:J

    .line 66
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaClock;->started:Z

    if-nez v0, :cond_0

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaClock;->started:Z

    .line 46
    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaClock;->positionUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/MediaClock;->elapsedRealtimeMinus(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaClock;->deltaUs:J

    .line 48
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/google/android/exoplayer/MediaClock;->started:Z

    if-eqz v0, :cond_0

    .line 55
    iget-wide v0, p0, Lcom/google/android/exoplayer/MediaClock;->deltaUs:J

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer/MediaClock;->elapsedRealtimeMinus(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer/MediaClock;->positionUs:J

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/MediaClock;->started:Z

    .line 58
    :cond_0
    return-void
.end method
