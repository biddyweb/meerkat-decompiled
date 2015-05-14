package com.google.common.util.concurrent;

import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;

final class Futures$1
  implements Runnable
{
  Futures$1(Executor paramExecutor, Runnable paramRunnable, AbstractFuture paramAbstractFuture)
  {
  }

  public void run()
  {
    final AtomicBoolean localAtomicBoolean = new AtomicBoolean(true);
    try
    {
      this.val$delegateExecutor.execute(new Runnable()
      {
        public void run()
        {
          localAtomicBoolean.set(false);
          Futures.1.this.val$delegateTask.run();
        }
      });
      return;
    }
    catch (RejectedExecutionException localRejectedExecutionException)
    {
      while (!localAtomicBoolean.get());
      this.val$outputFuture.setException(localRejectedExecutionException);
    }
  }
}