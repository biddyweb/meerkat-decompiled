package co.getair.meerkat.video;

import android.os.Handler;
import android.os.Looper;
import com.google.android.exoplayer.MediaCodecAudioTrackRenderer;
import com.google.android.exoplayer.MediaCodecAudioTrackRenderer.EventListener;
import com.google.android.exoplayer.MediaCodecVideoTrackRenderer;
import com.google.android.exoplayer.MediaCodecVideoTrackRenderer.EventListener;
import com.google.android.exoplayer.TrackRenderer;
import com.google.android.exoplayer.hls.HlsChunkSource;
import com.google.android.exoplayer.hls.HlsPlaylist;
import com.google.android.exoplayer.hls.HlsPlaylistParser;
import com.google.android.exoplayer.hls.HlsSampleSource;
import com.google.android.exoplayer.upstream.DefaultBandwidthMeter;
import com.google.android.exoplayer.upstream.UriDataSource;
import com.google.android.exoplayer.util.ManifestFetcher;
import com.google.android.exoplayer.util.ManifestFetcher.ManifestCallback;
import java.io.IOException;

class HlsRendererBuilder
  implements VideoPlayerView.RendererBuilder, ManifestFetcher.ManifestCallback<HlsPlaylist>
{
  public static final int RENDERER_COUNT = 2;
  public static final int TYPE_AUDIO = 1;
  public static final int TYPE_TEXT = 2;
  public static final int TYPE_TIMED_METADATA = 3;
  public static final int TYPE_VIDEO;
  private final MediaCodecAudioTrackRenderer.EventListener audioEventListener;
  private VideoPlayerView.RendererBuilderCallback callback;
  private final String contentId;
  private final Handler mainHandler;
  private final Looper mainLooper;
  private final String url;
  private final String userAgent;
  private final MediaCodecVideoTrackRenderer.EventListener videoEventListener;

  public HlsRendererBuilder(MediaCodecVideoTrackRenderer.EventListener paramEventListener, MediaCodecAudioTrackRenderer.EventListener paramEventListener1, String paramString1, String paramString2, String paramString3, Looper paramLooper, Handler paramHandler)
  {
    this.videoEventListener = paramEventListener;
    this.audioEventListener = paramEventListener1;
    this.userAgent = paramString1;
    this.url = paramString2;
    this.contentId = paramString3;
    this.mainHandler = paramHandler;
    this.mainLooper = paramLooper;
  }

  public void buildRenderers(VideoPlayerView.RendererBuilderCallback paramRendererBuilderCallback)
  {
    this.callback = paramRendererBuilderCallback;
    new ManifestFetcher(new HlsPlaylistParser(), this.contentId, this.url, this.userAgent).singleLoad(this.mainLooper, this);
  }

  public void onManifest(String paramString, HlsPlaylist paramHlsPlaylist)
  {
    DefaultBandwidthMeter localDefaultBandwidthMeter = new DefaultBandwidthMeter();
    HlsSampleSource localHlsSampleSource = new HlsSampleSource(new HlsChunkSource(new UriDataSource(this.userAgent, localDefaultBandwidthMeter), this.url, paramHlsPlaylist, localDefaultBandwidthMeter, null, 1), true, 2);
    MediaCodecVideoTrackRenderer localMediaCodecVideoTrackRenderer = new MediaCodecVideoTrackRenderer(localHlsSampleSource, 1, 5000L, this.mainHandler, this.videoEventListener, 50);
    MediaCodecAudioTrackRenderer localMediaCodecAudioTrackRenderer = new MediaCodecAudioTrackRenderer(localHlsSampleSource, this.mainHandler, this.audioEventListener);
    new TrackRenderer[] { localMediaCodecVideoTrackRenderer, localMediaCodecAudioTrackRenderer };
    this.callback.onRenderers(localMediaCodecVideoTrackRenderer, localMediaCodecAudioTrackRenderer);
  }

  public void onManifestError(String paramString, IOException paramIOException)
  {
    this.callback.onRenderersError(paramIOException);
  }
}