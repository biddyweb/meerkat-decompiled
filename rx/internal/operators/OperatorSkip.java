package rx.internal.operators;

import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;

public final class OperatorSkip<T>
  implements Observable.Operator<T, T>
{
  final int toSkip;

  public OperatorSkip(int paramInt)
  {
    this.toSkip = paramInt;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    return new Subscriber(paramSubscriber)
    {
      int skipped = 0;

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
        if (this.skipped >= OperatorSkip.this.toSkip)
        {
          paramSubscriber.onNext(paramAnonymousT);
          return;
        }
        this.skipped = (1 + this.skipped);
      }

      public void setProducer(final Producer paramAnonymousProducer)
      {
        paramSubscriber.setProducer(new Producer()
        {
          public void request(long paramAnonymous2Long)
          {
            if (paramAnonymous2Long == 9223372036854775807L)
              paramAnonymousProducer.request(paramAnonymous2Long);
            while (paramAnonymous2Long <= 0L)
              return;
            paramAnonymousProducer.request(paramAnonymous2Long + (OperatorSkip.this.toSkip - OperatorSkip.1.this.skipped));
          }
        });
      }
    };
  }
}