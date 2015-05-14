package rx.observables;

import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscription;
import rx.functions.Action1;
import rx.internal.operators.OnSubscribeRefCount;

public abstract class ConnectableObservable<T> extends Observable<T>
{
  protected ConnectableObservable(Observable.OnSubscribe<T> paramOnSubscribe)
  {
    super(paramOnSubscribe);
  }

  public final Subscription connect()
  {
    final Subscription[] arrayOfSubscription = new Subscription[1];
    connect(new Action1()
    {
      public void call(Subscription paramAnonymousSubscription)
      {
        arrayOfSubscription[0] = paramAnonymousSubscription;
      }
    });
    return arrayOfSubscription[0];
  }

  public abstract void connect(Action1<? super Subscription> paramAction1);

  public Observable<T> refCount()
  {
    return create(new OnSubscribeRefCount(this));
  }
}