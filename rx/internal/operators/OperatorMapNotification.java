package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func0;
import rx.functions.Func1;

public final class OperatorMapNotification<T, R>
  implements Observable.Operator<R, T>
{
  private final Func0<? extends R> onCompleted;
  private final Func1<? super Throwable, ? extends R> onError;
  private final Func1<? super T, ? extends R> onNext;

  public OperatorMapNotification(Func1<? super T, ? extends R> paramFunc1, Func1<? super Throwable, ? extends R> paramFunc11, Func0<? extends R> paramFunc0)
  {
    this.onNext = paramFunc1;
    this.onError = paramFunc11;
    this.onCompleted = paramFunc0;
  }

  public Subscriber<? super T> call(final Subscriber<? super R> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        try
        {
          paramSubscriber.onNext(OperatorMapNotification.this.onCompleted.call());
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
        try
        {
          paramSubscriber.onNext(OperatorMapNotification.this.onError.call(paramAnonymousThrowable));
          paramSubscriber.onCompleted();
          return;
        }
        catch (Throwable localThrowable)
        {
          paramSubscriber.onError(paramAnonymousThrowable);
        }
      }

      public void onNext(T paramAnonymousT)
      {
        try
        {
          paramSubscriber.onNext(OperatorMapNotification.this.onNext.call(paramAnonymousT));
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