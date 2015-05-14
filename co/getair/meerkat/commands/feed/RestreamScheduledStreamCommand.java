package co.getair.meerkat.commands.feed;

import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.feed.ScheduledBroadcastSummary;
import co.getair.meerkat.dtos.feed.StreamFeedScheduledItemProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class RestreamScheduledStreamCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    final StreamFeedScheduledItemProxy localStreamFeedScheduledItemProxy = (StreamFeedScheduledItemProxy)paramINotification.getBody();
    localStreamFeedScheduledItemProxy.restreamSchduledStream(new RunnableWithResultObject()
    {
      public void run()
      {
        JSONObject localJSONObject;
        if (this.success)
          localJSONObject = new JSONObject();
        try
        {
          localJSONObject.put("type", "schedule");
          MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("restream", localJSONObject);
          RestreamScheduledStreamCommand.this.sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
          RestreamScheduledStreamCommand.this.sendNotification("scheduledEventRestreamedCommand", localStreamFeedScheduledItemProxy.getBroadcastSummary().getTweetId(), null);
          return;
        }
        catch (JSONException localJSONException)
        {
          while (true)
            localJSONException.printStackTrace();
        }
      }
    });
  }
}