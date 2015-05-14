package org.puremvc.java.multicore.interfaces;

public abstract interface INotification
{
  public abstract Object getBody();

  public abstract String getName();

  public abstract String getType();

  public abstract void setBody(Object paramObject);

  public abstract void setType(String paramString);

  public abstract String toString();
}