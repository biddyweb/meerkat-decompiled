package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

@Beta
public final class HashingInputStream extends FilterInputStream
{
  private final Hasher hasher;

  public HashingInputStream(HashFunction paramHashFunction, InputStream paramInputStream)
  {
    super((InputStream)Preconditions.checkNotNull(paramInputStream));
    this.hasher = ((Hasher)Preconditions.checkNotNull(paramHashFunction.newHasher()));
  }

  public HashCode hash()
  {
    return this.hasher.hash();
  }

  public void mark(int paramInt)
  {
  }

  public boolean markSupported()
  {
    return false;
  }

  public int read()
    throws IOException
  {
    int i = this.in.read();
    if (i != -1)
      this.hasher.putByte((byte)i);
    return i;
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = this.in.read(paramArrayOfByte, paramInt1, paramInt2);
    if (i != -1)
      this.hasher.putBytes(paramArrayOfByte, paramInt1, i);
    return i;
  }

  public void reset()
    throws IOException
  {
    throw new IOException("reset not supported");
  }
}