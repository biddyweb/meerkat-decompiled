package rx.internal.operators;

import java.util.HashSet;
import java.util.Set;
import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Func1;

public final class OperatorDistinct<T, U>
  implements Observable.Operator<T, T>
{
  final Func1<? super T, ? extends U> keySelector;

  public OperatorDistinct(Func1<? super T, ? extends U> paramFunc1)
  {
    this.keySelector = paramFunc1;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      Set<U> keyMemory = new HashSet();

      public void onCompleted()
      {
        this.keyMemory = null;
        paramSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        this.keyMemory = null;
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        Object localObject = OperatorDistinct.this.keySelector.call(paramAnonymousT);
        if (this.keyMemory.add(localObject))
        {
          paramSubscriber.onNext(paramAnonymousT);
          return;
        }
        request(1L);
      }
    };
  }
}