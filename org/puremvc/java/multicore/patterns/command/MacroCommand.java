package org.puremvc.java.multicore.patterns.command;

import java.util.Collection;
import java.util.Iterator;
import org.puremvc.java.multicore.interfaces.ICommand;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.observer.Notifier;

public class MacroCommand extends Notifier
  implements ICommand
{
  private Collection<ICommand> subCommands = null;

  public MacroCommand()
  {
    initializeMacroCommand();
  }

  protected void addSubCommand(ICommand paramICommand)
  {
    this.subCommands.add(paramICommand);
  }

  public void execute(INotification paramINotification)
  {
    Iterator localIterator = this.subCommands.iterator();
    while (localIterator.hasNext())
    {
      ICommand localICommand = (ICommand)localIterator.next();
      localICommand.initializeNotifier(this.multitonKey);
      localICommand.execute(paramINotification);
    }
  }

  protected void initializeMacroCommand()
  {
  }
}