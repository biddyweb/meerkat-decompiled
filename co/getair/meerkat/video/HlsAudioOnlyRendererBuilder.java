package co.getair.meerkat.video;

import android.os.Handler;
import android.os.Looper;
import com.google.android.exoplayer.MediaCodecAudioTrackRenderer;
import com.google.android.exoplayer.MediaCodecAudioTrackRenderer.EventListener;
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

public class HlsAudioOnlyRendererBuilder
  implements VideoPlayerView.RendererBuilder, ManifestFetcher.ManifestCallback<HlsPlaylist>
{
  public static final int RENDERER_COUNT = 1;
  public static final int TYPE_AUDIO;
  private final MediaCodecAudioTrackRenderer.EventListener audioEventListener;
  private VideoPlayerView.RendererBuilderCallback callback;
  private final String contentId;
  private final Handler mainHandler;
  private final Looper mainLooper;
  private final String url;
  private final String userAgent;

  public HlsAudioOnlyRendererBuilder(MediaCodecAudioTrackRenderer.EventListener paramEventListener, String paramString1, String paramString2, String paramString3, Looper paramLooper, Handler paramHandler)
  {
    this.audioEventListener = paramEventListener;
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
    MediaCodecAudioTrackRenderer localMediaCodecAudioTrackRenderer = new MediaCodecAudioTrackRenderer(new HlsSampleSource(new HlsChunkSource(new UriDataSource(this.userAgent, localDefaultBandwidthMeter), this.url, paramHlsPlaylist, localDefaultBandwidthMeter, null, 1), true, 2), this.mainHandler, this.audioEventListener);
    new TrackRenderer[] { localMediaCodecAudioTrackRenderer };
    this.callback.onRenderers(localMediaCodecAudioTrackRenderer);
  }

  public void onManifestError(String paramString, IOException paramIOException)
  {
    this.callback.onRenderersError(paramIOException);
  }
}