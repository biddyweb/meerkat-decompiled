package com.google.common.eventbus;

import com.google.common.base.Objects;
import com.google.common.base.Throwables;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import com.google.common.reflect.TypeToken;
import com.google.common.reflect.TypeToken.TypeSet;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

class AnnotatedSubscriberFinder
  implements SubscriberFindingStrategy
{
  private static final LoadingCache<Class<?>, ImmutableList<Method>> subscriberMethodsCache = CacheBuilder.newBuilder().weakKeys().build(new CacheLoader()
  {
    public ImmutableList<Method> load(Class<?> paramAnonymousClass)
      throws Exception
    {
      return AnnotatedSubscriberFinder.getAnnotatedMethodsInternal(paramAnonymousClass);
    }
  });

  private static ImmutableList<Method> getAnnotatedMethods(Class<?> paramClass)
  {
    try
    {
      ImmutableList localImmutableList = (ImmutableList)subscriberMethodsCache.getUnchecked(paramClass);
      return localImmutableList;
    }
    catch (UncheckedExecutionException localUncheckedExecutionException)
    {
      throw Throwables.propagate(localUncheckedExecutionException.getCause());
    }
  }

  private static ImmutableList<Method> getAnnotatedMethodsInternal(Class<?> paramClass)
  {
    Set localSet = TypeToken.of(paramClass).getTypes().rawTypes();
    HashMap localHashMap = Maps.newHashMap();
    Iterator localIterator = localSet.iterator();
    while (localIterator.hasNext())
      for (Method localMethod : ((Class)localIterator.next()).getMethods())
        if ((localMethod.isAnnotationPresent(Subscribe.class)) && (!localMethod.isBridge()))
        {
          Class[] arrayOfClass = localMethod.getParameterTypes();
          if (arrayOfClass.length != 1)
          {
            String str = String.valueOf(String.valueOf(localMethod));
            int k = arrayOfClass.length;
            throw new IllegalArgumentException(128 + str.length() + "Method " + str + " has @Subscribe annotation, but requires " + k + " arguments.  Event subscriber methods must require a single argument.");
          }
          MethodIdentifier localMethodIdentifier = new MethodIdentifier(localMethod);
          if (!localHashMap.containsKey(localMethodIdentifier))
            localHashMap.put(localMethodIdentifier, localMethod);
        }
    return ImmutableList.copyOf(localHashMap.values());
  }

  private static EventSubscriber makeSubscriber(Object paramObject, Method paramMethod)
  {
    if (methodIsDeclaredThreadSafe(paramMethod))
      return new EventSubscriber(paramObject, paramMethod);
    return new SynchronizedEventSubscriber(paramObject, paramMethod);
  }

  private static boolean methodIsDeclaredThreadSafe(Method paramMethod)
  {
    return paramMethod.getAnnotation(AllowConcurrentEvents.class) != null;
  }

  public Multimap<Class<?>, EventSubscriber> findAllSubscribers(Object paramObject)
  {
    HashMultimap localHashMultimap = HashMultimap.create();
    Iterator localIterator = getAnnotatedMethods(paramObject.getClass()).iterator();
    while (localIterator.hasNext())
    {
      Method localMethod = (Method)localIterator.next();
      localHashMultimap.put(localMethod.getParameterTypes()[0], makeSubscriber(paramObject, localMethod));
    }
    return localHashMultimap;
  }

  private static final class MethodIdentifier
  {
    private final String name;
    private final List<Class<?>> parameterTypes;

    MethodIdentifier(Method paramMethod)
    {
      this.name = paramMethod.getName();
      this.parameterTypes = Arrays.asList(paramMethod.getParameterTypes());
    }

    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool1 = paramObject instanceof MethodIdentifier;
      boolean bool2 = false;
      if (bool1)
      {
        MethodIdentifier localMethodIdentifier = (MethodIdentifier)paramObject;
        boolean bool3 = this.name.equals(localMethodIdentifier.name);
        bool2 = false;
        if (bool3)
        {
          boolean bool4 = this.parameterTypes.equals(localMethodIdentifier.parameterTypes);
          bool2 = false;
          if (bool4)
            bool2 = true;
        }
      }
      return bool2;
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = this.name;
      arrayOfObject[1] = this.parameterTypes;
      return Objects.hashCode(arrayOfObject);
    }
  }
}