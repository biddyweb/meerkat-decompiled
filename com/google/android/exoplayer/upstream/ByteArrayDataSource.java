package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public class ByteArrayDataSource
  implements DataSource
{
  private final byte[] data;
  private int readPosition;
  private int remainingBytes;

  public ByteArrayDataSource(byte[] paramArrayOfByte)
  {
    Assertions.checkNotNull(paramArrayOfByte);
    if (paramArrayOfByte.length > 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkArgument(bool);
      this.data = paramArrayOfByte;
      return;
    }
  }

  public void close()
    throws IOException
  {
  }

  public long open(DataSpec paramDataSpec)
    throws IOException
  {
    this.readPosition = ((int)paramDataSpec.position);
    if (paramDataSpec.length == -1L);
    for (long l = this.data.length - paramDataSpec.position; ; l = paramDataSpec.length)
    {
      this.remainingBytes = ((int)l);
      if ((this.remainingBytes > 0) && (this.readPosition + this.remainingBytes <= this.data.length))
        break;
      throw new IOException("Unsatisfiable range: [" + this.readPosition + ", " + paramDataSpec.length + "], length: " + this.data.length);
    }
    return this.remainingBytes;
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this.remainingBytes == 0)
      return -1;
    int i = Math.min(paramInt2, this.remainingBytes);
    System.arraycopy(this.data, this.readPosition, paramArrayOfByte, paramInt1, i);
    this.readPosition = (i + this.readPosition);
    this.remainingBytes -= i;
    return i;
  }
}