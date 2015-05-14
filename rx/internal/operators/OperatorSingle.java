package rx.internal.operators;

import java.util.NoSuchElementException;
import rx.Observable.Operator;
import rx.Subscriber;

public final class OperatorSingle<T>
  implements Observable.Operator<T, T>
{
  private final T defaultValue;
  private final boolean hasDefaultValue;

  public OperatorSingle()
  {
    this(false, null);
  }

  public OperatorSingle(T paramT)
  {
    this(true, paramT);
  }

  private OperatorSingle(boolean paramBoolean, T paramT)
  {
    this.hasDefaultValue = paramBoolean;
    this.defaultValue = paramT;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      private boolean hasTooManyElements = false;
      private boolean isNonEmpty = false;
      private T value;

      public void onCompleted()
      {
        if (this.hasTooManyElements)
          return;
        if (this.isNonEmpty)
        {
          paramSubscriber.onNext(this.value);
          paramSubscriber.onCompleted();
          return;
        }
        if (OperatorSingle.this.hasDefaultValue)
        {
          paramSubscriber.onNext(OperatorSingle.this.defaultValue);
          paramSubscriber.onCompleted();
          return;
        }
        paramSubscriber.onError(new NoSuchElementException("Sequence contains no elements"));
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        if (this.isNonEmpty)
        {
          this.hasTooManyElements = true;
          paramSubscriber.onError(new IllegalArgumentException("Sequence contains too many elements"));
          unsubscribe();
          return;
        }
        this.value = paramAnonymousT;
        this.isNonEmpty = true;
        request(1L);
      }
    };
  }
}