package rx.internal.operators;

import rx.Observable.Operator;
import rx.Scheduler;
import rx.Subscriber;
import rx.schedulers.TimeInterval;

public final class OperatorTimeInterval<T>
  implements Observable.Operator<TimeInterval<T>, T>
{
  private final Scheduler scheduler;

  public OperatorTimeInterval(Scheduler paramScheduler)
  {
    this.scheduler = paramScheduler;
  }

  public Subscriber<? super T> call(final Subscriber<? super TimeInterval<T>> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      private long lastTimestamp = OperatorTimeInterval.this.scheduler.now();

      public void onCompleted()
      {
        paramSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        long l = OperatorTimeInterval.this.scheduler.now();
        paramSubscriber.onNext(new TimeInterval(l - this.lastTimestamp, paramAnonymousT));
        this.lastTimestamp = l;
      }
    };
  }
}