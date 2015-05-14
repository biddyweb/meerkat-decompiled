package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Action0;

public final class OperatorFinally<T>
  implements Observable.Operator<T, T>
{
  final Action0 action;

  public OperatorFinally(Action0 paramAction0)
  {
    this.action = paramAction0;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        try
        {
          paramSubscriber.onCompleted();
          return;
        }
        finally
        {
          OperatorFinally.this.action.call();
        }
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        try
        {
          paramSubscriber.onError(paramAnonymousThrowable);
          return;
        }
        finally
        {
          OperatorFinally.this.action.call();
        }
      }

      public void onNext(T paramAnonymousT)
      {
        paramSubscriber.onNext(paramAnonymousT);
      }
    };
  }
}