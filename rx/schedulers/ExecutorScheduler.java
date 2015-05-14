package rx.schedulers;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.MultipleAssignmentSubscription;
import rx.subscriptions.Subscriptions;

final class ExecutorScheduler extends Scheduler
{
  final Executor executor;

  public ExecutorScheduler(Executor paramExecutor)
  {
    this.executor = paramExecutor;
  }

  public Scheduler.Worker createWorker()
  {
    return new ExecutorSchedulerWorker(this.executor);
  }

  static final class ExecutorAction
    implements Runnable, Subscription
  {
    static final AtomicIntegerFieldUpdater<ExecutorAction> UNSUBSCRIBED_UPDATER = AtomicIntegerFieldUpdater.newUpdater(ExecutorAction.class, "unsubscribed");
    final Action0 actual;
    final CompositeSubscription parent;
    volatile int unsubscribed;

    public ExecutorAction(Action0 paramAction0, CompositeSubscription paramCompositeSubscription)
    {
      this.actual = paramAction0;
      this.parent = paramCompositeSubscription;
    }

    public boolean isUnsubscribed()
    {
      return this.unsubscribed != 0;
    }

    public void run()
    {
      if (isUnsubscribed())
        return;
      try
      {
        this.actual.call();
        return;
      }
      catch (Throwable localThrowable)
      {
        RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable);
        Thread localThread = Thread.currentThread();
        localThread.getUncaughtExceptionHandler().uncaughtException(localThread, localThrowable);
        return;
      }
      finally
      {
        unsubscribe();
      }
    }

    public void unsubscribe()
    {
      if (UNSUBSCRIBED_UPDATER.compareAndSet(this, 0, 1))
        this.parent.remove(this);
    }
  }

  static final class ExecutorSchedulerWorker extends Scheduler.Worker
    implements Runnable
  {
    final Executor executor;
    final ConcurrentLinkedQueue<ExecutorScheduler.ExecutorAction> queue;
    final CompositeSubscription tasks;
    final AtomicInteger wip;

    public ExecutorSchedulerWorker(Executor paramExecutor)
    {
      this.executor = paramExecutor;
      this.queue = new ConcurrentLinkedQueue();
      this.wip = new AtomicInteger();
      this.tasks = new CompositeSubscription();
    }

    public boolean isUnsubscribed()
    {
      return this.tasks.isUnsubscribed();
    }

    public void run()
    {
      do
        ((ExecutorScheduler.ExecutorAction)this.queue.poll()).run();
      while (this.wip.decrementAndGet() > 0);
    }

    public Subscription schedule(Action0 paramAction0)
    {
      Object localObject;
      if (isUnsubscribed())
        localObject = Subscriptions.unsubscribed();
      do
      {
        return localObject;
        localObject = new ExecutorScheduler.ExecutorAction(paramAction0, this.tasks);
        this.tasks.add((Subscription)localObject);
        this.queue.offer(localObject);
      }
      while (this.wip.getAndIncrement() != 0);
      try
      {
        this.executor.execute(this);
        return localObject;
      }
      catch (RejectedExecutionException localRejectedExecutionException)
      {
        this.tasks.remove((Subscription)localObject);
        this.wip.decrementAndGet();
        RxJavaPlugins.getInstance().getErrorHandler().handleError(localRejectedExecutionException);
        throw localRejectedExecutionException;
      }
    }

    public Subscription schedule(final Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      if (paramLong <= 0L)
        return schedule(paramAction0);
      if (isUnsubscribed())
        return Subscriptions.unsubscribed();
      if ((this.executor instanceof ScheduledExecutorService));
      for (ScheduledExecutorService localScheduledExecutorService = (ScheduledExecutorService)this.executor; ; localScheduledExecutorService = GenericScheduledExecutorService.getInstance())
      {
        final MultipleAssignmentSubscription localMultipleAssignmentSubscription = new MultipleAssignmentSubscription();
        try
        {
          localMultipleAssignmentSubscription.set(Subscriptions.from(localScheduledExecutorService.schedule(new Runnable()
          {
            public void run()
            {
              if (localMultipleAssignmentSubscription.isUnsubscribed())
                return;
              localMultipleAssignmentSubscription.set(ExecutorScheduler.ExecutorSchedulerWorker.this.schedule(paramAction0));
            }
          }
          , paramLong, paramTimeUnit)));
          return localMultipleAssignmentSubscription;
        }
        catch (RejectedExecutionException localRejectedExecutionException)
        {
          RxJavaPlugins.getInstance().getErrorHandler().handleError(localRejectedExecutionException);
          throw localRejectedExecutionException;
        }
      }
    }

    public void unsubscribe()
    {
      this.tasks.unsubscribe();
    }
  }
}