package com.google.android.exoplayer;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCrypto;
import android.os.Handler;
import android.os.SystemClock;
import android.view.Surface;
import com.google.android.exoplayer.drm.DrmSessionManager;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.TraceUtil;
import com.google.android.exoplayer.util.Util;
import java.nio.ByteBuffer;

@TargetApi(16)
public class MediaCodecVideoTrackRenderer extends MediaCodecTrackRenderer
{
  private static final String KEY_CROP_BOTTOM = "crop-bottom";
  private static final String KEY_CROP_LEFT = "crop-left";
  private static final String KEY_CROP_RIGHT = "crop-right";
  private static final String KEY_CROP_TOP = "crop-top";
  public static final int MSG_SET_SURFACE = 1;
  private final long allowedJoiningTimeUs;
  private int currentHeight;
  private float currentPixelWidthHeightRatio;
  private int currentWidth;
  private long droppedFrameAccumulationStartTimeMs;
  private int droppedFrameCount;
  private final EventListener eventListener;
  private final FrameReleaseTimeHelper frameReleaseTimeHelper;
  private long joiningDeadlineUs;
  private int lastReportedHeight;
  private float lastReportedPixelWidthHeightRatio;
  private int lastReportedWidth;
  private final int maxDroppedFrameCountToNotify;
  private boolean renderedFirstFrame;
  private boolean reportedDrawnToSurface;
  private Surface surface;
  private final int videoScalingMode;

  public MediaCodecVideoTrackRenderer(SampleSource paramSampleSource, int paramInt)
  {
    this(paramSampleSource, null, true, paramInt);
  }

  public MediaCodecVideoTrackRenderer(SampleSource paramSampleSource, int paramInt, long paramLong)
  {
    this(paramSampleSource, null, true, paramInt, paramLong);
  }

  public MediaCodecVideoTrackRenderer(SampleSource paramSampleSource, int paramInt1, long paramLong, Handler paramHandler, EventListener paramEventListener, int paramInt2)
  {
    this(paramSampleSource, null, true, paramInt1, paramLong, null, paramHandler, paramEventListener, paramInt2);
  }

  public MediaCodecVideoTrackRenderer(SampleSource paramSampleSource, DrmSessionManager paramDrmSessionManager, boolean paramBoolean, int paramInt)
  {
    this(paramSampleSource, paramDrmSessionManager, paramBoolean, paramInt, 0L);
  }

  public MediaCodecVideoTrackRenderer(SampleSource paramSampleSource, DrmSessionManager paramDrmSessionManager, boolean paramBoolean, int paramInt, long paramLong)
  {
    this(paramSampleSource, paramDrmSessionManager, paramBoolean, paramInt, paramLong, null, null, null, -1);
  }

  public MediaCodecVideoTrackRenderer(SampleSource paramSampleSource, DrmSessionManager paramDrmSessionManager, boolean paramBoolean, int paramInt1, long paramLong, FrameReleaseTimeHelper paramFrameReleaseTimeHelper, Handler paramHandler, EventListener paramEventListener, int paramInt2)
  {
    super(paramSampleSource, paramDrmSessionManager, paramBoolean, paramHandler, paramEventListener);
    this.videoScalingMode = paramInt1;
    this.allowedJoiningTimeUs = (1000L * paramLong);
    this.frameReleaseTimeHelper = paramFrameReleaseTimeHelper;
    this.eventListener = paramEventListener;
    this.maxDroppedFrameCountToNotify = paramInt2;
    this.joiningDeadlineUs = -1L;
    this.currentWidth = -1;
    this.currentHeight = -1;
    this.currentPixelWidthHeightRatio = -1.0F;
    this.lastReportedWidth = -1;
    this.lastReportedHeight = -1;
    this.lastReportedPixelWidthHeightRatio = -1.0F;
  }

