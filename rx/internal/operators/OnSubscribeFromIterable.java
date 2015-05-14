package rx.internal.operators;

import java.util.Iterator;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable.OnSubscribe;
import rx.Producer;
import rx.Subscriber;

public final class OnSubscribeFromIterable<T>
  implements Observable.OnSubscribe<T>
{
  final Iterable<? extends T> is;

  public OnSubscribeFromIterable(Iterable<? extends T> paramIterable)
  {
    if (paramIterable == null)
      throw new NullPointerException("iterable must not be null");
    this.is = paramIterable;
  }

  public void call(Subscriber<? super T> paramSubscriber)
  {
    paramSubscriber.setProducer(new IterableProducer(paramSubscriber, this.is.iterator(), null));
  }

  private static final class IterableProducer<T>
    implements Producer
  {
    private static final AtomicLongFieldUpdater<IterableProducer> REQUESTED_UPDATER = AtomicLongFieldUpdater.newUpdater(IterableProducer.class, "requested");
    private final Iterator<? extends T> it;
    private final Subscriber<? super T> o;
    private volatile long requested = 0L;

    private IterableProducer(Subscriber<? super T> paramSubscriber, Iterator<? extends T> paramIterator)
    {
      this.o = paramSubscriber;
      this.it = paramIterator;
    }

    public void request(long paramLong)
    {
      if (REQUESTED_UPDATER.get(this) == 9223372036854775807L);
      label72: 
      do
      {
        do
        {
          return;
          if (paramLong != 9223372036854775807L)
            break;
          REQUESTED_UPDATER.set(this, paramLong);
          while (true)
          {
            if (!this.it.hasNext())
              break label72;
            if (this.o.isUnsubscribed())
              break;
            this.o.onNext(this.it.next());
          }
        }
        while (this.o.isUnsubscribed());
        this.o.onCompleted();
        return;
      }
      while ((paramLong <= 0L) || (BackpressureUtils.getAndAddRequest(REQUESTED_UPDATER, this, paramLong) != 0L));
      long l1;
      label171: 
      do
      {
        l1 = this.requested;
        long l2 = l1;
        while (true)
        {
          if (!this.it.hasNext())
            break label171;
          l2 -= 1L;
          if (l2 < 0L)
            break label171;
          if (this.o.isUnsubscribed())
            break;
          this.o.onNext(this.it.next());
        }
        if (!this.it.hasNext())
        {
          if (this.o.isUnsubscribed())
            break;
          this.o.onCompleted();
          return;
        }
      }
      while (REQUESTED_UPDATER.addAndGet(this, -l1) != 0L);
    }
  }
}