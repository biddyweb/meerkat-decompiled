package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable.OnSubscribe;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;

public final class OnSubscribeTimerPeriodically
  implements Observable.OnSubscribe<Long>
{
  final long initialDelay;
  final long period;
  final Scheduler scheduler;
  final TimeUnit unit;

  public OnSubscribeTimerPeriodically(long paramLong1, long paramLong2, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    this.initialDelay = paramLong1;
    this.period = paramLong2;
    this.unit = paramTimeUnit;
    this.scheduler = paramScheduler;
  }

  public void call(final Subscriber<? super Long> paramSubscriber)
  {
    final Scheduler.Worker localWorker = this.scheduler.createWorker();
    paramSubscriber.add(localWorker);
    localWorker.schedulePeriodically(new Action0()
    {
      long counter;

      public void call()
      {
        try
        {
          Subscriber localSubscriber = paramSubscriber;
          long l = this.counter;
          this.counter = (1L + l);
          localSubscriber.onNext(Long.valueOf(l));
          return;
        }
        catch (Throwable localThrowable)
        {
          try
          {
            paramSubscriber.onError(localThrowable);
            return;
          }
          finally
          {
            localWorker.unsubscribe();
          }
        }
      }
    }
    , this.initialDelay, this.period, this.unit);
  }
}