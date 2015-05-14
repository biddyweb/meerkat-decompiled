package rx.internal.operators;

import java.util.Deque;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Producer;
import rx.Subscriber;

final class TakeLastQueueProducer<T>
  implements Producer
{
  private static final AtomicLongFieldUpdater<TakeLastQueueProducer> REQUESTED_UPDATER = AtomicLongFieldUpdater.newUpdater(TakeLastQueueProducer.class, "requested");
  private final Deque<Object> deque;
  private volatile boolean emittingStarted = false;
  private final NotificationLite<T> notification;
  private volatile long requested = 0L;
  private final Subscriber<? super T> subscriber;

  public TakeLastQueueProducer(NotificationLite<T> paramNotificationLite, Deque<Object> paramDeque, Subscriber<? super T> paramSubscriber)
  {
    this.notification = paramNotificationLite;
    this.deque = paramDeque;
    this.subscriber = paramSubscriber;
  }

  void emit(long paramLong)
  {
    if (this.requested == 9223372036854775807L)
      if (paramLong != 0L);
    while (paramLong != 0L)
      try
      {
        Iterator localIterator = this.deque.iterator();
        while (localIterator.hasNext())
        {
          Object localObject3 = localIterator.next();
          boolean bool = this.subscriber.isUnsubscribed();
          if (bool)
            return;
          this.notification.accept(this.subscriber, localObject3);
        }
      }
      catch (Throwable localThrowable)
      {
        this.subscriber.onError(localThrowable);
        return;
        return;
      }
      finally
      {
        this.deque.clear();
      }
    label205: long l3;
    do
    {
      long l1 = this.requested;
      for (int i = 0; ; i++)
      {
        l1 -= 1L;
        if (l1 < 0L)
          break label205;
        Object localObject1 = this.deque.poll();
        if (localObject1 == null)
          break label205;
        if ((this.subscriber.isUnsubscribed()) || (this.notification.accept(this.subscriber, localObject1)))
          break;
      }
      long l2;
      do
      {
        l2 = this.requested;
        l3 = l2 - i;
        if (l2 == 9223372036854775807L)
          break;
      }
      while (!REQUESTED_UPDATER.compareAndSet(this, l2, l3));
    }
    while (l3 != 0L);
  }

  public void request(long paramLong)
  {
    if (this.requested == 9223372036854775807L);
    while (true)
    {
      return;
      if (paramLong == 9223372036854775807L);
      for (long l = REQUESTED_UPDATER.getAndSet(this, 9223372036854775807L); this.emittingStarted; l = REQUESTED_UPDATER.getAndAdd(this, paramLong))
      {
        emit(l);
        return;
      }
    }
  }

  void startEmitting()
  {
    if (!this.emittingStarted)
    {
      this.emittingStarted = true;
      emit(0L);
    }
  }
}