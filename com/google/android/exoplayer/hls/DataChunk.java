package com.google.android.exoplayer.hls;

import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import java.io.IOException;
import java.util.Arrays;

public abstract class DataChunk extends HlsChunk
{
  private static final int READ_GRANULARITY = 16384;
  private byte[] data;
  private int limit;
  private volatile boolean loadCanceled;
  private volatile boolean loadFinished;

  public DataChunk(DataSource paramDataSource, DataSpec paramDataSpec, byte[] paramArrayOfByte)
  {
    super(paramDataSource, paramDataSpec);
    this.data = paramArrayOfByte;
  }

  private void maybeExpandData()
  {
    if (this.data == null)
      this.data = new byte[16384];
    while (this.data.length >= 16384 + this.limit)
      return;
    this.data = Arrays.copyOf(this.data, 16384 + this.data.length);
  }

  public final void cancelLoad()
  {
    this.loadCanceled = true;
  }

  public void consume()
    throws IOException
  {
    consume(this.data, this.limit);
  }

  protected abstract void consume(byte[] paramArrayOfByte, int paramInt)
    throws IOException;

  public final boolean isLoadCanceled()
  {
    return this.loadCanceled;
  }

  public boolean isLoadFinished()
  {
    return this.loadFinished;
  }

  public final void load()
    throws IOException, InterruptedException
  {
    try
    {
      this.dataSource.open(this.dataSpec);
      this.limit = 0;
      int i = 0;
      while ((i != -1) && (!this.loadCanceled))
      {
        maybeExpandData();
        i = this.dataSource.read(this.data, this.limit, 16384);
        if (i != -1)
          this.limit = (i + this.limit);
      }
    }
    finally
    {
      this.dataSource.close();
    }
    boolean bool1 = this.loadCanceled;
    boolean bool2 = false;
    if (!bool1)
      bool2 = true;
    this.loadFinished = bool2;
    this.dataSource.close();
  }
}