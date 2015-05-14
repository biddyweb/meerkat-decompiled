package com.digits.sdk.android.concurrent;

public abstract interface RetryPolicy
{
  public abstract boolean shouldRetry(int paramInt, Throwable paramThrowable);
}