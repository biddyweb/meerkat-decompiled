package com.digits.sdk.android.concurrent;

public class DigitsRetryPolicy
  implements RetryPolicy
{
  private final int maxRetries;

  public DigitsRetryPolicy()
  {
    this(0);
  }

  public DigitsRetryPolicy(int paramInt)
  {
    this.maxRetries = paramInt;
  }

  public boolean shouldRetry(int paramInt, Throwable paramThrowable)
  {
    return paramInt < this.maxRetries;
  }
}