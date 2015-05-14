package rx.internal.operators;

import rx.Observable;
import rx.Observable.Operator;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;

public final class OperatorOnErrorFlatMap<T>
  implements Observable.Operator<T, T>
{
  private final Func1<OnErrorThrowable, ? extends Observable<? extends T>> resumeFunction;

  public OperatorOnErrorFlatMap(Func1<OnErrorThrowable, ? extends Observable<? extends T>> paramFunc1)
  {
    this.resumeFunction = paramFunc1;
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
        try
        {
          RxJavaPlugins.getInstance().getErrorHandler().handleError(paramAnonymousThrowable);
          ((Observable)OperatorOnErrorFlatMap.this.resumeFunction.call(OnErrorThrowable.from(paramAnonymousThrowable))).unsafeSubscribe(new Subscriber()
          {
            public void onCompleted()
            {
            }

            public void onError(Throwable paramAnonymous2Throwable)
            {
              OperatorOnErrorFlatMap.1.this.val$child.onError(paramAnonymous2Throwable);
            }

            public void onNext(T paramAnonymous2T)
            {
              OperatorOnErrorFlatMap.1.this.val$child.onNext(paramAnonymous2T);
            }
          });
          return;
        }
        catch (Throwable localThrowable)
        {
          paramSubscriber.onError(localThrowable);
        }
      }

      public void onNext(T paramAnonymousT)
      {
        paramSubscriber.onNext(paramAnonymousT);
      }
    };
  }
}