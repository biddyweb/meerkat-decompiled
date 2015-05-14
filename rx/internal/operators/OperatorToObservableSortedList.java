package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Func2;

public final class OperatorToObservableSortedList<T>
  implements Observable.Operator<List<T>, T>
{
  private static Func2 defaultSortFunction = new DefaultComparableFunction(null);
  private final Func2<? super T, ? super T, Integer> sortFunction;

  public OperatorToObservableSortedList()
  {
    this.sortFunction = defaultSortFunction;
  }

  public OperatorToObservableSortedList(Func2<? super T, ? super T, Integer> paramFunc2)
  {
    this.sortFunction = paramFunc2;
  }

  public Subscriber<? super T> call(final Subscriber<? super List<T>> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      final List<T> list = new ArrayList();

      public void onCompleted()
      {
        try
        {
          Collections.sort(this.list, new Comparator()
          {
            public int compare(T paramAnonymous2T1, T paramAnonymous2T2)
            {
              return ((Integer)OperatorToObservableSortedList.this.sortFunction.call(paramAnonymous2T1, paramAnonymous2T2)).intValue();
            }
          });
          paramSubscriber.onNext(Collections.unmodifiableList(this.list));
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
        this.list.add(paramAnonymousT);
      }

      public void onStart()
      {
        request(9223372036854775807L);
      }
    };
  }

  private static class DefaultComparableFunction
    implements Func2<Object, Object, Integer>
  {
    public Integer call(Object paramObject1, Object paramObject2)
    {
      return Integer.valueOf(((Comparable)paramObject1).compareTo((Comparable)paramObject2));
    }
  }
}