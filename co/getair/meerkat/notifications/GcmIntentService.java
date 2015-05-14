package co.getair.meerkat.notifications;

import android.app.IntentService;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.media.RingtoneManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v4.app.NotificationCompat.Builder;
import android.support.v4.app.NotificationCompat.InboxStyle;
import android.support.v4.app.NotificationManagerCompat;
import android.support.v4.content.LocalBroadcastManager;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.activities.LandingActivity;
import co.getair.meerkat.facades.ApplicationFacade;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import java.util.List;

public class GcmIntentService extends IntentService
{
  NotificationCompat.Builder builder;
  private NotificationManagerCompat mNotificationManager;

  public GcmIntentService()
  {
    super("GcmIntentService");
  }

  private void processNotification(String paramString, Bundle paramBundle)
  {
    int i = -1;
    switch (paramString.hashCode())
    {
    default:
    case 1073919773:
    case 2137549332:
    case 1982491454:
    }
    while (true)
      switch (i)
      {
      default:
        return;
        if (paramString.equals("UpdateInbox"))
        {
          i = 0;
          continue;
          if (paramString.equals("GoLive"))
          {
            i = 1;
            continue;
            if (paramString.equals("Banned"))
              i = 2;
          }
        }
        break;
      case 0:
      case 1:
      case 2:
      }
    ApplicationFacade.getInst(MeerkatApplication.getName()).sendNotification("commandGetInbox", null, null);
    return;
    sendNotification(paramBundle.getString("body"), paramBundle);
    return;
    Intent localIntent1 = new Intent("notificationDoAuthorize");
    Intent localIntent2 = new Intent("notificationDismissWatchScreen");
    Intent localIntent3 = new Intent("notificationDismissBroadcastScreen");
    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(localIntent1);
    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(localIntent2);
    LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(localIntent3);
  }

  private void sendNotification(String paramString, Bundle paramBundle)
  {
    this.mNotificationManager = NotificationManagerCompat.from(this);
    PendingNotification localPendingNotification = new PendingNotification(paramString, System.currentTimeMillis());
    PendingNotificationsManager localPendingNotificationsManager = PendingNotificationsManager.getInstance(getApplicationContext());
    localPendingNotificationsManager.addNotification(localPendingNotification);
    List localList = localPendingNotificationsManager.getPendingNotifications();
    if (localList != null)
    {
      Intent localIntent = new Intent(this, LandingActivity.class);
      if (localList.size() == 1)
        localIntent.putExtras(paramBundle);
      PendingIntent localPendingIntent = PendingIntent.getActivity(this, 0, localIntent, 1342177280);
      NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(this).setSmallIcon(2130837976).setAutoCancel(true).setContentTitle(localPendingNotificationsManager.getGroupedNotificationTitle()).setContentText(((PendingNotification)localList.get(0)).getNotificationText()).setWhen(System.currentTimeMillis()).setSound(RingtoneManager.getDefaultUri(2)).setContentIntent(localPendingIntent);
      if (Build.VERSION.SDK_INT >= 21)
        localBuilder.setColor(getResources().getColor(2131492923));
      NotificationCompat.InboxStyle localInboxStyle;
      while (true)
      {
        localInboxStyle = new NotificationCompat.InboxStyle();
        localInboxStyle.setBigContentTitle(localPendingNotificationsManager.getGroupedNotificationTitle());
        for (int i = 0; i < Math.min(localList.size(), 4); i++)
          localInboxStyle.addLine(((PendingNotification)localList.get(i)).getNotificationText());
        localBuilder.setLargeIcon(BitmapFactory.decodeResource(getResources(), 2130903040));
      }
      if (localList.size() > 4)
        localInboxStyle.addLine("+" + (-4 + localList.size()) + " more");
      localBuilder.setStyle(localInboxStyle);
      if (localList.size() > 1)
        localBuilder.setNumber(localList.size());
      Notification localNotification = localBuilder.build();
      this.mNotificationManager.notify(localPendingNotificationsManager.getGroupNotificationsId(), localNotification);
    }
  }

  protected void onHandleIntent(Intent paramIntent)
  {
    Bundle localBundle = paramIntent.getExtras();
    String str = GoogleCloudMessaging.getInstance(this).getMessageType(paramIntent);
    if ((!localBundle.isEmpty()) && ("gcm".equals(str)))
      processNotification(localBundle.getString("type"), localBundle);
    GcmBroadcastReceiver.completeWakefulIntent(paramIntent);
  }
}