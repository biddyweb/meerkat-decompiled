.class public Lco/getair/meerkat/video/VideoPlayerView;
.super Landroid/widget/RelativeLayout;
.source "VideoPlayerView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/google/android/exoplayer/ExoPlayer$Listener;
.implements Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;
.implements Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;,
        Lco/getair/meerkat/video/VideoPlayerView$RendererBuilder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoPlayerView"


# instance fields
.field private builder:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilder;

.field private callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

.field private didPlayerStarted:Z

.field private mainHandler:Landroid/os/Handler;

.field private player:Lcom/google/android/exoplayer/ExoPlayer;

.field private playlistUrl:Ljava/lang/String;

.field private progressBar:Landroid/widget/ProgressBar;

.field private surfaceView:Lcom/google/android/exoplayer/VideoSurfaceView;

.field private userAgent:Ljava/lang/String;

.field private videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->didPlayerStarted:Z

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/VideoPlayerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/VideoPlayerView;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->userAgent:Ljava/lang/String;

    .line 94
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/VideoPlayerView;->init(Landroid/content/Context;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 98
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->didPlayerStarted:Z

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/VideoPlayerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/VideoPlayerView;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->userAgent:Ljava/lang/String;

    .line 99
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/VideoPlayerView;->init(Landroid/content/Context;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 103
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->didPlayerStarted:Z

    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/VideoPlayerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/VideoPlayerView;->getUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->userAgent:Ljava/lang/String;

    .line 104
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/VideoPlayerView;->init(Landroid/content/Context;)V

    .line 105
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/VideoPlayerView;)Lcom/google/android/exoplayer/ExoPlayer;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/VideoPlayerView;

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/VideoPlayerView;Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/VideoPlayerView;
    .param p1, "x1"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;
    .param p2, "x2"    # Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;
    .param p3, "x3"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/video/VideoPlayerView;->onRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/video/VideoPlayerView;Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/VideoPlayerView;
    .param p1, "x1"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;
    .param p2, "x2"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/video/VideoPlayerView;->onRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/video/VideoPlayerView;Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/VideoPlayerView;
    .param p1, "x1"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;
    .param p2, "x2"    # Ljava/lang/Exception;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lco/getair/meerkat/video/VideoPlayerView;->onRenderersError(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$400(Lco/getair/meerkat/video/VideoPlayerView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/VideoPlayerView;

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method public static getUserAgent(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 236
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 237
    .local v2, "packageName":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 238
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "packageName":Ljava/lang/String;
    .local v3, "versionName":Ljava/lang/String;
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ExoPlayerDemo/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " (Linux;Android "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ExoPlayerLib/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "1.2.4"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 239
    .end local v3    # "versionName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 240
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "?"

    .restart local v3    # "versionName":Ljava/lang/String;
    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 222
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 223
    .local v0, "layoutInflater":Landroid/view/LayoutInflater;
    const v1, 0x7f04004d

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 226
    const v1, 0x7f0e016b

    invoke-virtual {p0, v1}, Lco/getair/meerkat/video/VideoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->progressBar:Landroid/widget/ProgressBar;

    .line 228
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 229
    iget-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    new-instance v2, Landroid/graphics/LightingColorFilter;

    const/high16 v3, -0x1000000

    const v4, 0xffffff

    invoke-direct {v2, v3, v4}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 231
    :cond_0
    return-void
.end method

.method private maybeStartPlayback()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 304
    const-string v1, "VideoPlayerView"

    const-string v2, "maybeStartPlayback"

    invoke-static {v1, v2}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    iget-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->surfaceView:Lcom/google/android/exoplayer/VideoSurfaceView;

    invoke-virtual {v1}, Lcom/google/android/exoplayer/VideoSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 306
    .local v0, "surface":Landroid/view/Surface;
    iget-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v1

    if-nez v1, :cond_1

    .line 312
    :cond_0
    :goto_0
    return-void

    .line 310
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    iget-object v2, p0, Lco/getair/meerkat/video/VideoPlayerView;->videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    invoke-interface {v1, v2, v3, v0}, Lcom/google/android/exoplayer/ExoPlayer;->sendMessage(Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;ILjava/lang/Object;)V

    .line 311
    iget-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v1, v3}, Lcom/google/android/exoplayer/ExoPlayer;->setPlayWhenReady(Z)V

    goto :goto_0
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 325
    const-string v0, "VideoPlayerView"

    const-string v1, "Playback failed: %s  with stacktrace: \n %s "

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    return-void
.end method

.method private onRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    .locals 3
    .param p1, "callback"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;
    .param p2, "audioRenderer"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    .prologue
    .line 278
    const-string v0, "onRenderers(2) started"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 279
    const-string v0, "VideoPlayerView"

    const-string v1, "onRenderers"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    if-eq v0, p1, :cond_0

    .line 301
    :goto_0
    return-void

    .line 283
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .line 285
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    if-eqz v0, :cond_1

    if-nez p2, :cond_2

    .line 287
    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    if-nez v0, :cond_3

    .line 289
    const-string v0, "onRenderers returns a null object PLAYER "

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 299
    :cond_2
    :goto_1
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/google/android/exoplayer/TrackRenderer;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/ExoPlayer;->prepare([Lcom/google/android/exoplayer/TrackRenderer;)V

    .line 300
    invoke-direct {p0}, Lco/getair/meerkat/video/VideoPlayerView;->maybeStartPlayback()V

    goto :goto_0

    .line 290
    :cond_3
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    if-nez v0, :cond_4

    .line 291
    const-string v0, "onRenderers returns a null object VIDEO RENDERER"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 292
    :cond_4
    if-nez p2, :cond_5

    .line 293
    const-string v0, "onRenderers returns a null object AUDIO RENDERER"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 295
    :cond_5
    const-string v0, "onRenderers returns a null object unknown"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private onRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;)V
    .locals 3
    .param p1, "callback"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;
    .param p2, "videoRenderer"    # Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;
    .param p3, "audioRenderer"    # Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer;

    .prologue
    .line 249
    const-string v0, "onRenderers(1) started"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 251
    const-string v0, "VideoPlayerView"

    const-string v1, "onRenderers"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    if-eq v0, p1, :cond_0

    .line 275
    :goto_0
    return-void

    .line 255
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .line 256
    iput-object p2, p0, Lco/getair/meerkat/video/VideoPlayerView;->videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    .line 258
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    if-nez p3, :cond_2

    .line 261
    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    if-nez v0, :cond_3

    .line 263
    const-string v0, "onRenderers returns a null object PLAYER "

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 273
    :cond_2
    :goto_1
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/google/android/exoplayer/TrackRenderer;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/ExoPlayer;->prepare([Lcom/google/android/exoplayer/TrackRenderer;)V

    .line 274
    invoke-direct {p0}, Lco/getair/meerkat/video/VideoPlayerView;->maybeStartPlayback()V

    goto :goto_0

    .line 264
    :cond_3
    if-nez p2, :cond_4

    .line 265
    const-string v0, "onRenderers returns a null object VIDEO RENDERER"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 266
    :cond_4
    if-nez p3, :cond_5

    .line 267
    const-string v0, "onRenderers returns a null object AUDIO RENDERER"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 269
    :cond_5
    const-string v0, "onRenderers returns a null object unknown"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private onRenderersError(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;Ljava/lang/Exception;)V
    .locals 2
    .param p1, "callback"    # Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 315
    const-string v0, "VideoPlayerView"

    const-string v1, "onRenderersError"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    if-eq v0, p1, :cond_0

    .line 321
    :goto_0
    return-void

    .line 319
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .line 320
    invoke-direct {p0, p2}, Lco/getair/meerkat/video/VideoPlayerView;->onError(Ljava/lang/Exception;)V

    goto :goto_0
.end method


# virtual methods
.method public cleanVideoView()V
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer/ExoPlayer;->removeListener(Lcom/google/android/exoplayer/ExoPlayer$Listener;)V

    .line 129
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v0}, Lcom/google/android/exoplayer/ExoPlayer;->release()V

    .line 130
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    .line 131
    return-void
.end method

.method public onAudioTrackInitializationError(Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;)V
    .locals 1
    .param p1, "e"    # Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;

    .prologue
    .line 334
    const-string v0, "onAudioTrackInitializationError"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;)V

    .line 335
    return-void
