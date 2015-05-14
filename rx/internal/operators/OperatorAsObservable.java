package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;

public final class OperatorAsObservable<T>
  implements Observable.Operator<T, T>
{
  public static <T> OperatorAsObservable<T> instance()
  {
    return Holder.INSTANCE;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    return paramSubscriber;
  }

  private static final class Holder
  {
    static final OperatorAsObservable<Object> INSTANCE = new OperatorAsObservable(null);
  }
}