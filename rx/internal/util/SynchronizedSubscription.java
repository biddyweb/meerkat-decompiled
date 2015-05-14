package rx.internal.util;

import rx.Subscription;

public class SynchronizedSubscription
  implements Subscription
{
  private final Subscription s;

  public SynchronizedSubscription(Subscription paramSubscription)
  {
    this.s = paramSubscription;
  }

  public boolean isUnsubscribed()
  {
    try
    {
      boolean bool = this.s.isUnsubscribed();
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void unsubscribe()
  {
    try
    {
      this.s.unsubscribe();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}