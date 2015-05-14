package org.puremvc.java.multicore.patterns.command;

import org.puremvc.java.multicore.interfaces.ICommand;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.observer.Notifier;

public class SimpleCommand extends Notifier
  implements ICommand
{
  public void execute(INotification paramINotification)
  {
  }
}