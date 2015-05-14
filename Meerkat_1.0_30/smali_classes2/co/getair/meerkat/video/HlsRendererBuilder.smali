.class Lco/getair/meerkat/video/HlsRendererBuilder;
.super Ljava/lang/Object;
.source "HlsRendererBuilder.java"

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
.field public static final RENDERER_COUNT:I = 0x2

.field public static final TYPE_AUDIO:I = 0x1

.field public static final TYPE_TEXT:I = 0x2

.field public static final TYPE_TIMED_METADATA:I = 0x3

.field public static final TYPE_VIDEO:I


# instance fields
.field private final audioEventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

.field private callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

.field private final contentId:Ljava/lang/String;

.field private final mainHandler:Landroid/os/Handler;

.field private final mainLooper:Landroid/os/Looper;

.field private final url:Ljava/lang/String;

.field private final userAgent:Ljava/lang/String;

.field private final videoEventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;Landroid/os/Handler;)V
    .locals 0
    .param p1, "videoEventListener"    # Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;
    .param p2, "audioEventListener"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;
    .param p3, "userAgent"    # Ljava/lang/String;
    .param p4, "url"    # Ljava/lang/String;
    .param p5, "contentId"    # Ljava/lang/String;
    .param p6, "mainLooper"    # Landroid/os/Looper;
    .param p7, "mainHandler"    # Landroid/os/Handler;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->videoEventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

    .line 67
    iput-object p2, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->audioEventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    .line 68
    iput-object p3, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->userAgent:Ljava/lang/String;

    .line 69
    iput-object p4, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->url:Ljava/lang/String;

    .line 70
    iput-object p5, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->contentId:Ljava/lang/String;

    .line 71
    iput-object p7, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->mainHandler:Landroid/os/Handler;

    .line 72
    iput-object p6, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->mainLooper:Landroid/os/Looper;

    .line 73
    return-void
.end method


# virtual methods
.method public buildRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;)V
    .locals 5
    .param p1, "callback"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .prologue
    .line 77
    iput-object p1, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .line 78
    new-instance v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;

    invoke-direct {v0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;-><init>()V

    .line 79
    .local v0, "parser":Lcom/google/android/exoplayer/hls/HlsPlaylistParser;
    new-instance v1, Lcom/google/android/exoplayer/util/ManifestFetcher;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->contentId:Ljava/lang/String;

    iget-object v3, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->url:Ljava/lang/String;

    iget-object v4, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->userAgent:Ljava/lang/String;

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/google/android/exoplayer/util/ManifestFetcher;-><init>(Lcom/google/android/exoplayer/util/ManifestParser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .local v1, "playlistFetcher":Lcom/google/android/exoplayer/util/ManifestFetcher;, "Lcom/google/android/exoplayer/util/ManifestFetcher<Lcom/google/android/exoplayer/hls/HlsPlaylist;>;"
    iget-object v2, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->mainLooper:Landroid/os/Looper;

    invoke-virtual {v1, v2, p0}, Lcom/google/android/exoplayer/util/ManifestFetcher;->singleLoad(Landroid/os/Looper;Lcom/google/android/exoplayer/util/ManifestFetcher$ManifestCallback;)V

    .line 83
    return-void
.end method

.method public onManifest(Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;)V
    .locals 15
    .param p1, "contentId"    # Ljava/lang/String;
    .param p2, "manifest"    # Lcom/google/android/exoplayer/hls/HlsPlaylist;

    .prologue
    .line 92
    new-instance v4, Lcom/google/android/exoplayer/upstream/DefaultBandwidthMeter;

    invoke-direct {v4}, Lcom/google/android/exoplayer/upstream/DefaultBandwidthMeter;-><init>()V

    .line 94
    .local v4, "bandwidthMeter":Lcom/google/android/exoplayer/upstream/DefaultBandwidthMeter;
    new-instance v1, Lcom/google/android/exoplayer/upstream/UriDataSource;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->userAgent:Ljava/lang/String;

    invoke-direct {v1, v2, v4}, Lcom/google/android/exoplayer/upstream/UriDataSource;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer/upstream/TransferListener;)V

    .line 95
    .local v1, "dataSource":Lcom/google/android/exoplayer/upstream/DataSource;
    new-instance v0, Lcom/google/android/exoplayer/hls/HlsChunkSource;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->url:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object/from16 v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/hls/HlsChunkSource;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;Lcom/google/android/exoplayer/upstream/BandwidthMeter;[II)V

    .line 97
    .local v0, "chunkSource":Lcom/google/android/exoplayer/hls/HlsChunkSource;
    new-instance v6, Lcom/google/android/exoplayer/hls/HlsSampleSource;

    const/4 v2, 0x1

    const/4 v3, 0x2

    invoke-direct {v6, v0, v2, v3}, Lcom/google/android/exoplayer/hls/HlsSampleSource;-><init>(Lcom/google/android/exoplayer/hls/HlsChunkSource;ZI)V

    .line 98
    .local v6, "sampleSource":Lcom/google/android/exoplayer/hls/HlsSampleSource;
    new-instance v5, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    const/4 v7, 0x1

    const-wide/16 v8, 0x1388

    iget-object v10, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->mainHandler:Landroid/os/Handler;

    iget-object v11, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->videoEventListener:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;

    const/16 v12, 0x32

    invoke-direct/range {v5 .. v12}, Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;IJLandroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;I)V

    .line 101
    .local v5, "videoRenderer":Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;
    new-instance v13, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    iget-object v2, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->mainHandler:Landroid/os/Handler;

    iget-object v3, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->audioEventListener:Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;

    invoke-direct {v13, v6, v2, v3}, Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;-><init>(Lcom/google/android/exoplayer/SampleSource;Landroid/os/Handler;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;)V

    .line 103
    .local v13, "audioRenderer":Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;
    const/4 v2, 0x2

    new-array v14, v2, [Lcom/google/android/exoplayer/TrackRenderer;

    .line 104
    .local v14, "renderers":[Lcom/google/android/exoplayer/TrackRenderer;
    const/4 v2, 0x0

    aput-object v5, v14, v2

    .line 105
    const/4 v2, 0x1

    aput-object v13, v14, v2

    .line 106
    iget-object v2, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    invoke-virtual {v2, v5, v13}, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->onRenderers(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V

    .line 107
    return-void
.end method

.method public bridge synthetic onManifest(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 45
    check-cast p2, Lcom/google/android/exoplayer/hls/HlsPlaylist;

    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/HlsRendererBuilder;->onManifest(Ljava/lang/String;Lcom/google/android/exoplayer/hls/HlsPlaylist;)V

    return-void
.end method

.method public onManifestError(Ljava/lang/String;Ljava/io/IOException;)V
    .locals 1
    .param p1, "contentId"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/io/IOException;

    .prologue
    .line 87
    iget-object v0, p0, Lco/getair/meerkat/video/HlsRendererBuilder;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    invoke-virtual {v0, p2}, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;->onRenderersError(Ljava/lang/Exception;)V

    .line 88
    return-void
.end method
