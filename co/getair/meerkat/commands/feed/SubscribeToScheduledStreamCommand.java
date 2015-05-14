package co.getair.meerkat.commands.feed;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.DidSubscribeParams;
import co.getair.meerkat.dtos.MixpanelEventParams;
import co.getair.meerkat.dtos.feed.ScheduledBroadcastSummary;
import co.getair.meerkat.dtos.feed.StreamFeedScheduledItemProxy;
import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.notifications.PendingNotificationBroadcastReceiver;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import java.util.List;
import org.joda.time.Duration;
import org.joda.time.Instant;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class SubscribeToScheduledStreamCommand extends SimpleCommand
{
  private void scheduleStreamNotification(ScheduledBroadcastSummary paramScheduledBroadcastSummary)
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    PendingIntent localPendingIntent = PendingNotificationBroadcastReceiver.createPendingNotificationIntent(localActivity, paramScheduledBroadcastSummary);
    Instant localInstant = new Instant(1000L * paramScheduledBroadcastSummary.getEndTime()).minus(Duration.standardMinutes(1L));
    ((AlarmManager)localActivity.getSystemService("alarm")).set(0, localInstant.getMillis(), localPendingIntent);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    final StreamFeedScheduledItemProxy localStreamFeedScheduledItemProxy = (StreamFeedScheduledItemProxy)paramINotification.getBody();
    localStreamFeedScheduledItemProxy.subscribeToSchduledStream(new RunnableWithResultObject()
    {
      public void run()
      {
        GraphProxy localGraphProxy;
        JSONObject localJSONObject;
        long l2;
        if (this.success)
        {
          SubscribeToScheduledStreamCommand.this.sendNotification("scheduledEventSubscribedCommand", this.val$didSubscribeParams, null);
          SubscribeToScheduledStreamCommand.this.scheduleStreamNotification(localStreamFeedScheduledItemProxy.getBroadcastSummary());
          localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
          localJSONObject = new JSONObject();
          long l1 = System.currentTimeMillis() / 1000L;
          l2 = localStreamFeedScheduledItemProxy.getBroadcastSummary().getEndTime() - l1;
        }
        try
        {
          localJSONObject.put("stream id", localStreamFeedScheduledItemProxy.getBroadcastSummary().getId());
          localJSONObject.put("subscribed", localStreamFeedScheduledItemProxy.getBroadcastSummary().getSubscribers().size());
          localJSONObject.put("is following", localGraphProxy.amIFollowingUser(localStreamFeedScheduledItemProxy.getBroadcastSummary().getBroadcaster().getId()));
          localJSONObject.put("time before", l2);
          MixpanelEventParams localMixpanelEventParams = new MixpanelEventParams("subscribe", localJSONObject);
          SubscribeToScheduledStreamCommand.this.sendNotification("trackMixpanelEvent", localMixpanelEventParams, null);
          SubscribeToScheduledStreamCommand.this.sendNotification("incrementPeopleProperty", "subscribe count", null);
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