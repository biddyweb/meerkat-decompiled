package org.puremvc.java.multicore.interfaces;

public abstract interface INotifier
{
  public abstract void initializeNotifier(String paramString);

  public abstract void sendNotification(String paramString);

  public abstract void sendNotification(String paramString, Object paramObject);

  public abstract void sendNotification(String paramString1, Object paramObject, String paramString2);
}