  private void dropOutputBuffer(MediaCodec paramMediaCodec, int paramInt)
  {
    TraceUtil.beginSection("dropVideoBuffer");
    paramMediaCodec.releaseOutputBuffer(paramInt, false);
    TraceUtil.endSection();
    CodecCounters localCodecCounters = this.codecCounters;
    localCodecCounters.droppedOutputBufferCount = (1 + localCodecCounters.droppedOutputBufferCount);
    this.droppedFrameCount = (1 + this.droppedFrameCount);
    if (this.droppedFrameCount == this.maxDroppedFrameCountToNotify)
      maybeNotifyDroppedFrameCount();
  }

  private void maybeNotifyDrawnToSurface()
  {
    if ((this.eventHandler == null) || (this.eventListener == null) || (this.reportedDrawnToSurface))
      return;
    final Surface localSurface = this.surface;
    this.eventHandler.post(new Runnable()
    {
      public void run()
      {
        MediaCodecVideoTrackRenderer.this.eventListener.onDrawnToSurface(localSurface);
      }
    });
    this.reportedDrawnToSurface = true;
  }

  private void maybeNotifyDroppedFrameCount()
  {
    if ((this.eventHandler == null) || (this.eventListener == null) || (this.droppedFrameCount == 0))
      return;
    long l1 = SystemClock.elapsedRealtime();
    final int i = this.droppedFrameCount;
    final long l2 = l1 - this.droppedFrameAccumulationStartTimeMs;
    this.eventHandler.post(new Runnable()
    {
      public void run()
      {
        MediaCodecVideoTrackRenderer.this.eventListener.onDroppedFrames(i, l2);
      }
    });
    this.droppedFrameCount = 0;
    this.droppedFrameAccumulationStartTimeMs = l1;
  }

  private void maybeNotifyVideoSizeChanged()
  {
    if ((this.eventHandler == null) || (this.eventListener == null) || ((this.lastReportedWidth == this.currentWidth) && (this.lastReportedHeight == this.currentHeight) && (this.lastReportedPixelWidthHeightRatio == this.currentPixelWidthHeightRatio)))
      return;
    final int i = this.currentWidth;
    final int j = this.currentHeight;
    final float f = this.currentPixelWidthHeightRatio;
    this.eventHandler.post(new Runnable()
    {
      public void run()
      {
        MediaCodecVideoTrackRenderer.this.eventListener.onVideoSizeChanged(i, j, f);
      }
    });
    this.lastReportedWidth = i;
    this.lastReportedHeight = j;
    this.lastReportedPixelWidthHeightRatio = f;
  }

  private void renderOutputBufferImmediate(MediaCodec paramMediaCodec, int paramInt)
  {
    maybeNotifyVideoSizeChanged();
    TraceUtil.beginSection("renderVideoBufferImmediate");
    paramMediaCodec.releaseOutputBuffer(paramInt, true);
    TraceUtil.endSection();
    CodecCounters localCodecCounters = this.codecCounters;
    localCodecCounters.renderedOutputBufferCount = (1 + localCodecCounters.renderedOutputBufferCount);
    maybeNotifyDrawnToSurface();
  }

  @TargetApi(21)
  private void renderOutputBufferTimedV21(MediaCodec paramMediaCodec, int paramInt, long paramLong)
  {
    maybeNotifyVideoSizeChanged();
    TraceUtil.beginSection("releaseOutputBufferTimed");
    paramMediaCodec.releaseOutputBuffer(paramInt, paramLong);
    TraceUtil.endSection();
    CodecCounters localCodecCounters = this.codecCounters;
    localCodecCounters.renderedOutputBufferCount = (1 + localCodecCounters.renderedOutputBufferCount);
    maybeNotifyDrawnToSurface();
  }

  private void setSurface(Surface paramSurface)
    throws ExoPlaybackException
  {
    if (this.surface == paramSurface);
    int i;
    do
    {
      return;
      this.surface = paramSurface;
      this.reportedDrawnToSurface = false;
      i = getState();
    }
    while ((i != 2) && (i != 3));
    releaseCodec();
    maybeInitCodec();
  }

