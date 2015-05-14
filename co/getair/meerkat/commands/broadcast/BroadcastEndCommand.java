package co.getair.meerkat.commands.broadcast;

import co.getair.meerkat.facades.BroadcastActivityFacade;
import co.getair.meerkat.mediators.BroadcastMediator;
import co.getair.meerkat.proxies.StreamActivitiesProxy;
import co.getair.meerkat.proxies.StreamWatchersProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class BroadcastEndCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    getFacade().removeProxy("broadcastProxy");
    getFacade().removeProxy("mixpanelProxy");
    getFacade().removeMediator(BroadcastMediator.NAME());
    getFacade().removeCommand("commentsOnVideoMediator");
    getFacade().removeProxy("gpsProxy");
    getFacade().removeProxy(StreamActivitiesProxy.NAME());
    getFacade().removeProxy(StreamWatchersProxy.NAME());
    BroadcastActivityFacade.removeCore("BroadcastActivity");
  }
}