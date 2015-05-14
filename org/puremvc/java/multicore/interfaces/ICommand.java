package org.puremvc.java.multicore.interfaces;

public abstract interface ICommand extends INotifier
{
  public abstract void execute(INotification paramINotification);
}