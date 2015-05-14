package rx.internal.operators;

import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.annotations.Experimental;
import rx.functions.Func1;

@Experimental
public final class OperatorTakeUntilPredicate<T>
  implements Observable.Operator<T, T>
{
  private final Func1<? super T, Boolean> stopPredicate;

  public OperatorTakeUntilPredicate(Func1<? super T, Boolean> paramFunc1)
  {
    this.stopPredicate = paramFunc1;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    final ParentSubscriber localParentSubscriber = new ParentSubscriber(paramSubscriber, null);
    paramSubscriber.add(localParentSubscriber);
    paramSubscriber.setProducer(new Producer()
    {
      public void request(long paramAnonymousLong)
      {
        localParentSubscriber.downstreamRequest(paramAnonymousLong);
      }
    });
    return localParentSubscriber;
  }

  private final class ParentSubscriber extends Subscriber<T>
  {
    private final Subscriber<? super T> child;
    private boolean done = false;

    private ParentSubscriber()
    {
      Object localObject;
      this.child = localObject;
    }

    void downstreamRequest(long paramLong)
    {
      request(paramLong);
    }

    public void onCompleted()
    {
      if (!this.done)
        this.child.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      if (!this.done)
        this.child.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      this.child.onNext(paramT);
      try
      {
        boolean bool = ((Boolean)OperatorTakeUntilPredicate.this.stopPredicate.call(paramT)).booleanValue();
        if (bool)
        {
          this.done = true;
          this.child.onCompleted();
          unsubscribe();
        }
        return;
      }
      catch (Throwable localThrowable)
      {
        this.done = true;
        this.child.onError(localThrowable);
        unsubscribe();
      }
    }
  }
}