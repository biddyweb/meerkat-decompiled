package org.puremvc.java.multicore.patterns.observer;

import org.puremvc.java.multicore.interfaces.IFunction;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.interfaces.IObserver;

public class Observer
  implements IObserver
{
  private Object context;
  private IFunction notify;

  public Observer(IFunction paramIFunction, Object paramObject)
  {
    setNotifyContext(paramObject);
    setNotifyMethod(paramIFunction);
  }

  public boolean compareNotifyContext(Object paramObject)
  {
    return this.context == paramObject;
  }

  public Object getNotifyContext()
  {
    return this.context;
  }

  public IFunction getNotifyMethod()
  {
    return this.notify;
  }

  public void notifyObserver(INotification paramINotification)
  {
    getNotifyMethod().onNotification(paramINotification);
  }

  public void setNotifyContext(Object paramObject)
  {
    this.context = paramObject;
  }

  public void setNotifyMethod(IFunction paramIFunction)
  {
    this.notify = paramIFunction;
  }
}