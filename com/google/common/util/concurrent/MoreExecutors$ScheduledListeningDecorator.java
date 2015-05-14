package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import java.util.concurrent.Callable;
import java.util.concurrent.Delayed;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

class MoreExecutors$ScheduledListeningDecorator extends MoreExecutors.ListeningDecorator
  implements ListeningScheduledExecutorService
{
  final ScheduledExecutorService delegate;

  MoreExecutors$ScheduledListeningDecorator(ScheduledExecutorService paramScheduledExecutorService)
  {
    super(paramScheduledExecutorService);
    this.delegate = ((ScheduledExecutorService)Preconditions.checkNotNull(paramScheduledExecutorService));
  }

  public ListenableScheduledFuture<?> schedule(Runnable paramRunnable, long paramLong, TimeUnit paramTimeUnit)
  {
    ListenableFutureTask localListenableFutureTask = ListenableFutureTask.create(paramRunnable, null);
    return new ListenableScheduledTask(localListenableFutureTask, this.delegate.schedule(localListenableFutureTask, paramLong, paramTimeUnit));
  }

  public <V> ListenableScheduledFuture<V> schedule(Callable<V> paramCallable, long paramLong, TimeUnit paramTimeUnit)
  {
    ListenableFutureTask localListenableFutureTask = ListenableFutureTask.create(paramCallable);
    return new ListenableScheduledTask(localListenableFutureTask, this.delegate.schedule(localListenableFutureTask, paramLong, paramTimeUnit));
  }

  public ListenableScheduledFuture<?> scheduleAtFixedRate(Runnable paramRunnable, long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
  {
    NeverSuccessfulListenableFutureTask localNeverSuccessfulListenableFutureTask = new NeverSuccessfulListenableFutureTask(paramRunnable);
    return new ListenableScheduledTask(localNeverSuccessfulListenableFutureTask, this.delegate.scheduleAtFixedRate(localNeverSuccessfulListenableFutureTask, paramLong1, paramLong2, paramTimeUnit));
  }

  public ListenableScheduledFuture<?> scheduleWithFixedDelay(Runnable paramRunnable, long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
  {
    NeverSuccessfulListenableFutureTask localNeverSuccessfulListenableFutureTask = new NeverSuccessfulListenableFutureTask(paramRunnable);
    return new ListenableScheduledTask(localNeverSuccessfulListenableFutureTask, this.delegate.scheduleWithFixedDelay(localNeverSuccessfulListenableFutureTask, paramLong1, paramLong2, paramTimeUnit));
  }

  private static final class ListenableScheduledTask<V> extends ForwardingListenableFuture.SimpleForwardingListenableFuture<V>
    implements ListenableScheduledFuture<V>
  {
    private final ScheduledFuture<?> scheduledDelegate;

    public ListenableScheduledTask(ListenableFuture<V> paramListenableFuture, ScheduledFuture<?> paramScheduledFuture)
    {
      super();
      this.scheduledDelegate = paramScheduledFuture;
    }

    public boolean cancel(boolean paramBoolean)
    {
      boolean bool = super.cancel(paramBoolean);
      if (bool)
        this.scheduledDelegate.cancel(paramBoolean);
      return bool;
    }

    public int compareTo(Delayed paramDelayed)
    {
      return this.scheduledDelegate.compareTo(paramDelayed);
    }

    public long getDelay(TimeUnit paramTimeUnit)
    {
      return this.scheduledDelegate.getDelay(paramTimeUnit);
    }
  }

  private static final class NeverSuccessfulListenableFutureTask extends AbstractFuture<Void>
    implements Runnable
  {
    private final Runnable delegate;

    public NeverSuccessfulListenableFutureTask(Runnable paramRunnable)
    {
      this.delegate = ((Runnable)Preconditions.checkNotNull(paramRunnable));
    }

    public void run()
    {
      try
      {
        this.delegate.run();
        return;
      }
      catch (Throwable localThrowable)
      {
        setException(localThrowable);
        throw Throwables.propagate(localThrowable);
      }
    }
  }
}