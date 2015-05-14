package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@VisibleForTesting
class MoreExecutors$Application
{
  final void addDelayedShutdownHook(final ExecutorService paramExecutorService, final long paramLong, TimeUnit paramTimeUnit)
  {
    Preconditions.checkNotNull(paramExecutorService);
    Preconditions.checkNotNull(paramTimeUnit);
    String str = String.valueOf(String.valueOf(paramExecutorService));
    addShutdownHook(MoreExecutors.newThread(24 + str.length() + "DelayedShutdownHook-for-" + str, new Runnable()
    {
      public void run()
      {
        try
        {
          paramExecutorService.shutdown();
          paramExecutorService.awaitTermination(paramLong, this.val$timeUnit);
          return;
        }
        catch (InterruptedException localInterruptedException)
        {
        }
      }
    }));
  }

  @VisibleForTesting
  void addShutdownHook(Thread paramThread)
  {
    Runtime.getRuntime().addShutdownHook(paramThread);
  }

  final ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor)
  {
    return getExitingExecutorService(paramThreadPoolExecutor, 120L, TimeUnit.SECONDS);
  }

  final ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    MoreExecutors.access$000(paramThreadPoolExecutor);
    ExecutorService localExecutorService = Executors.unconfigurableExecutorService(paramThreadPoolExecutor);
    addDelayedShutdownHook(localExecutorService, paramLong, paramTimeUnit);
    return localExecutorService;
  }

  final ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor)
  {
    return getExitingScheduledExecutorService(paramScheduledThreadPoolExecutor, 120L, TimeUnit.SECONDS);
  }

  final ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    MoreExecutors.access$000(paramScheduledThreadPoolExecutor);
    ScheduledExecutorService localScheduledExecutorService = Executors.unconfigurableScheduledExecutorService(paramScheduledThreadPoolExecutor);
    addDelayedShutdownHook(localScheduledExecutorService, paramLong, paramTimeUnit);
    return localScheduledExecutorService;
  }
}