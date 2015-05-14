package com.google.android.exoplayer.upstream;

import java.nio.ByteBuffer;

public abstract interface NonBlockingInputStream
{
  public abstract void close();

  public abstract long getAvailableByteCount();

  public abstract boolean isEndOfStream();

  public abstract int read(ByteBuffer paramByteBuffer, int paramInt);

  public abstract int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  public abstract int skip(int paramInt);
}