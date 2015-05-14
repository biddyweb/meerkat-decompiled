.class public Lcom/google/android/exoplayer/util/PlayerControl;
.super Ljava/lang/Object;
.source "PlayerControl.java"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# instance fields
.field private final exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/ExoPlayer;)V
    .locals 0
    .param p1, "exoPlayer"    # Lcom/google/android/exoplayer/ExoPlayer;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    .line 34
    return-void
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x1

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x1

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .prologue
    .line 63
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer/ExoPlayer;->getBufferedPercentage()I

    move-result v0

    return v0
.end method

.method public getCurrentPosition()I
    .locals 4

    .prologue
    .line 73
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 74
    :goto_0
    return v0

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    .line 74
    invoke-interface {v0}, Lcom/google/android/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    long-to-int v0, v0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 4

    .prologue
    .line 79
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 80
    :goto_0
    return v0

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    .line 80
    invoke-interface {v0}, Lcom/google/android/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v0

    long-to-int v0, v0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result v0

    return v0
.end method

.method public pause()V
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/ExoPlayer;->setPlayWhenReady(Z)V

    .line 96
    return-void
.end method

.method public seekTo(I)V
    .locals 6
    .param p1, "timeMillis"    # I

    .prologue
    .line 100
    iget-object v2, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v2}, Lcom/google/android/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    const-wide/16 v0, 0x0

    .line 102
    .local v0, "seekPosition":J
    :goto_0
    iget-object v2, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v2, v0, v1}, Lcom/google/android/exoplayer/ExoPlayer;->seekTo(J)V

    .line 103
    return-void

    .line 100
    .end local v0    # "seekPosition":J
    :cond_0
    const/4 v2, 0x0

    .line 101
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/PlayerControl;->getDuration()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-long v0, v2

    goto :goto_0
.end method

.method public start()V
    .locals 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/google/android/exoplayer/util/PlayerControl;->exoPlayer:Lcom/google/android/exoplayer/ExoPlayer;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/ExoPlayer;->setPlayWhenReady(Z)V

    .line 91
    return-void
.end method
