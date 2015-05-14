package co.getair.meerkat.commands.watch;

import co.getair.meerkat.facades.WatchActivityFacade;
import co.getair.meerkat.proxies.StreamActivitiesProxy;
import co.getair.meerkat.proxies.StreamWatchersProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class WatcherEndCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    getFacade().removeProxy("watchProxy");
    getFacade().removeProxy("sessionProxy");
    getFacade().removeProxy("mixpanelProxy");
    getFacade().removeMediator("watchMediator");
    getFacade().removeCommand("commentsOnVideoMediator");
    getFacade().removeProxy(StreamActivitiesProxy.NAME());
    getFacade().removeProxy(StreamWatchersProxy.NAME());
    WatchActivityFacade.removeCore("WatchActivity");
  }
}