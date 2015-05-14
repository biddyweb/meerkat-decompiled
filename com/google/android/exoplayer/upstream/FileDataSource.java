package com.google.android.exoplayer.upstream;

import android.net.Uri;
import java.io.IOException;
import java.io.RandomAccessFile;

public final class FileDataSource
  implements DataSource
{
  private long bytesRemaining;
  private RandomAccessFile file;
  private final TransferListener listener;
  private boolean opened;

  public FileDataSource()
  {
    this(null);
  }

  public FileDataSource(TransferListener paramTransferListener)
  {
    this.listener = paramTransferListener;
  }

  public void close()
    throws FileDataSource.FileDataSourceException
  {
    if (this.file != null);
    try
    {
      this.file.close();
      return;
    }
    catch (IOException localIOException)
    {
      throw new FileDataSourceException(localIOException);
    }
    finally
    {
      this.file = null;
      if (this.opened)
      {
        this.opened = false;
        if (this.listener != null)
          this.listener.onTransferEnd();
      }
    }
  }

  public long open(DataSpec paramDataSpec)
    throws FileDataSource.FileDataSourceException
  {
    try
    {
      this.file = new RandomAccessFile(paramDataSpec.uri.getPath(), "r");
      this.file.seek(paramDataSpec.position);
      if (paramDataSpec.length == -1L);
      for (long l = this.file.length() - paramDataSpec.position; ; l = paramDataSpec.length)
      {
        this.bytesRemaining = l;
        this.opened = true;
        if (this.listener != null)
          this.listener.onTransferStart();
        return this.bytesRemaining;
      }
    }
    catch (IOException localIOException)
    {
      throw new FileDataSourceException(localIOException);
    }
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws FileDataSource.FileDataSourceException
  {
    int j;
    if (this.bytesRemaining == 0L)
      j = -1;
    while (true)
    {
      return j;
      try
      {
        int i = this.file.read(paramArrayOfByte, paramInt1, (int)Math.min(this.bytesRemaining, paramInt2));
        j = i;
        if (j <= 0)
          continue;
        this.bytesRemaining -= j;
        if (this.listener == null)
          continue;
        this.listener.onBytesTransferred(j);
        return j;
      }
      catch (IOException localIOException)
      {
        throw new FileDataSourceException(localIOException);
      }
    }
  }

  public static class FileDataSourceException extends IOException
  {
    public FileDataSourceException(IOException paramIOException)
    {
      super();
    }
  }
}