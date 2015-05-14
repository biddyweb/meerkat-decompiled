package co.getair.meerkat.commands.mixpanel;

import co.getair.meerkat.proxies.MixpanelProxy;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class SetMixpanelSuperPropertiesCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    JSONObject localJSONObject = (JSONObject)paramINotification.getBody();
    ((MixpanelProxy)getFacade().retrieveProxy("mixpanelProxy")).setSuperProperties(localJSONObject);
  }
}