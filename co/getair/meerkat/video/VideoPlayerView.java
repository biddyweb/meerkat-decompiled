package co.getair.meerkat.video;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.LightingColorFilter;
import android.graphics.drawable.Drawable;
import android.media.MediaCodec.CryptoException;
import android.os.Build.VERSION;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import co.getair.meerkat.utilities.MLog;
import com.crashlytics.android.Crashlytics;
import com.google.android.exoplayer.ExoPlaybackException;
import com.google.android.exoplayer.ExoPlayer;
import com.google.android.exoplayer.ExoPlayer.Factory;
import com.google.android.exoplayer.ExoPlayer.Listener;
import com.google.android.exoplayer.MediaCodecAudioTrackRenderer;
import com.google.android.exoplayer.MediaCodecAudioTrackRenderer.EventListener;
import com.google.android.exoplayer.MediaCodecTrackRenderer.DecoderInitializationException;
import com.google.android.exoplayer.MediaCodecVideoTrackRenderer;
import com.google.android.exoplayer.MediaCodecVideoTrackRenderer.EventListener;
import com.google.android.exoplayer.TrackRenderer;
import com.google.android.exoplayer.VideoSurfaceView;
import com.google.android.exoplayer.audio.AudioTrack.InitializationException;
import com.google.android.exoplayer.audio.AudioTrack.WriteException;

