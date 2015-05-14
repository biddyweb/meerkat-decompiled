package com.google.common.cache;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
abstract interface LongAddable
{
  public abstract void add(long paramLong);

  public abstract void increment();

  public abstract long sum();
}