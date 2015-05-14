package org.puremvc.java.multicore.patterns.mediator;

import org.puremvc.java.multicore.interfaces.IMediator;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.interfaces.INotifier;
import org.puremvc.java.multicore.patterns.observer.Notifier;

public class Mediator extends Notifier
  implements IMediator, INotifier
{
  public static final String NAME = "Mediator";
  protected String mediatorName = null;
  protected Object viewComponent = null;

  public Mediator()
  {
  }

  public Mediator(String paramString, Object paramObject)
  {
    init(paramString, paramObject);
  }

  public final String getMediatorName()
  {
    return this.mediatorName;
  }

  public Object getViewComponent()
  {
    return this.viewComponent;
  }

  public void handleNotification(INotification paramINotification)
  {
  }

  public void init(String paramString, Object paramObject)
  {
    if (paramString != null);
    while (true)
    {
      this.mediatorName = paramString;
      this.viewComponent = paramObject;
      return;
      paramString = "Mediator";
    }
  }

  public String[] listNotificationInterests()
  {
    return new String[0];
  }

  public void onRegister()
  {
  }

  public void onRemove()
  {
  }

  public void setViewComponent(Object paramObject)
  {
    this.viewComponent = paramObject;
  }
}