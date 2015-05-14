package com.google.android.exoplayer.upstream;

import android.net.Uri;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public final class UriDataSource
  implements DataSource
{
  private static final String FILE_URI_SCHEME = "file";
  private DataSource dataSource;
  private final DataSource fileDataSource;
  private final DataSource httpDataSource;

  public UriDataSource(DataSource paramDataSource1, DataSource paramDataSource2)
  {
    this.fileDataSource = ((DataSource)Assertions.checkNotNull(paramDataSource1));
    this.httpDataSource = ((DataSource)Assertions.checkNotNull(paramDataSource2));
  }

  public UriDataSource(String paramString, TransferListener paramTransferListener)
  {
    this(new FileDataSource(paramTransferListener), new HttpDataSource(paramString, null, paramTransferListener));
  }

  public void close()
    throws IOException
  {
    if (this.dataSource != null)
    {
      this.dataSource.close();
      this.dataSource = null;
    }
  }

  public long open(DataSpec paramDataSpec)
    throws IOException
  {
    boolean bool;
    if (this.dataSource == null)
    {
      bool = true;
      Assertions.checkState(bool);
      if (!"file".equals(paramDataSpec.uri.getScheme()))
        break label54;
    }
    label54: for (DataSource localDataSource = this.fileDataSource; ; localDataSource = this.httpDataSource)
    {
      this.dataSource = localDataSource;
      return this.dataSource.open(paramDataSpec);
      bool = false;
      break;
    }
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    return this.dataSource.read(paramArrayOfByte, paramInt1, paramInt2);
  }
}