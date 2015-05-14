package rx.internal.operators;

import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;

public final class OperatorTake<T>
  implements Observable.Operator<T, T>
{
  final int limit;

  public OperatorTake(int paramInt)
  {
    this.limit = paramInt;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    Subscriber local1 = new Subscriber()
    {
      boolean completed = false;
      int count = 0;

      public void onCompleted()
      {
        if (!this.completed)
          paramSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        if (!this.completed)
          paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        if (!isUnsubscribed())
        {
          int i = 1 + this.count;
          this.count = i;
          if (i >= OperatorTake.this.limit)
            this.completed = true;
          paramSubscriber.onNext(paramAnonymousT);
          if (this.completed)
          {
            paramSubscriber.onCompleted();
            unsubscribe();
          }
        }
      }

      public void setProducer(final Producer paramAnonymousProducer)
      {
        paramSubscriber.setProducer(new Producer()
        {
          public void request(long paramAnonymous2Long)
          {
            long l;
            if (!OperatorTake.1.this.completed)
            {
              l = OperatorTake.this.limit - OperatorTake.1.this.count;
              if (paramAnonymous2Long < l)
                paramAnonymousProducer.request(paramAnonymous2Long);
            }
            else
            {
              return;
            }
            paramAnonymousProducer.request(l);
          }
        });
      }
    };
    if (this.limit == 0)
    {
      paramSubscriber.onCompleted();
      local1.unsubscribe();
    }
    paramSubscriber.add(local1);
    return local1;
  }
}