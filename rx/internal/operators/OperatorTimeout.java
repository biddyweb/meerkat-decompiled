package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;

public final class OperatorTimeout<T> extends OperatorTimeoutBase<T>
{
  public OperatorTimeout(long paramLong, TimeUnit paramTimeUnit, Observable<? extends T> paramObservable, Scheduler paramScheduler)
  {
    super(new OperatorTimeoutBase.FirstTimeoutStub()
    {
      public Subscription call(final OperatorTimeoutBase.TimeoutSubscriber<T> paramAnonymousTimeoutSubscriber, final Long paramAnonymousLong, Scheduler.Worker paramAnonymousWorker)
      {
        return paramAnonymousWorker.schedule(new Action0()
        {
          public void call()
          {
            paramAnonymousTimeoutSubscriber.onTimeout(paramAnonymousLong.longValue());
          }
        }
        , this.val$timeout, this.val$timeUnit);
      }
    }
    , new OperatorTimeoutBase.TimeoutStub()
    {
      public Subscription call(final OperatorTimeoutBase.TimeoutSubscriber<T> paramAnonymousTimeoutSubscriber, final Long paramAnonymousLong, T paramAnonymousT, Scheduler.Worker paramAnonymousWorker)
      {
        return paramAnonymousWorker.schedule(new Action0()
        {
          public void call()
          {
            paramAnonymousTimeoutSubscriber.onTimeout(paramAnonymousLong.longValue());
          }
        }
        , this.val$timeout, this.val$timeUnit);
      }
    }
    , paramObservable, paramScheduler);
  }
}