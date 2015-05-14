package co.getair.meerkat.commands.schedule;

import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.ScheduleBroadcastParams;
import co.getair.meerkat.proxies.ScheduleBroadcastProxy;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ScheduleBroadcastCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ScheduleBroadcastParams localScheduleBroadcastParams = (ScheduleBroadcastParams)paramINotification.getBody();
    ((ScheduleBroadcastProxy)getFacade().retrieveProxy("scheduleBroadcastProxy")).scheduleBroadcast(localScheduleBroadcastParams);
    JSONObject localJSONObject = new JSONObject();
    try
    {
      if (localScheduleBroadcastParams.getCoverImage() != null);
      for (boolean bool = true; ; bool = false)
      {
        localJSONObject.put("has photo", bool);
        localJSONObject.put("caption", localScheduleBroadcastParams.getCaption());
        localJSONObject.put("future time", localScheduleBroadcastParams.getTimeOfBroadcast());
        sendNotification("trackMixpanelEvent", new MixpanelEventParams("schedule", localJSONObject), null);
        sendNotification("incrementPeopleProperty", "schedule count", null);
        return;
      }
    }
    catch (Exception localException)
    {
      while (true)
        localException.printStackTrace();
    }
  }
}