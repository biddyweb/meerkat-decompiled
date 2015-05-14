package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;

public final class OperatorElementAt<T>
  implements Observable.Operator<T, T>
{
  private final T defaultValue;
  private final boolean hasDefault;
  private final int index;

  public OperatorElementAt(int paramInt)
  {
    this(paramInt, null, false);
  }

  public OperatorElementAt(int paramInt, T paramT)
  {
    this(paramInt, paramT, true);
  }

  private OperatorElementAt(int paramInt, T paramT, boolean paramBoolean)
  {
    if (paramInt < 0)
      throw new IndexOutOfBoundsException(paramInt + " is out of bounds");
    this.index = paramInt;
    this.defaultValue = paramT;
    this.hasDefault = paramBoolean;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      private int currentIndex = 0;

      public void onCompleted()
      {
        if (this.currentIndex <= OperatorElementAt.this.index)
        {
          if (OperatorElementAt.this.hasDefault)
          {
            paramSubscriber.onNext(OperatorElementAt.this.defaultValue);
            paramSubscriber.onCompleted();
          }
        }
        else
          return;
        paramSubscriber.onError(new IndexOutOfBoundsException(OperatorElementAt.this.index + " is out of bounds"));
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        if (this.currentIndex == OperatorElementAt.this.index)
        {
          paramSubscriber.onNext(paramAnonymousT);
          paramSubscriber.onCompleted();
        }
        while (true)
        {
          this.currentIndex = (1 + this.currentIndex);
          return;
          request(1L);
        }
      }
    };
  }
}