  private void skipOutputBuffer(MediaCodec paramMediaCodec, int paramInt)
  {
    TraceUtil.beginSection("skipVideoBuffer");
    paramMediaCodec.releaseOutputBuffer(paramInt, false);
    TraceUtil.endSection();
    CodecCounters localCodecCounters = this.codecCounters;
    localCodecCounters.skippedOutputBufferCount = (1 + localCodecCounters.skippedOutputBufferCount);
  }

  protected boolean canReconfigureCodec(MediaCodec paramMediaCodec, boolean paramBoolean, MediaFormat paramMediaFormat1, MediaFormat paramMediaFormat2)
  {
    return (paramMediaFormat2.mimeType.equals(paramMediaFormat1.mimeType)) && ((paramBoolean) || ((paramMediaFormat1.width == paramMediaFormat2.width) && (paramMediaFormat1.height == paramMediaFormat2.height)));
  }

  protected void configureCodec(MediaCodec paramMediaCodec, android.media.MediaFormat paramMediaFormat, MediaCrypto paramMediaCrypto)
  {
    paramMediaCodec.configure(paramMediaFormat, this.surface, paramMediaCrypto, 0);
    paramMediaCodec.setVideoScalingMode(this.videoScalingMode);
  }

  public void handleMessage(int paramInt, Object paramObject)
    throws ExoPlaybackException
  {
    if (paramInt == 1)
    {
      setSurface((Surface)paramObject);
      return;
    }
    super.handleMessage(paramInt, paramObject);
  }

  protected boolean handlesMimeType(String paramString)
  {
    return (MimeTypes.isVideo(paramString)) && (super.handlesMimeType(paramString));
  }

  protected boolean isReady()
  {
    if ((super.isReady()) && ((this.renderedFirstFrame) || (!codecInitialized()) || (getSourceState() == 2)))
      this.joiningDeadlineUs = -1L;
    do
    {
      return true;
      if (this.joiningDeadlineUs == -1L)
        return false;
    }
    while (1000L * SystemClock.elapsedRealtime() < this.joiningDeadlineUs);
    this.joiningDeadlineUs = -1L;
    return false;
  }

  public void onDisabled()
  {
    this.currentWidth = -1;
    this.currentHeight = -1;
    this.currentPixelWidthHeightRatio = -1.0F;
    this.lastReportedWidth = -1;
    this.lastReportedHeight = -1;
    this.lastReportedPixelWidthHeightRatio = -1.0F;
    if (this.frameReleaseTimeHelper != null)
      this.frameReleaseTimeHelper.disable();
    super.onDisabled();
  }

  protected void onEnabled(long paramLong, boolean paramBoolean)
  {
    super.onEnabled(paramLong, paramBoolean);
    this.renderedFirstFrame = false;
    if ((paramBoolean) && (this.allowedJoiningTimeUs > 0L))
      this.joiningDeadlineUs = (1000L * SystemClock.elapsedRealtime() + this.allowedJoiningTimeUs);
    if (this.frameReleaseTimeHelper != null)
      this.frameReleaseTimeHelper.enable();
  }

  protected void onInputFormatChanged(MediaFormatHolder paramMediaFormatHolder)
    throws ExoPlaybackException
  {
    super.onInputFormatChanged(paramMediaFormatHolder);
    if (paramMediaFormatHolder.format.pixelWidthHeightRatio == -1.0F);
    for (float f = 1.0F; ; f = paramMediaFormatHolder.format.pixelWidthHeightRatio)
    {
      this.currentPixelWidthHeightRatio = f;
      return;
    }
  }

