package rx.internal.operators;

import rx.Observable;
import rx.Observable.Operator;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;
import rx.functions.Func2;

public final class OperatorMapPair<T, U, R>
  implements Observable.Operator<Observable<? extends R>, T>
{
  final Func1<? super T, ? extends Observable<? extends U>> collectionSelector;
  final Func2<? super T, ? super U, ? extends R> resultSelector;

  public OperatorMapPair(Func1<? super T, ? extends Observable<? extends U>> paramFunc1, Func2<? super T, ? super U, ? extends R> paramFunc2)
  {
    this.collectionSelector = paramFunc1;
    this.resultSelector = paramFunc2;
  }

  public static <T, U> Func1<T, Observable<U>> convertSelector(Func1<? super T, ? extends Iterable<? extends U>> paramFunc1)
  {
    return new Func1()
    {
      public Observable<U> call(T paramAnonymousT)
      {
        return Observable.from((Iterable)this.val$selector.call(paramAnonymousT));
      }
    };
  }

  public Subscriber<? super T> call(final Subscriber<? super Observable<? extends R>> paramSubscriber)
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

      public void onNext(final T paramAnonymousT)
      {
        try
        {
          paramSubscriber.onNext(((Observable)OperatorMapPair.this.collectionSelector.call(paramAnonymousT)).map(new Func1()
          {
            public R call(U paramAnonymous2U)
            {
              return OperatorMapPair.this.resultSelector.call(paramAnonymousT, paramAnonymous2U);
            }
          }));
          return;
        }
        catch (Throwable localThrowable)
        {
          paramSubscriber.onError(OnErrorThrowable.addValueAsLastCause(localThrowable, paramAnonymousT));
        }
      }
    };
  }
}