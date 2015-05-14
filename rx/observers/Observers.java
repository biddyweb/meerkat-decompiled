package rx.observers;

import rx.Observer;
import rx.exceptions.OnErrorNotImplementedException;
import rx.functions.Action0;
import rx.functions.Action1;

public final class Observers
{
  private static final Observer<Object> EMPTY = new Observer()
  {
    public final void onCompleted()
    {
    }

    public final void onError(Throwable paramAnonymousThrowable)
    {
      throw new OnErrorNotImplementedException(paramAnonymousThrowable);
    }

    public final void onNext(Object paramAnonymousObject)
    {
    }
  };

  private Observers()
  {
    throw new IllegalStateException("No instances!");
  }

  public static final <T> Observer<T> create(Action1<? super T> paramAction1)
  {
    if (paramAction1 == null)
      throw new IllegalArgumentException("onNext can not be null");
    return new Observer()
    {
      public final void onCompleted()
      {
      }

      public final void onError(Throwable paramAnonymousThrowable)
      {
        throw new OnErrorNotImplementedException(paramAnonymousThrowable);
      }

      public final void onNext(T paramAnonymousT)
      {
        this.val$onNext.call(paramAnonymousT);
      }
    };
  }

  public static final <T> Observer<T> create(final Action1<? super T> paramAction1, Action1<Throwable> paramAction11)
  {
    if (paramAction1 == null)
      throw new IllegalArgumentException("onNext can not be null");
    if (paramAction11 == null)
      throw new IllegalArgumentException("onError can not be null");
    return new Observer()
    {
      public final void onCompleted()
      {
      }

      public final void onError(Throwable paramAnonymousThrowable)
      {
        this.val$onError.call(paramAnonymousThrowable);
      }

      public final void onNext(T paramAnonymousT)
      {
        paramAction1.call(paramAnonymousT);
      }
    };
  }

  public static final <T> Observer<T> create(final Action1<? super T> paramAction1, final Action1<Throwable> paramAction11, Action0 paramAction0)
  {
    if (paramAction1 == null)
      throw new IllegalArgumentException("onNext can not be null");
    if (paramAction11 == null)
      throw new IllegalArgumentException("onError can not be null");
    if (paramAction0 == null)
      throw new IllegalArgumentException("onComplete can not be null");
    return new Observer()
    {
      public final void onCompleted()
      {
        this.val$onComplete.call();
      }

      public final void onError(Throwable paramAnonymousThrowable)
      {
        paramAction11.call(paramAnonymousThrowable);
      }

      public final void onNext(T paramAnonymousT)
      {
        paramAction1.call(paramAnonymousT);
      }
    };
  }

  public static <T> Observer<T> empty()
  {
    return EMPTY;
  }
}