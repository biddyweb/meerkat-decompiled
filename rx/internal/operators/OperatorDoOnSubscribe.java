package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Action0;

public class OperatorDoOnSubscribe<T>
  implements Observable.Operator<T, T>
{
  private final Action0 subscribe;

  public OperatorDoOnSubscribe(Action0 paramAction0)
  {
    this.subscribe = paramAction0;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    this.subscribe.call();
    return paramSubscriber;
  }
}