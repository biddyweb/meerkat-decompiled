package com.google.android.exoplayer.upstream.cache;

import android.net.Uri;
import android.util.Log;
import com.google.android.exoplayer.upstream.DataSink;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.FileDataSource;
import com.google.android.exoplayer.upstream.TeeDataSource;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public final class CacheDataSource
  implements DataSource
{
  private static final String TAG = "CacheDataSource";
  private final boolean blockOnCache;
  private long bytesRemaining;
  private final Cache cache;
  private final DataSource cacheReadDataSource;
  private final DataSource cacheWriteDataSource;
  private DataSource currentDataSource;
  private final EventListener eventListener;
  private boolean ignoreCache;
  private final boolean ignoreCacheOnError;
  private String key;
  private CacheSpan lockedSpan;
  private long readPosition;
  private long totalCachedBytesRead;
  private final DataSource upstreamDataSource;
  private Uri uri;

  public CacheDataSource(Cache paramCache, DataSource paramDataSource1, DataSource paramDataSource2, DataSink paramDataSink, boolean paramBoolean1, boolean paramBoolean2, EventListener paramEventListener)
  {
    this.cache = paramCache;
    this.cacheReadDataSource = paramDataSource2;
    this.blockOnCache = paramBoolean1;
    this.ignoreCacheOnError = paramBoolean2;
    this.upstreamDataSource = paramDataSource1;
    if (paramDataSink != null);
    for (this.cacheWriteDataSource = new TeeDataSource(paramDataSource1, paramDataSink); ; this.cacheWriteDataSource = null)
    {
      this.eventListener = paramEventListener;
      return;
    }
  }

  public CacheDataSource(Cache paramCache, DataSource paramDataSource, boolean paramBoolean1, boolean paramBoolean2)
  {
    this(paramCache, paramDataSource, paramBoolean1, paramBoolean2, 9223372036854775807L);
  }

  public CacheDataSource(Cache paramCache, DataSource paramDataSource, boolean paramBoolean1, boolean paramBoolean2, long paramLong)
  {
    this(paramCache, paramDataSource, new FileDataSource(), new CacheDataSink(paramCache, paramLong), paramBoolean1, paramBoolean2, null);
  }

  private void closeCurrentSource()
    throws IOException
  {
    if (this.currentDataSource == null);
    while (true)
    {
      return;
      try
      {
        this.currentDataSource.close();
        this.currentDataSource = null;
        return;
      }
      finally
      {
        if (this.lockedSpan != null)
        {
          this.cache.releaseHoleSpan(this.lockedSpan);
          this.lockedSpan = null;
        }
      }
    }
  }

  private void handleBeforeThrow(IOException paramIOException)
  {
    if ((this.ignoreCacheOnError) && ((this.currentDataSource == this.cacheReadDataSource) || ((paramIOException instanceof CacheDataSink.CacheDataSinkException))))
      this.ignoreCache = true;
  }

  private void notifyBytesRead()
  {
    if ((this.eventListener != null) && (this.totalCachedBytesRead > 0L))
    {
      this.eventListener.onCachedBytesRead(this.cache.getCacheSpace(), this.totalCachedBytesRead);
      this.totalCachedBytesRead = 0L;
    }
  }

  private void openNextSource()
    throws IOException
  {
    CacheSpan localCacheSpan;
    DataSpec localDataSpec;
    try
    {
      if (this.ignoreCache)
      {
        localCacheSpan = null;
        if (localCacheSpan != null)
          break label130;
        this.currentDataSource = this.upstreamDataSource;
        localDataSpec = new DataSpec(this.uri, this.readPosition, this.bytesRemaining, this.key);
      }
      while (true)
      {
        this.currentDataSource.open(localDataSpec);
        return;
        if (this.bytesRemaining == -1L)
        {
          Log.w("CacheDataSource", "Cache bypassed due to unbounded length.");
          localCacheSpan = null;
          break;
        }
        if (this.blockOnCache)
        {
          localCacheSpan = this.cache.startReadWrite(this.key, this.readPosition);
          break;
        }
        localCacheSpan = this.cache.startReadWriteNonBlocking(this.key, this.readPosition);
        break;
        label130: if (!localCacheSpan.isCached)
          break label216;
        Uri localUri2 = Uri.fromFile(localCacheSpan.file);
        long l3 = this.readPosition - localCacheSpan.position;
        long l4 = Math.min(localCacheSpan.length - l3, this.bytesRemaining);
        localDataSpec = new DataSpec(localUri2, this.readPosition, l4, this.key, l3);
        this.currentDataSource = this.cacheReadDataSource;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new RuntimeException(localInterruptedException);
    }
    label216: this.lockedSpan = localCacheSpan;
    long l1;
    if (localCacheSpan.isOpenEnded())
    {
      l1 = this.bytesRemaining;
      label234: Uri localUri1 = this.uri;
      long l2 = this.readPosition;
      String str = this.key;
      localDataSpec = new DataSpec(localUri1, l2, l1, str);
      if (this.cacheWriteDataSource == null)
        break label306;
    }
    label306: for (DataSource localDataSource = this.cacheWriteDataSource; ; localDataSource = this.upstreamDataSource)
    {
      this.currentDataSource = localDataSource;
      break;
      l1 = Math.min(localCacheSpan.length, this.bytesRemaining);
      break label234;
    }
  }

  public void close()
    throws IOException
  {
    notifyBytesRead();
    try
    {
      closeCurrentSource();
      return;
    }
    catch (IOException localIOException)
    {
      handleBeforeThrow(localIOException);
      throw localIOException;
    }
  }

  public long open(DataSpec paramDataSpec)
    throws IOException
  {
    Assertions.checkState(paramDataSpec.uriIsFullStream);
    try
    {
      this.uri = paramDataSpec.uri;
      this.key = paramDataSpec.key;
      this.readPosition = paramDataSpec.position;
      this.bytesRemaining = paramDataSpec.length;
      openNextSource();
      long l = paramDataSpec.length;
      return l;
    }
    catch (IOException localIOException)
    {
      handleBeforeThrow(localIOException);
      throw localIOException;
    }
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i;
    try
    {
      i = this.currentDataSource.read(paramArrayOfByte, paramInt1, paramInt2);
      if (i >= 0)
      {
        if (this.currentDataSource == this.cacheReadDataSource)
          this.totalCachedBytesRead += i;
        this.readPosition += i;
        if (this.bytesRemaining != -1L)
        {
          this.bytesRemaining -= i;
          return i;
        }
      }
      else
      {
        closeCurrentSource();
        if ((this.bytesRemaining > 0L) && (this.bytesRemaining != -1L))
        {
          openNextSource();
          int j = read(paramArrayOfByte, paramInt1, paramInt2);
          return j;
        }
      }
    }
    catch (IOException localIOException)
    {
      handleBeforeThrow(localIOException);
      throw localIOException;
    }
    return i;
  }

  public static abstract interface EventListener
  {
    public abstract void onCachedBytesRead(long paramLong1, long paramLong2);
  }
}