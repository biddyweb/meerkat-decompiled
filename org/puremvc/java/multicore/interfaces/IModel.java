package org.puremvc.java.multicore.interfaces;

public abstract interface IModel
{
  public abstract boolean hasProxy(String paramString);

  public abstract void registerProxy(IProxy paramIProxy);

  public abstract IProxy removeProxy(String paramString);

  public abstract IProxy retrieveProxy(String paramString);
}