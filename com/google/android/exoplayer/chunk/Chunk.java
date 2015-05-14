package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.upstream.Allocator;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSourceStream;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.Loader.Loadable;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.TraceUtil;
import java.io.IOException;

public abstract class Chunk
  implements Loader.Loadable
{
  private final DataSource dataSource;
  private DataSourceStream dataSourceStream;
  private final DataSpec dataSpec;
  public final Format format;
  public final int trigger;

  public Chunk(DataSource paramDataSource, DataSpec paramDataSpec, Format paramFormat, int paramInt)
  {
    if (paramDataSpec.length <= 2147483647L);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.dataSource = ((DataSource)Assertions.checkNotNull(paramDataSource));
      this.dataSpec = ((DataSpec)Assertions.checkNotNull(paramDataSpec));
      this.format = ((Format)Assertions.checkNotNull(paramFormat));
      this.trigger = paramInt;
      return;
    }
  }

  public final long bytesLoaded()
  {
    return this.dataSourceStream.getLoadPosition();
  }

  public final void cancelLoad()
  {
    this.dataSourceStream.cancelLoad();
  }

  public final void consume()
    throws IOException
  {
    if (this.dataSourceStream != null);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      consumeStream(this.dataSourceStream);
      return;
    }
  }

  protected void consumeStream(NonBlockingInputStream paramNonBlockingInputStream)
    throws IOException
  {
  }

  public final long getLength()
  {
    return this.dataSourceStream.getLength();
  }

  protected final NonBlockingInputStream getNonBlockingInputStream()
  {
    return this.dataSourceStream;
  }

  public final void init(Allocator paramAllocator)
  {
    if (this.dataSourceStream == null);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.dataSourceStream = new DataSourceStream(this.dataSource, this.dataSpec, paramAllocator);
      return;
    }
  }

  public final boolean isLoadCanceled()
  {
    return this.dataSourceStream.isLoadCanceled();
  }

  public final boolean isLoadFinished()
  {
    return this.dataSourceStream.isLoadFinished();
  }

  public final boolean isReadFinished()
  {
    return this.dataSourceStream.isEndOfStream();
  }

  public final void load()
    throws IOException, InterruptedException
  {
    TraceUtil.beginSection("chunkLoad");
    try
    {
      this.dataSourceStream.load();
      return;
    }
    finally
    {
      TraceUtil.endSection();
    }
  }

  public final void release()
  {
    if (this.dataSourceStream != null)
    {
      this.dataSourceStream.close();
      this.dataSourceStream = null;
    }
  }

  protected final void resetReadPosition()
  {
    if (this.dataSourceStream != null)
      this.dataSourceStream.resetReadPosition();
  }
}