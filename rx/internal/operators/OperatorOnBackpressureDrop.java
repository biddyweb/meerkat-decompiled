package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.functions.Action1;

public class OperatorOnBackpressureDrop<T>
  implements Observable.Operator<T, T>
{
  private final Action1<? super T> onDrop;

  private OperatorOnBackpressureDrop()
  {
    this(null);
  }

  public OperatorOnBackpressureDrop(Action1<? super T> paramAction1)
  {
    this.onDrop = paramAction1;
  }

  public static <T> OperatorOnBackpressureDrop<T> instance()
  {
    return Holder.INSTANCE;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    final AtomicLong localAtomicLong = new AtomicLong();
    paramSubscriber.setProducer(new Producer()
    {
      public void request(long paramAnonymousLong)
      {
        BackpressureUtils.getAndAddRequest(localAtomicLong, paramAnonymousLong);
      }
    });
    return new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        paramSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        if (localAtomicLong.get() > 0L)
        {
          paramSubscriber.onNext(paramAnonymousT);
          localAtomicLong.decrementAndGet();
        }
        while (OperatorOnBackpressureDrop.this.onDrop == null)
          return;
        OperatorOnBackpressureDrop.this.onDrop.call(paramAnonymousT);
      }

      public void onStart()
      {
        request(9223372036854775807L);
      }
    };
  }

  private static final class Holder
  {
    static final OperatorOnBackpressureDrop<Object> INSTANCE = new OperatorOnBackpressureDrop(null);
  }
}