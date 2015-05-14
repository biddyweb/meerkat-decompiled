package com.google.common.eventbus;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

final class SynchronizedEventSubscriber extends EventSubscriber
{
  public SynchronizedEventSubscriber(Object paramObject, Method paramMethod)
  {
    super(paramObject, paramMethod);
  }

  public void handleEvent(Object paramObject)
    throws InvocationTargetException
  {
    try
    {
      super.handleEvent(paramObject);
      return;
    }
    finally
    {
    }
  }
}