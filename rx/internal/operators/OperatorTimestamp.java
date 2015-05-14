package rx.internal.operators;

import rx.Observable.Operator;
import rx.Scheduler;
import rx.Subscriber;
import rx.schedulers.Timestamped;

public final class OperatorTimestamp<T>
  implements Observable.Operator<Timestamped<T>, T>
{
  private final Scheduler scheduler;

  public OperatorTimestamp(Scheduler paramScheduler)
  {
    this.scheduler = paramScheduler;
  }

  public Subscriber<? super T> call(final Subscriber<? super Timestamped<T>> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
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
        paramSubscriber.onNext(new Timestamped(OperatorTimestamp.this.scheduler.now(), paramAnonymousT));
      }
    };
  }
}