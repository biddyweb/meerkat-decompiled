package rx.schedulers;

import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.BooleanSubscription;
import rx.subscriptions.Subscriptions;

public final class TrampolineScheduler extends Scheduler
{
  private static final TrampolineScheduler INSTANCE = new TrampolineScheduler();

  private static int compare(int paramInt1, int paramInt2)
  {
    if (paramInt1 < paramInt2)
      return -1;
    if (paramInt1 == paramInt2)
      return 0;
    return 1;
  }

  static TrampolineScheduler instance()
  {
    return INSTANCE;
  }

  public Scheduler.Worker createWorker()
  {
    return new InnerCurrentThreadScheduler(null);
  }

  private static class InnerCurrentThreadScheduler extends Scheduler.Worker
    implements Subscription
  {
    private static final AtomicIntegerFieldUpdater<InnerCurrentThreadScheduler> COUNTER_UPDATER = AtomicIntegerFieldUpdater.newUpdater(InnerCurrentThreadScheduler.class, "counter");
    volatile int counter;
    private final BooleanSubscription innerSubscription = new BooleanSubscription();
    private final PriorityBlockingQueue<TrampolineScheduler.TimedAction> queue = new PriorityBlockingQueue();
    private final AtomicInteger wip = new AtomicInteger();

    private Subscription enqueue(Action0 paramAction0, long paramLong)
    {
      if (this.innerSubscription.isUnsubscribed())
        return Subscriptions.unsubscribed();
      final TrampolineScheduler.TimedAction localTimedAction1 = new TrampolineScheduler.TimedAction(paramAction0, Long.valueOf(paramLong), COUNTER_UPDATER.incrementAndGet(this), null);
      this.queue.add(localTimedAction1);
      if (this.wip.getAndIncrement() == 0)
      {
        do
        {
          TrampolineScheduler.TimedAction localTimedAction2 = (TrampolineScheduler.TimedAction)this.queue.poll();
          if (localTimedAction2 != null)
            localTimedAction2.action.call();
        }
        while (this.wip.decrementAndGet() > 0);
        return Subscriptions.unsubscribed();
      }
      return Subscriptions.create(new Action0()
      {
        public void call()
        {
          TrampolineScheduler.InnerCurrentThreadScheduler.this.queue.remove(localTimedAction1);
        }
      });
    }

    public boolean isUnsubscribed()
    {
      return this.innerSubscription.isUnsubscribed();
    }

    public Subscription schedule(Action0 paramAction0)
    {
      return enqueue(paramAction0, now());
    }

    public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      long l = now() + paramTimeUnit.toMillis(paramLong);
      return enqueue(new SleepingAction(paramAction0, this, l), l);
    }

    public void unsubscribe()
    {
      this.innerSubscription.unsubscribe();
    }
  }

  private static final class TimedAction
    implements Comparable<TimedAction>
  {
    final Action0 action;
    final int count;
    final Long execTime;

    private TimedAction(Action0 paramAction0, Long paramLong, int paramInt)
    {
      this.action = paramAction0;
      this.execTime = paramLong;
      this.count = paramInt;
    }

    public int compareTo(TimedAction paramTimedAction)
    {
      int i = this.execTime.compareTo(paramTimedAction.execTime);
      if (i == 0)
        i = TrampolineScheduler.compare(this.count, paramTimedAction.count);
      return i;
    }
  }
}