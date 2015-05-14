package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.nio.ByteBuffer;

public final class ByteArrayNonBlockingInputStream
  implements NonBlockingInputStream
{
  private final byte[] data;
  private int position;

  public ByteArrayNonBlockingInputStream(byte[] paramArrayOfByte)
  {
    this.data = ((byte[])Assertions.checkNotNull(paramArrayOfByte));
  }

  private int getReadLength(int paramInt)
  {
    return Math.min(paramInt, this.data.length - this.position);
  }

  public void close()
  {
  }

  public long getAvailableByteCount()
  {
    return this.data.length - this.position;
  }

  public boolean isEndOfStream()
  {
    return this.position == this.data.length;
  }

  public int read(ByteBuffer paramByteBuffer, int paramInt)
  {
    if (isEndOfStream())
      return -1;
    int i = getReadLength(paramInt);
    paramByteBuffer.put(this.data, this.position, i);
    this.position = (i + this.position);
    return i;
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (isEndOfStream())
      return -1;
    int i = getReadLength(paramInt2);
    System.arraycopy(this.data, this.position, paramArrayOfByte, paramInt1, i);
    this.position = (i + this.position);
    return i;
  }

  public int skip(int paramInt)
  {
    int i = getReadLength(paramInt);
    this.position = (i + this.position);
    return i;
  }
}