package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;

public final class OnSubscribeDelaySubscription<T>
  implements Observable.OnSubscribe<T>
{
  final Scheduler scheduler;
  final Observable<? extends T> source;
  final long time;
  final TimeUnit unit;

  public OnSubscribeDelaySubscription(Observable<? extends T> paramObservable, long paramLong, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    this.source = paramObservable;
    this.time = paramLong;
    this.unit = paramTimeUnit;
    this.scheduler = paramScheduler;
  }

  public void call(final Subscriber<? super T> paramSubscriber)
  {
    Scheduler.Worker localWorker = this.scheduler.createWorker();
    paramSubscriber.add(localWorker);
    localWorker.schedule(new Action0()
    {
      public void call()
      {
        if (!paramSubscriber.isUnsubscribed())
          OnSubscribeDelaySubscription.this.source.unsafeSubscribe(paramSubscriber);
      }
    }
    , this.time, this.unit);
  }
}