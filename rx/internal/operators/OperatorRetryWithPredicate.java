package rx.internal.operators;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Observable;
import rx.Observable.Operator;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;
import rx.functions.Func2;
import rx.schedulers.Schedulers;
import rx.subscriptions.SerialSubscription;

public final class OperatorRetryWithPredicate<T>
  implements Observable.Operator<T, Observable<T>>
{
  final Func2<Integer, Throwable, Boolean> predicate;

  public OperatorRetryWithPredicate(Func2<Integer, Throwable, Boolean> paramFunc2)
  {
    this.predicate = paramFunc2;
  }

  public Subscriber<? super Observable<T>> call(Subscriber<? super T> paramSubscriber)
  {
    Scheduler.Worker localWorker = Schedulers.trampoline().createWorker();
    paramSubscriber.add(localWorker);
    SerialSubscription localSerialSubscription = new SerialSubscription();
    paramSubscriber.add(localSerialSubscription);
    return new SourceSubscriber(paramSubscriber, this.predicate, localWorker, localSerialSubscription);
  }

  static final class SourceSubscriber<T> extends Subscriber<Observable<T>>
  {
    static final AtomicIntegerFieldUpdater<SourceSubscriber> ATTEMPTS_UPDATER = AtomicIntegerFieldUpdater.newUpdater(SourceSubscriber.class, "attempts");
    volatile int attempts;
    final Subscriber<? super T> child;
    final Scheduler.Worker inner;
    final Func2<Integer, Throwable, Boolean> predicate;
    final SerialSubscription serialSubscription;

    public SourceSubscriber(Subscriber<? super T> paramSubscriber, Func2<Integer, Throwable, Boolean> paramFunc2, Scheduler.Worker paramWorker, SerialSubscription paramSerialSubscription)
    {
      this.child = paramSubscriber;
      this.predicate = paramFunc2;
      this.inner = paramWorker;
      this.serialSubscription = paramSerialSubscription;
    }

    public void onCompleted()
    {
    }

    public void onError(Throwable paramThrowable)
    {
      this.child.onError(paramThrowable);
    }

    public void onNext(final Observable<T> paramObservable)
    {
      this.inner.schedule(new Action0()
      {
        public void call()
        {
          OperatorRetryWithPredicate.SourceSubscriber.ATTEMPTS_UPDATER.incrementAndGet(OperatorRetryWithPredicate.SourceSubscriber.this);
          Subscriber local1 = new Subscriber()
          {
            public void onCompleted()
            {
              OperatorRetryWithPredicate.SourceSubscriber.this.child.onCompleted();
            }

            public void onError(Throwable paramAnonymous2Throwable)
            {
              if ((((Boolean)OperatorRetryWithPredicate.SourceSubscriber.this.predicate.call(Integer.valueOf(OperatorRetryWithPredicate.SourceSubscriber.this.attempts), paramAnonymous2Throwable)).booleanValue()) && (!OperatorRetryWithPredicate.SourceSubscriber.this.inner.isUnsubscribed()))
              {
                OperatorRetryWithPredicate.SourceSubscriber.this.inner.schedule(jdField_this);
                return;
              }
              OperatorRetryWithPredicate.SourceSubscriber.this.child.onError(paramAnonymous2Throwable);
            }

            public void onNext(T paramAnonymous2T)
            {
              OperatorRetryWithPredicate.SourceSubscriber.this.child.onNext(paramAnonymous2T);
            }
          };
          OperatorRetryWithPredicate.SourceSubscriber.this.serialSubscription.set(local1);
          paramObservable.unsafeSubscribe(local1);
        }
      });
    }
  }
}