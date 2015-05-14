package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;

final class Futures$WrappedCombiner<T>
  implements Callable<T>
{
  final Callable<T> delegate;
  Futures.CombinerFuture<T> outputFuture;

  Futures$WrappedCombiner(Callable<T> paramCallable)
  {
    this.delegate = ((Callable)Preconditions.checkNotNull(paramCallable));
  }

  public T call()
    throws Exception
  {
    try
    {
      Object localObject = this.delegate.call();
      return localObject;
    }
    catch (ExecutionException localExecutionException)
    {
      this.outputFuture.setException(localExecutionException.getCause());
      return null;
    }
    catch (CancellationException localCancellationException)
    {
      while (true)
        this.outputFuture.cancel(false);
    }
  }
}