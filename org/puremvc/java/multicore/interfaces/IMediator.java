package org.puremvc.java.multicore.interfaces;

public abstract interface IMediator extends INotifier
{
  public abstract String getMediatorName();

  public abstract Object getViewComponent();

  public abstract void handleNotification(INotification paramINotification);

  public abstract String[] listNotificationInterests();

  public abstract void onRegister();

  public abstract void onRemove();

  public abstract void setViewComponent(Object paramObject);
}