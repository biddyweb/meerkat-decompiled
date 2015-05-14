package rx.internal.operators;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import rx.Observable.Operator;
import rx.Subscriber;

public final class OperatorToObservableList<T>
  implements Observable.Operator<List<T>, T>
{
  public static <T> OperatorToObservableList<T> instance()
  {
    return Holder.INSTANCE;
  }

  public Subscriber<? super T> call(final Subscriber<? super List<T>> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      private boolean completed = false;
      final List<T> list = new LinkedList();

      public void onCompleted()
      {
        try
        {
          this.completed = true;
          paramSubscriber.onNext(new ArrayList(this.list));
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
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        if (!this.completed)
          this.list.add(paramAnonymousT);
      }

      public void onStart()
      {
        request(9223372036854775807L);
      }
    };
  }

  private static final class Holder
  {
    static final OperatorToObservableList<Object> INSTANCE = new OperatorToObservableList(null);
  }
}