package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;

public final class OperatorFilter<T>
  implements Observable.Operator<T, T>
{
  private final Func1<? super T, Boolean> predicate;

  public OperatorFilter(Func1<? super T, Boolean> paramFunc1)
  {
    this.predicate = paramFunc1;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
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

      public void onNext(T paramAnonymousT)
      {
        try
        {
          if (((Boolean)OperatorFilter.this.predicate.call(paramAnonymousT)).booleanValue())
          {
            paramSubscriber.onNext(paramAnonymousT);
            return;
          }
          request(1L);
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