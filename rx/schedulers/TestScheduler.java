package rx.schedulers;

import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.BooleanSubscription;
import rx.subscriptions.Subscriptions;

public class TestScheduler extends Scheduler
{
  private static long counter = 0L;
  private final Queue<TimedAction> queue = new PriorityQueue(11, new CompareActionsByTime(null));
  private long time;

  private void triggerActions(long paramLong)
  {
    TimedAction localTimedAction;
    if (!this.queue.isEmpty())
    {
      localTimedAction = (TimedAction)this.queue.peek();
      if (localTimedAction.time <= paramLong);
    }
    else
    {
      this.time = paramLong;
      return;
    }
    if (localTimedAction.time == 0L);
    for (long l = this.time; ; l = localTimedAction.time)
    {
      this.time = l;
      this.queue.remove();
      if (localTimedAction.scheduler.isUnsubscribed())
        break;
      localTimedAction.action.call();
      break;
    }
  }

  public void advanceTimeBy(long paramLong, TimeUnit paramTimeUnit)
  {
    advanceTimeTo(this.time + paramTimeUnit.toNanos(paramLong), TimeUnit.NANOSECONDS);
  }

  public void advanceTimeTo(long paramLong, TimeUnit paramTimeUnit)
  {
    triggerActions(paramTimeUnit.toNanos(paramLong));
  }

  public Scheduler.Worker createWorker()
  {
    return new InnerTestScheduler(null);
  }

  public long now()
  {
    return TimeUnit.NANOSECONDS.toMillis(this.time);
  }

  public void triggerActions()
  {
    triggerActions(this.time);
  }

  private static class CompareActionsByTime
    implements Comparator<TestScheduler.TimedAction>
  {
    public int compare(TestScheduler.TimedAction paramTimedAction1, TestScheduler.TimedAction paramTimedAction2)
    {
      if (TestScheduler.TimedAction.access$200(paramTimedAction1) == TestScheduler.TimedAction.access$200(paramTimedAction2))
        return Long.valueOf(TestScheduler.TimedAction.access$300(paramTimedAction1)).compareTo(Long.valueOf(TestScheduler.TimedAction.access$300(paramTimedAction2)));
      return Long.valueOf(TestScheduler.TimedAction.access$200(paramTimedAction1)).compareTo(Long.valueOf(TestScheduler.TimedAction.access$200(paramTimedAction2)));
    }
  }

  private final class InnerTestScheduler extends Scheduler.Worker
  {
    private final BooleanSubscription s = new BooleanSubscription();

    private InnerTestScheduler()
    {
    }

    public boolean isUnsubscribed()
    {
      return this.s.isUnsubscribed();
    }

    public long now()
    {
      return TestScheduler.this.now();
    }

    public Subscription schedule(Action0 paramAction0)
    {
      final TestScheduler.TimedAction localTimedAction = new TestScheduler.TimedAction(this, 0L, paramAction0, null);
      TestScheduler.this.queue.add(localTimedAction);
      return Subscriptions.create(new Action0()
      {
        public void call()
        {
          TestScheduler.this.queue.remove(localTimedAction);
        }
      });
    }

    public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      final TestScheduler.TimedAction localTimedAction = new TestScheduler.TimedAction(this, TestScheduler.this.time + paramTimeUnit.toNanos(paramLong), paramAction0, null);
      TestScheduler.this.queue.add(localTimedAction);
      return Subscriptions.create(new Action0()
      {
        public void call()
        {
          TestScheduler.this.queue.remove(localTimedAction);
        }
      });
    }

    public void unsubscribe()
    {
      this.s.unsubscribe();
    }
  }

  private static final class TimedAction
  {
    private final Action0 action;
    private final long count = TestScheduler.access$108();
    private final Scheduler.Worker scheduler;
    private final long time;

    private TimedAction(Scheduler.Worker paramWorker, long paramLong, Action0 paramAction0)
    {
      this.time = paramLong;
      this.action = paramAction0;
      this.scheduler = paramWorker;
    }

    public String toString()
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Long.valueOf(this.time);
      arrayOfObject[1] = this.action.toString();
      return String.format("TimedAction(time = %d, action = %s)", arrayOfObject);
    }
  }
}