package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.nio.ByteBuffer;

public final class DataSourceStream
  implements Loader.Loadable, NonBlockingInputStream
{
  private static final int CHUNKED_ALLOCATION_INCREMENT = 262144;
  private Allocation allocation;
  private final Allocator allocator;
  private final DataSource dataSource;
  private final DataSpec dataSpec;
  private volatile boolean loadCanceled;
  private volatile long loadPosition;
  private final ReadHead readHead;
  private volatile long resolvedLength;
  private int writeFragmentIndex;
  private int writeFragmentOffset;
  private int writeFragmentRemainingLength;

  public DataSourceStream(DataSource paramDataSource, DataSpec paramDataSpec, Allocator paramAllocator)
  {
    if (paramDataSpec.length <= 2147483647L);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.dataSource = paramDataSource;
      this.dataSpec = paramDataSpec;
      this.allocator = paramAllocator;
      this.resolvedLength = -1L;
      this.readHead = new ReadHead(null);
      return;
    }
  }

  private boolean maybeMoreToLoad()
  {
    return (this.resolvedLength == -1L) || (this.loadPosition < this.resolvedLength);
  }

  private int read(ByteBuffer paramByteBuffer, byte[] paramArrayOfByte, int paramInt1, ReadHead paramReadHead, int paramInt2)
  {
    if (isEndOfStream())
      j = -1;
    int i;
    do
    {
      return j;
      i = (int)Math.min(this.loadPosition - paramReadHead.position, paramInt2);
      j = 0;
    }
    while (i == 0);
    if (paramReadHead.position == 0)
    {
      ReadHead.access$202(paramReadHead, 0);
      ReadHead.access$302(paramReadHead, this.allocation.getFragmentOffset(0));
      ReadHead.access$402(paramReadHead, this.allocation.getFragmentLength(0));
    }
    int j = 0;
    byte[][] arrayOfByte = this.allocation.getBuffers();
    label102: int k;
    if (j < i)
    {
      if (paramReadHead.fragmentRemaining == 0)
      {
        ReadHead.access$208(paramReadHead);
        ReadHead.access$302(paramReadHead, this.allocation.getFragmentOffset(paramReadHead.fragmentIndex));
        ReadHead.access$402(paramReadHead, this.allocation.getFragmentLength(paramReadHead.fragmentIndex));
      }
      k = Math.min(paramReadHead.fragmentRemaining, i - j);
      if (paramByteBuffer == null)
        break label254;
      paramByteBuffer.put(arrayOfByte[paramReadHead.fragmentIndex], paramReadHead.fragmentOffset, k);
    }
    while (true)
    {
      ReadHead.access$102(paramReadHead, k + paramReadHead.position);
      j += k;
      ReadHead.access$302(paramReadHead, k + paramReadHead.fragmentOffset);
      ReadHead.access$402(paramReadHead, paramReadHead.fragmentRemaining - k);
      break label102;
      break;
      label254: if (paramArrayOfByte != null)
      {
        System.arraycopy(arrayOfByte[paramReadHead.fragmentIndex], paramReadHead.fragmentOffset, paramArrayOfByte, paramInt1, k);
        paramInt1 += k;
      }
    }
  }

  public void cancelLoad()
  {
    this.loadCanceled = true;
  }

  public void close()
  {
    if (this.allocation != null)
    {
      this.allocation.release();
      this.allocation = null;
    }
  }

  public long getAvailableByteCount()
  {
    return this.loadPosition - this.readHead.position;
  }

  public long getLength()
  {
    if (this.resolvedLength != -1L)
      return this.resolvedLength;
    return this.dataSpec.length;
  }

  public long getLoadPosition()
  {
    return this.loadPosition;
  }

  public long getReadPosition()
  {
    return this.readHead.position;
  }

  public boolean isEndOfStream()
  {
    return (this.resolvedLength != -1L) && (this.readHead.position == this.resolvedLength);
  }

  public boolean isLoadCanceled()
  {
    return this.loadCanceled;
  }

  public boolean isLoadFinished()
  {
    return (this.resolvedLength != -1L) && (this.loadPosition == this.resolvedLength);
  }

  public void load()
    throws IOException, InterruptedException
  {
    if ((this.loadCanceled) || (isLoadFinished()))
      return;
    long l2;
    try
    {
      if ((this.loadPosition != 0L) || (this.resolvedLength != -1L))
        break label244;
      DataSpec localDataSpec2 = this.dataSpec;
      l2 = this.dataSource.open(localDataSpec2);
      if (l2 > 2147483647L)
        throw new DataSourceStreamLoadException(new UnexpectedLengthException(this.dataSpec.length, l2));
    }
    finally
    {
      Util.closeQuietly(this.dataSource);
    }
    this.resolvedLength = l2;
    if (this.allocation == null)
      if (this.resolvedLength == -1L)
        break label561;
    label554: label561: for (int k = (int)this.resolvedLength; ; k = 262144)
    {
      this.allocation = this.allocator.allocate(k);
      int i = this.allocation.capacity();
      if (this.loadPosition == 0L)
      {
        this.writeFragmentIndex = 0;
        this.writeFragmentOffset = this.allocation.getFragmentOffset(0);
        this.writeFragmentRemainingLength = this.allocation.getFragmentLength(0);
      }
      int j = 2147483647;
      byte[][] arrayOfByte = this.allocation.getBuffers();
      label211: if ((!this.loadCanceled) && (j > 0) && (maybeMoreToLoad()))
        if (Thread.interrupted())
        {
          throw new InterruptedException();
          label244: if (this.resolvedLength == -1L)
            break label554;
        }
      for (long l1 = this.resolvedLength - this.loadPosition; ; l1 = -1L)
      {
        DataSpec localDataSpec1 = new DataSpec(this.dataSpec.uri, this.dataSpec.position + this.loadPosition, l1, this.dataSpec.key);
        this.dataSource.open(localDataSpec1);
        break;
        j = this.dataSource.read(arrayOfByte[this.writeFragmentIndex], this.writeFragmentOffset, this.writeFragmentRemainingLength);
        if (j > 0)
        {
          this.loadPosition += j;
          this.writeFragmentOffset = (j + this.writeFragmentOffset);
          this.writeFragmentRemainingLength -= j;
          if ((this.writeFragmentRemainingLength != 0) || (!maybeMoreToLoad()))
            break label211;
          this.writeFragmentIndex = (1 + this.writeFragmentIndex);
          if (this.loadPosition == i)
          {
            this.allocation.ensureCapacity(262144 + i);
            i = this.allocation.capacity();
            arrayOfByte = this.allocation.getBuffers();
          }
          this.writeFragmentOffset = this.allocation.getFragmentOffset(this.writeFragmentIndex);
          this.writeFragmentRemainingLength = this.allocation.getFragmentLength(this.writeFragmentIndex);
          break label211;
        }
        if (this.resolvedLength == -1L)
        {
          this.resolvedLength = this.loadPosition;
          break label211;
        }
        if (this.resolvedLength == this.loadPosition)
          break label211;
        throw new DataSourceStreamLoadException(new UnexpectedLengthException(this.resolvedLength, this.loadPosition));
        Util.closeQuietly(this.dataSource);
        return;
      }
    }
  }

  public int read(ByteBuffer paramByteBuffer, int paramInt)
  {
    return read(paramByteBuffer, null, 0, this.readHead, paramInt);
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return read(null, paramArrayOfByte, paramInt1, this.readHead, paramInt2);
  }

  public void resetReadPosition()
  {
    this.readHead.reset();
  }

  public int skip(int paramInt)
  {
    return read(null, null, 0, this.readHead, paramInt);
  }

  public static class DataSourceStreamLoadException extends IOException
  {
    public DataSourceStreamLoadException(IOException paramIOException)
    {
      super();
    }
  }

  private static class ReadHead
  {
    private int fragmentIndex;
    private int fragmentOffset;
    private int fragmentRemaining;
    private int position;

    public void reset()
    {
      this.position = 0;
      this.fragmentIndex = 0;
      this.fragmentOffset = 0;
      this.fragmentRemaining = 0;
    }
  }
}