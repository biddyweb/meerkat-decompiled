package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable.Operator;
import rx.Scheduler;
import rx.Subscriber;

public final class OperatorThrottleFirst<T>
  implements Observable.Operator<T, T>
{
  private final Scheduler scheduler;
  private final long timeInMilliseconds;

  public OperatorThrottleFirst(long paramLong, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    this.timeInMilliseconds = paramTimeUnit.toMillis(paramLong);
    this.scheduler = paramScheduler;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      private long lastOnNext = 0L;

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
        long l = OperatorThrottleFirst.this.scheduler.now();
        if ((this.lastOnNext == 0L) || (l - this.lastOnNext >= OperatorThrottleFirst.this.timeInMilliseconds))
        {
          this.lastOnNext = l;
          paramSubscriber.onNext(paramAnonymousT);
        }
      }

      public void onStart()
      {
        request(9223372036854775807L);
      }
    };
  }
}