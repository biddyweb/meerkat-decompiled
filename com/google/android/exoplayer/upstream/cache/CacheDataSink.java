package com.google.android.exoplayer.upstream.cache;

import com.google.android.exoplayer.upstream.DataSink;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.util.Assertions;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class CacheDataSink
  implements DataSink
{
  private final Cache cache;
  private DataSpec dataSpec;
  private long dataSpecBytesWritten;
  private File file;
  private final long maxCacheFileSize;
  private FileOutputStream outputStream;
  private long outputStreamBytesWritten;

  public CacheDataSink(Cache paramCache, long paramLong)
  {
    this.cache = ((Cache)Assertions.checkNotNull(paramCache));
    this.maxCacheFileSize = paramLong;
  }

  private void closeCurrentOutputStream()
    throws IOException
  {
    if (this.outputStream != null)
    {
      this.outputStream.flush();
      this.outputStream.close();
      this.outputStream = null;
      this.cache.commitFile(this.file);
      this.file = null;
    }
  }

  private void openNextOutputStream()
    throws FileNotFoundException
  {
    this.file = this.cache.startFile(this.dataSpec.key, this.dataSpec.absoluteStreamPosition + this.dataSpecBytesWritten, Math.min(this.dataSpec.length - this.dataSpecBytesWritten, this.maxCacheFileSize));
    this.outputStream = new FileOutputStream(this.file);
    this.outputStreamBytesWritten = 0L;
  }

  public void close()
    throws CacheDataSink.CacheDataSinkException
  {
    try
    {
      closeCurrentOutputStream();
      return;
    }
    catch (IOException localIOException)
    {
      throw new CacheDataSinkException(localIOException);
    }
  }

  public DataSink open(DataSpec paramDataSpec)
    throws CacheDataSink.CacheDataSinkException
  {
    boolean bool;
    if (paramDataSpec.length != -1L)
      bool = true;
    while (true)
    {
      Assertions.checkState(bool);
      try
      {
        this.dataSpec = paramDataSpec;
        this.dataSpecBytesWritten = 0L;
        openNextOutputStream();
        return this;
        bool = false;
      }
      catch (FileNotFoundException localFileNotFoundException)
      {
        throw new CacheDataSinkException(localFileNotFoundException);
      }
    }
  }

  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws CacheDataSink.CacheDataSinkException
  {
    int i = 0;
    while (i < paramInt2)
      try
      {
        if (this.outputStreamBytesWritten == this.maxCacheFileSize)
        {
          closeCurrentOutputStream();
          openNextOutputStream();
        }
        int j = (int)Math.min(paramInt2 - i, this.maxCacheFileSize - this.outputStreamBytesWritten);
        this.outputStream.write(paramArrayOfByte, paramInt1 + i, j);
        i += j;
        this.outputStreamBytesWritten += j;
        this.dataSpecBytesWritten += j;
      }
      catch (IOException localIOException)
      {
        throw new CacheDataSinkException(localIOException);
      }
  }

  public static class CacheDataSinkException extends IOException
  {
    public CacheDataSinkException(IOException paramIOException)
    {
      super();
    }
  }
}