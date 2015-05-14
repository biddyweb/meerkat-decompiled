package com.google.common.eventbus;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.common.collect.SetMultimap;
import com.google.common.reflect.TypeToken;
import com.google.common.reflect.TypeToken.TypeSet;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.logging.Level;
import java.util.logging.Logger;

@Beta
public class EventBus
{
  private static final LoadingCache<Class<?>, Set<Class<?>>> flattenHierarchyCache = CacheBuilder.newBuilder().weakKeys().build(new CacheLoader()
  {
    public Set<Class<?>> load(Class<?> paramAnonymousClass)
    {
      return TypeToken.of(paramAnonymousClass).getTypes().rawTypes();
    }
  });
  private final ThreadLocal<Queue<EventWithSubscriber>> eventsToDispatch = new ThreadLocal()
  {
    protected Queue<EventBus.EventWithSubscriber> initialValue()
    {
      return new LinkedList();
    }
  };
  private final SubscriberFindingStrategy finder = new AnnotatedSubscriberFinder();
  private final ThreadLocal<Boolean> isDispatching = new ThreadLocal()
  {
    protected Boolean initialValue()
    {
      return Boolean.valueOf(false);
    }
  };
  private SubscriberExceptionHandler subscriberExceptionHandler;
  private final SetMultimap<Class<?>, EventSubscriber> subscribersByType = HashMultimap.create();
  private final ReadWriteLock subscribersByTypeLock = new ReentrantReadWriteLock();

  public EventBus()
  {
    this("default");
  }

  public EventBus(SubscriberExceptionHandler paramSubscriberExceptionHandler)
  {
    this.subscriberExceptionHandler = ((SubscriberExceptionHandler)Preconditions.checkNotNull(paramSubscriberExceptionHandler));
  }

  public EventBus(String paramString)
  {
    this(new LoggingSubscriberExceptionHandler(paramString));
  }

  void dispatch(Object paramObject, EventSubscriber paramEventSubscriber)
  {
    try
    {
      paramEventSubscriber.handleEvent(paramObject);
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      try
      {
        this.subscriberExceptionHandler.handleException(localInvocationTargetException.getCause(), new SubscriberExceptionContext(this, paramObject, paramEventSubscriber.getSubscriber(), paramEventSubscriber.getMethod()));
        return;
      }
      catch (Throwable localThrowable)
      {
        Logger localLogger = Logger.getLogger(EventBus.class.getName());
        Level localLevel = Level.SEVERE;
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = localThrowable;
        arrayOfObject[1] = localInvocationTargetException.getCause();
        localLogger.log(localLevel, String.format("Exception %s thrown while handling exception: %s", arrayOfObject), localThrowable);
      }
    }
  }

  void dispatchQueuedEvents()
  {
    if (((Boolean)this.isDispatching.get()).booleanValue())
      return;
    this.isDispatching.set(Boolean.valueOf(true));
    try
    {
      Queue localQueue = (Queue)this.eventsToDispatch.get();
      while (true)
      {
        EventWithSubscriber localEventWithSubscriber = (EventWithSubscriber)localQueue.poll();
        if (localEventWithSubscriber == null)
          break;
        dispatch(localEventWithSubscriber.event, localEventWithSubscriber.subscriber);
      }
    }
    finally
    {
      this.isDispatching.remove();
      this.eventsToDispatch.remove();
    }
    this.isDispatching.remove();
    this.eventsToDispatch.remove();
  }

  void enqueueEvent(Object paramObject, EventSubscriber paramEventSubscriber)
  {
    ((Queue)this.eventsToDispatch.get()).offer(new EventWithSubscriber(paramObject, paramEventSubscriber));
  }

  @VisibleForTesting
  Set<Class<?>> flattenHierarchy(Class<?> paramClass)
  {
    try
    {
      Set localSet = (Set)flattenHierarchyCache.getUnchecked(paramClass);
      return localSet;
    }
    catch (UncheckedExecutionException localUncheckedExecutionException)
    {
      throw Throwables.propagate(localUncheckedExecutionException.getCause());
    }
  }

  public void post(Object paramObject)
  {
    Set localSet1 = flattenHierarchy(paramObject.getClass());
    int i = 0;
    Iterator localIterator1 = localSet1.iterator();
    while (localIterator1.hasNext())
    {
      Class localClass = (Class)localIterator1.next();
      this.subscribersByTypeLock.readLock().lock();
      try
      {
        Set localSet2 = this.subscribersByType.get(localClass);
        if (!localSet2.isEmpty())
        {
          i = 1;
          Iterator localIterator2 = localSet2.iterator();
          while (localIterator2.hasNext())
            enqueueEvent(paramObject, (EventSubscriber)localIterator2.next());
        }
      }
      finally
      {
        this.subscribersByTypeLock.readLock().unlock();
      }
      this.subscribersByTypeLock.readLock().unlock();
    }
    if ((i == 0) && (!(paramObject instanceof DeadEvent)))
      post(new DeadEvent(this, paramObject));
    dispatchQueuedEvents();
  }

  public void register(Object paramObject)
  {
    Multimap localMultimap = this.finder.findAllSubscribers(paramObject);
    this.subscribersByTypeLock.writeLock().lock();
    try
    {
      this.subscribersByType.putAll(localMultimap);
      return;
    }
    finally
    {
      this.subscribersByTypeLock.writeLock().unlock();
    }
  }

  public void unregister(Object paramObject)
  {
    Iterator localIterator = this.finder.findAllSubscribers(paramObject).asMap().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Class localClass = (Class)localEntry.getKey();
      Collection localCollection = (Collection)localEntry.getValue();
      this.subscribersByTypeLock.writeLock().lock();
      Set localSet;
      try
      {
        localSet = this.subscribersByType.get(localClass);
        if (!localSet.containsAll(localCollection))
        {
          String str = String.valueOf(String.valueOf(paramObject));
          throw new IllegalArgumentException(65 + str.length() + "missing event subscriber for an annotated method. Is " + str + " registered?");
        }
      }
      finally
      {
        this.subscribersByTypeLock.writeLock().unlock();
      }
      localSet.removeAll(localCollection);
      this.subscribersByTypeLock.writeLock().unlock();
    }
  }

  static class EventWithSubscriber
  {
    final Object event;
    final EventSubscriber subscriber;

    public EventWithSubscriber(Object paramObject, EventSubscriber paramEventSubscriber)
    {
      this.event = Preconditions.checkNotNull(paramObject);
      this.subscriber = ((EventSubscriber)Preconditions.checkNotNull(paramEventSubscriber));
    }
  }

  private static final class LoggingSubscriberExceptionHandler
    implements SubscriberExceptionHandler
  {
    private final Logger logger;

    public LoggingSubscriberExceptionHandler(String paramString)
    {
      String str1 = String.valueOf(String.valueOf(EventBus.class.getName()));
      String str2 = String.valueOf(String.valueOf((String)Preconditions.checkNotNull(paramString)));
      this.logger = Logger.getLogger(1 + str1.length() + str2.length() + str1 + "." + str2);
    }

    public void handleException(Throwable paramThrowable, SubscriberExceptionContext paramSubscriberExceptionContext)
    {
      Logger localLogger = this.logger;
      Level localLevel = Level.SEVERE;
      String str1 = String.valueOf(String.valueOf(paramSubscriberExceptionContext.getSubscriber()));
      String str2 = String.valueOf(String.valueOf(paramSubscriberExceptionContext.getSubscriberMethod()));
      localLogger.log(localLevel, 30 + str1.length() + str2.length() + "Could not dispatch event: " + str1 + " to " + str2, paramThrowable.getCause());
    }
  }
}