.class final Lcom/google/android/exoplayer/ExoPlayerImpl;
.super Ljava/lang/Object;
.source "ExoPlayerImpl.java"

# interfaces
.implements Lcom/google/android/exoplayer/ExoPlayer;


# static fields
.field private static final TAG:Ljava/lang/String; = "ExoPlayerImpl"


# instance fields
.field private final eventHandler:Landroid/os/Handler;

.field private final internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

.field private final listeners:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet",
            "<",
            "Lcom/google/android/exoplayer/ExoPlayer$Listener;",
            ">;"
        }
    .end annotation
.end field

.field private pendingPlayWhenReadyAcks:I

.field private playWhenReady:Z

.field private playbackState:I

.field private final rendererEnabledFlags:[Z


# direct methods
.method public constructor <init>(III)V
    .locals 7
    .param p1, "rendererCount"    # I
    .param p2, "minBufferMs"    # I
    .param p3, "minRebufferMs"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const-string v0, "ExoPlayerImpl"

    const-string v1, "Init 1.2.4"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playWhenReady:Z

    .line 57
    iput v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playbackState:I

    .line 58
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->listeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 59
    new-array v0, p1, [Z

    iput-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->rendererEnabledFlags:[Z

    .line 60
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->rendererEnabledFlags:[Z

    array-length v0, v0

    if-ge v6, v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->rendererEnabledFlags:[Z

    aput-boolean v2, v0, v6

    .line 60
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 63
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer/ExoPlayerImpl$1;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer/ExoPlayerImpl$1;-><init>(Lcom/google/android/exoplayer/ExoPlayerImpl;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->eventHandler:Landroid/os/Handler;

    .line 69
    new-instance v0, Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    iget-object v1, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->eventHandler:Landroid/os/Handler;

    iget-boolean v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playWhenReady:Z

    iget-object v3, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->rendererEnabledFlags:[Z

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;-><init>(Landroid/os/Handler;Z[ZII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    .line 71
    return-void
.end method


# virtual methods
.method public addListener(Lcom/google/android/exoplayer/ExoPlayer$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/exoplayer/ExoPlayer$Listener;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->listeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    .line 81
    return-void
.end method

.method public blockingSendMessage(Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;ILjava/lang/Object;)V
    .locals 1
    .param p1, "target"    # Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;
    .param p2, "messageType"    # I
    .param p3, "message"    # Ljava/lang/Object;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->blockingSendMessage(Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;ILjava/lang/Object;)V

    .line 157
    return-void
.end method

.method public getBufferedPercentage()I
    .locals 10

    .prologue
    const-wide/16 v4, 0x64

    const-wide/16 v8, -0x1

    .line 176
    invoke-virtual {p0}, Lcom/google/android/exoplayer/ExoPlayerImpl;->getBufferedPosition()J

    move-result-wide v0

    .line 177
    .local v0, "bufferedPosition":J
    invoke-virtual {p0}, Lcom/google/android/exoplayer/ExoPlayerImpl;->getDuration()J

    move-result-wide v2

    .line 178
    .local v2, "duration":J
    cmp-long v6, v0, v8

    if-eqz v6, :cond_0

    cmp-long v6, v2, v8

    if-nez v6, :cond_1

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return v4

    :cond_1
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-nez v6, :cond_2

    :goto_1
    long-to-int v4, v4

    goto :goto_0

    :cond_2
    mul-long/2addr v4, v0

    div-long/2addr v4, v2

    goto :goto_1
.end method

.method public getBufferedPosition()J
    .locals 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->getBufferedPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getPlayWhenReady()Z
    .locals 1

    .prologue
    .line 125
    iget-boolean v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playWhenReady:Z

    return v0
.end method

.method public getPlaybackLooper()Landroid/os/Looper;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->getPlaybackLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method

.method public getPlaybackState()I
    .locals 1

    .prologue
    .line 90
    iget v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playbackState:I

    return v0
.end method

.method public getRendererEnabled(I)Z
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 108
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->rendererEnabledFlags:[Z

    aget-boolean v0, v0, p1

    return v0
.end method

.method handleEvent(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 184
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 209
    :cond_0
    return-void

    .line 186
    :pswitch_0
    iget v2, p1, Landroid/os/Message;->arg1:I

    iput v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playbackState:I

    .line 187
    iget-object v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->listeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/ExoPlayer$Listener;

    .line 188
    .local v1, "listener":Lcom/google/android/exoplayer/ExoPlayer$Listener;
    iget-boolean v3, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playWhenReady:Z

    iget v4, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playbackState:I

    invoke-interface {v1, v3, v4}, Lcom/google/android/exoplayer/ExoPlayer$Listener;->onPlayerStateChanged(ZI)V

    goto :goto_0

    .line 193
    .end local v1    # "listener":Lcom/google/android/exoplayer/ExoPlayer$Listener;
    :pswitch_1
    iget v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->pendingPlayWhenReadyAcks:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->pendingPlayWhenReadyAcks:I

    .line 194
    iget v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->pendingPlayWhenReadyAcks:I

    if-nez v2, :cond_0

    .line 195
    iget-object v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->listeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/ExoPlayer$Listener;

    .line 196
    .restart local v1    # "listener":Lcom/google/android/exoplayer/ExoPlayer$Listener;
    invoke-interface {v1}, Lcom/google/android/exoplayer/ExoPlayer$Listener;->onPlayWhenReadyCommitted()V

    goto :goto_1

    .line 202
    .end local v1    # "listener":Lcom/google/android/exoplayer/ExoPlayer$Listener;
    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/exoplayer/ExoPlaybackException;

    .line 203
    .local v0, "exception":Lcom/google/android/exoplayer/ExoPlaybackException;
    iget-object v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->listeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer/ExoPlayer$Listener;

    .line 204
    .restart local v1    # "listener":Lcom/google/android/exoplayer/ExoPlayer$Listener;
    invoke-interface {v1, v0}, Lcom/google/android/exoplayer/ExoPlayer$Listener;->onPlayerError(Lcom/google/android/exoplayer/ExoPlaybackException;)V

    goto :goto_2

    .line 184
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public isPlayWhenReadyCommitted()Z
    .locals 1

    .prologue
    .line 130
    iget v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->pendingPlayWhenReadyAcks:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public varargs prepare([Lcom/google/android/exoplayer/TrackRenderer;)V
    .locals 1
    .param p1, "renderers"    # [Lcom/google/android/exoplayer/TrackRenderer;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->prepare([Lcom/google/android/exoplayer/TrackRenderer;)V

    .line 96
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->release()V

    .line 146
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->eventHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 147
    return-void
.end method

.method public removeListener(Lcom/google/android/exoplayer/ExoPlayer$Listener;)V
    .locals 1
    .param p1, "listener"    # Lcom/google/android/exoplayer/ExoPlayer$Listener;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->listeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    .line 86
    return-void
.end method

.method public seekTo(J)V
    .locals 1
    .param p1, "positionMs"    # J

    .prologue
    .line 135
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->seekTo(J)V

    .line 136
    return-void
.end method

.method public sendMessage(Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;ILjava/lang/Object;)V
    .locals 1
    .param p1, "target"    # Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;
    .param p2, "messageType"    # I
    .param p3, "message"    # Ljava/lang/Object;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->sendMessage(Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;ILjava/lang/Object;)V

    .line 152
    return-void
.end method

.method public setPlayWhenReady(Z)V
    .locals 3
    .param p1, "playWhenReady"    # Z

    .prologue
    .line 113
    iget-boolean v1, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playWhenReady:Z

    if-eq v1, p1, :cond_0

    .line 114
    iput-boolean p1, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playWhenReady:Z

    .line 115
    iget v1, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->pendingPlayWhenReadyAcks:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->pendingPlayWhenReadyAcks:I

    .line 116
    iget-object v1, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->setPlayWhenReady(Z)V

    .line 117
    iget-object v1, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->listeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/ExoPlayer$Listener;

    .line 118
    .local v0, "listener":Lcom/google/android/exoplayer/ExoPlayer$Listener;
    iget v2, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->playbackState:I

    invoke-interface {v0, p1, v2}, Lcom/google/android/exoplayer/ExoPlayer$Listener;->onPlayerStateChanged(ZI)V

    goto :goto_0

    .line 121
    .end local v0    # "listener":Lcom/google/android/exoplayer/ExoPlayer$Listener;
    :cond_0
    return-void
.end method

.method public setRendererEnabled(IZ)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "enabled"    # Z

    .prologue
    .line 100
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->rendererEnabledFlags:[Z

    aget-boolean v0, v0, p1

    if-eq v0, p2, :cond_0

    .line 101
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->rendererEnabledFlags:[Z

    aput-boolean p2, v0, p1

    .line 102
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->setRendererEnabled(IZ)V

    .line 104
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/google/android/exoplayer/ExoPlayerImpl;->internalPlayer:Lcom/google/android/exoplayer/ExoPlayerImplInternal;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/ExoPlayerImplInternal;->stop()V

    .line 141
    return-void
.end method
