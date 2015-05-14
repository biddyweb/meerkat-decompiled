package co.getair.meerkat.commands.broadcast;

import co.getair.meerkat.dtos.watch_broadcast.StreamStats;
import co.getair.meerkat.proxies.BroadcastProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class UpdateStreamStateCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    StreamStats localStreamStats = (StreamStats)paramINotification.getBody();
    ((BroadcastProxy)getFacade().retrieveProxy("broadcastProxy")).updateStreamStats(localStreamStats);
  }
}