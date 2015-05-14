package rx.internal.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;
import rx.Subscription;
import rx.exceptions.Exceptions;

public final class SubscriptionList
  implements Subscription
{
  private final ReentrantLock lock = new ReentrantLock();
  private LinkedList<Subscription> subscriptions;
  private volatile boolean unsubscribed;

  public SubscriptionList()
  {
  }

  public SubscriptionList(Subscription paramSubscription)
  {
    this.subscriptions = new LinkedList();
    this.subscriptions.add(paramSubscription);
  }

  public SubscriptionList(Subscription[] paramArrayOfSubscription)
  {
    this.subscriptions = new LinkedList(Arrays.asList(paramArrayOfSubscription));
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
      this.lock.lock();
    try
    {
      if (!this.unsubscribed)
      {
        LinkedList localLinkedList = this.subscriptions;
        if (localLinkedList == null)
        {
          localLinkedList = new LinkedList();
          this.subscriptions = localLinkedList;
        }
        localLinkedList.add(paramSubscription);
        return;
      }
      this.lock.unlock();
      paramSubscription.unsubscribe();
      return;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public void clear()
  {
    if (!this.unsubscribed)
      this.lock.lock();
    try
    {
      LinkedList localLinkedList = this.subscriptions;
      this.subscriptions = null;
      this.lock.unlock();
      unsubscribeFromAll(localLinkedList);
      return;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public boolean hasSubscriptions()
  {
    boolean bool1 = this.unsubscribed;
    boolean bool2 = false;
    if (!bool1)
      this.lock.lock();
    try
    {
      boolean bool3 = this.unsubscribed;
      bool2 = false;
      if (!bool3)
      {
        LinkedList localLinkedList = this.subscriptions;
        bool2 = false;
        if (localLinkedList != null)
        {
          boolean bool4 = this.subscriptions.isEmpty();
          bool2 = false;
          if (!bool4)
            bool2 = true;
        }
      }
      return bool2;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public boolean isUnsubscribed()
  {
    return this.unsubscribed;
  }

  public void remove(Subscription paramSubscription)
  {
    if (!this.unsubscribed)
      this.lock.lock();
    try
    {
      LinkedList localLinkedList = this.subscriptions;
      boolean bool1 = this.unsubscribed;
      if ((bool1) || (localLinkedList == null));
      boolean bool2;
      do
      {
        return;
        bool2 = localLinkedList.remove(paramSubscription);
        this.lock.unlock();
      }
      while (!bool2);
      paramSubscription.unsubscribe();
      return;
    }
    finally
    {
      this.lock.unlock();
    }
  }

  public void unsubscribe()
  {
    if (!this.unsubscribed)
      this.lock.lock();
    try
    {
      boolean bool = this.unsubscribed;
      if (bool)
        return;
      this.unsubscribed = true;
      LinkedList localLinkedList = this.subscriptions;
      this.subscriptions = null;
      this.lock.unlock();
      unsubscribeFromAll(localLinkedList);
      return;
    }
    finally
    {
      this.lock.unlock();
    }
  }
}