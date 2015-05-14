package co.getair.meerkat;

import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.media.RingtoneManager;
import co.getair.meerkat.activities.WatchActivity;
import co.getair.meerkat.utilities.RandomInt;

public class ScheduledBroadcastReceiver extends BroadcastReceiver
{
  public static final String BROADCAST_ID_KEY = "broadcastNameKey";
  public static final String BROADCAST_NAME_KEY = "broadcastIdNameKey";

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramIntent.getStringExtra("broadcastIdNameKey");
    String str = paramIntent.getStringExtra("broadcastNameKey");
    NotificationManager localNotificationManager = (NotificationManager)paramContext.getSystemService("notification");
    Intent localIntent = new Intent(paramContext, WatchActivity.class);
    paramIntent.putExtra("broadcastNameKey", str);
    paramIntent.setFlags(536870912);
    PendingIntent localPendingIntent = PendingIntent.getActivity(paramContext, RandomInt.getInt(), localIntent, 0);
    Notification.Builder localBuilder = new Notification.Builder(paramContext).setSmallIcon(2130837973).setContentTitle("go live").setContentText(String.format("Your followers are waiting for you to stream.", new Object[0])).setAutoCancel(true).setSound(RingtoneManager.getDefaultUri(2));
    localBuilder.setContentIntent(localPendingIntent);
    localNotificationManager.notify(RandomInt.getInt(), localBuilder.build());
  }
}