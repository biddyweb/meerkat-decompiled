package rx.internal.operators;

import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observable.Operator;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Func3;
import rx.functions.Func4;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.SerialSubscription;

class OperatorTimeoutBase<T>
  implements Observable.Operator<T, T>
{
  private final FirstTimeoutStub<T> firstTimeoutStub;
  private final Observable<? extends T> other;
  private final Scheduler scheduler;
  private final TimeoutStub<T> timeoutStub;

  OperatorTimeoutBase(FirstTimeoutStub<T> paramFirstTimeoutStub, TimeoutStub<T> paramTimeoutStub, Observable<? extends T> paramObservable, Scheduler paramScheduler)
  {
    this.firstTimeoutStub = paramFirstTimeoutStub;
    this.timeoutStub = paramTimeoutStub;
    this.other = paramObservable;
    this.scheduler = paramScheduler;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    Scheduler.Worker localWorker = this.scheduler.createWorker();
    paramSubscriber.add(localWorker);
    SerialSubscription localSerialSubscription = new SerialSubscription();
    paramSubscriber.add(localSerialSubscription);
    TimeoutSubscriber localTimeoutSubscriber = new TimeoutSubscriber(new SerializedSubscriber(paramSubscriber), this.timeoutStub, localSerialSubscription, this.other, localWorker, null);
    localSerialSubscription.set((Subscription)this.firstTimeoutStub.call(localTimeoutSubscriber, Long.valueOf(0L), localWorker));
    return localTimeoutSubscriber;
  }

  static abstract interface FirstTimeoutStub<T> extends Func3<OperatorTimeoutBase.TimeoutSubscriber<T>, Long, Scheduler.Worker, Subscription>
  {
  }

  static abstract interface TimeoutStub<T> extends Func4<OperatorTimeoutBase.TimeoutSubscriber<T>, Long, T, Scheduler.Worker, Subscription>
  {
  }

  static final class TimeoutSubscriber<T> extends Subscriber<T>
  {
    static final AtomicLongFieldUpdater<TimeoutSubscriber> ACTUAL_UPDATER = AtomicLongFieldUpdater.newUpdater(TimeoutSubscriber.class, "actual");
    static final AtomicIntegerFieldUpdater<TimeoutSubscriber> TERMINATED_UPDATER = AtomicIntegerFieldUpdater.newUpdater(TimeoutSubscriber.class, "terminated");
    volatile long actual;
    private final Object gate = new Object();
    private final Scheduler.Worker inner;
    private final Observable<? extends T> other;
    private final SerialSubscription serial;
    private final SerializedSubscriber<T> serializedSubscriber;
    volatile int terminated;
    private final OperatorTimeoutBase.TimeoutStub<T> timeoutStub;

    private TimeoutSubscriber(SerializedSubscriber<T> paramSerializedSubscriber, OperatorTimeoutBase.TimeoutStub<T> paramTimeoutStub, SerialSubscription paramSerialSubscription, Observable<? extends T> paramObservable, Scheduler.Worker paramWorker)
    {
      super();
      this.serializedSubscriber = paramSerializedSubscriber;
      this.timeoutStub = paramTimeoutStub;
      this.serial = paramSerialSubscription;
      this.other = paramObservable;
      this.inner = paramWorker;
    }

    public void onCompleted()
    {
      synchronized (this.gate)
      {
        int i = TERMINATED_UPDATER.getAndSet(this, 1);
        int j = 0;
        if (i == 0)
          j = 1;
        if (j != 0)
        {
          this.serial.unsubscribe();
          this.serializedSubscriber.onCompleted();
        }
        return;
      }
    }

    public void onError(Throwable paramThrowable)
    {
      synchronized (this.gate)
      {
        int i = TERMINATED_UPDATER.getAndSet(this, 1);
        int j = 0;
        if (i == 0)
          j = 1;
        if (j != 0)
        {
          this.serial.unsubscribe();
          this.serializedSubscriber.onError(paramThrowable);
        }
        return;
      }
    }

    public void onNext(T paramT)
    {
      synchronized (this.gate)
      {
        int i = this.terminated;
        int j = 0;
        if (i == 0)
        {
          ACTUAL_UPDATER.incrementAndGet(this);
          j = 1;
        }
        if (j != 0)
        {
          this.serializedSubscriber.onNext(paramT);
          this.serial.set((Subscription)this.timeoutStub.call(this, Long.valueOf(this.actual), paramT, this.inner));
        }
        return;
      }
    }

    public void onTimeout(long paramLong)
    {
      synchronized (this.gate)
      {
        boolean bool = paramLong < this.actual;
        int i = 0;
        if (!bool)
        {
          int j = TERMINATED_UPDATER.getAndSet(this, 1);
          i = 0;
          if (j == 0)
            i = 1;
        }
        if (i != 0)
        {
          if (this.other == null)
            this.serializedSubscriber.onError(new TimeoutException());
        }
        else
          return;
      }
      this.other.unsafeSubscribe(this.serializedSubscriber);
      this.serial.set(this.serializedSubscriber);
    }
  }
}