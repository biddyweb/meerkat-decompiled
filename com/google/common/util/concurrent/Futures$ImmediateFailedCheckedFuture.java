package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

class Futures$ImmediateFailedCheckedFuture<V, X extends Exception> extends Futures.ImmediateFuture<V>
  implements CheckedFuture<V, X>
{
  private final X thrown;

  Futures$ImmediateFailedCheckedFuture(X paramX)
  {
    super(null);
    this.thrown = paramX;
  }

  public V checkedGet()
    throws Exception
  {
    throw this.thrown;
  }

  public V checkedGet(long paramLong, TimeUnit paramTimeUnit)
    throws Exception
  {
    Preconditions.checkNotNull(paramTimeUnit);
    throw this.thrown;
  }

  public V get()
    throws ExecutionException
  {
    throw new ExecutionException(this.thrown);
  }
}