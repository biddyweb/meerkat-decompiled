package com.google.android.exoplayer.upstream;

import java.io.IOException;

public final class UnexpectedLengthException extends IOException
{
  public final long actualLength;
  public final long expectedLength;

  public UnexpectedLengthException(long paramLong1, long paramLong2)
  {
    super("Expected: " + paramLong1 + ", got: " + paramLong2);
    this.expectedLength = paramLong1;
    this.actualLength = paramLong2;
  }
}