.end method

.method public onAudioTrackWriteError(Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;)V
    .locals 1
    .param p1, "e"    # Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;

    .prologue
    .line 339
    const-string v0, "onAudioTrackWriteError"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;)V

    .line 340
    return-void
.end method

.method public onCryptoError(Landroid/media/MediaCodec$CryptoException;)V
    .locals 3
    .param p1, "e"    # Landroid/media/MediaCodec$CryptoException;

    .prologue
    .line 179
    const-string v0, "VideoPlayerView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCryptoError - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/media/MediaCodec$CryptoException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    return-void
.end method

.method public onDecoderInitializationError(Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;)V
    .locals 3
    .param p1, "e"    # Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;

    .prologue
    .line 174
    const-string v0, "VideoPlayerView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDecoderInitializationError - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/exoplayer/MediaCodecTrackRenderer$DecoderInitializationException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method public onDrawnToSurface(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .prologue
    .line 150
    const-string v0, "VideoPlayerView"

    const-string v1, "onDrawnToSurface"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public onDroppedFrames(IJ)V
    .locals 4
    .param p1, "count"    # I
    .param p2, "elapsed"    # J

    .prologue
    .line 140
    const-string v0, "VideoPlayerView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDroppedFrames - elapsed = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", count = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method public onPlayWhenReadyCommitted()V
    .locals 2

    .prologue
    .line 211
    const-string v0, "VideoPlayerView"

    const-string v1, "onPlayWhenReadyCommitted"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method public onPlayerError(Lcom/google/android/exoplayer/ExoPlaybackException;)V
    .locals 3
    .param p1, "error"    # Lcom/google/android/exoplayer/ExoPlaybackException;

    .prologue
    .line 216
    const-string v0, "VideoPlayerView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPlayerError"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/exoplayer/ExoPlaybackException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method public onPlayerStateChanged(ZI)V
    .locals 4
    .param p1, "playWhenReady"    # Z
    .param p2, "playbackState"    # I

    .prologue
    const/4 v3, 0x1

    .line 184
    const-string v0, "VideoPlayerView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPlayerStateChanged - playback  state = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const/4 v0, 0x4

    if-ne v0, p2, :cond_0

    .line 186
    iput-boolean v3, p0, Lco/getair/meerkat/video/VideoPlayerView;->didPlayerStarted:Z

    .line 187
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->mainHandler:Landroid/os/Handler;

    new-instance v1, Lco/getair/meerkat/video/VideoPlayerView$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/video/VideoPlayerView$1;-><init>(Lco/getair/meerkat/video/VideoPlayerView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 195
    :cond_0
    const/4 v0, 0x3

    if-ne v0, p2, :cond_1

    iget-boolean v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->didPlayerStarted:Z

    if-eqz v0, :cond_1

    .line 196
    const-string v0, "VideoPlayerView"

    const-string v1, "CONNECTION ISSUES TAG"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    :cond_1
    if-ne v3, p2, :cond_2

    iget-boolean v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->didPlayerStarted:Z

    if-eqz v0, :cond_2

    .line 201
    const-string v0, "VideoPlayerView"

    const-string v1, "RESTARTING PLAYER"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    :cond_2
    return-void
.end method

.method public onVideoSizeChanged(IIF)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "pixelWidthHeightRatio"    # F

    .prologue
    .line 145
    const-string v0, "VideoPlayerView"

    const-string v1, "onVideoSizeChanged"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    return-void
.end method

.method public stopProgressBar()V
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 135
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 161
    const-string v0, "VideoPlayerView"

    const-string v1, "surfaceChanged"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 156
    const-string v0, "VideoPlayerView"

    const-string v1, "surfaceCreated"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 166
    const-string v0, "VideoPlayerView"

    const-string v1, "surfaceDestroyed"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    iget-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->videoRenderer:Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/ExoPlayer;->blockingSendMessage(Lcom/google/android/exoplayer/ExoPlayer$ExoPlayerComponent;ILjava/lang/Object;)V

    .line 170
    :cond_0
    return-void
.end method

.method public watchStream(Ljava/lang/String;)V
    .locals 8
    .param p1, "playlistUrl"    # Ljava/lang/String;

    .prologue
    .line 109
    const-string v0, "WatchStream started"

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 111
    const-string v0, "VideoPlayerView"

    const-string v1, "watchStream"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    iput-object p1, p0, Lco/getair/meerkat/video/VideoPlayerView;->playlistUrl:Ljava/lang/String;

    .line 113
    const/4 v0, 0x2

    const/16 v1, 0x3e8

    const/16 v2, 0x1388

    invoke-static {v0, v1, v2}, Lcom/google/android/exoplayer/ExoPlayer$Factory;->newInstance(III)Lcom/google/android/exoplayer/ExoPlayer;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    .line 114
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    invoke-interface {v0, p0}, Lcom/google/android/exoplayer/ExoPlayer;->addListener(Lcom/google/android/exoplayer/ExoPlayer$Listener;)V

    .line 116
    const-string v1, "WatchStream started - player inited is now : "

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->player:Lcom/google/android/exoplayer/ExoPlayer;

    if-nez v0, :cond_0

    const-string v0, "null"

    :goto_0
    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 118
    const v0, 0x7f0e016a

    invoke-virtual {p0, v0}, Lco/getair/meerkat/video/VideoPlayerView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/VideoSurfaceView;

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->surfaceView:Lcom/google/android/exoplayer/VideoSurfaceView;

    .line 119
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->surfaceView:Lcom/google/android/exoplayer/VideoSurfaceView;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/VideoSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 120
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Lco/getair/meerkat/video/VideoPlayerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->mainHandler:Landroid/os/Handler;

    .line 121
    new-instance v0, Lco/getair/meerkat/video/HlsRendererBuilder;

    iget-object v3, p0, Lco/getair/meerkat/video/VideoPlayerView;->userAgent:Ljava/lang/String;

    const-string v5, ""

    invoke-virtual {p0}, Lco/getair/meerkat/video/VideoPlayerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    iget-object v7, p0, Lco/getair/meerkat/video/VideoPlayerView;->mainHandler:Landroid/os/Handler;

    move-object v1, p0

    move-object v2, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/video/HlsRendererBuilder;-><init>(Lcom/google/android/exoplayer/MediaCodecVideoTrackRenderer$EventListener;Lcom/google/android/exoplayer/MediaCodecAudioTrackRenderer$EventListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;Landroid/os/Handler;)V

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->builder:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilder;

    .line 122
    new-instance v0, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    invoke-direct {v0, p0}, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;-><init>(Lco/getair/meerkat/video/VideoPlayerView;)V

    iput-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    .line 123
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView;->builder:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilder;

    iget-object v1, p0, Lco/getair/meerkat/video/VideoPlayerView;->callback:Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;

    invoke-interface {v0, v1}, Lco/getair/meerkat/video/VideoPlayerView$RendererBuilder;->buildRenderers(Lco/getair/meerkat/video/VideoPlayerView$RendererBuilderCallback;)V

    .line 124
    return-void

    .line 116
    :cond_0
    const-string v0, "not null"

    goto :goto_0
.end method
