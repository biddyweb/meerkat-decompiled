package co.getair.meerkat.commands.login;

import co.getair.meerkat.proxies.SessionProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class LoginCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ((SessionProxy)getFacade().retrieveProxy("sessionProxy")).startLoginFlow();
  }
}