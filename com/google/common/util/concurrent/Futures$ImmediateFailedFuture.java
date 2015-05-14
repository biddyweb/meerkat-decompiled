package com.google.common.util.concurrent;

import java.util.concurrent.ExecutionException;

class Futures$ImmediateFailedFuture<V> extends Futures.ImmediateFuture<V>
{
  private final Throwable thrown;

  Futures$ImmediateFailedFuture(Throwable paramThrowable)
  {
    super(null);
    this.thrown = paramThrowable;
  }

  public V get()
    throws ExecutionException
  {
    throw new ExecutionException(this.thrown);
  }
}