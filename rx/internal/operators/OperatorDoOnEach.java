package rx.internal.operators;

import rx.Observable.Operator;
import rx.Observer;
import rx.Subscriber;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorThrowable;

public class OperatorDoOnEach<T>
  implements Observable.Operator<T, T>
{
  private final Observer<? super T> doOnEachObserver;

  public OperatorDoOnEach(Observer<? super T> paramObserver)
  {
    this.doOnEachObserver = paramObserver;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      private boolean done = false;

      public void onCompleted()
      {
        if (this.done)
          return;
        try
        {
          OperatorDoOnEach.this.doOnEachObserver.onCompleted();
          this.done = true;
          paramSubscriber.onCompleted();
          return;
        }
        catch (Throwable localThrowable)
        {
          onError(localThrowable);
        }
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        Exceptions.throwIfFatal(paramAnonymousThrowable);
        if (this.done)
          return;
        this.done = true;
        try
        {
          OperatorDoOnEach.this.doOnEachObserver.onError(paramAnonymousThrowable);
          paramSubscriber.onError(paramAnonymousThrowable);
          return;
        }
        catch (Throwable localThrowable)
        {
          paramSubscriber.onError(localThrowable);
        }
      }

      public void onNext(T paramAnonymousT)
      {
        if (this.done)
          return;
        try
        {
          OperatorDoOnEach.this.doOnEachObserver.onNext(paramAnonymousT);
          paramSubscriber.onNext(paramAnonymousT);
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