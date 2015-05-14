package org.puremvc.java.multicore.interfaces;

public abstract interface IController
{
  public abstract void executeCommand(INotification paramINotification);

  public abstract boolean hasCommand(String paramString);

  public abstract void registerCommand(String paramString, ICommand paramICommand);

  public abstract void removeCommand(String paramString);
}