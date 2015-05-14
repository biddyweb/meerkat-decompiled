package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import rx.Observable;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.subscriptions.SerialSubscription;

public final class OperatorSwitchIfEmpty<T>
  implements Observable.Operator<T, T>
{
  private final Observable<? extends T> alternate;

  public OperatorSwitchIfEmpty(Observable<? extends T> paramObservable)
  {
    this.alternate = paramObservable;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    SerialSubscription localSerialSubscription = new SerialSubscription();
    SwitchIfEmptySubscriber localSwitchIfEmptySubscriber = new SwitchIfEmptySubscriber(paramSubscriber, localSerialSubscription);
    localSerialSubscription.set(localSwitchIfEmptySubscriber);
    paramSubscriber.add(localSerialSubscription);
    return localSwitchIfEmptySubscriber;
  }

  private class SwitchIfEmptySubscriber extends Subscriber<T>
  {
    private final Subscriber<? super T> child;
    final AtomicLong consumerCapacity = new AtomicLong(0L);
    boolean empty = true;
    final SerialSubscription ssub;

    public SwitchIfEmptySubscriber(SerialSubscription arg2)
    {
      Object localObject1;
      this.child = localObject1;
      Object localObject2;
      this.ssub = localObject2;
    }

    private void subscribeToAlternate()
    {
      this.ssub.set(OperatorSwitchIfEmpty.this.alternate.unsafeSubscribe(new Subscriber()
      {
        public void onCompleted()
        {
          OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.this.child.onCompleted();
        }

        public void onError(Throwable paramAnonymousThrowable)
        {
          OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.this.child.onError(paramAnonymousThrowable);
        }

        public void onNext(T paramAnonymousT)
        {
          OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.this.child.onNext(paramAnonymousT);
        }

        public void onStart()
        {
          long l = OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.this.consumerCapacity.get();
          if (l > 0L)
            request(l);
        }

        public void setProducer(final Producer paramAnonymousProducer)
        {
          OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.this.child.setProducer(new Producer()
          {
            public void request(long paramAnonymous2Long)
            {
              paramAnonymousProducer.request(paramAnonymous2Long);
            }
          });
        }
      }));
    }

    public void onCompleted()
    {
      if (!this.empty)
        this.child.onCompleted();
      while (this.child.isUnsubscribed())
        return;
      subscribeToAlternate();
    }

    public void onError(Throwable paramThrowable)
    {
      this.child.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      this.empty = false;
      this.child.onNext(paramT);
    }

    public void setProducer(final Producer paramProducer)
    {
      super.setProducer(new Producer()
      {
        public void request(long paramAnonymousLong)
        {
          if (OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.this.empty)
            OperatorSwitchIfEmpty.SwitchIfEmptySubscriber.this.consumerCapacity.set(paramAnonymousLong);
          paramProducer.request(paramAnonymousLong);
        }
      });
    }
  }
}