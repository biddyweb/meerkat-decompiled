package rx.internal.operators;

import java.util.ArrayDeque;
import java.util.Deque;
import rx.Observable.Operator;
import rx.Subscriber;

public final class OperatorTakeLast<T>
  implements Observable.Operator<T, T>
{
  private final int count;

  public OperatorTakeLast(int paramInt)
  {
    if (paramInt < 0)
      throw new IndexOutOfBoundsException("count could not be negative");
    this.count = paramInt;
  }

  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    final ArrayDeque localArrayDeque = new ArrayDeque();
    final NotificationLite localNotificationLite = NotificationLite.instance();
    final TakeLastQueueProducer localTakeLastQueueProducer = new TakeLastQueueProducer(localNotificationLite, localArrayDeque, paramSubscriber);
    paramSubscriber.setProducer(localTakeLastQueueProducer);
    return new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        localArrayDeque.offer(localNotificationLite.completed());
        localTakeLastQueueProducer.startEmitting();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        localArrayDeque.clear();
        paramSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(T paramAnonymousT)
      {
        if (OperatorTakeLast.this.count == 0)
          return;
        if (localArrayDeque.size() == OperatorTakeLast.this.count)
          localArrayDeque.removeFirst();
        localArrayDeque.offerLast(localNotificationLite.next(paramAnonymousT));
      }

      public void onStart()
      {
        request(9223372036854775807L);
      }
    };
  }
}