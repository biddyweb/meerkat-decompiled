package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Func1;
import rx.functions.Func2;

public final class OperatorSkipWhile<T>
  implements Observable.Operator<T, T>
{
  private final Func2<? super T, Integer, Boolean> predicate;

  public OperatorSkipWhile(Func2<? super T, Integer, Boolean> paramFunc2)
  {
    this.predicate = paramFunc2;
  }

  public static <T> Func2<T, Integer, Boolean> toPredicate2(Func1<? super T, Boolean> paramFunc1)
  {
    return new Func2()
    {
      public Boolean call(T paramAnonymousT, Integer paramAnonymousInteger)
      {
        return (Boolean)this.val$predicate.call(paramAnonymousT);
      }
    };
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      int index;
      boolean skipping = true;

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
        if (!this.skipping)
        {
          paramSubscriber.onNext(paramAnonymousT);
          return;
        }
        Func2 localFunc2 = OperatorSkipWhile.this.predicate;
        int i = this.index;
        this.index = (i + 1);
        if (!((Boolean)localFunc2.call(paramAnonymousT, Integer.valueOf(i))).booleanValue())
        {
          this.skipping = false;
          paramSubscriber.onNext(paramAnonymousT);
          return;
        }
        request(1L);
      }
    };
  }
}