public class VideoPlayerView extends RelativeLayout
  implements SurfaceHolder.Callback, ExoPlayer.Listener, MediaCodecVideoTrackRenderer.EventListener, MediaCodecAudioTrackRenderer.EventListener
{
  private static final String TAG = "VideoPlayerView";
  private RendererBuilder builder;
  private RendererBuilderCallback callback;
  private boolean didPlayerStarted = false;
  private Handler mainHandler;
  private ExoPlayer player;
  private String playlistUrl;
  private ProgressBar progressBar;
  private VideoSurfaceView surfaceView;
  private String userAgent = getUserAgent(getContext());
  private MediaCodecVideoTrackRenderer videoRenderer;

  public VideoPlayerView(Context paramContext)
  {
    super(paramContext);
    init(paramContext);
  }

  public VideoPlayerView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext);
  }

  public VideoPlayerView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext);
  }

  public static String getUserAgent(Context paramContext)
  {
    try
    {
      String str2 = paramContext.getPackageName();
      str1 = paramContext.getPackageManager().getPackageInfo(str2, 0).versionName;
      return "ExoPlayerDemo/" + str1 + " (Linux;Android " + Build.VERSION.RELEASE + ") " + "ExoPlayerLib/" + "1.2.4";
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
        String str1 = "?";
    }
  }

  private void init(Context paramContext)
  {
    ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(2130968653, this);
    this.progressBar = ((ProgressBar)findViewById(2131624299));
    if (Build.VERSION.SDK_INT >= 21)
      this.progressBar.getIndeterminateDrawable().setColorFilter(new LightingColorFilter(-16777216, 16777215));
  }

  private void maybeStartPlayback()
  {
    MLog.d("VideoPlayerView", "maybeStartPlayback");
    Surface localSurface = this.surfaceView.getHolder().getSurface();
    if ((this.videoRenderer == null) || (localSurface == null) || (!localSurface.isValid()))
      return;
    this.player.sendMessage(this.videoRenderer, 1, localSurface);
    this.player.setPlayWhenReady(true);
  }

  private void onError(Exception paramException)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramException.getLocalizedMessage();
    arrayOfObject[1] = paramException.getStackTrace().toString();
    MLog.e("VideoPlayerView", String.format("Playback failed: %s  with stacktrace: \n %s ", arrayOfObject));
  }

  private void onRenderers(RendererBuilderCallback paramRendererBuilderCallback, MediaCodecAudioTrackRenderer paramMediaCodecAudioTrackRenderer)
  {
    Crashlytics.log("onRenderers(2) started");
    MLog.d("VideoPlayerView", "onRenderers");
    if (this.callback != paramRendererBuilderCallback)
      return;
    this.callback = null;
    if ((this.player == null) || (this.videoRenderer == null) || (paramMediaCodecAudioTrackRenderer == null))
    {
      if (this.player != null)
        break label78;
      Crashlytics.log("onRenderers returns a null object PLAYER ");
    }
    while (true)
    {
      this.player.prepare(new TrackRenderer[] { paramMediaCodecAudioTrackRenderer });
      maybeStartPlayback();
      return;
      label78: if (this.videoRenderer == null)
        Crashlytics.log("onRenderers returns a null object VIDEO RENDERER");
      else if (paramMediaCodecAudioTrackRenderer == null)
        Crashlytics.log("onRenderers returns a null object AUDIO RENDERER");
      else
        Crashlytics.log("onRenderers returns a null object unknown");
    }
  }

  private void onRenderers(RendererBuilderCallback paramRendererBuilderCallback, MediaCodecVideoTrackRenderer paramMediaCodecVideoTrackRenderer, MediaCodecAudioTrackRenderer paramMediaCodecAudioTrackRenderer)
  {
    Crashlytics.log("onRenderers(1) started");
    MLog.d("VideoPlayerView", "onRenderers");
    if (this.callback != paramRendererBuilderCallback)
      return;
    this.callback = null;
    this.videoRenderer = paramMediaCodecVideoTrackRenderer;
    if ((this.player == null) || (paramMediaCodecVideoTrackRenderer == null) || (paramMediaCodecAudioTrackRenderer == null))
    {
      if (this.player != null)
        break label85;
      Crashlytics.log("onRenderers returns a null object PLAYER ");
    }
    while (true)
    {
      this.player.prepare(new TrackRenderer[] { paramMediaCodecVideoTrackRenderer, paramMediaCodecAudioTrackRenderer });
      maybeStartPlayback();
      return;
      label85: if (paramMediaCodecVideoTrackRenderer == null)
        Crashlytics.log("onRenderers returns a null object VIDEO RENDERER");
      else if (paramMediaCodecAudioTrackRenderer == null)
        Crashlytics.log("onRenderers returns a null object AUDIO RENDERER");
      else
        Crashlytics.log("onRenderers returns a null object unknown");
    }
  }

  private void onRenderersError(RendererBuilderCallback paramRendererBuilderCallback, Exception paramException)
  {
    MLog.d("VideoPlayerView", "onRenderersError");
    if (this.callback != paramRendererBuilderCallback)
      return;
    this.callback = null;
    onError(paramException);
  }

  public void cleanVideoView()
  {
    this.player.removeListener(this);
    this.player.release();
    this.player = null;
  }

  public void onAudioTrackInitializationError(AudioTrack.InitializationException paramInitializationException)
  {
    MLog.d("onAudioTrackInitializationError");
  }

  public void onAudioTrackWriteError(AudioTrack.WriteException paramWriteException)
  {
    MLog.d("onAudioTrackWriteError");
  }

  public void onCryptoError(MediaCodec.CryptoException paramCryptoException)
  {
    MLog.d("VideoPlayerView", "onCryptoError - " + paramCryptoException.toString());
  }

  public void onDecoderInitializationError(MediaCodecTrackRenderer.DecoderInitializationException paramDecoderInitializationException)
  {
    MLog.d("VideoPlayerView", "onDecoderInitializationError - " + paramDecoderInitializationException.toString());
  }

  public void onDrawnToSurface(Surface paramSurface)
  {
    MLog.d("VideoPlayerView", "onDrawnToSurface");
  }

  public void onDroppedFrames(int paramInt, long paramLong)
  {
    MLog.d("VideoPlayerView", "onDroppedFrames - elapsed = " + paramLong + ", count = " + paramInt);
  }

  public void onPlayWhenReadyCommitted()
  {
    MLog.d("VideoPlayerView", "onPlayWhenReadyCommitted");
  }

  public void onPlayerError(ExoPlaybackException paramExoPlaybackException)
  {
    MLog.d("VideoPlayerView", "onPlayerError" + paramExoPlaybackException.toString());
  }

  public void onPlayerStateChanged(boolean paramBoolean, int paramInt)
  {
    MLog.d("VideoPlayerView", "onPlayerStateChanged - playback  state = " + paramInt);
    if (4 == paramInt)
    {
      this.didPlayerStarted = true;
      this.mainHandler.post(new Runnable()
      {
        public void run()
        {
          VideoPlayerView.this.progressBar.setVisibility(8);
        }
      });
    }
    if ((3 == paramInt) && (this.didPlayerStarted))
      MLog.d("VideoPlayerView", "CONNECTION ISSUES TAG");
    if ((1 == paramInt) && (this.didPlayerStarted))
      MLog.d("VideoPlayerView", "RESTARTING PLAYER");
  }

  public void onVideoSizeChanged(int paramInt1, int paramInt2, float paramFloat)
  {
    MLog.d("VideoPlayerView", "onVideoSizeChanged");
  }

  public void stopProgressBar()
  {
    this.progressBar.setVisibility(8);
  }

  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    MLog.d("VideoPlayerView", "surfaceChanged");
  }

  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    MLog.d("VideoPlayerView", "surfaceCreated");
  }

  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    MLog.d("VideoPlayerView", "surfaceDestroyed");
    if ((this.videoRenderer != null) && (this.player != null))
      this.player.blockingSendMessage(this.videoRenderer, 1, null);
  }

  public void watchStream(String paramString)
  {
    Crashlytics.log("WatchStream started");
    MLog.d("VideoPlayerView", "watchStream");
    this.playlistUrl = paramString;
    this.player = ExoPlayer.Factory.newInstance(2, 1000, 5000);
    this.player.addListener(this);
    Object[] arrayOfObject = new Object[1];
    if (this.player == null);
    for (String str = "null"; ; str = "not null")
    {
      arrayOfObject[0] = str;
      Crashlytics.log(String.format("WatchStream started - player inited is now : ", arrayOfObject));
      this.surfaceView = ((VideoSurfaceView)findViewById(2131624298));
      this.surfaceView.getHolder().addCallback(this);
      this.mainHandler = new Handler(getContext().getMainLooper());
      this.builder = new HlsRendererBuilder(this, this, this.userAgent, paramString, "", getContext().getMainLooper(), this.mainHandler);
      this.callback = new RendererBuilderCallback();
      this.builder.buildRenderers(this.callback);
      return;
    }
  }

  public static abstract interface RendererBuilder
  {
    public abstract void buildRenderers(VideoPlayerView.RendererBuilderCallback paramRendererBuilderCallback);
  }

  final class RendererBuilderCallback
  {
    RendererBuilderCallback()
    {
    }

    public void onRenderers(MediaCodecAudioTrackRenderer paramMediaCodecAudioTrackRenderer)
    {
      Object[] arrayOfObject = new Object[1];
      if (VideoPlayerView.this.player == null);
      for (String str = "null"; ; str = "not null")
      {
        arrayOfObject[0] = str;
        Crashlytics.log(String.format("onRenderers(2) callback - player is: %s", arrayOfObject));
        VideoPlayerView.this.onRenderers(this, paramMediaCodecAudioTrackRenderer);
        return;
      }
    }

    public void onRenderers(MediaCodecVideoTrackRenderer paramMediaCodecVideoTrackRenderer, MediaCodecAudioTrackRenderer paramMediaCodecAudioTrackRenderer)
    {
      Object[] arrayOfObject = new Object[1];
      if (VideoPlayerView.this.player == null);
      for (String str = "null"; ; str = "not null")
      {
        arrayOfObject[0] = str;
        Crashlytics.log(String.format("onRenderers(1) callback - player is: %s", arrayOfObject));
        VideoPlayerView.this.onRenderers(this, paramMediaCodecVideoTrackRenderer, paramMediaCodecAudioTrackRenderer);
        return;
      }
    }

    public void onRenderersError(Exception paramException)
    {
      VideoPlayerView.this.onRenderersError(this, paramException);
    }
  }
}