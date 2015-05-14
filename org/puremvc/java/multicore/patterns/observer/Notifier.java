package org.puremvc.java.multicore.patterns.observer;

import org.puremvc.java.multicore.patterns.facade.Facade;

public class Notifier
{
  protected String multitonKey = null;

  protected Facade getFacade()
  {
    if (this.multitonKey == null)
      throw new RuntimeException("Notifier not initialized");
    return Facade.getInstance(this.multitonKey);
  }

  public void initializeNotifier(String paramString)
  {
    this.multitonKey = paramString;
  }

  public void sendNotification(String paramString)
  {
    getFacade().sendNotification(paramString);
  }

  public void sendNotification(String paramString, Object paramObject)
  {
    getFacade().sendNotification(paramString, paramObject);
  }

  public void sendNotification(String paramString1, Object paramObject, String paramString2)
  {
    getFacade().sendNotification(paramString1, paramObject, paramString2);
  }
}