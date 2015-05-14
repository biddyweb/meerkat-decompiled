package com.google.android.exoplayer.upstream;

import java.io.IOException;

public abstract interface DataSink
{
  public abstract void close()
    throws IOException;

  public abstract DataSink open(DataSpec paramDataSpec)
    throws IOException;

  public abstract void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException;
}