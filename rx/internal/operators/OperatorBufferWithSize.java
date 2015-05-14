package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;

public final class OperatorBufferWithSize<T>
  implements Observable.Operator<List<T>, T>
{
  final int count;
  final int skip;

  public OperatorBufferWithSize(int paramInt1, int paramInt2)
  {
    if (paramInt1 <= 0)
      throw new IllegalArgumentException("count must be greater than 0");
    if (paramInt2 <= 0)
      throw new IllegalArgumentException("skip must be greater than 0");
    this.count = paramInt1;
    this.skip = paramInt2;
  }

  public Subscriber<? super T> call(final Subscriber<? super List<T>> paramSubscriber)
  {
    if (this.count == this.skip)
      return new Subscriber(paramSubscriber)
      {
        List<T> buffer;

        public void onCompleted()
        {
          List localList = this.buffer;
          this.buffer = null;
          if (localList != null);
          try
          {
            paramSubscriber.onNext(localList);
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
          this.buffer = null;
          paramSubscriber.onError(paramAnonymousThrowable);
        }

        public void onNext(T paramAnonymousT)
        {
          if (this.buffer == null)
            this.buffer = new ArrayList(OperatorBufferWithSize.this.count);
          this.buffer.add(paramAnonymousT);
          if (this.buffer.size() == OperatorBufferWithSize.this.count)
          {
            List localList = this.buffer;
            this.buffer = null;
            paramSubscriber.onNext(localList);
          }
        }

        public void setProducer(final Producer paramAnonymousProducer)
        {
          paramSubscriber.setProducer(new Producer()
          {
            private volatile boolean infinite = false;

            public void request(long paramAnonymous2Long)
            {
              if (this.infinite)
                return;
              if (paramAnonymous2Long >= 9223372036854775807L / OperatorBufferWithSize.this.count)
              {
                this.infinite = true;
                paramAnonymousProducer.request(9223372036854775807L);
                return;
              }
              paramAnonymousProducer.request(paramAnonymous2Long * OperatorBufferWithSize.this.count);
            }
          });
        }
      };
    return new Subscriber(paramSubscriber)
    {
      final List<List<T>> chunks = new LinkedList();
      int index;

      public void onCompleted()
      {
        try
        {
          Iterator localIterator = this.chunks.iterator();
          while (localIterator.hasNext())
          {
            List localList = (List)localIterator.next();
            try
            {
              paramSubscriber.onNext(localList);
            }
            catch (Throwable localThrowable)
            {
              onError(localThrowable);
              return;
            }
          }
          paramSubscriber.onCompleted();
          return;
        }
        finally
        {
          this.chunks.clear();
        }
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        this.chunks.clear();
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        int i = this.index;
        this.index = (i + 1);
        if (i % OperatorBufferWithSize.this.skip == 0)
          this.chunks.add(new ArrayList(OperatorBufferWithSize.this.count));
        Iterator localIterator = this.chunks.iterator();
        while (localIterator.hasNext())
        {
          List localList = (List)localIterator.next();
          localList.add(paramAnonymousT);
          if (localList.size() == OperatorBufferWithSize.this.count)
          {
            localIterator.remove();
            paramSubscriber.onNext(localList);
          }
        }
      }

      public void setProducer(final Producer paramAnonymousProducer)
      {
        paramSubscriber.setProducer(new Producer()
        {
          private volatile boolean firstRequest = true;
          private volatile boolean infinite = false;

          private void requestInfinite()
          {
            this.infinite = true;
            paramAnonymousProducer.request(9223372036854775807L);
          }

          public void request(long paramAnonymous2Long)
          {
            if (paramAnonymous2Long == 0L);
            do
            {
              return;
              if (paramAnonymous2Long < 0L)
                throw new IllegalArgumentException("request a negative number: " + paramAnonymous2Long);
            }
            while (this.infinite);
            if (paramAnonymous2Long == 9223372036854775807L)
            {
              requestInfinite();
              return;
            }
            if (this.firstRequest)
            {
              this.firstRequest = false;
              if (paramAnonymous2Long - 1L >= (9223372036854775807L - OperatorBufferWithSize.this.count) / OperatorBufferWithSize.this.skip)
              {
                requestInfinite();
                return;
              }
              paramAnonymousProducer.request(OperatorBufferWithSize.this.count + OperatorBufferWithSize.this.skip * (paramAnonymous2Long - 1L));
              return;
            }
            if (paramAnonymous2Long >= 9223372036854775807L / OperatorBufferWithSize.this.skip)
            {
              requestInfinite();
              return;
            }
            paramAnonymousProducer.request(paramAnonymous2Long * OperatorBufferWithSize.this.skip);
          }
        });
      }
    };
  }
}