package com.google.android.gms.analytics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;

public final class AnalyticsReceiver extends BroadcastReceiver
{
  static PowerManager.WakeLock zzAY;
  static Object zzmz = new Object();

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    Intent localIntent = new Intent(paramContext, AnalyticsService.class);
    synchronized (zzmz)
    {
      paramContext.startService(localIntent);
      try
      {
        zzAY = ((PowerManager)paramContext.getSystemService("power")).newWakeLock(1, "Analytics WakeLock");
        zzAY.acquire(1000L);
        return;
      }
      catch (SecurityException localSecurityException)
      {
        while (true)
          zzae.zzac("Analytics service at risk of not starting. For more reliable analytics, add the WAKE_LOCK permission to your manifest. See http://goo.gl/8Rd3yj for instructions.");
      }
    }
  }
}