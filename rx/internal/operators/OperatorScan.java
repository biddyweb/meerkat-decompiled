package rx.internal.operators;

import java.util.concurrent.atomic.AtomicBoolean;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func0;
import rx.functions.Func2;

public final class OperatorScan<R, T>
  implements Observable.Operator<R, T>
{
  private static final Object NO_INITIAL_VALUE = new Object();
  private final Func2<R, ? super T, R> accumulator;
  private final Func0<R> initialValueFactory;

  public OperatorScan(R paramR, Func2<R, ? super T, R> paramFunc2)
  {
    this(new Func0()
    {
      public R call()
      {
        return OperatorScan.this;
      }
    }
    , paramFunc2);
  }

  public OperatorScan(Func0<R> paramFunc0, Func2<R, ? super T, R> paramFunc2)
  {
    this.initialValueFactory = paramFunc0;
    this.accumulator = paramFunc2;
  }

  public OperatorScan(Func2<R, ? super T, R> paramFunc2)
  {
    this(NO_INITIAL_VALUE, paramFunc2);
  }

  public Subscriber<? super T> call(final Subscriber<? super R> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      private final R initialValue = OperatorScan.this.initialValueFactory.call();
      boolean initialized = false;
      private R value = this.initialValue;

      private void emitInitialValueIfNeeded(Subscriber<? super R> paramAnonymousSubscriber)
      {
        if (!this.initialized)
        {
          this.initialized = true;
          if (this.initialValue != OperatorScan.NO_INITIAL_VALUE)
            paramAnonymousSubscriber.onNext(this.initialValue);
        }
      }

      public void onCompleted()
      {
        emitInitialValueIfNeeded(paramSubscriber);
        paramSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        emitInitialValueIfNeeded(paramSubscriber);
        if (this.value == OperatorScan.NO_INITIAL_VALUE)
          this.value = paramAnonymousT;
        while (true)
        {
          paramSubscriber.onNext(this.value);
          return;
          try
          {
            this.value = OperatorScan.this.accumulator.call(this.value, paramAnonymousT);
          }
          catch (Throwable localThrowable)
          {
            paramSubscriber.onError(OnErrorThrowable.addValueAsLastCause(localThrowable, paramAnonymousT));
          }
        }
      }

      public void setProducer(final Producer paramAnonymousProducer)
      {
        paramSubscriber.setProducer(new Producer()
        {
          final AtomicBoolean excessive = new AtomicBoolean();
          final AtomicBoolean once = new AtomicBoolean();

          public void request(long paramAnonymous2Long)
          {
            if (this.once.compareAndSet(false, true))
            {
              if ((OperatorScan.2.this.initialValue == OperatorScan.NO_INITIAL_VALUE) || (paramAnonymous2Long == 9223372036854775807L))
              {
                paramAnonymousProducer.request(paramAnonymous2Long);
                return;
              }
              if (paramAnonymous2Long == 1L)
              {
                this.excessive.set(true);
                paramAnonymousProducer.request(1L);
                return;
              }
              paramAnonymousProducer.request(paramAnonymous2Long - 1L);
              return;
            }
            if ((paramAnonymous2Long > 1L) && (this.excessive.compareAndSet(true, false)) && (paramAnonymous2Long != 9223372036854775807L))
            {
              paramAnonymousProducer.request(paramAnonymous2Long - 1L);
              return;
            }
            paramAnonymousProducer.request(paramAnonymous2Long);
          }
        });
      }
    };
  }
}