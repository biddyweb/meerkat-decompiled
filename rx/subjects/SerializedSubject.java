package rx.subjects;

import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.observers.SerializedObserver;

public class SerializedSubject<T, R> extends Subject<T, R>
{
  private final Subject<T, R> actual;
  private final SerializedObserver<T> observer;

  public SerializedSubject(Subject<T, R> paramSubject)
  {
    super(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super R> paramAnonymousSubscriber)
      {
        SerializedSubject.this.unsafeSubscribe(paramAnonymousSubscriber);
      }
    });
    this.actual = paramSubject;
    this.observer = new SerializedObserver(paramSubject);
  }

  public boolean hasObservers()
  {
    return this.actual.hasObservers();
  }

  public void onCompleted()
  {
    this.observer.onCompleted();
  }

  public void onError(Throwable paramThrowable)
  {
    this.observer.onError(paramThrowable);
  }

  public void onNext(T paramT)
  {
    this.observer.onNext(paramT);
  }
}