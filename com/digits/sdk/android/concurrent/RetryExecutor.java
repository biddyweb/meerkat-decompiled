package com.digits.sdk.android.concurrent;

import java.util.concurrent.DelayQueue;
import java.util.concurrent.Delayed;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class RetryExecutor extends ThreadPoolExecutor
{
  private final Backoff backoff;
  private final DelayQueue delayQueue;
  private final RetryPolicy retryPolicy;

  public RetryExecutor(int paramInt, RetryPolicy paramRetryPolicy)
  {
    this(paramInt, paramRetryPolicy, new ExponentialBackoff(1000L));
  }

  public RetryExecutor(int paramInt, RetryPolicy paramRetryPolicy, Backoff paramBackoff)
  {
    this(paramInt, paramRetryPolicy, paramBackoff, new DelayQueue());
  }

  RetryExecutor(int paramInt, RetryPolicy paramRetryPolicy, Backoff paramBackoff, DelayQueue paramDelayQueue)
  {
    super(paramInt, paramInt * 2, 0L, TimeUnit.NANOSECONDS, paramDelayQueue);
    if (paramRetryPolicy == null)
      throw new IllegalArgumentException("retry policy cannot be null");
    if (paramBackoff == null)
      throw new IllegalArgumentException("backoff cannot be null");
    this.retryPolicy = paramRetryPolicy;
    this.backoff = paramBackoff;
    this.delayQueue = paramDelayQueue;
  }

  public void execute(Runnable paramRunnable)
  {
    if (paramRunnable == null)
      throw new NullPointerException("runnable cannot be null");
    super.execute(new RetryRunnable(paramRunnable));
  }

  public Backoff getBackoff()
  {
    return this.backoff;
  }

  public RetryPolicy getRetryPolicy()
  {
    return this.retryPolicy;
  }

  class RetryRunnable
    implements Runnable, Delayed
  {
    private final Runnable command;
    private final long delay;
    private final int retries;

    public RetryRunnable(Runnable arg2)
    {
      this(localRunnable, 0L);
    }

    public RetryRunnable(Runnable paramLong, long arg3)
    {
      this(paramLong, localObject, 0);
    }

    public RetryRunnable(Runnable paramLong, long arg3, int arg5)
    {
      this.command = paramLong;
      this.delay = (??? + System.currentTimeMillis());
      int i;
      this.retries = i;
    }

    public int compareTo(Delayed paramDelayed)
    {
      long l = paramDelayed.getDelay(TimeUnit.MILLISECONDS);
      if (this.delay < l)
        return -1;
      if (this.delay > l)
        return 1;
      return 0;
    }

    public long getDelay(TimeUnit paramTimeUnit)
    {
      return paramTimeUnit.convert(this.delay - System.currentTimeMillis(), TimeUnit.MILLISECONDS);
    }

    public int getRetries()
    {
      return this.retries;
    }

    public void run()
    {
      try
      {
        this.command.run();
        return;
      }
      catch (Throwable localThrowable)
      {
        while (!RetryExecutor.this.retryPolicy.shouldRetry(this.retries, localThrowable));
        long l = RetryExecutor.this.backoff.getDelayMillis(this.retries);
        RetryExecutor.this.delayQueue.offer(new RetryRunnable(RetryExecutor.this, this.command, l, 1 + this.retries));
      }
    }
  }
}