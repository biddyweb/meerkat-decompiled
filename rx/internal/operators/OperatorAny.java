package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Func1;

public final class OperatorAny<T>
  implements Observable.Operator<Boolean, T>
{
  private final Func1<? super T, Boolean> predicate;
  private final boolean returnOnEmpty;

  public OperatorAny(Func1<? super T, Boolean> paramFunc1, boolean paramBoolean)
  {
    this.predicate = paramFunc1;
    this.returnOnEmpty = paramBoolean;
  }

  public Subscriber<? super T> call(final Subscriber<? super Boolean> paramSubscriber)
  {
    Subscriber local1 = new Subscriber()
    {
      boolean done;
      boolean hasElements;

      public void onCompleted()
      {
        if (!this.done)
        {
          this.done = true;
          if (!this.hasElements)
            break label38;
          paramSubscriber.onNext(Boolean.valueOf(false));
        }
        while (true)
        {
          paramSubscriber.onCompleted();
          return;
          label38: paramSubscriber.onNext(Boolean.valueOf(OperatorAny.this.returnOnEmpty));
        }
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        this.hasElements = true;
        if ((((Boolean)OperatorAny.this.predicate.call(paramAnonymousT)).booleanValue()) && (!this.done))
        {
          this.done = true;
          Subscriber localSubscriber = paramSubscriber;
          if (!OperatorAny.this.returnOnEmpty);
          for (boolean bool = true; ; bool = false)
          {
            localSubscriber.onNext(Boolean.valueOf(bool));
            paramSubscriber.onCompleted();
            unsubscribe();
            return;
          }
        }
        request(1L);
      }
    };
    paramSubscriber.add(local1);
    return local1;
  }
}