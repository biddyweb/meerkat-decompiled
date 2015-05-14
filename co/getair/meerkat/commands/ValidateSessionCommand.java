package co.getair.meerkat.commands;

import co.getair.meerkat.proxies.SessionProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ValidateSessionCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ((SessionProxy)getFacade().retrieveProxy("sessionProxy")).validateSession();
  }
}