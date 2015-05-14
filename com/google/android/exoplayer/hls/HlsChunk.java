package com.google.android.exoplayer.hls;

import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.Loader.Loadable;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public abstract class HlsChunk
  implements Loader.Loadable
{
  protected final DataSource dataSource;
  protected final DataSpec dataSpec;

  public HlsChunk(DataSource paramDataSource, DataSpec paramDataSpec)
  {
    if (paramDataSpec.length <= 2147483647L);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.dataSource = ((DataSource)Assertions.checkNotNull(paramDataSource));
      this.dataSpec = ((DataSpec)Assertions.checkNotNull(paramDataSpec));
      return;
    }
  }

  public abstract void consume()
    throws IOException;

  public abstract boolean isLoadFinished();
}