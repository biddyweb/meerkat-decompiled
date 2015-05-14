package org.puremvc.java.multicore.interfaces;

public abstract interface IView
{
  public abstract boolean hasMediator(String paramString);

  public abstract void notifyObservers(INotification paramINotification);

  public abstract void registerMediator(IMediator paramIMediator);

  public abstract void registerObserver(String paramString, IObserver paramIObserver);

  public abstract IMediator removeMediator(String paramString);

  public abstract IMediator retrieveMediator(String paramString);
}