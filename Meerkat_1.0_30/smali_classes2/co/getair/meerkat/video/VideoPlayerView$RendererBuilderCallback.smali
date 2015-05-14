.class final Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;
.super Ljava/lang/Object;
.source "VideoPlayerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/VideoPlayerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "RendererBuilderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/VideoPlayerView;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/VideoPlayerView;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/VideoPlayerView;

    .prologue
    .line 54
    iput-object p1, p0, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRenderers(Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    .locals 4
    .param p1, "audioRenderer"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    .prologue
    .line 65
    const-string v1, "onRenderers(2) callback - player is: %s"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    # getter for: Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;
    invoke-static {v0}, Lco/getair/meerkat/video/VideoPlayerView;->access$000(Lco/getair/meerkat/video/VideoPlayerView;)Lcom/google/android/exoplayer/ExoPlayer;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "null"

    :goto_0
    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    # invokes: Lco/getair/meerkat/video/VideoPlayerView;->onRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    invoke-static {v0, p0, p1}, Lco/getair/meerkat/video/VideoPlayerView;->access$200(Lco/getair/meerkat/video/VideoPlayerView;Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V

    .line 67
    return-void

    .line 65
    :cond_0
    const-string v0, "not null"

    goto :goto_0
.end method

.method public onRenderers(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    .locals 4
    .param p1, "videoRenderer"    # Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;
    .param p2, "audioRenderer"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    .prologue
    .line 59
    const-string v1, "onRenderers(1) callback - player is: %s"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    # getter for: Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;
    invoke-static {v0}, Lco/getair/meerkat/video/VideoPlayerView;->access$000(Lco/getair/meerkat/video/VideoPlayerView;)Lcom/google/android/exoplayer/ExoPlayer;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "null"

    :goto_0
    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 61
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    # invokes: Lco/getair/meerkat/video/VideoPlayerView;->onRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    invoke-static {v0, p0, p1, p2}, Lco/getair/meerkat/video/VideoPlayerView;->access$100(Lco/getair/meerkat/video/VideoPlayerView;Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V

    .line 62
    return-void

    .line 59
    :cond_0
    const-string v0, "not null"

    goto :goto_0
.end method

.method public onRenderersError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 70
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    # invokes: Lco/getair/meerkat/video/VideoPlayerView;->onRenderersError(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Ljava/lang/Exception;)V
    invoke-static {v0, p0, p1}, Lco/getair/meerkat/video/VideoPlayerView;->access$300(Lco/getair/meerkat/video/VideoPlayerView;Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Ljava/lang/Exception;)V

    .line 71
    return-void
.end method