  protected void onOutputFormatChanged(android.media.MediaFormat paramMediaFormat)
  {
    int i;
    int j;
    if ((paramMediaFormat.containsKey("crop-right")) && (paramMediaFormat.containsKey("crop-left")) && (paramMediaFormat.containsKey("crop-bottom")) && (paramMediaFormat.containsKey("crop-top")))
    {
      i = 1;
      if (i == 0)
        break label96;
      j = 1 + (paramMediaFormat.getInteger("crop-right") - paramMediaFormat.getInteger("crop-left"));
      label58: this.currentWidth = j;
      if (i == 0)
        break label107;
    }
    label96: label107: for (int k = 1 + (paramMediaFormat.getInteger("crop-bottom") - paramMediaFormat.getInteger("crop-top")); ; k = paramMediaFormat.getInteger("height"))
    {
      this.currentHeight = k;
      return;
      i = 0;
      break;
      j = paramMediaFormat.getInteger("width");
      break label58;
    }
  }

  protected void onStarted()
  {
    super.onStarted();
    this.droppedFrameCount = 0;
    this.droppedFrameAccumulationStartTimeMs = SystemClock.elapsedRealtime();
  }

  protected void onStopped()
  {
    this.joiningDeadlineUs = -1L;
    maybeNotifyDroppedFrameCount();
    super.onStopped();
  }

  protected boolean processOutputBuffer(long paramLong1, long paramLong2, MediaCodec paramMediaCodec, ByteBuffer paramByteBuffer, MediaCodec.BufferInfo paramBufferInfo, int paramInt, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      skipOutputBuffer(paramMediaCodec, paramInt);
      return true;
    }
    long l1 = 1000L * SystemClock.elapsedRealtime() - paramLong2;
    long l2 = paramBufferInfo.presentationTimeUs - paramLong1 - l1;
    long l3 = System.nanoTime();
    long l4 = l3 + 1000L * l2;
    long l5;
    if (this.frameReleaseTimeHelper != null)
    {
      l5 = this.frameReleaseTimeHelper.adjustReleaseTime(paramBufferInfo.presentationTimeUs, l4);
      l2 = (l5 - l3) / 1000L;
    }
    while (l2 < -30000L)
    {
      dropOutputBuffer(paramMediaCodec, paramInt);
      return true;
      l5 = l4;
    }
    if (!this.renderedFirstFrame)
    {
      renderOutputBufferImmediate(paramMediaCodec, paramInt);
      this.renderedFirstFrame = true;
      return true;
    }
    if (getState() != 3)
      return false;
    if (Util.SDK_INT >= 21)
    {
      if (l2 < 50000L)
      {
        renderOutputBufferTimedV21(paramMediaCodec, paramInt, l5);
        return true;
      }
    }
    else if (l2 < 30000L)
    {
      long l6;
      if (l2 > 11000L)
        l6 = l2 - 10000L;
      try
      {
        Thread.sleep(l6 / 1000L);
        renderOutputBufferImmediate(paramMediaCodec, paramInt);
        return true;
      }
      catch (InterruptedException localInterruptedException)
      {
        while (true)
          Thread.currentThread().interrupt();
      }
    }
    return false;
  }

  protected void seekTo(long paramLong)
    throws ExoPlaybackException
  {
    super.seekTo(paramLong);
    this.renderedFirstFrame = false;
    this.joiningDeadlineUs = -1L;
  }

  protected boolean shouldInitCodec()
  {
    return (super.shouldInitCodec()) && (this.surface != null) && (this.surface.isValid());
  }

  public static abstract interface EventListener extends MediaCodecTrackRenderer.EventListener
  {
    public abstract void onDrawnToSurface(Surface paramSurface);

    public abstract void onDroppedFrames(int paramInt, long paramLong);

    public abstract void onVideoSizeChanged(int paramInt1, int paramInt2, float paramFloat);
  }

  public static abstract interface FrameReleaseTimeHelper
  {
    public abstract long adjustReleaseTime(long paramLong1, long paramLong2);

    public abstract void disable();

    public abstract void enable();
  }
}