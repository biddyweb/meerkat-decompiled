package co.getair.meerkat.commands.feed;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.feed.ScheduledBroadcastSummary;
import co.getair.meerkat.dtos.feed.StreamFeedScheduledItemProxy;
import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.notifications.PendingNotificationBroadcastReceiver;
import co.getair.meerkat.proxies.GraphProxy;
import java.util.List;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class UnsubscribeFromScheduledStreamCommand extends SimpleCommand
{
  private void unscheduleStreamNotification(ScheduledBroadcastSummary paramScheduledBroadcastSummary)
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    PendingIntent localPendingIntent = PendingNotificationBroadcastReceiver.createPendingNotificationIntent(localActivity, paramScheduledBroadcastSummary);
    ((AlarmManager)localActivity.getSystemService("alarm")).cancel(localPendingIntent);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    final StreamFeedScheduledItemProxy localStreamFeedScheduledItemProxy = (StreamFeedScheduledItemProxy)paramINotification.getBody();
    localStreamFeedScheduledItemProxy.unsubscribeToSchduledStream(new Runnable()
    {
      public void run()
      {
        UnsubscribeFromScheduledStreamCommand.this.unscheduleStreamNotification(localStreamFeedScheduledItemProxy.getBroadcastSummary());
        GraphProxy localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
        JSONObject localJSONObject = new JSONObject();
        long l1 = System.currentTimeMillis() / 1000L;
        long l2 = localStreamFeedScheduledItemProxy.getBroadcastSummary().getEndTime() - l1;
        try
        {
          localJSONObject.put("stream id", localStreamFeedScheduledItemProxy.getBroadcastSummary().getId());
          localJSONObject.put("subscribed", localStreamFeedScheduledItemProxy.getBroadcastSummary().getSubscribers().size());
          localJSONObject.put("is following", localGraphProxy.amIFollowingUser(localStreamFeedScheduledItemProxy.getBroadcastSummary().getBroadcaster().getId()));
          localJSONObject.put("time before", l2);
          MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("unsubscribe", localJSONObject);
          UnsubscribeFromScheduledStreamCommand.this.sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
          UnsubscribeFromScheduledStreamCommand.this.sendNotification("decrementPeopleProperty", "subscribe count", null);
          return;
        }
        catch (Exception localException)
        {
          while (true)
            localException.printStackTrace();
        }
      }
    });
  }
}