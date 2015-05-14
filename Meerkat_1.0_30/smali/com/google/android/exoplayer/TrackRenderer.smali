.class public abstract Lcom/google/android/exoplayer/TrackRenderer;
.super Ljava/lang/Object;
.source "TrackRenderer.java"

# interfaces
.implements Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;


# static fields
.field public static final END_OF_TRACK_US:J = -0x3L

.field public static final MATCH_LONGEST_US:J = -0x2L

.field protected static final STATE_ENABLED:I = 0x2

.field protected static final STATE_IGNORE:I = -0x1

.field protected static final STATE_PREPARED:I = 0x1

.field protected static final STATE_RELEASED:I = -0x2

.field protected static final STATE_STARTED:I = 0x3

.field protected static final STATE_UNPREPARED:I = 0x0

.field public static final UNKNOWN_TIME_US:J = -0x1L


# instance fields
.field private state:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method final disable()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 210
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 211
    iput v1, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    .line 212
    invoke-virtual {p0}, Lcom/google/android/exoplayer/TrackRenderer;->onDisabled()V

    .line 213
    return-void

    .line 210
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract doPrepare()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation
.end method

.method protected abstract doSomeWork(JJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation
.end method

.method final enable(JZ)V
    .locals 3
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 145
    iget v1, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    if-ne v1, v0, :cond_0

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 146
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    .line 147
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/exoplayer/TrackRenderer;->onEnabled(JZ)V

    .line 148
    return-void

    .line 145
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract getBufferedPositionUs()J
.end method

.method protected abstract getCurrentPositionUs()J
.end method

.method protected abstract getDurationUs()J
.end method

.method protected final getState()I
    .locals 1

    .prologue
    .line 104
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    return v0
.end method

.method public handleMessage(ILjava/lang/Object;)V
    .locals 0
    .param p1, "what"    # I
    .param p2, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 349
    return-void
.end method

.method protected abstract isEnded()Z
.end method

.method protected abstract isReady()Z
.end method

.method protected isTimeSource()Z
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x0

    return v0
.end method

.method protected onDisabled()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 224
    return-void
.end method

.method protected onEnabled(JZ)V
    .locals 0
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 163
    return-void
.end method

.method protected onReleased()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 246
    return-void
.end method

.method protected onStarted()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 184
    return-void
.end method

.method protected onStopped()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 204
    return-void
.end method

.method final prepare()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 114
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 115
    invoke-virtual {p0}, Lcom/google/android/exoplayer/TrackRenderer;->doPrepare()I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    .line 116
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_1

    :cond_0
    move v2, v1

    :cond_1
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 119
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    return v0

    :cond_2
    move v0, v2

    .line 114
    goto :goto_0
.end method

.method final release()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x2

    .line 230
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    if-eq v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 233
    iput v2, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    .line 234
    invoke-virtual {p0}, Lcom/google/android/exoplayer/TrackRenderer;->onReleased()V

    .line 235
    return-void

    .line 230
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract seekTo(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation
.end method

.method final start()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 170
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 171
    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    .line 172
    invoke-virtual {p0}, Lcom/google/android/exoplayer/TrackRenderer;->onStarted()V

    .line 173
    return-void

    .line 170
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final stop()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 190
    iget v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 191
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/TrackRenderer;->state:I

    .line 192
    invoke-virtual {p0}, Lcom/google/android/exoplayer/TrackRenderer;->onStopped()V

    .line 193
    return-void

    .line 190
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
