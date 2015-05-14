package org.puremvc.java.multicore.interfaces;

public abstract interface IProxy extends INotifier
{
  public abstract Object getData();

  public abstract String getProxyName();

  public abstract void onRegister();

  public abstract void onRemove();

  public abstract void setData(Object paramObject);
}