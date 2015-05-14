package co.getair.meerkat.commands.mixpanel;

import co.getair.meerkat.proxies.MixpanelProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class DecrementPeolpePropertyCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    String str = (String)paramINotification.getBody();
    ((MixpanelProxy)getFacade().retrieveProxy("mixpanelProxy")).decrementPeopleProperty(str);
  }
}