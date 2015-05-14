package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Func1;

public final class OperatorAll<T>
  implements Observable.Operator<Boolean, T>
{
  private final Func1<? super T, Boolean> predicate;

  public OperatorAll(Func1<? super T, Boolean> paramFunc1)
  {
    this.predicate = paramFunc1;
  }

  public Subscriber<? super T> call(final Subscriber<? super Boolean> paramSubscriber)
  {
    Subscriber local1 = new Subscriber()
    {
      boolean done;

      public void onCompleted()
      {
        if (!this.done)
        {
          this.done = true;
          paramSubscriber.onNext(Boolean.valueOf(true));
          paramSubscriber.onCompleted();
        }
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        if ((!((Boolean)OperatorAll.this.predicate.call(paramAnonymousT)).booleanValue()) && (!this.done))
        {
          this.done = true;
          paramSubscriber.onNext(Boolean.valueOf(false));
          paramSubscriber.onCompleted();
          unsubscribe();
          return;
        }
        request(1L);
      }
    };
    paramSubscriber.add(local1);
    return local1;
  }
}