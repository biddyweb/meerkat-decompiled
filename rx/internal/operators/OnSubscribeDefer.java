package rx.internal.operators;

import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.functions.Func0;

public final class OnSubscribeDefer<T>
  implements Observable.OnSubscribe<T>
{
  final Func0<? extends Observable<? extends T>> observableFactory;

  public OnSubscribeDefer(Func0<? extends Observable<? extends T>> paramFunc0)
  {
    this.observableFactory = paramFunc0;
  }

  public void call(Subscriber<? super T> paramSubscriber)
  {
    try
    {
      Observable localObservable = (Observable)this.observableFactory.call();
      localObservable.unsafeSubscribe(paramSubscriber);
      return;
    }
    catch (Throwable localThrowable)
    {
      paramSubscriber.onError(localThrowable);
    }
  }
}