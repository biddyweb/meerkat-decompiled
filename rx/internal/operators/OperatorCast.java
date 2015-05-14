package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;

public class OperatorCast<T, R>
  implements Observable.Operator<R, T>
{
  private final Class<R> castClass;

  public OperatorCast(Class<R> paramClass)
  {
    this.castClass = paramClass;
  }

  public Subscriber<? super T> call(final Subscriber<? super R> paramSubscriber)
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
          paramSubscriber.onNext(OperatorCast.this.castClass.cast(paramAnonymousT));
          return;
        }
        catch (Throwable localThrowable)
        {
          onError(OnErrorThrowable.addValueAsLastCause(localThrowable, paramAnonymousT));
        }
      }
    };
  }
}