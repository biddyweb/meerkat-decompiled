package com.google.common.util.concurrent;

import com.google.common.base.Function;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

final class Futures$3
  implements Future<O>
{
  Futures$3(Future paramFuture, Function paramFunction)
  {
  }

  private O applyTransformation(I paramI)
    throws ExecutionException
  {
    try
    {
      Object localObject = this.val$function.apply(paramI);
      return localObject;
    }
    catch (Throwable localThrowable)
    {
      throw new ExecutionException(localThrowable);
    }
  }

  public boolean cancel(boolean paramBoolean)
  {
    return this.val$input.cancel(paramBoolean);
  }

  public O get()
    throws InterruptedException, ExecutionException
  {
    return applyTransformation(this.val$input.get());
  }

  public O get(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ExecutionException, TimeoutException
  {
    return applyTransformation(this.val$input.get(paramLong, paramTimeUnit));
  }

  public boolean isCancelled()
  {
    return this.val$input.isCancelled();
  }

  public boolean isDone()
  {
    return this.val$input.isDone();
  }
}