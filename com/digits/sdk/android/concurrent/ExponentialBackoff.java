package com.digits.sdk.android.concurrent;

public class ExponentialBackoff
  implements Backoff
{
  private final long constant;

  ExponentialBackoff(long paramLong)
  {
    this.constant = paramLong;
  }

  public long getDelayMillis(int paramInt)
  {
    return ()(this.constant * Math.pow(2.0D, paramInt));
  }
}