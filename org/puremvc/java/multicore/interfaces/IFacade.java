package org.puremvc.java.multicore.interfaces;

public abstract interface IFacade extends INotifier
{
  public abstract boolean hasCommand(String paramString);

  public abstract boolean hasMediator(String paramString);

  public abstract boolean hasProxy(String paramString);

  public abstract void registerCommand(String paramString, ICommand paramICommand);

  public abstract void registerMediator(IMediator paramIMediator);

  public abstract void registerProxy(IProxy paramIProxy);

  public abstract void removeCommand(String paramString);

  public abstract IMediator removeMediator(String paramString);

  public abstract IProxy removeProxy(String paramString);

  public abstract IMediator retrieveMediator(String paramString);

  public abstract IProxy retrieveProxy(String paramString);
}