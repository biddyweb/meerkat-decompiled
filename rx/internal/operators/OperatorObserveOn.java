package rx.internal.operators;

import java.util.Queue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable.Operator;
import rx.Producer;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.MissingBackpressureException;
import rx.functions.Action0;
import rx.internal.util.RxRingBuffer;
import rx.internal.util.SynchronizedQueue;
import rx.internal.util.unsafe.SpscArrayQueue;
import rx.internal.util.unsafe.UnsafeAccess;
import rx.schedulers.ImmediateScheduler;
import rx.schedulers.TrampolineScheduler;

public final class OperatorObserveOn<T>
  implements Observable.Operator<T, T>
{
  private final Scheduler scheduler;

  public OperatorObserveOn(Scheduler paramScheduler)
  {
    this.scheduler = paramScheduler;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    if ((this.scheduler instanceof ImmediateScheduler));
    while ((this.scheduler instanceof TrampolineScheduler))
      return paramSubscriber;
    return new ObserveOnSubscriber(this.scheduler, paramSubscriber);
  }

  private static final class ObserveOnSubscriber<T> extends Subscriber<T>
  {
    static final AtomicLongFieldUpdater<ObserveOnSubscriber> COUNTER_UPDATER = AtomicLongFieldUpdater.newUpdater(ObserveOnSubscriber.class, "counter");
    static final AtomicLongFieldUpdater<ObserveOnSubscriber> REQUESTED = AtomicLongFieldUpdater.newUpdater(ObserveOnSubscriber.class, "requested");
    final Action0 action = new Action0()
    {
      public void call()
      {
        OperatorObserveOn.ObserveOnSubscriber.this.pollQueue();
      }
    };
    final Subscriber<? super T> child;
    volatile boolean completed = false;
    volatile long counter;
    volatile Throwable error;
    volatile boolean failure = false;
    final NotificationLite<T> on = NotificationLite.instance();
    final Queue<Object> queue;
    final Scheduler.Worker recursiveScheduler;
    volatile long requested = 0L;
    final OperatorObserveOn.ScheduledUnsubscribe scheduledUnsubscribe;

    public ObserveOnSubscriber(Scheduler paramScheduler, Subscriber<? super T> paramSubscriber)
    {
      this.child = paramSubscriber;
      this.recursiveScheduler = paramScheduler.createWorker();
      if (UnsafeAccess.isUnsafeAvailable());
      for (this.queue = new SpscArrayQueue(RxRingBuffer.SIZE); ; this.queue = new SynchronizedQueue(RxRingBuffer.SIZE))
      {
        this.scheduledUnsubscribe = new OperatorObserveOn.ScheduledUnsubscribe(this.recursiveScheduler);
        paramSubscriber.add(this.scheduledUnsubscribe);
        paramSubscriber.setProducer(new Producer()
        {
          public void request(long paramAnonymousLong)
          {
            OperatorObserveOn.ObserveOnSubscriber.REQUESTED.getAndAdd(OperatorObserveOn.ObserveOnSubscriber.this, paramAnonymousLong);
            OperatorObserveOn.ObserveOnSubscriber.this.schedule();
          }
        });
        paramSubscriber.add(this.recursiveScheduler);
        paramSubscriber.add(this);
        return;
      }
    }

    public void onCompleted()
    {
      if ((isUnsubscribed()) || (this.completed));
      while (this.error != null)
        return;
      this.completed = true;
      schedule();
    }

    public void onError(Throwable paramThrowable)
    {
      if ((isUnsubscribed()) || (this.completed));
      while (this.error != null)
        return;
      this.error = paramThrowable;
      unsubscribe();
      this.completed = true;
      this.failure = true;
      schedule();
    }

    public void onNext(T paramT)
    {
      if ((isUnsubscribed()) || (this.completed))
        return;
      if (!this.queue.offer(this.on.next(paramT)))
      {
        onError(new MissingBackpressureException());
        return;
      }
      schedule();
    }

    public void onStart()
    {
      request(RxRingBuffer.SIZE);
    }

    void pollQueue()
    {
      int i = 0;
      label35: label165: label187: label196: 
      while (true)
      {
        this.counter = 1L;
        Object localObject;
        if (!this.scheduledUnsubscribe.isUnsubscribed())
        {
          if (this.failure)
          {
            this.child.onError(this.error);
            return;
          }
          if ((this.requested == 0L) && (this.completed) && (this.queue.isEmpty()))
          {
            this.child.onCompleted();
            return;
          }
          if (REQUESTED.getAndDecrement(this) == 0L)
            break label187;
          localObject = this.queue.poll();
          if (localObject != null)
            break label165;
          if (this.completed)
          {
            if (this.failure)
            {
              this.child.onError(this.error);
              return;
            }
            this.child.onCompleted();
            return;
          }
          REQUESTED.incrementAndGet(this);
        }
        while (true)
        {
          if (COUNTER_UPDATER.decrementAndGet(this) > 0L)
            break label196;
          if (i <= 0)
            break label35;
          request(i);
          return;
          if (this.on.accept(this.child, localObject))
            break;
          i++;
          break;
          REQUESTED.incrementAndGet(this);
        }
      }
    }

    protected void schedule()
    {
      if (COUNTER_UPDATER.getAndIncrement(this) == 0L)
        this.recursiveScheduler.schedule(this.action);
    }
  }

  static final class ScheduledUnsubscribe
    implements Subscription
  {
    static final AtomicIntegerFieldUpdater<ScheduledUnsubscribe> ONCE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(ScheduledUnsubscribe.class, "once");
    volatile int once;
    volatile boolean unsubscribed = false;
    final Scheduler.Worker worker;

    public ScheduledUnsubscribe(Scheduler.Worker paramWorker)
    {
      this.worker = paramWorker;
    }

    public boolean isUnsubscribed()
    {
      return this.unsubscribed;
    }

    public void unsubscribe()
    {
      if (ONCE_UPDATER.getAndSet(this, 1) == 0)
        this.worker.schedule(new Action0()
        {
          public void call()
          {
            OperatorObserveOn.ScheduledUnsubscribe.this.worker.unsubscribe();
            OperatorObserveOn.ScheduledUnsubscribe.this.unsubscribed = true;
          }
        });
    }
  }
}