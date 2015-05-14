package co.getair.meerkat.commands;

import co.getair.meerkat.proxies.InboxProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class GetInboxCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ((InboxProxy)getFacade().retrieveProxy("inboxProxy")).fetchInbox();
  }
}