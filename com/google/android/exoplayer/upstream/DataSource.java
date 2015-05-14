package com.google.android.exoplayer.upstream;

import java.io.IOException;

public abstract interface DataSource
{
  public abstract void close()
    throws IOException;

  public abstract long open(DataSpec paramDataSpec)
    throws IOException;

  public abstract int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException;
}