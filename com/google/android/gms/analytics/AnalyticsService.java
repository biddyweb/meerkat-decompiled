package com.google.android.gms.analytics;

import android.app.IntentService;
import android.content.Intent;
import android.os.PowerManager.WakeLock;
import android.util.Pair;

public final class AnalyticsService extends IntentService
{
  static int zzAZ = 1800;

  public AnalyticsService()
  {
    super("AnalyticsService");
  }

  public AnalyticsService(String paramString)
  {
    super(paramString);
  }

  static void zzC(int paramInt)
  {
    zzAZ = paramInt;
  }

  protected void onHandleIntent(Intent paramIntent)
  {
    try
    {
      synchronized (AnalyticsReceiver.zzmz)
      {
        if ((AnalyticsReceiver.zzAY != null) && (AnalyticsReceiver.zzAY.isHeld()))
          AnalyticsReceiver.zzAY.release();
        label32: GoogleAnalytics localGoogleAnalytics = GoogleAnalytics.getInstance(this);
        zzae.zzab("Analytics Service called.");
        Pair localPair = localGoogleAnalytics.zzgl().zzfg();
        if ((localPair != null) && (localPair.first != null) && (localPair.second != null) && (Math.abs(System.currentTimeMillis() - ((Long)localPair.first).longValue()) >= 1000 * zzAZ))
          localGoogleAnalytics.dispatchLocalHits();
        stopSelf();
        return;
      }
    }
    catch (SecurityException localSecurityException)
    {
      break label32;
    }
  }
}