package rx.subjects;

import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Observer;

public abstract class Subject<T, R> extends Observable<R>
  implements Observer<T>
{
  protected Subject(Observable.OnSubscribe<R> paramOnSubscribe)
  {
    super(paramOnSubscribe);
  }

  public abstract boolean hasObservers();

  public final SerializedSubject<T, R> toSerialized()
  {
    return new SerializedSubject(this);
  }
}