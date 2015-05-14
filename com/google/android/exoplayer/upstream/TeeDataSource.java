package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public final class TeeDataSource
  implements DataSource
{
  private final DataSink dataSink;
  private final DataSource upstream;

  public TeeDataSource(DataSource paramDataSource, DataSink paramDataSink)
  {
    this.upstream = ((DataSource)Assertions.checkNotNull(paramDataSource));
    this.dataSink = ((DataSink)Assertions.checkNotNull(paramDataSink));
  }

  public void close()
    throws IOException
  {
    this.upstream.close();
    this.dataSink.close();
  }

  public long open(DataSpec paramDataSpec)
    throws IOException
  {
    long l = this.upstream.open(paramDataSpec);
    if ((paramDataSpec.length == -1L) && (l != -1L))
      paramDataSpec = new DataSpec(paramDataSpec.uri, paramDataSpec.absoluteStreamPosition, l, paramDataSpec.key, paramDataSpec.position, paramDataSpec.uriIsFullStream);
    this.dataSink.open(paramDataSpec);
    return l;
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = this.upstream.read(paramArrayOfByte, paramInt1, paramInt2);
    if (i > 0)
      this.dataSink.write(paramArrayOfByte, paramInt1, i);
    return i;
  }
}