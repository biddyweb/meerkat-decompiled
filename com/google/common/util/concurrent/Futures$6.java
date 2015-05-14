package com.google.common.util.concurrent;

import java.util.concurrent.ExecutionException;

final class Futures$6
  implements Runnable
{
  Futures$6(ListenableFuture paramListenableFuture, FutureCallback paramFutureCallback)
  {
  }

  public void run()
  {
    try
    {
      Object localObject = Uninterruptibles.getUninterruptibly(this.val$future);
      this.val$callback.onSuccess(localObject);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      this.val$callback.onFailure(localExecutionException.getCause());
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      this.val$callback.onFailure(localRuntimeException);
      return;
    }
    catch (Error localError)
    {
      this.val$callback.onFailure(localError);
    }
  }
}