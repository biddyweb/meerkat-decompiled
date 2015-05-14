package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public class PriorityDataSource
  implements DataSource
{
  private final int priority;
  private final DataSource upstream;

  public PriorityDataSource(int paramInt, DataSource paramDataSource)
  {
    this.priority = paramInt;
    this.upstream = ((DataSource)Assertions.checkNotNull(paramDataSource));
  }

  public void close()
    throws IOException
  {
    this.upstream.close();
  }

  public long open(DataSpec paramDataSpec)
    throws IOException
  {
    NetworkLock.instance.proceedOrThrow(this.priority);
    return this.upstream.open(paramDataSpec);
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    NetworkLock.instance.proceedOrThrow(this.priority);
    return this.upstream.read(paramArrayOfByte, paramInt1, paramInt2);
  }
}