package rx.internal.operators;

import rx.Observable;
import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Func1;
import rx.observers.SerializedSubscriber;
import rx.subjects.PublishSubject;

public final class OperatorDelayWithSelector<T, V>
  implements Observable.Operator<T, T>
{
  final Func1<? super T, ? extends Observable<V>> itemDelay;
  final Observable<? extends T> source;

  public OperatorDelayWithSelector(Observable<? extends T> paramObservable, Func1<? super T, ? extends Observable<V>> paramFunc1)
  {
    this.source = paramObservable;
    this.itemDelay = paramFunc1;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    final SerializedSubscriber localSerializedSubscriber = new SerializedSubscriber(paramSubscriber);
    final PublishSubject localPublishSubject = PublishSubject.create();
    paramSubscriber.add(Observable.merge(localPublishSubject).unsafeSubscribe(new Subscriber()
    {
      public void onCompleted()
      {
        localSerializedSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        localSerializedSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        localSerializedSubscriber.onNext(paramAnonymousT);
      }
    }));
    return new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        localPublishSubject.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        localSerializedSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(final T paramAnonymousT)
      {
        try
        {
          localPublishSubject.onNext(((Observable)OperatorDelayWithSelector.this.itemDelay.call(paramAnonymousT)).take(1).defaultIfEmpty(null).map(new Func1()
          {
            public T call(V paramAnonymous2V)
            {
              return paramAnonymousT;
            }
          }));
          return;
        }
        catch (Throwable localThrowable)
        {
          onError(localThrowable);
        }
      }
    };
  }
}