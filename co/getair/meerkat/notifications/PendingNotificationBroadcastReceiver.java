package co.getair.meerkat.notifications;

import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import co.getair.meerkat.activities.FeedActivity;
import co.getair.meerkat.dtos.feed.ScheduledBroadcastSummary;
import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;

public class PendingNotificationBroadcastReceiver extends BroadcastReceiver
{
  public static final String EXTRA_BROADCASTER_HANDLE = "broadcasterHandle";
  private static final int SCHEDULED_BROADCAST_NOTIFICATION_ID = 2;

  public static PendingIntent createPendingNotificationIntent(Context paramContext, ScheduledBroadcastSummary paramScheduledBroadcastSummary)
  {
    return PendingIntent.getBroadcast(paramContext, 0, new Intent(paramContext, PendingNotificationBroadcastReceiver.class).putExtra("broadcasterHandle", paramScheduledBroadcastSummary.getBroadcaster().getTwitterHandle()), 0);
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("broadcasterHandle");
    Intent localIntent = new Intent(paramContext, FeedActivity.class);
    Bitmap localBitmap = BitmapFactory.decodeResource(paramContext.getResources(), 2130903040);
    Notification.Builder localBuilder = new Notification.Builder(paramContext).setAutoCancel(true).setLargeIcon(localBitmap).setSmallIcon(2130837976).setContentTitle("Meerkat").setContentText(String.format("%s's stream is about to start", new Object[] { str })).setContentIntent(PendingIntent.getActivity(paramContext, 0, localIntent, 0));
    ((NotificationManager)paramContext.getSystemService("notification")).notify(2, localBuilder.build());
  }
}