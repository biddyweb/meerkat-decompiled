package co.getair.meerkat.commands;

import co.getair.meerkat.dtos.IUserToFollow;
import co.getair.meerkat.proxies.GraphProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class UnfollowUserCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    IUserToFollow localIUserToFollow = (IUserToFollow)paramINotification.getBody();
    ((GraphProxy)getFacade().retrieveProxy("graphProxy")).unfollowUser(localIUserToFollow);
  }
}