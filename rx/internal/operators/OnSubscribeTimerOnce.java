package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable.OnSubscribe;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;

public final class OnSubscribeTimerOnce
  implements Observable.OnSubscribe<Long>
{
  final Scheduler scheduler;
  final long time;
  final TimeUnit unit;

  public OnSubscribeTimerOnce(long paramLong, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    this.time = paramLong;
    this.unit = paramTimeUnit;
    this.scheduler = paramScheduler;
  }

  public void call(final Subscriber<? super Long> paramSubscriber)
  {
    Scheduler.Worker localWorker = this.scheduler.createWorker();
    paramSubscriber.add(localWorker);
    localWorker.schedule(new Action0()
    {
      public void call()
      {
        try
        {
          paramSubscriber.onNext(Long.valueOf(0L));
          paramSubscriber.onCompleted();
          return;
        }
        catch (Throwable localThrowable)
        {
          paramSubscriber.onError(localThrowable);
        }
      }
    }
    , this.time, this.unit);
  }
}