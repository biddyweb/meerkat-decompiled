package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.annotation.Nullable;

class EventSubscriber
{
  private final Method method;
  private final Object target;

  EventSubscriber(Object paramObject, Method paramMethod)
  {
    Preconditions.checkNotNull(paramObject, "EventSubscriber target cannot be null.");
    Preconditions.checkNotNull(paramMethod, "EventSubscriber method cannot be null.");
    this.target = paramObject;
    this.method = paramMethod;
    paramMethod.setAccessible(true);
  }

  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool1 = paramObject instanceof EventSubscriber;
    boolean bool2 = false;
    if (bool1)
    {
      EventSubscriber localEventSubscriber = (EventSubscriber)paramObject;
      Object localObject1 = this.target;
      Object localObject2 = localEventSubscriber.target;
      bool2 = false;
      if (localObject1 == localObject2)
      {
        boolean bool3 = this.method.equals(localEventSubscriber.method);
        bool2 = false;
        if (bool3)
          bool2 = true;
      }
    }
    return bool2;
  }

  public Method getMethod()
  {
    return this.method;
  }

  public Object getSubscriber()
  {
    return this.target;
  }

  public void handleEvent(Object paramObject)
    throws InvocationTargetException
  {
    Preconditions.checkNotNull(paramObject);
    try
    {
      this.method.invoke(this.target, new Object[] { paramObject });
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      String str2 = String.valueOf(String.valueOf(paramObject));
      throw new Error(33 + str2.length() + "Method rejected target/argument: " + str2, localIllegalArgumentException);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      String str1 = String.valueOf(String.valueOf(paramObject));
      throw new Error(28 + str1.length() + "Method became inaccessible: " + str1, localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      if ((localInvocationTargetException.getCause() instanceof Error))
        throw ((Error)localInvocationTargetException.getCause());
      throw localInvocationTargetException;
    }
  }

  public int hashCode()
  {
    return 31 * (31 + this.method.hashCode()) + System.identityHashCode(this.target);
  }

  public String toString()
  {
    String str = String.valueOf(String.valueOf(this.method));
    return 10 + str.length() + "[wrapper " + str + "]";
  }
}