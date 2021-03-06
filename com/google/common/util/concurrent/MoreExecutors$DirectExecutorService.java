package com.google.common.util.concurrent;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class MoreExecutors$DirectExecutorService extends AbstractListeningExecutorService
{
  private final Lock lock = new ReentrantLock();
  private int runningTasks = 0;
  private boolean shutdown = false;
  private final Condition termination = this.lock.newCondition();

  private void endTask()
  {
    this.lock.lock();
    try
    {
      this.runningTasks = (-1 + this.runningTasks);
      if (isTerminated())
        this.termination.signalAll();
      return;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  private void startTask()
  {
    this.lock.lock();
    try
    {
      if (isShutdown())
        throw new RejectedExecutionException("Executor already shutdown");
    }
    finally
    {
      this.lock.unlock();
    }
    this.runningTasks = (1 + this.runningTasks);
    this.lock.unlock();
  }

  public boolean awaitTermination(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    long l1 = paramTimeUnit.toNanos(paramLong);
    this.lock.lock();
    try
    {
      while (true)
      {
        boolean bool = isTerminated();
        if (bool)
          return true;
        if (l1 <= 0L)
          return false;
        long l2 = this.termination.awaitNanos(l1);
        l1 = l2;
      }
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public void execute(Runnable paramRunnable)
  {
    startTask();
    try
    {
      paramRunnable.run();
      return;
    }
    finally
    {
      endTask();
    }
  }

  public boolean isShutdown()
  {
    this.lock.lock();
    try
    {
      boolean bool = this.shutdown;
      return bool;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public boolean isTerminated()
  {
    this.lock.lock();
    try
    {
      if (this.shutdown)
      {
        int i = this.runningTasks;
        if (i == 0)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public void shutdown()
  {
    this.lock.lock();
    try
    {
      this.shutdown = true;
      return;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public List<Runnable> shutdownNow()
  {
    shutdown();
    return Collections.emptyList();
  }
}