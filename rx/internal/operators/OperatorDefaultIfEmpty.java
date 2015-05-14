package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;

public class OperatorDefaultIfEmpty<T>
  implements Observable.Operator<T, T>
{
  final T defaultValue;

  public OperatorDefaultIfEmpty(T paramT)
  {
    this.defaultValue = paramT;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      boolean hasValue;

      public void onCompleted()
      {
        if (!this.hasValue);
        try
        {
          paramSubscriber.onNext(OperatorDefaultIfEmpty.this.defaultValue);
          paramSubscriber.onCompleted();
          return;
        }
        catch (Throwable localThrowable)
        {
          paramSubscriber.onError(localThrowable);
        }
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        this.hasValue = true;
        paramSubscriber.onNext(paramAnonymousT);
      }
    };
  }
}