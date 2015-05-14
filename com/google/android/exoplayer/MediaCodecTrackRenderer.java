package com.google.android.exoplayer;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaCodec.CodecException;
import android.media.MediaCodec.CryptoException;
import android.media.MediaCodec.CryptoInfo;
import android.media.MediaCrypto;
import android.os.Handler;
import android.os.SystemClock;
import com.google.android.exoplayer.drm.DrmSessionManager;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@TargetApi(16)
public abstract class MediaCodecTrackRenderer extends TrackRenderer
{
  private static final long MAX_CODEC_HOTSWAP_TIME_MS = 1000L;
  private static final int RECONFIGURATION_STATE_NONE = 0;
  private static final int RECONFIGURATION_STATE_QUEUE_PENDING = 2;
  private static final int RECONFIGURATION_STATE_WRITE_PENDING = 1;
  protected static final int SOURCE_STATE_NOT_READY = 0;
  protected static final int SOURCE_STATE_READY = 1;
  protected static final int SOURCE_STATE_READY_READ_MAY_FAIL = 2;
  private MediaCodec codec;
  public final CodecCounters codecCounters;
  private long codecHotswapTimeMs;
  private boolean codecIsAdaptive;
  private int codecReconfigurationState;
  private boolean codecReconfigured;
  private long currentPositionUs;
  private final List<Long> decodeOnlyPresentationTimestamps;
  private Map<UUID, byte[]> drmInitData;
  private final DrmSessionManager drmSessionManager;
  protected final Handler eventHandler;
  private final EventListener eventListener;
  private MediaFormat format;
  private final MediaFormatHolder formatHolder;
  private ByteBuffer[] inputBuffers;
  private int inputIndex;
  private boolean inputStreamEnded;
  private boolean openedDrmSession;
  private final MediaCodec.BufferInfo outputBufferInfo;
  private ByteBuffer[] outputBuffers;
  private int outputIndex;
  private boolean outputStreamEnded;
  private final boolean playClearSamplesWithoutKeys;
  private final SampleHolder sampleHolder;
  private final SampleSource source;
  private int sourceState;
  private int trackIndex;
  private boolean waitingForFirstSyncFrame;
  private boolean waitingForKeys;

