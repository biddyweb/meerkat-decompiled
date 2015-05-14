package com.google.android.exoplayer.chunk;

import android.os.Handler;
import android.os.SystemClock;
import com.google.android.exoplayer.LoadControl;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.upstream.Loader.Callback;
import com.google.android.exoplayer.upstream.Loader.Loadable;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class ChunkSampleSource
  implements SampleSource, Loader.Callback
{
  public static final int DEFAULT_MIN_LOADABLE_RETRY_COUNT = 3;
  private static final int NO_RESET_PENDING = -1;
  private static final int STATE_ENABLED = 2;
  private static final int STATE_PREPARED = 1;
  private static final int STATE_UNPREPARED;
  private final int bufferSizeContribution;
  private final ChunkSource chunkSource;
  private IOException currentLoadableException;
  private int currentLoadableExceptionCount;
  private boolean currentLoadableExceptionFatal;
  private long currentLoadableExceptionTimestamp;
  private final ChunkOperationHolder currentLoadableHolder;
  private volatile Format downstreamFormat;
  private MediaFormat downstreamMediaFormat;
  private long downstreamPositionUs;
  private final Handler eventHandler;
  private final EventListener eventListener;
  private final int eventSourceId;
  private final boolean frameAccurateSeeking;
  private long lastPerformedBufferOperation;
  private long lastSeekPositionUs;
  private final LoadControl loadControl;
  private Loader loader;
  private final LinkedList<MediaChunk> mediaChunks;
  private final int minLoadableRetryCount;
  private boolean pendingDiscontinuity;
  private long pendingResetPositionUs;
  private final List<MediaChunk> readOnlyMediaChunks;
  private int state;

  public ChunkSampleSource(ChunkSource paramChunkSource, LoadControl paramLoadControl, int paramInt, boolean paramBoolean)
  {
    this(paramChunkSource, paramLoadControl, paramInt, paramBoolean, null, null, 0);
  }

  public ChunkSampleSource(ChunkSource paramChunkSource, LoadControl paramLoadControl, int paramInt1, boolean paramBoolean, Handler paramHandler, EventListener paramEventListener, int paramInt2)
  {
    this(paramChunkSource, paramLoadControl, paramInt1, paramBoolean, paramHandler, paramEventListener, paramInt2, 3);
  }

  public ChunkSampleSource(ChunkSource paramChunkSource, LoadControl paramLoadControl, int paramInt1, boolean paramBoolean, Handler paramHandler, EventListener paramEventListener, int paramInt2, int paramInt3)
  {
    this.chunkSource = paramChunkSource;
    this.loadControl = paramLoadControl;
    this.bufferSizeContribution = paramInt1;
    this.frameAccurateSeeking = paramBoolean;
    this.eventHandler = paramHandler;
    this.eventListener = paramEventListener;
    this.eventSourceId = paramInt2;
    this.minLoadableRetryCount = paramInt3;
    this.currentLoadableHolder = new ChunkOperationHolder();
    this.mediaChunks = new LinkedList();
    this.readOnlyMediaChunks = Collections.unmodifiableList(this.mediaChunks);
    this.state = 0;
  }

  private void clearCurrentLoadable()
  {
    this.currentLoadableHolder.chunk = null;
    this.currentLoadableException = null;
    this.currentLoadableExceptionCount = 0;
    this.currentLoadableExceptionFatal = false;
  }

  private void clearMediaChunks()
  {
    discardDownstreamMediaChunks(null);
  }

  private void discardDownstreamMediaChunk()
  {
    MediaChunk localMediaChunk = (MediaChunk)this.mediaChunks.removeFirst();
    long l = localMediaChunk.bytesLoaded();
    localMediaChunk.release();
    notifyDownstreamDiscarded(localMediaChunk.startTimeUs, localMediaChunk.endTimeUs, l);
  }

  private void discardDownstreamMediaChunks(MediaChunk paramMediaChunk)
  {
    if ((this.mediaChunks.isEmpty()) || (paramMediaChunk == this.mediaChunks.getFirst()))
      return;
    long l1 = 0L;
    long l2 = ((MediaChunk)this.mediaChunks.getFirst()).startTimeUs;
    long l3 = 0L;
    while ((!this.mediaChunks.isEmpty()) && (paramMediaChunk != this.mediaChunks.getFirst()))
    {
      MediaChunk localMediaChunk = (MediaChunk)this.mediaChunks.removeFirst();
      l1 += localMediaChunk.bytesLoaded();
      l3 = localMediaChunk.endTimeUs;
      localMediaChunk.release();
    }
    notifyDownstreamDiscarded(l2, l3, l1);
  }

  private boolean discardUpstreamMediaChunks(int paramInt)
  {
    if (this.mediaChunks.size() <= paramInt)
      return false;
    long l1 = 0L;
    long l2 = 0L;
    long l3 = ((MediaChunk)this.mediaChunks.getLast()).endTimeUs;
    while (this.mediaChunks.size() > paramInt)
    {
      MediaChunk localMediaChunk = (MediaChunk)this.mediaChunks.removeLast();
      l1 += localMediaChunk.bytesLoaded();
      l2 = localMediaChunk.startTimeUs;
      localMediaChunk.release();
    }
    notifyUpstreamDiscarded(l2, l3, l1);
    return true;
  }

  private MediaChunk getMediaChunk(long paramLong)
  {
    Iterator localIterator = this.mediaChunks.iterator();
    while (localIterator.hasNext())
    {
      MediaChunk localMediaChunk = (MediaChunk)localIterator.next();
      if (paramLong < localMediaChunk.startTimeUs)
        localMediaChunk = null;
      while (localMediaChunk.isLastChunk())
        return localMediaChunk;
      if (paramLong < localMediaChunk.endTimeUs)
        return localMediaChunk;
    }
    return null;
  }

  private long getNextLoadPositionUs()
  {
    if (isPendingReset())
      return this.pendingResetPositionUs;
    MediaChunk localMediaChunk = (MediaChunk)this.mediaChunks.getLast();
    if (localMediaChunk.nextChunkIndex == -1)
      return -1L;
    return localMediaChunk.endTimeUs;
  }

  private long getRetryDelayMillis(long paramLong)
  {
    return Math.min(1000L * (paramLong - 1L), 5000L);
  }

  private boolean isMediaChunk(Chunk paramChunk)
  {
    return paramChunk instanceof MediaChunk;
  }

  private boolean isPendingReset()
  {
    return this.pendingResetPositionUs != -1L;
  }

  private void maybeStartLoading()
  {
    Chunk localChunk = this.currentLoadableHolder.chunk;
    if (localChunk == null)
      return;
    localChunk.init(this.loadControl.getAllocator());
    if (isMediaChunk(localChunk))
    {
      MediaChunk localMediaChunk = (MediaChunk)localChunk;
      if (isPendingReset())
      {
        localMediaChunk.seekTo(this.pendingResetPositionUs, false);
        this.pendingResetPositionUs = -1L;
      }
      this.mediaChunks.add(localMediaChunk);
      notifyLoadStarted(localMediaChunk.format.id, localMediaChunk.trigger, false, localMediaChunk.startTimeUs, localMediaChunk.endTimeUs, localMediaChunk.getLength());
    }
    while (true)
    {
      this.loader.startLoading(localChunk, this);
      return;
      notifyLoadStarted(localChunk.format.id, localChunk.trigger, true, -1L, -1L, localChunk.getLength());
    }
  }

  private void maybeThrowLoadableException()
    throws IOException
  {
    if ((this.currentLoadableException != null) && ((this.currentLoadableExceptionFatal) || (this.currentLoadableExceptionCount > this.minLoadableRetryCount)))
      throw this.currentLoadableException;
  }

  private void notifyConsumptionError(final IOException paramIOException)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onConsumptionError(ChunkSampleSource.this.eventSourceId, paramIOException);
        }
      });
  }

  private void notifyDownstreamDiscarded(final long paramLong1, long paramLong2, final long paramLong3)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onDownstreamDiscarded(ChunkSampleSource.this.eventSourceId, ChunkSampleSource.this.usToMs(paramLong1), ChunkSampleSource.this.usToMs(paramLong3), this.val$bytesDiscarded);
        }
      });
  }

  private void notifyDownstreamFormatChanged(final String paramString, final int paramInt, final long paramLong)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onDownstreamFormatChanged(ChunkSampleSource.this.eventSourceId, paramString, paramInt, ChunkSampleSource.this.usToMs(paramLong));
        }
      });
  }

  private void notifyLoadCanceled(final long paramLong)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onLoadCanceled(ChunkSampleSource.this.eventSourceId, paramLong);
        }
      });
  }

  private void notifyLoadCompleted(final long paramLong)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onLoadCompleted(ChunkSampleSource.this.eventSourceId, paramLong);
        }
      });
  }

  private void notifyLoadStarted(final String paramString, final int paramInt, final boolean paramBoolean, final long paramLong1, long paramLong2, final long paramLong3)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onLoadStarted(ChunkSampleSource.this.eventSourceId, paramString, paramInt, paramBoolean, ChunkSampleSource.this.usToMs(paramLong1), ChunkSampleSource.this.usToMs(paramLong3), this.val$length);
        }
      });
  }

  private void notifyUpstreamDiscarded(final long paramLong1, long paramLong2, final long paramLong3)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onUpstreamDiscarded(ChunkSampleSource.this.eventSourceId, ChunkSampleSource.this.usToMs(paramLong1), ChunkSampleSource.this.usToMs(paramLong3), this.val$totalBytes);
        }
      });
  }

  private void notifyUpstreamError(final IOException paramIOException)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          ChunkSampleSource.this.eventListener.onUpstreamError(ChunkSampleSource.this.eventSourceId, paramIOException);
        }
      });
  }

  private void restartFrom(long paramLong)
  {
    this.pendingResetPositionUs = paramLong;
    if (this.loader.isLoading())
    {
      this.loader.cancelLoading();
      return;
    }
    clearMediaChunks();
    clearCurrentLoadable();
    updateLoadControl();
  }

  private void resumeFromBackOff()
  {
    this.currentLoadableException = null;
    Chunk localChunk = this.currentLoadableHolder.chunk;
    if (!isMediaChunk(localChunk))
    {
      this.currentLoadableHolder.queueSize = this.readOnlyMediaChunks.size();
      this.chunkSource.getChunkOperation(this.readOnlyMediaChunks, this.pendingResetPositionUs, this.downstreamPositionUs, this.currentLoadableHolder);
      discardUpstreamMediaChunks(this.currentLoadableHolder.queueSize);
      if (this.currentLoadableHolder.chunk == localChunk)
      {
        this.loader.startLoading(localChunk, this);
        return;
      }
      localChunk.release();
      maybeStartLoading();
      return;
    }
    if (localChunk == this.mediaChunks.getFirst())
    {
      this.loader.startLoading(localChunk, this);
      return;
    }
    MediaChunk localMediaChunk = (MediaChunk)this.mediaChunks.removeLast();
    if (localChunk == localMediaChunk);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.currentLoadableHolder.queueSize = this.readOnlyMediaChunks.size();
      this.chunkSource.getChunkOperation(this.readOnlyMediaChunks, this.pendingResetPositionUs, this.downstreamPositionUs, this.currentLoadableHolder);
      this.mediaChunks.add(localMediaChunk);
      if (this.currentLoadableHolder.chunk != localChunk)
        break;
      this.loader.startLoading(localChunk, this);
      return;
    }
    discardUpstreamMediaChunks(this.currentLoadableHolder.queueSize);
    clearCurrentLoadable();
    maybeStartLoading();
  }

  private void updateLoadControl()
  {
    if (this.currentLoadableExceptionFatal)
    {
      this.loadControl.update(this, this.downstreamPositionUs, -1L, false, true);
      return;
    }
    long l1 = SystemClock.elapsedRealtime();
    long l2 = getNextLoadPositionUs();
    int i;
    label47: boolean bool1;
    label65: boolean bool3;
    long l3;
    if (this.currentLoadableException != null)
    {
      i = 1;
      if ((!this.loader.isLoading()) && (i == 0))
        break label231;
      bool1 = true;
      if ((bool1) || (((this.currentLoadableHolder.chunk != null) || (l2 == -1L)) && (l1 - this.lastPerformedBufferOperation <= 2000L)))
        break label271;
      this.lastPerformedBufferOperation = l1;
      this.currentLoadableHolder.queueSize = this.readOnlyMediaChunks.size();
      this.chunkSource.getChunkOperation(this.readOnlyMediaChunks, this.pendingResetPositionUs, this.downstreamPositionUs, this.currentLoadableHolder);
      bool3 = discardUpstreamMediaChunks(this.currentLoadableHolder.queueSize);
      if (this.currentLoadableHolder.chunk != null)
        break label237;
      l3 = -1L;
    }
    while (true)
    {
      boolean bool2 = this.loadControl.update(this, this.downstreamPositionUs, l3, bool1, false);
      if (i != 0)
      {
        if (l1 - this.currentLoadableExceptionTimestamp < getRetryDelayMillis(this.currentLoadableExceptionCount))
          break;
        resumeFromBackOff();
        return;
        i = 0;
        break label47;
        label231: bool1 = false;
        break label65;
        label237: if (!bool3)
          break label271;
        l3 = getNextLoadPositionUs();
        continue;
      }
      if ((this.loader.isLoading()) || (!bool2))
        break;
      maybeStartLoading();
      return;
      label271: l3 = l2;
    }
  }

  public boolean continueBuffering(long paramLong)
    throws IOException
  {
    boolean bool1;
    if (this.state == 2)
    {
      bool1 = true;
      Assertions.checkState(bool1);
      this.downstreamPositionUs = paramLong;
      this.chunkSource.continueBuffering(paramLong);
      updateLoadControl();
      boolean bool2 = isPendingReset();
      bool3 = false;
      if (!bool2)
      {
        boolean bool4 = this.mediaChunks.isEmpty();
        bool3 = false;
        if (!bool4)
          break label81;
      }
    }
    while (true)
    {
      if (!bool3)
        maybeThrowLoadableException();
      return bool3;
      bool1 = false;
      break;
      label81: if (!((MediaChunk)this.mediaChunks.getFirst()).sampleAvailable())
        break label103;
      bool3 = true;
    }
    label103: if ((this.mediaChunks.size() > 1) && (((MediaChunk)this.mediaChunks.get(1)).sampleAvailable()));
    for (boolean bool3 = true; ; bool3 = false)
      break;
  }

  public void disable(int paramInt)
  {
    boolean bool1;
    if (this.state == 2)
      bool1 = true;
    while (true)
    {
      Assertions.checkState(bool1);
      boolean bool2;
      if (paramInt == 0)
      {
        bool2 = true;
        label20: Assertions.checkState(bool2);
        this.pendingDiscontinuity = false;
        this.state = 1;
      }
      try
      {
        this.chunkSource.disable(this.mediaChunks);
        this.loadControl.unregister(this);
        if (this.loader.isLoading())
        {
          this.loader.cancelLoading();
          return;
          bool1 = false;
          continue;
          bool2 = false;
          break label20;
        }
        else
        {
          clearMediaChunks();
          clearCurrentLoadable();
          this.loadControl.trimAllocator();
          return;
        }
      }
      finally
      {
        this.loadControl.unregister(this);
        if (!this.loader.isLoading())
          break label135;
      }
    }
    this.loader.cancelLoading();
    while (true)
    {
      throw localObject;
      label135: clearMediaChunks();
      clearCurrentLoadable();
      this.loadControl.trimAllocator();
    }
  }

  public void enable(int paramInt, long paramLong)
  {
    int i = 1;
    if (this.state == i)
    {
      int k = i;
      Assertions.checkState(k);
      if (paramInt != 0)
        break label90;
    }
    while (true)
    {
      Assertions.checkState(i);
      this.state = 2;
      this.chunkSource.enable();
      this.loadControl.register(this, this.bufferSizeContribution);
      this.downstreamFormat = null;
      this.downstreamMediaFormat = null;
      this.downstreamPositionUs = paramLong;
      this.lastSeekPositionUs = paramLong;
      restartFrom(paramLong);
      return;
      int m = 0;
      break;
      label90: int j = 0;
    }
  }

  public long getBufferedPositionUs()
  {
    if (this.state == 2);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      if (!isPendingReset())
        break;
      return this.pendingResetPositionUs;
    }
    MediaChunk localMediaChunk = (MediaChunk)this.mediaChunks.getLast();
    Chunk localChunk = this.currentLoadableHolder.chunk;
    if ((localChunk != null) && (localMediaChunk == localChunk))
    {
      long l = localMediaChunk.getLength();
      if ((l != -1L) && (l != 0L))
        return localMediaChunk.startTimeUs + (localMediaChunk.endTimeUs - localMediaChunk.startTimeUs) * localMediaChunk.bytesLoaded() / l;
      return localMediaChunk.startTimeUs;
    }
    if (localMediaChunk.isLastChunk())
      return -3L;
    return localMediaChunk.endTimeUs;
  }

  public Format getFormat()
  {
    return this.downstreamFormat;
  }

  public int getTrackCount()
  {
    if (this.state != 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      return 1;
    }
  }

  public TrackInfo getTrackInfo(int paramInt)
  {
    boolean bool1 = true;
    boolean bool2;
    if (this.state != 0)
    {
      bool2 = bool1;
      Assertions.checkState(bool2);
      if (paramInt != 0)
        break label38;
    }
    while (true)
    {
      Assertions.checkState(bool1);
      return this.chunkSource.getTrackInfo();
      bool2 = false;
      break;
      label38: bool1 = false;
    }
  }

  public void onLoadCanceled(Loader.Loadable paramLoadable)
  {
    Chunk localChunk = this.currentLoadableHolder.chunk;
    notifyLoadCanceled(localChunk.bytesLoaded());
    if (!isMediaChunk(localChunk))
      localChunk.release();
    clearCurrentLoadable();
    if (this.state == 2)
    {
      restartFrom(this.pendingResetPositionUs);
      return;
    }
    clearMediaChunks();
    this.loadControl.trimAllocator();
  }

  public void onLoadCompleted(Loader.Loadable paramLoadable)
  {
    Chunk localChunk = this.currentLoadableHolder.chunk;
    notifyLoadCompleted(localChunk.bytesLoaded());
    try
    {
      localChunk.consume();
      return;
    }
    catch (IOException localIOException)
    {
      this.currentLoadableException = localIOException;
      this.currentLoadableExceptionCount = (1 + this.currentLoadableExceptionCount);
      this.currentLoadableExceptionTimestamp = SystemClock.elapsedRealtime();
      this.currentLoadableExceptionFatal = true;
      notifyConsumptionError(localIOException);
      return;
    }
    finally
    {
      if (!isMediaChunk(localChunk))
        localChunk.release();
      if (!this.currentLoadableExceptionFatal)
        clearCurrentLoadable();
      updateLoadControl();
    }
  }

  public void onLoadError(Loader.Loadable paramLoadable, IOException paramIOException)
  {
    this.currentLoadableException = paramIOException;
    this.currentLoadableExceptionCount = (1 + this.currentLoadableExceptionCount);
    this.currentLoadableExceptionTimestamp = SystemClock.elapsedRealtime();
    notifyUpstreamError(paramIOException);
    this.chunkSource.onChunkLoadError(this.currentLoadableHolder.chunk, paramIOException);
    updateLoadControl();
  }

  protected void onSampleRead(MediaChunk paramMediaChunk, SampleHolder paramSampleHolder)
  {
  }

  public boolean prepare()
  {
    if (this.state == 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.loader = new Loader("Loader:" + this.chunkSource.getTrackInfo().mimeType);
      this.state = 1;
      return true;
    }
  }

  public int readData(int paramInt, long paramLong, MediaFormatHolder paramMediaFormatHolder, SampleHolder paramSampleHolder, boolean paramBoolean)
    throws IOException
  {
    boolean bool1;
    if (this.state == 2)
    {
      bool1 = true;
      Assertions.checkState(bool1);
      if (paramInt != 0)
        break label49;
    }
    label49: for (boolean bool2 = true; ; bool2 = false)
    {
      Assertions.checkState(bool2);
      if (!this.pendingDiscontinuity)
        break label55;
      this.pendingDiscontinuity = false;
      return -5;
      bool1 = false;
      break;
    }
    label55: if (paramBoolean)
      return -2;
    this.downstreamPositionUs = paramLong;
    if (isPendingReset())
    {
      maybeThrowLoadableException();
      IOException localIOException2 = this.chunkSource.getError();
      if (localIOException2 != null)
        throw localIOException2;
      return -2;
    }
    MediaChunk localMediaChunk = (MediaChunk)this.mediaChunks.getFirst();
    if (localMediaChunk.isReadFinished())
    {
      if (this.mediaChunks.size() > 1)
      {
        discardDownstreamMediaChunk();
        ((MediaChunk)this.mediaChunks.getFirst()).seekToStart();
        return readData(paramInt, paramLong, paramMediaFormatHolder, paramSampleHolder, false);
      }
      if (localMediaChunk.isLastChunk())
        return -1;
      IOException localIOException1 = this.chunkSource.getError();
      if (localIOException1 != null)
        throw localIOException1;
      return -2;
    }
    if ((this.downstreamFormat == null) || (!this.downstreamFormat.equals(localMediaChunk.format)))
    {
      notifyDownstreamFormatChanged(localMediaChunk.format.id, localMediaChunk.trigger, localMediaChunk.startTimeUs);
      this.downstreamFormat = localMediaChunk.format;
    }
    if (!localMediaChunk.prepare())
    {
      if (this.currentLoadableException != null)
        throw this.currentLoadableException;
      return -2;
    }
    MediaFormat localMediaFormat = localMediaChunk.getMediaFormat();
    if ((localMediaFormat != null) && (!localMediaFormat.equals(this.downstreamMediaFormat, true)))
    {
      this.chunkSource.getMaxVideoDimensions(localMediaFormat);
      paramMediaFormatHolder.format = localMediaFormat;
      paramMediaFormatHolder.drmInitData = localMediaChunk.getPsshInfo();
      this.downstreamMediaFormat = localMediaFormat;
      return -4;
    }
    if (localMediaChunk.read(paramSampleHolder))
    {
      if ((this.frameAccurateSeeking) && (paramSampleHolder.timeUs < this.lastSeekPositionUs));
      for (boolean bool3 = true; ; bool3 = false)
      {
        paramSampleHolder.decodeOnly = bool3;
        onSampleRead(localMediaChunk, paramSampleHolder);
        return -3;
      }
    }
    maybeThrowLoadableException();
    return -2;
  }

  public void release()
  {
    if (this.state != 2);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      if (this.loader != null)
      {
        this.loader.release();
        this.loader = null;
      }
      this.state = 0;
      return;
    }
  }

  public void seekToUs(long paramLong)
  {
    boolean bool1 = true;
    if (this.state == 2);
    for (boolean bool2 = bool1; ; bool2 = false)
    {
      Assertions.checkState(bool2);
      this.downstreamPositionUs = paramLong;
      this.lastSeekPositionUs = paramLong;
      if (this.pendingResetPositionUs != paramLong)
        break;
      return;
    }
    MediaChunk localMediaChunk = getMediaChunk(paramLong);
    if (localMediaChunk == null)
    {
      restartFrom(paramLong);
      this.pendingDiscontinuity = bool1;
      return;
    }
    boolean bool3 = this.pendingDiscontinuity;
    if (localMediaChunk == this.mediaChunks.getFirst());
    while (true)
    {
      this.pendingDiscontinuity = (bool3 | localMediaChunk.seekTo(paramLong, bool1));
      discardDownstreamMediaChunks(localMediaChunk);
      updateLoadControl();
      return;
      bool1 = false;
    }
  }

  protected final int usToMs(long paramLong)
  {
    return (int)(paramLong / 1000L);
  }

  public static abstract interface EventListener
  {
    public abstract void onConsumptionError(int paramInt, IOException paramIOException);

    public abstract void onDownstreamDiscarded(int paramInt1, int paramInt2, int paramInt3, long paramLong);

    public abstract void onDownstreamFormatChanged(int paramInt1, String paramString, int paramInt2, int paramInt3);

    public abstract void onLoadCanceled(int paramInt, long paramLong);

    public abstract void onLoadCompleted(int paramInt, long paramLong);

    public abstract void onLoadStarted(int paramInt1, String paramString, int paramInt2, boolean paramBoolean, int paramInt3, int paramInt4, long paramLong);

    public abstract void onUpstreamDiscarded(int paramInt1, int paramInt2, int paramInt3, long paramLong);

    public abstract void onUpstreamError(int paramInt, IOException paramIOException);
  }
}