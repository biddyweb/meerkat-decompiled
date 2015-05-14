.class public Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;
.super Ljava/lang/Object;
.source "HlsAudioOnlyRendererBuilder.java"

# interfaces
.implements Lco/getair/meerkat/video/VideoPlayerView$RendererBuilder;
.implements Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lco/getair/meerkat/video/VideoPlayerView$RendererBuilder;",
        "Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback",
        "<",
        "Lcom/google/android/exoplayer/hls/HlsPlaylist;",
        ">;"
    }
.end annotation


# static fields
.field public static final RENDERER_COUNT:I = 0x1

.field public static final TYPE_AUDIO:I


# instance fields
.field private final audioEventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

.field private callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

.field private final contentId:Ljava/lang/String;

.field private final mainHandler:Landroid/os/Handler;

.field private final mainLooper:Landroid/os/Looper;

.field private final url:Ljava/lang/String;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;Landroid/os/Handler;)V
    .locals 0
    .param p1, "audioEventListener"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;
    .param p2, "userAgent"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "contentId"    # Ljava/lang/String;
    .param p5, "mainLooper"    # Landroid/os/Looper;
    .param p6, "mainHandler"    # Landroid/os/Handler;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->audioEventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    .line 40
    iput-object p2, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->userAgent:Ljava/lang/String;

    .line 41
    iput-object p3, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->url:Ljava/lang/String;

    .line 42
    iput-object p4, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->contentId:Ljava/lang/String;

    .line 43
    iput-object p6, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->mainHandler:Landroid/os/Handler;

    .line 44
    iput-object p5, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->mainLooper:Landroid/os/Looper;

    .line 45
    return-void
.end method


# virtual methods
.method public buildRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;)V
    .locals 5
    .param p1, "callback"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .prologue
    .line 49
    iput-object p1, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .line 50
    new-instance v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    invoke-direct {v0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;-><init>()V

    .line 51
    .local v0, "parser":Lcom/google/android/exoplayer/hls/HlsPlaylistParser;
    new-instance v1, Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->contentId:Ljava/lang/String;

    iget-object v3, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->url:Ljava/lang/String;

    iget-object v4, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->userAgent:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/google/android/exoplayer/util/ManifestFetcher;-><init>(Lcom/google/android/exoplayer/util/ManifestParser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .local v1, "playlistFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/hls/HlsPlaylist;>;"
    iget-object v2, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->mainLooper:Landroid/os/Looper;

    invoke-virtual {v1, v2, p0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->singleLoad(Landroid/os/Looper;Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;)V

    .line 55
    return-void
.end method

.method public onManifest(Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;)V
    .locals 10
    .param p1, "contentId"    # Ljava/lang/String;
    .param p2, "manifest"    # Lcom/google/android/exoplayer/hls/HlsPlaylist;

    .prologue
    const/4 v6, 0x1

    .line 64
    new-instance v4, Lcom/google/android/exoplayer/upstream/DefaultBandwidthMeter;

    invoke-direct {v4}, Lcom/google/android/exoplayer/upstream/DefaultBandwidthMeter;-><init>()V

    .line 66
    .local v4, "bandwidthMeter":Lcom/google/android/exoplayer/upstream/DefaultBandwidthMeter;
    new-instance v1, Lcom/google/android/exoplayer/upstream/UriDataSource;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->userAgent:Ljava/lang/String;

    invoke-direct {v1, v2, v4}, Lcom/google/android/exoplayer/upstream/UriDataSource;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/upstream/TransferListener;)V

    .line 67
    .local v1, "dataSource":Lcom/google/android/exoplayer/upstream/DataSource;
    new-instance v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->url:Ljava/lang/String;

    const/4 v5, 0x0

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/upstream/BandwidthMeter;[II)V

    .line 69
    .local v0, "chunkSource":Lcom/google/android/exoplayer/hls/HlsChunkSource;
    new-instance v9, Lcom/google/android/exoplayer/hls/HlsSampleSource;

    const/4 v2, 0x2

    invoke-direct {v9, v0, v6, v2}, Lcom/google/android/exoplayer/hls/HlsSampleSource;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;ZI)V

    .line 70
    .local v9, "sampleSource":Lcom/google/android/exoplayer/hls/HlsSampleSource;
    new-instance v7, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->mainHandler:Landroid/os/Handler;

    iget-object v3, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->audioEventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    invoke-direct {v7, v9, v2, v3}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;Landroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;)V

    .line 72
    .local v7, "audioRenderer":Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;
    new-array v8, v6, [Lcom/google/android/exoplayer/TrackRenderer;

    .line 73
    .local v8, "renderers":[Lcom/google/android/exoplayer/TrackRenderer;
    const/4 v2, 0x0

    aput-object v7, v8, v2

    .line 74
    iget-object v2, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    invoke-virtual {v2, v7}, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->onRenderers(Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V

    .line 75
    return-void
.end method

.method public bridge synthetic onManifest(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 22
    check-cast p2, Lcom/google/android/exoplayer/hls/HlsPlaylist;

    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->onManifest(Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;)V

    return-void
.end method

.method public onManifestError(Ljava/lang/String;Ljava/io/IOException;)V
    .locals 1
    .param p1, "contentId"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 59
    iget-object v0, p0, Lco/getair/meerkat/video/HlsAudioOnlyRendererBuilder;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    invoke-virtual {v0, p2}, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->onRenderersError(Ljava/lang/Exception;)V

    .line 60
    return-void
.end method
