package rx.subscriptions;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import rx.Subscription;
import rx.exceptions.Exceptions;

public final class CompositeSubscription
  implements Subscription
{
  private Set<Subscription> subscriptions;
  private volatile boolean unsubscribed;

  public CompositeSubscription()
  {
  }

  public CompositeSubscription(Subscription[] paramArrayOfSubscription)
  {
    this.subscriptions = new HashSet(Arrays.asList(paramArrayOfSubscription));
  }

  private static void unsubscribeFromAll(Collection<Subscription> paramCollection)
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

  public void add(Subscription paramSubscription)
  {
    if (paramSubscription.isUnsubscribed())
      return;
    if (!this.unsubscribed)
      try
      {
        if (!this.unsubscribed)
        {
          if (this.subscriptions == null)
            this.subscriptions = new HashSet(4);
          this.subscriptions.add(paramSubscription);
          return;
        }
      }
      finally
      {
      }
    paramSubscription.unsubscribe();
  }

  public void clear()
  {
    if (!this.unsubscribed)
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

  public boolean hasSubscriptions()
  {
    if (!this.unsubscribed)
      try
      {
        boolean bool1 = this.unsubscribed;
        boolean bool2 = false;
        if (!bool1)
        {
          Set localSet = this.subscriptions;
          bool2 = false;
          if (localSet != null)
          {
            boolean bool3 = this.subscriptions.isEmpty();
            bool2 = false;
            if (!bool3)
              bool2 = true;
          }
        }
        return bool2;
      }
      finally
      {
      }
    return false;
  }

  public boolean isUnsubscribed()
  {
    return this.unsubscribed;
  }

  public void remove(Subscription paramSubscription)
  {
    if (!this.unsubscribed)
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
    if (!this.unsubscribed)
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