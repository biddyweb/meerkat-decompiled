package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

class MoreExecutors$ListeningDecorator extends AbstractListeningExecutorService
{
  private final ExecutorService delegate;

  MoreExecutors$ListeningDecorator(ExecutorService paramExecutorService)
  {
    this.delegate = ((ExecutorService)Preconditions.checkNotNull(paramExecutorService));
  }

  public boolean awaitTermination(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return this.delegate.awaitTermination(paramLong, paramTimeUnit);
  }

  public void execute(Runnable paramRunnable)
  {
    this.delegate.execute(paramRunnable);
  }

  public boolean isShutdown()
  {
    return this.delegate.isShutdown();
  }

  public boolean isTerminated()
  {
    return this.delegate.isTerminated();
  }

  public void shutdown()
  {
    this.delegate.shutdown();
  }

  public List<Runnable> shutdownNow()
  {
    return this.delegate.shutdownNow();
  }
}