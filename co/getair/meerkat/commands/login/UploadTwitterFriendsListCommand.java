package co.getair.meerkat.commands.login;

import co.getair.meerkat.proxies.SessionProxy;
import java.util.List;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class UploadTwitterFriendsListCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    List localList = (List)paramINotification.getBody();
    ((SessionProxy)getFacade().retrieveProxy("sessionProxy")).uploadTwitterFrindsList(localList);
  }
}