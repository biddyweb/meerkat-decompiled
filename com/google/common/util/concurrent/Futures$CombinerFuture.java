package com.google.common.util.concurrent;

import com.google.common.collect.ImmutableList;
import java.util.Iterator;
import java.util.concurrent.Callable;

final class Futures$CombinerFuture<V> extends ListenableFutureTask<V>
{
  ImmutableList<ListenableFuture<?>> futures;

  Futures$CombinerFuture(Callable<V> paramCallable, ImmutableList<ListenableFuture<?>> paramImmutableList)
  {
    super(paramCallable);
    this.futures = paramImmutableList;
  }

  public boolean cancel(boolean paramBoolean)
  {
    ImmutableList localImmutableList = this.futures;
    if (super.cancel(paramBoolean))
    {
      Iterator localIterator = localImmutableList.iterator();
      while (localIterator.hasNext())
        ((ListenableFuture)localIterator.next()).cancel(paramBoolean);
      return true;
    }
    return false;
  }

  protected void done()
  {
    super.done();
    this.futures = null;
  }

  protected void setException(Throwable paramThrowable)
  {
    super.setException(paramThrowable);
  }
}