  public MediaCodecTrackRenderer(SampleSource paramSampleSource, DrmSessionManager paramDrmSessionManager, boolean paramBoolean, Handler paramHandler, EventListener paramEventListener)
  {
    if (Util.SDK_INT >= 16);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.source = paramSampleSource;
      this.drmSessionManager = paramDrmSessionManager;
      this.playClearSamplesWithoutKeys = paramBoolean;
      this.eventHandler = paramHandler;
      this.eventListener = paramEventListener;
      this.codecCounters = new CodecCounters();
      this.sampleHolder = new SampleHolder(0);
      this.formatHolder = new MediaFormatHolder();
      this.decodeOnlyPresentationTimestamps = new ArrayList();
      this.outputBufferInfo = new MediaCodec.BufferInfo();
      return;
    }
  }

  private void checkForDiscontinuity()
    throws IOException, ExoPlaybackException
  {
    if (this.codec == null);
    while (this.source.readData(this.trackIndex, this.currentPositionUs, this.formatHolder, this.sampleHolder, true) != -5)
      return;
    flushCodec();
  }

  private boolean drainOutputBuffer(long paramLong1, long paramLong2)
    throws ExoPlaybackException
  {
    if (this.outputStreamEnded)
      return false;
    if (this.outputIndex < 0)
      this.outputIndex = this.codec.dequeueOutputBuffer(this.outputBufferInfo, 0L);
    if (this.outputIndex == -2)
    {
      onOutputFormatChanged(this.codec.getOutputFormat());
      CodecCounters localCodecCounters2 = this.codecCounters;
      localCodecCounters2.outputFormatChangedCount = (1 + localCodecCounters2.outputFormatChangedCount);
      return true;
    }
    if (this.outputIndex == -3)
    {
      this.outputBuffers = this.codec.getOutputBuffers();
      CodecCounters localCodecCounters1 = this.codecCounters;
      localCodecCounters1.outputBuffersChangedCount = (1 + localCodecCounters1.outputBuffersChangedCount);
      return true;
    }
    if (this.outputIndex < 0)
      return false;
    if ((0x4 & this.outputBufferInfo.flags) != 0)
    {
      this.outputStreamEnded = true;
      return false;
    }
    int i = getDecodeOnlyIndex(this.outputBufferInfo.presentationTimeUs);
    MediaCodec localMediaCodec = this.codec;
    ByteBuffer localByteBuffer = this.outputBuffers[this.outputIndex];
    MediaCodec.BufferInfo localBufferInfo = this.outputBufferInfo;
    int j = this.outputIndex;
    boolean bool;
    if (i != -1)
    {
      bool = true;
      if (!processOutputBuffer(paramLong1, paramLong2, localMediaCodec, localByteBuffer, localBufferInfo, j, bool))
        break label255;
      if (i == -1)
        break label241;
      this.decodeOnlyPresentationTimestamps.remove(i);
    }
    while (true)
    {
      this.outputIndex = -1;
      return true;
      bool = false;
      break;
      label241: this.currentPositionUs = this.outputBufferInfo.presentationTimeUs;
    }
    label255: return false;
  }

  private boolean feedInputBuffer(boolean paramBoolean)
    throws IOException, ExoPlaybackException
  {
    if (this.inputStreamEnded)
      return false;
    if (this.inputIndex < 0)
    {
      this.inputIndex = this.codec.dequeueInputBuffer(0L);
      if (this.inputIndex < 0)
        return false;
      this.sampleHolder.data = this.inputBuffers[this.inputIndex];
      this.sampleHolder.data.clear();
    }
    int i;
    if (this.waitingForKeys)
      i = -3;
    while (i == -2)
    {
      return false;
      if (this.codecReconfigurationState == 1)
      {
        for (int m = 0; ; m++)
        {
          int n = this.format.initializationData.size();
          if (m >= n)
            break;
          byte[] arrayOfByte = (byte[])this.format.initializationData.get(m);
          this.sampleHolder.data.put(arrayOfByte);
        }
        this.codecReconfigurationState = 2;
      }
      i = this.source.readData(this.trackIndex, this.currentPositionUs, this.formatHolder, this.sampleHolder, false);
      if ((paramBoolean) && (this.sourceState == 1) && (i == -2))
        this.sourceState = 2;
    }
    if (i == -5)
    {
      flushCodec();
      return true;
    }
    if (i == -4)
    {
      if (this.codecReconfigurationState == 2)
      {
        this.sampleHolder.data.clear();
        this.codecReconfigurationState = 1;
      }
      onInputFormatChanged(this.formatHolder);
      return true;
    }
    if (i == -1)
    {
      if (this.codecReconfigurationState == 2)
      {
        this.sampleHolder.data.clear();
        this.codecReconfigurationState = 1;
      }
      this.inputStreamEnded = true;
      try
      {
        this.codec.queueInputBuffer(this.inputIndex, 0, 0, 0L, 4);
        this.inputIndex = -1;
        return false;
      }
      catch (MediaCodec.CryptoException localCryptoException2)
      {
        notifyCryptoError(localCryptoException2);
        throw new ExoPlaybackException(localCryptoException2);
      }
    }
    if (this.waitingForFirstSyncFrame)
    {
      if ((0x1 & this.sampleHolder.flags) == 0)
      {
        this.sampleHolder.data.clear();
        if (this.codecReconfigurationState == 2)
          this.codecReconfigurationState = 1;
        return true;
      }
      this.waitingForFirstSyncFrame = false;
    }
    if ((0x2 & this.sampleHolder.flags) != 0);
    for (boolean bool = true; ; bool = false)
    {
      this.waitingForKeys = shouldWaitForKeys(bool);
      if (!this.waitingForKeys)
        break;
      return false;
    }
    try
    {
      int j = this.sampleHolder.data.position();
      int k = j - this.sampleHolder.size;
      long l = this.sampleHolder.timeUs;
      if (this.sampleHolder.decodeOnly)
        this.decodeOnlyPresentationTimestamps.add(Long.valueOf(l));
      if (bool)
      {
        MediaCodec.CryptoInfo localCryptoInfo = getFrameworkCryptoInfo(this.sampleHolder, k);
        this.codec.queueSecureInputBuffer(this.inputIndex, 0, localCryptoInfo, l, 0);
      }
      while (true)
      {
        this.inputIndex = -1;
        this.codecReconfigurationState = 0;
        return true;
        this.codec.queueInputBuffer(this.inputIndex, 0, j, l, 0);
      }
    }
    catch (MediaCodec.CryptoException localCryptoException1)
    {
      notifyCryptoError(localCryptoException1);
      throw new ExoPlaybackException(localCryptoException1);
    }
  }

  private void flushCodec()
    throws ExoPlaybackException
  {
    this.codecHotswapTimeMs = -1L;
    this.inputIndex = -1;
    this.outputIndex = -1;
    this.waitingForFirstSyncFrame = true;
    this.decodeOnlyPresentationTimestamps.clear();
    if (Util.SDK_INT >= 18)
      this.codec.flush();
    while (true)
    {
      if ((this.codecReconfigured) && (this.format != null))
        this.codecReconfigurationState = 1;
      return;
      releaseCodec();
      maybeInitCodec();
    }
  }

  private int getDecodeOnlyIndex(long paramLong)
  {
    int i = this.decodeOnlyPresentationTimestamps.size();
    for (int j = 0; j < i; j++)
      if (((Long)this.decodeOnlyPresentationTimestamps.get(j)).longValue() == paramLong)
        return j;
    return -1;
  }

  private static MediaCodec.CryptoInfo getFrameworkCryptoInfo(SampleHolder paramSampleHolder, int paramInt)
  {
    MediaCodec.CryptoInfo localCryptoInfo = paramSampleHolder.cryptoInfo.getFrameworkCryptoInfoV16();
    if (paramInt == 0)
      return localCryptoInfo;
    if (localCryptoInfo.numBytesOfClearData == null)
      localCryptoInfo.numBytesOfClearData = new int[1];
    int[] arrayOfInt = localCryptoInfo.numBytesOfClearData;
    arrayOfInt[0] = (paramInt + arrayOfInt[0]);
    return localCryptoInfo;
  }

  private boolean isWithinHotswapPeriod()
  {
    return SystemClock.elapsedRealtime() < 1000L + this.codecHotswapTimeMs;
  }

  private void notifyAndThrowDecoderInitError(DecoderInitializationException paramDecoderInitializationException)
    throws ExoPlaybackException
  {
    notifyDecoderInitializationError(paramDecoderInitializationException);
    throw new ExoPlaybackException(paramDecoderInitializationException);
  }

  private void notifyCryptoError(final MediaCodec.CryptoException paramCryptoException)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          MediaCodecTrackRenderer.this.eventListener.onCryptoError(paramCryptoException);
        }
      });
  }

  private void notifyDecoderInitializationError(final DecoderInitializationException paramDecoderInitializationException)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          MediaCodecTrackRenderer.this.eventListener.onDecoderInitializationError(paramDecoderInitializationException);
        }
      });
  }

  private void readFormat()
    throws IOException, ExoPlaybackException
  {
    if (this.source.readData(this.trackIndex, this.currentPositionUs, this.formatHolder, this.sampleHolder, false) == -4)
      onInputFormatChanged(this.formatHolder);
  }

  private boolean shouldWaitForKeys(boolean paramBoolean)
    throws ExoPlaybackException
  {
    if (!this.openedDrmSession);
    int i;
    do
    {
      return false;
      i = this.drmSessionManager.getState();
      if (i == 0)
        throw new ExoPlaybackException(this.drmSessionManager.getError());
    }
    while ((i == 4) || ((!paramBoolean) && (this.playClearSamplesWithoutKeys)));
    return true;
  }

  protected boolean canReconfigureCodec(MediaCodec paramMediaCodec, boolean paramBoolean, MediaFormat paramMediaFormat1, MediaFormat paramMediaFormat2)
  {
    return false;
  }

  protected final boolean codecInitialized()
  {
    return this.codec != null;
  }

  protected void configureCodec(MediaCodec paramMediaCodec, android.media.MediaFormat paramMediaFormat, MediaCrypto paramMediaCrypto)
  {
    paramMediaCodec.configure(paramMediaFormat, null, paramMediaCrypto, 0);
  }

  protected int doPrepare()
    throws ExoPlaybackException
  {
    try
    {
      boolean bool = this.source.prepare();
      if (!bool)
        return 0;
    }
    catch (IOException localIOException)
    {
      throw new ExoPlaybackException(localIOException);
    }
    for (int i = 0; i < this.source.getTrackCount(); i++)
      if (handlesMimeType(this.source.getTrackInfo(i).mimeType))
      {
        this.trackIndex = i;
        return 1;
      }
    return -1;
  }

  protected void doSomeWork(long paramLong1, long paramLong2)
    throws ExoPlaybackException
  {
    int i = 1;
    try
    {
      if (this.source.continueBuffering(paramLong1))
        if (this.sourceState != 0);
      while (true)
      {
        this.sourceState = i;
        checkForDiscontinuity();
        if (this.format == null)
          readFormat();
        if ((this.codec == null) && (shouldInitCodec()))
          maybeInitCodec();
        if (this.codec != null)
        {
          while (drainOutputBuffer(paramLong1, paramLong2));
          while ((feedInputBuffer(true)) && (feedInputBuffer(false)));
        }
        this.codecCounters.ensureUpdated();
        return;
        i = this.sourceState;
        continue;
        i = 0;
      }
    }
    catch (IOException localIOException)
    {
      throw new ExoPlaybackException(localIOException);
    }
  }

  protected long getBufferedPositionUs()
  {
    long l = this.source.getBufferedPositionUs();
    if ((l == -1L) || (l == -3L))
      return l;
    return Math.max(l, getCurrentPositionUs());
  }

  protected long getCurrentPositionUs()
  {
    return this.currentPositionUs;
  }

  protected long getDurationUs()
  {
    return this.source.getTrackInfo(this.trackIndex).durationUs;
  }

  protected final int getSourceState()
  {
    return this.sourceState;
  }

  protected boolean handlesMimeType(String paramString)
  {
    return true;
  }

  protected final boolean haveFormat()
  {
    return this.format != null;
  }

  protected boolean isEnded()
  {
    return this.outputStreamEnded;
  }

  protected boolean isReady()
  {
    return (this.format != null) && (!this.waitingForKeys) && ((this.sourceState != 0) || (this.outputIndex >= 0) || (isWithinHotswapPeriod()));
  }

  protected final void maybeInitCodec()
    throws ExoPlaybackException
  {
    if (!shouldInitCodec());
    String str1;
    int i;
    do
    {
      return;
      str1 = this.format.mimeType;
      Map localMap = this.drmInitData;
      localMediaCrypto = null;
      bool = false;
      if (localMap == null)
        break;
      if (this.drmSessionManager == null)
        throw new ExoPlaybackException("Media requires a DrmSessionManager");
      if (!this.openedDrmSession)
      {
        this.drmSessionManager.open(this.drmInitData, str1);
        this.openedDrmSession = true;
      }
      i = this.drmSessionManager.getState();
      if (i == 0)
        throw new ExoPlaybackException(this.drmSessionManager.getError());
    }
    while ((i != 3) && (i != 4));
    MediaCrypto localMediaCrypto = this.drmSessionManager.getMediaCrypto();
    boolean bool = this.drmSessionManager.requiresSecureDecoderComponent(str1);
    try
    {
      DecoderInfo localDecoderInfo2 = MediaCodecUtil.getDecoderInfo(str1, bool);
      localDecoderInfo1 = localDecoderInfo2;
      if (localDecoderInfo1 == null)
        notifyAndThrowDecoderInitError(new DecoderInitializationException(this.format, null, -49999));
      str2 = localDecoderInfo1.name;
      this.codecIsAdaptive = localDecoderInfo1.adaptive;
    }
    catch (MediaCodecUtil.DecoderQueryException localDecoderQueryException)
    {
      try
      {
        DecoderInfo localDecoderInfo1;
        this.codec = MediaCodec.createByCodecName(str2);
        configureCodec(this.codec, this.format.getFrameworkMediaFormatV16(), localMediaCrypto);
        this.codec.start();
        this.inputBuffers = this.codec.getInputBuffers();
        this.outputBuffers = this.codec.getOutputBuffers();
        if (getState() == 3)
        {
          l = SystemClock.elapsedRealtime();
          this.codecHotswapTimeMs = l;
          this.inputIndex = -1;
          this.outputIndex = -1;
          this.waitingForFirstSyncFrame = true;
          CodecCounters localCodecCounters = this.codecCounters;
          localCodecCounters.codecInitCount = (1 + localCodecCounters.codecInitCount);
          return;
          localDecoderQueryException = localDecoderQueryException;
          notifyAndThrowDecoderInitError(new DecoderInitializationException(this.format, localDecoderQueryException, -49998));
          localDecoderInfo1 = null;
        }
      }
      catch (Exception localException)
      {
        while (true)
        {
          String str2;
          notifyAndThrowDecoderInitError(new DecoderInitializationException(this.format, localException, str2));
          continue;
          long l = -1L;
        }
      }
    }
  }

  protected void onDisabled()
  {
    this.format = null;
    this.drmInitData = null;
    try
    {
      releaseCodec();
      try
      {
        if (this.openedDrmSession)
        {
          this.drmSessionManager.close();
          this.openedDrmSession = false;
        }
        return;
      }
      finally
      {
        this.source.disable(this.trackIndex);
      }
    }
    finally
    {
    }
  }

  protected void onEnabled(long paramLong, boolean paramBoolean)
  {
    this.source.enable(this.trackIndex, paramLong);
    this.sourceState = 0;
    this.inputStreamEnded = false;
    this.outputStreamEnded = false;
    this.waitingForKeys = false;
    this.currentPositionUs = paramLong;
  }

  protected void onInputFormatChanged(MediaFormatHolder paramMediaFormatHolder)
    throws ExoPlaybackException
  {
    MediaFormat localMediaFormat = this.format;
    this.format = paramMediaFormatHolder.format;
    this.drmInitData = paramMediaFormatHolder.drmInitData;
    if ((this.codec != null) && (canReconfigureCodec(this.codec, this.codecIsAdaptive, localMediaFormat, this.format)))
    {
      this.codecReconfigured = true;
      this.codecReconfigurationState = 1;
      return;
    }
    releaseCodec();
    maybeInitCodec();
  }

  protected void onOutputFormatChanged(android.media.MediaFormat paramMediaFormat)
  {
  }

  protected void onReleased()
  {
    this.source.release();
  }

  protected void onStarted()
  {
  }

  protected void onStopped()
  {
  }

  protected abstract boolean processOutputBuffer(long paramLong1, long paramLong2, MediaCodec paramMediaCodec, ByteBuffer paramByteBuffer, MediaCodec.BufferInfo paramBufferInfo, int paramInt, boolean paramBoolean)
    throws ExoPlaybackException;

  protected void releaseCodec()
  {
    if (this.codec != null)
    {
      this.codecHotswapTimeMs = -1L;
      this.inputIndex = -1;
      this.outputIndex = -1;
      this.decodeOnlyPresentationTimestamps.clear();
      this.inputBuffers = null;
      this.outputBuffers = null;
      this.codecReconfigured = false;
      this.codecIsAdaptive = false;
      this.codecReconfigurationState = 0;
      CodecCounters localCodecCounters = this.codecCounters;
      localCodecCounters.codecReleaseCount = (1 + localCodecCounters.codecReleaseCount);
    }
    try
    {
      this.codec.stop();
      try
      {
        this.codec.release();
        return;
      }
      finally
      {
        this.codec = null;
      }
    }
    finally
    {
    }
  }

  protected void seekTo(long paramLong)
    throws ExoPlaybackException
  {
    this.currentPositionUs = paramLong;
    this.source.seekToUs(paramLong);
    this.sourceState = 0;
    this.inputStreamEnded = false;
    this.outputStreamEnded = false;
    this.waitingForKeys = false;
  }

  protected boolean shouldInitCodec()
  {
    return (this.codec == null) && (this.format != null);
  }

  public static class DecoderInitializationException extends Exception
  {
    private static final int CUSTOM_ERROR_CODE_BASE = -50000;
    private static final int DECODER_QUERY_ERROR = -49998;
    private static final int NO_SUITABLE_DECODER_ERROR = -49999;
    public final String decoderName;
    public final String diagnosticInfo;

    public DecoderInitializationException(MediaFormat paramMediaFormat, Throwable paramThrowable, int paramInt)
    {
      super(paramThrowable);
      this.decoderName = null;
      this.diagnosticInfo = buildCustomDiagnosticInfo(paramInt);
    }

    public DecoderInitializationException(MediaFormat paramMediaFormat, Throwable paramThrowable, String paramString)
    {
      super(paramThrowable);
      this.decoderName = paramString;
      if (Util.SDK_INT >= 21);
      for (String str = getDiagnosticInfoV21(paramThrowable); ; str = null)
      {
        this.diagnosticInfo = str;
        return;
      }
    }

    private static String buildCustomDiagnosticInfo(int paramInt)
    {
      if (paramInt < 0);
      for (String str = "neg_"; ; str = "")
        return "com.google.android.exoplayer.MediaCodecTrackRenderer_" + str + Math.abs(paramInt);
    }

    @TargetApi(21)
    private static String getDiagnosticInfoV21(Throwable paramThrowable)
    {
      if ((paramThrowable instanceof MediaCodec.CodecException))
        return ((MediaCodec.CodecException)paramThrowable).getDiagnosticInfo();
      return null;
    }
  }

  public static abstract interface EventListener
  {
    public abstract void onCryptoError(MediaCodec.CryptoException paramCryptoException);

    public abstract void onDecoderInitializationError(MediaCodecTrackRenderer.DecoderInitializationException paramDecoderInitializationException);
  }
}