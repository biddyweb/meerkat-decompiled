package rx.internal.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import rx.Subscription;
import rx.exceptions.Exceptions;
import rx.functions.Action1;

public final class SubscriptionRandomList<T extends Subscription>
  implements Subscription
{
  private Set<T> subscriptions;
  private boolean unsubscribed = false;

  public SubscriptionRandomList()
  {
  }

  public SubscriptionRandomList(T[] paramArrayOfT)
  {
    this.subscriptions = new HashSet(Arrays.asList(paramArrayOfT));
  }

  private static <T extends Subscription> void unsubscribeFromAll(Collection<T> paramCollection)
  {
    if (paramCollection == null)
      return;
    ArrayList localArrayList = null;
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext())
    {
      Subscription localSubscription = (Subscription)localIterator.next();
      try
      {
        localSubscription.unsubscribe();
      }
      catch (Throwable localThrowable)
      {
        if (localArrayList == null)
          localArrayList = new ArrayList();
        localArrayList.add(localThrowable);
      }
    }
    Exceptions.throwIfAny(localArrayList);
  }

  public void add(T paramT)
  {
    try
    {
      if (this.unsubscribed);
      for (T ? = paramT; ; ? = null)
      {
        if (? != null)
          ?.unsubscribe();
        return;
        if (this.subscriptions == null)
          this.subscriptions = new HashSet(4);
        this.subscriptions.add(paramT);
      }
    }
    finally
    {
    }
  }

  public void clear()
  {
    try
    {
      if ((this.unsubscribed) || (this.subscriptions == null))
        return;
      Set localSet = this.subscriptions;
      this.subscriptions = null;
      unsubscribeFromAll(localSet);
      return;
    }
    finally
    {
    }
  }

  public void forEach(Action1<T> paramAction1)
  {
    try
    {
      if ((this.unsubscribed) || (this.subscriptions == null))
        return;
      Subscription[] arrayOfSubscription = (Subscription[])this.subscriptions.toArray(null);
      int i = arrayOfSubscription.length;
      for (int j = 0; j < i; j++)
        paramAction1.call(arrayOfSubscription[j]);
    }
    finally
    {
    }
  }

  public boolean isUnsubscribed()
  {
    try
    {
      boolean bool = this.unsubscribed;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void remove(Subscription paramSubscription)
  {
    try
    {
      if ((this.unsubscribed) || (this.subscriptions == null))
        return;
      boolean bool = this.subscriptions.remove(paramSubscription);
      if (bool)
      {
        paramSubscription.unsubscribe();
        return;
      }
    }
    finally
    {
    }
  }

  public void unsubscribe()
  {
    try
    {
      if (this.unsubscribed)
        return;
      this.unsubscribed = true;
      Set localSet = this.subscriptions;
      this.subscriptions = null;
      unsubscribeFromAll(localSet);
      return;
    }
    finally
    {
    }
  }
}