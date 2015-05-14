package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable.OnSubscribe;
import rx.Producer;
import rx.Subscriber;

public final class OnSubscribeRange
  implements Observable.OnSubscribe<Integer>
{
  private final int end;
  private final int start;

  public OnSubscribeRange(int paramInt1, int paramInt2)
  {
    this.start = paramInt1;
    this.end = paramInt2;
  }

  public void call(Subscriber<? super Integer> paramSubscriber)
  {
    paramSubscriber.setProducer(new RangeProducer(paramSubscriber, this.start, this.end, null));
  }

  private static final class RangeProducer
    implements Producer
  {
    private static final AtomicLongFieldUpdater<RangeProducer> REQUESTED_UPDATER = AtomicLongFieldUpdater.newUpdater(RangeProducer.class, "requested");
    private final int end;
    private long index;
    private final Subscriber<? super Integer> o;
    private volatile long requested;

    private RangeProducer(Subscriber<? super Integer> paramSubscriber, int paramInt1, int paramInt2)
    {
      this.o = paramSubscriber;
      this.index = paramInt1;
      this.end = paramInt2;
    }

    public void request(long paramLong)
    {
      if (REQUESTED_UPDATER.get(this) == 9223372036854775807L);
      label80: 
      do
      {
        do
        {
          return;
          if (paramLong != 9223372036854775807L)
            break;
          REQUESTED_UPDATER.set(this, paramLong);
          for (long l7 = this.index; ; l7 += 1L)
          {
            if (l7 > this.end)
              break label80;
            if (this.o.isUnsubscribed())
              break;
            this.o.onNext(Integer.valueOf((int)l7));
          }
        }
        while (this.o.isUnsubscribed());
        this.o.onCompleted();
        return;
      }
      while ((paramLong <= 0L) || (BackpressureUtils.getAndAddRequest(REQUESTED_UPDATER, this, paramLong) != 0L));
      long l4;
      label215: 
      do
      {
        long l1 = this.requested;
        long l2 = this.index;
        long l3 = 1L + (this.end - l2);
        l4 = Math.min(l3, l1);
        if (l3 <= l1);
        long l5;
        for (int i = 1; ; i = 0)
        {
          l5 = l4 + l2;
          for (long l6 = l2; ; l6 += 1L)
          {
            if (l6 >= l5)
              break label215;
            if (this.o.isUnsubscribed())
              break;
            this.o.onNext(Integer.valueOf((int)l6));
          }
        }
        this.index = l5;
        if (i != 0)
        {
          this.o.onCompleted();
          return;
        }
      }
      while (REQUESTED_UPDATER.addAndGet(this, -l4) != 0L);
    }
  }
}