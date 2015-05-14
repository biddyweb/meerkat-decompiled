package org.puremvc.java.multicore.interfaces;

public abstract interface IObserver
{
  public abstract boolean compareNotifyContext(Object paramObject);

  public abstract void notifyObserver(INotification paramINotification);

  public abstract void setNotifyContext(Object paramObject);

  public abstract void setNotifyMethod(IFunction paramIFunction);
}