package com.digits.sdk.android.concurrent;

abstract interface Backoff
{
  public abstract long getDelayMillis(int paramInt);
}