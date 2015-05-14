package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import java.util.concurrent.Callable;
import java.util.concurrent.ScheduledExecutorService;

final class MoreExecutors$4 extends WrappingScheduledExecutorService
{
  MoreExecutors$4(ScheduledExecutorService paramScheduledExecutorService, Supplier paramSupplier)
  {
    super(paramScheduledExecutorService);
  }

  protected Runnable wrapTask(Runnable paramRunnable)
  {
    return Callables.threadRenaming(paramRunnable, this.val$nameSupplier);
  }

  protected <T> Callable<T> wrapTask(Callable<T> paramCallable)
  {
    return Callables.threadRenaming(paramCallable, this.val$nameSupplier);
  }
}