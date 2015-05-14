package com.google.android.exoplayer.hls;

import android.os.SystemClock;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.hls.parser.HlsExtractor;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.upstream.Loader.Callback;
import com.google.android.exoplayer.upstream.Loader.Loadable;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;
import java.util.LinkedList;

public class HlsSampleSource
  implements SampleSource, Loader.Callback
{
  public static final int DEFAULT_MIN_LOADABLE_RETRY_COUNT = 3;
  private static final int NO_RESET_PENDING = -1;
  private final HlsChunkSource chunkSource;
  private HlsChunk currentLoadable;
  private IOException currentLoadableException;
  private int currentLoadableExceptionCount;
  private boolean currentLoadableExceptionFatal;
  private long currentLoadableExceptionTimestamp;
  private MediaFormat[] downstreamMediaFormats;
  private long downstreamPositionUs;
  private int enabledTrackCount;
  private final LinkedList<HlsExtractor> extractors;
  private final boolean frameAccurateSeeking;
  private long lastSeekPositionUs;
  private Loader loader;
  private boolean loadingFinished;
  private final int minLoadableRetryCount;
  private boolean[] pendingDiscontinuities;
  private long pendingResetPositionUs;
  private boolean prepared;
  private TsChunk previousTsLoadable;
  private int remainingReleaseCount;
  private int trackCount;
  private boolean[] trackEnabledStates;
  private TrackInfo[] trackInfos;

  public HlsSampleSource(HlsChunkSource paramHlsChunkSource, boolean paramBoolean, int paramInt)
  {
    this(paramHlsChunkSource, paramBoolean, paramInt, 3);
  }

  public HlsSampleSource(HlsChunkSource paramHlsChunkSource, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    this.chunkSource = paramHlsChunkSource;
    this.frameAccurateSeeking = paramBoolean;
    this.remainingReleaseCount = paramInt1;
    this.minLoadableRetryCount = paramInt2;
    this.extractors = new LinkedList();
  }

  private void clearCurrentLoadable()
  {
    this.currentLoadable = null;
    this.currentLoadableException = null;
    this.currentLoadableExceptionCount = 0;
    this.currentLoadableExceptionFatal = false;
  }

  private void clearState()
  {
    for (int i = 0; i < this.extractors.size(); i++)
      ((HlsExtractor)this.extractors.get(i)).release();
    this.extractors.clear();
    clearCurrentLoadable();
    this.previousTsLoadable = null;
  }

  private boolean continueBufferingInternal()
    throws IOException
  {
    maybeStartLoading();
    boolean bool1 = isPendingReset();
    boolean bool2 = false;
    if (!bool1)
    {
      boolean bool3 = this.extractors.isEmpty();
      bool2 = false;
      if (!bool3)
        break label31;
    }
    label31: 
    do
    {
      return bool2;
      boolean bool4 = this.prepared;
      bool2 = false;
      if (bool4)
      {
        boolean bool5 = haveSamplesForEnabledTracks(getCurrentExtractor());
        bool2 = false;
        if (bool5)
          bool2 = true;
      }
    }
    while (bool2);
    maybeThrowLoadableException();
    return bool2;
  }

  private void discardSamplesForDisabledTracks(HlsExtractor paramHlsExtractor, long paramLong)
  {
    if (!paramHlsExtractor.isPrepared());
    while (true)
    {
      return;
      for (int i = 0; i < this.trackEnabledStates.length; i++)
        if (this.trackEnabledStates[i] == 0)
          paramHlsExtractor.discardUntil(i, paramLong);
    }
  }

  private HlsExtractor getCurrentExtractor()
  {
    for (HlsExtractor localHlsExtractor = (HlsExtractor)this.extractors.getFirst(); (this.extractors.size() > 1) && (!haveSamplesForEnabledTracks(localHlsExtractor)); localHlsExtractor = (HlsExtractor)this.extractors.getFirst())
      ((HlsExtractor)this.extractors.removeFirst()).release();
    return localHlsExtractor;
  }

  private long getRetryDelayMillis(long paramLong)
  {
    return Math.min(1000L * (paramLong - 1L), 5000L);
  }

  private boolean haveSamplesForEnabledTracks(HlsExtractor paramHlsExtractor)
  {
    if (!paramHlsExtractor.isPrepared());
    while (true)
    {
      return false;
      for (int i = 0; i < this.trackEnabledStates.length; i++)
        if ((this.trackEnabledStates[i] != 0) && (paramHlsExtractor.hasSamples(i)))
          return true;
    }
  }

  private boolean isPendingReset()
  {
    return this.pendingResetPositionUs != -1L;
  }

  private boolean isTsChunk(HlsChunk paramHlsChunk)
  {
    return paramHlsChunk instanceof TsChunk;
  }

  private void maybeStartLoading()
  {
    if ((this.currentLoadableExceptionFatal) || (this.loadingFinished) || (this.loader.isLoading()));
    label82: HlsChunk localHlsChunk;
    do
    {
      return;
      if (this.currentLoadableException != null);
      for (int i = 1; ; i = 0)
      {
        if (i == 0)
          break label82;
        if (SystemClock.elapsedRealtime() - this.currentLoadableExceptionTimestamp < getRetryDelayMillis(this.currentLoadableExceptionCount))
          break;
        this.currentLoadableException = null;
        this.loader.startLoading(this.currentLoadable, this);
        return;
      }
      localHlsChunk = this.chunkSource.getChunkOperation(this.previousTsLoadable, this.pendingResetPositionUs, this.downstreamPositionUs);
    }
    while (localHlsChunk == null);
    this.currentLoadable = localHlsChunk;
    if (isTsChunk(this.currentLoadable))
    {
      this.previousTsLoadable = ((TsChunk)this.currentLoadable);
      if (isPendingReset())
        this.pendingResetPositionUs = -1L;
      if ((this.extractors.isEmpty()) || (this.extractors.getLast() != this.previousTsLoadable.extractor))
        this.extractors.addLast(this.previousTsLoadable.extractor);
    }
    this.loader.startLoading(this.currentLoadable, this);
  }

  private void maybeThrowLoadableException()
    throws IOException
  {
    if ((this.currentLoadableException != null) && ((this.currentLoadableExceptionFatal) || (this.currentLoadableExceptionCount > this.minLoadableRetryCount)))
      throw this.currentLoadableException;
  }

  private void restartFrom(long paramLong)
  {
    this.pendingResetPositionUs = paramLong;
    this.loadingFinished = false;
    if (this.loader.isLoading())
    {
      this.loader.cancelLoading();
      return;
    }
    clearState();
    maybeStartLoading();
  }

  public boolean continueBuffering(long paramLong)
    throws IOException
  {
    Assertions.checkState(this.prepared);
    if (this.enabledTrackCount > 0);
    for (boolean bool1 = true; ; bool1 = false)
    {
      Assertions.checkState(bool1);
      this.downstreamPositionUs = paramLong;
      if (!this.extractors.isEmpty())
        discardSamplesForDisabledTracks((HlsExtractor)this.extractors.getFirst(), this.downstreamPositionUs);
      boolean bool2;
      if (!this.loadingFinished)
      {
        boolean bool3 = continueBufferingInternal();
        bool2 = false;
        if (!bool3);
      }
      else
      {
        bool2 = true;
      }
      return bool2;
    }
  }

  public void disable(int paramInt)
  {
    Assertions.checkState(this.prepared);
    Assertions.checkState(this.trackEnabledStates[paramInt]);
    this.enabledTrackCount = (-1 + this.enabledTrackCount);
    this.trackEnabledStates[paramInt] = false;
    this.pendingDiscontinuities[paramInt] = false;
    if (this.enabledTrackCount == 0)
    {
      if (this.loader.isLoading())
        this.loader.cancelLoading();
    }
    else
      return;
    clearState();
  }

  public void enable(int paramInt, long paramLong)
  {
    Assertions.checkState(this.prepared);
    if (this.trackEnabledStates[paramInt] == 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.enabledTrackCount = (1 + this.enabledTrackCount);
      this.trackEnabledStates[paramInt] = true;
      this.downstreamMediaFormats[paramInt] = null;
      if (this.enabledTrackCount == 1)
        seekToUs(paramLong);
      return;
    }
  }

  public long getBufferedPositionUs()
  {
    Assertions.checkState(this.prepared);
    boolean bool;
    long l;
    if (this.enabledTrackCount > 0)
    {
      bool = true;
      Assertions.checkState(bool);
      if (!isPendingReset())
        break label39;
      l = this.pendingResetPositionUs;
    }
    label39: 
    do
    {
      return l;
      bool = false;
      break;
      if (this.loadingFinished)
        return -3L;
      l = ((HlsExtractor)this.extractors.getLast()).getLargestSampleTimestamp();
    }
    while (l != -9223372036854775808L);
    return this.downstreamPositionUs;
  }

  public int getTrackCount()
  {
    Assertions.checkState(this.prepared);
    return this.trackCount;
  }

  public TrackInfo getTrackInfo(int paramInt)
  {
    Assertions.checkState(this.prepared);
    return this.trackInfos[paramInt];
  }

  public void onLoadCanceled(Loader.Loadable paramLoadable)
  {
    if (this.enabledTrackCount > 0)
    {
      restartFrom(this.pendingResetPositionUs);
      return;
    }
    clearState();
  }

  public void onLoadCompleted(Loader.Loadable paramLoadable)
  {
    try
    {
      this.currentLoadable.consume();
      return;
    }
    catch (IOException localIOException)
    {
      this.currentLoadableException = localIOException;
      this.currentLoadableExceptionCount = (1 + this.currentLoadableExceptionCount);
      this.currentLoadableExceptionTimestamp = SystemClock.elapsedRealtime();
      this.currentLoadableExceptionFatal = true;
      return;
    }
    finally
    {
      if (isTsChunk(this.currentLoadable))
        this.loadingFinished = ((TsChunk)paramLoadable).isLastChunk;
      if (!this.currentLoadableExceptionFatal)
        clearCurrentLoadable();
      maybeStartLoading();
    }
  }

  public void onLoadError(Loader.Loadable paramLoadable, IOException paramIOException)
  {
    if (this.chunkSource.onLoadError(this.currentLoadable, paramIOException))
      clearCurrentLoadable();
    while (true)
    {
      maybeStartLoading();
      return;
      this.currentLoadableException = paramIOException;
      this.currentLoadableExceptionCount = (1 + this.currentLoadableExceptionCount);
      this.currentLoadableExceptionTimestamp = SystemClock.elapsedRealtime();
    }
  }

  public boolean prepare()
    throws IOException
  {
    if (this.prepared)
      return true;
    if (this.loader == null)
      this.loader = new Loader("Loader:HLS");
    continueBufferingInternal();
    if (!this.extractors.isEmpty())
    {
      HlsExtractor localHlsExtractor = (HlsExtractor)this.extractors.getFirst();
      if (localHlsExtractor.isPrepared())
      {
        this.trackCount = localHlsExtractor.getTrackCount();
        this.trackEnabledStates = new boolean[this.trackCount];
        this.pendingDiscontinuities = new boolean[this.trackCount];
        this.downstreamMediaFormats = new MediaFormat[this.trackCount];
        this.trackInfos = new TrackInfo[this.trackCount];
        for (int i = 0; i < this.trackCount; i++)
        {
          MediaFormat localMediaFormat = localHlsExtractor.getFormat(i);
          if (localMediaFormat != null)
            this.trackInfos[i] = new TrackInfo(localMediaFormat.mimeType, this.chunkSource.getDurationUs());
        }
        this.prepared = true;
      }
    }
    if (!this.prepared)
      maybeThrowLoadableException();
    return this.prepared;
  }

  public int readData(int paramInt, long paramLong, MediaFormatHolder paramMediaFormatHolder, SampleHolder paramSampleHolder, boolean paramBoolean)
    throws IOException
  {
    Assertions.checkState(this.prepared);
    this.downstreamPositionUs = paramLong;
    if (this.pendingDiscontinuities[paramInt] != 0)
    {
      this.pendingDiscontinuities[paramInt] = false;
      return -5;
    }
    if ((paramBoolean) || (isPendingReset()) || (this.extractors.isEmpty()))
    {
      maybeThrowLoadableException();
      return -2;
    }
    HlsExtractor localHlsExtractor = getCurrentExtractor();
    if (this.extractors.size() > 1)
      localHlsExtractor.configureSpliceTo((HlsExtractor)this.extractors.get(1));
    int i = 0;
    while ((this.extractors.size() > i + 1) && (!localHlsExtractor.hasSamples(paramInt)))
    {
      LinkedList localLinkedList = this.extractors;
      i++;
      localHlsExtractor = (HlsExtractor)localLinkedList.get(i);
    }
    if (!localHlsExtractor.isPrepared())
    {
      maybeThrowLoadableException();
      return -2;
    }
    MediaFormat localMediaFormat = localHlsExtractor.getFormat(paramInt);
    if ((localMediaFormat != null) && (!localMediaFormat.equals(this.downstreamMediaFormats[paramInt], true)))
    {
      this.chunkSource.getMaxVideoDimensions(localMediaFormat);
      paramMediaFormatHolder.format = localMediaFormat;
      this.downstreamMediaFormats[paramInt] = localMediaFormat;
      return -4;
    }
    if (localHlsExtractor.getSample(paramInt, paramSampleHolder))
    {
      if ((this.frameAccurateSeeking) && (paramSampleHolder.timeUs < this.lastSeekPositionUs));
      for (boolean bool = true; ; bool = false)
      {
        paramSampleHolder.decodeOnly = bool;
        return -3;
      }
    }
    if (this.loadingFinished)
      return -1;
    maybeThrowLoadableException();
    return -2;
  }

  public void release()
  {
    if (this.remainingReleaseCount > 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      int i = -1 + this.remainingReleaseCount;
      this.remainingReleaseCount = i;
      if ((i == 0) && (this.loader != null))
      {
        this.loader.release();
        this.loader = null;
      }
      return;
    }
  }

  public void seekToUs(long paramLong)
  {
    Assertions.checkState(this.prepared);
    if (this.enabledTrackCount > 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.lastSeekPositionUs = paramLong;
      if ((this.pendingResetPositionUs != paramLong) && (this.downstreamPositionUs != paramLong))
        break;
      this.downstreamPositionUs = paramLong;
      return;
    }
    this.downstreamPositionUs = paramLong;
    for (int i = 0; i < this.pendingDiscontinuities.length; i++)
      this.pendingDiscontinuities[i] = true;
    restartFrom(paramLong);
  }

  protected final int usToMs(long paramLong)
  {
    return (int)(paramLong / 1000L);
  }
}