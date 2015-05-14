package co.getair.meerkat.commands.mixpanel;

import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.proxies.MixpanelProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class TrackEventCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    MixpanelEventParams localMixpanelEventParams = (MixpanelEventParams)paramINotification.getBody();
    ((MixpanelProxy)getFacade().retrieveProxy("mixpanelProxy")).trackEvent(localMixpanelEventParams.getEventName(), localMixpanelEventParams.getEventProperties());
  }
}