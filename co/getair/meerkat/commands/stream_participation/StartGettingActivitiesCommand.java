package co.getair.meerkat.commands.stream_participation;

import co.getair.meerkat.proxies.StreamActivitiesProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class StartGettingActivitiesCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ((StreamActivitiesProxy)getFacade().retrieveProxy(StreamActivitiesProxy.NAME())).getActivities();
  }
}