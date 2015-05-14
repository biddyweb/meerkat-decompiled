package rx.internal.util;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Subscription;
import rx.functions.Func1;

public final class SubscriptionIndexedRingBuffer<T extends Subscription>
  implements Subscription
{
  private static final Func1<Subscription, Boolean> UNSUBSCRIBE = new Func1()
  {
    public Boolean call(Subscription paramAnonymousSubscription)
    {
      paramAnonymousSubscription.unsubscribe();
      return Boolean.TRUE;
    }
  };
  private static final AtomicIntegerFieldUpdater<SubscriptionIndexedRingBuffer> UNSUBSCRIBED = AtomicIntegerFieldUpdater.newUpdater(SubscriptionIndexedRingBuffer.class, "unsubscribed");
  private volatile IndexedRingBuffer<T> subscriptions = IndexedRingBuffer.getInstance();
  private volatile int unsubscribed = 0;

  public SubscriptionIndexedRingBuffer()
  {
  }

  public SubscriptionIndexedRingBuffer(T[] paramArrayOfT)
  {
    int i = paramArrayOfT.length;
    for (int j = 0; j < i; j++)
    {
      T ? = paramArrayOfT[j];
      this.subscriptions.add(?);
    }
  }

  private static void unsubscribeFromAll(IndexedRingBuffer<? extends Subscription> paramIndexedRingBuffer)
  {
    if (paramIndexedRingBuffer == null)
      return;
    paramIndexedRingBuffer.forEach(UNSUBSCRIBE);
  }

  public int add(T paramT)
  {
    try
    {
      int i;
      if ((this.unsubscribed == 1) || (this.subscriptions == null))
      {
        paramT.unsubscribe();
        i = -1;
      }
      while (true)
      {
        return i;
        i = this.subscriptions.add(paramT);
        if (this.unsubscribed == 1)
          paramT.unsubscribe();
      }
    }
    finally
    {
    }
  }

  public int forEach(Func1<T, Boolean> paramFunc1)
  {
    return forEach(paramFunc1, 0);
  }

  public int forEach(Func1<T, Boolean> paramFunc1, int paramInt)
  {
    try
    {
      if (this.unsubscribed != 1)
      {
        IndexedRingBuffer localIndexedRingBuffer = this.subscriptions;
        if (localIndexedRingBuffer != null)
          break label29;
      }
      label29: int j;
      for (int i = 0; ; i = j)
      {
        return i;
        j = this.subscriptions.forEach(paramFunc1, paramInt);
      }
    }
    finally
    {
    }
  }

  public boolean isUnsubscribed()
  {
    return this.unsubscribed == 1;
  }

  public void remove(int paramInt)
  {
    if ((this.unsubscribed == 1) || (this.subscriptions == null) || (paramInt < 0));
    Subscription localSubscription;
    do
    {
      return;
      localSubscription = (Subscription)this.subscriptions.remove(paramInt);
    }
    while ((localSubscription == null) || (localSubscription == null));
    localSubscription.unsubscribe();
  }

  public void removeSilently(int paramInt)
  {
    if ((this.unsubscribed == 1) || (this.subscriptions == null) || (paramInt < 0))
      return;
    this.subscriptions.remove(paramInt);
  }

  public void unsubscribe()
  {
    if ((UNSUBSCRIBED.compareAndSet(this, 0, 1)) && (this.subscriptions != null))
    {
      unsubscribeFromAll(this.subscriptions);
      IndexedRingBuffer localIndexedRingBuffer = this.subscriptions;
      this.subscriptions = null;
      localIndexedRingBuffer.unsubscribe();
    }
  }
}