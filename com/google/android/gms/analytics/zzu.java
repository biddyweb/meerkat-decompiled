package com.google.android.gms.analytics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

class zzu extends BroadcastReceiver
{
  static final String zzBO = zzu.class.getName();
  private final zzaj zzBP;

  zzu(zzaj paramzzaj)
  {
    this.zzBP = paramzzaj;
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str = paramIntent.getAction();
    if ("android.net.conn.CONNECTIVITY_CHANGE".equals(str))
    {
      bool1 = paramIntent.getBooleanExtra("noConnectivity", false);
      localzzaj = this.zzBP;
      bool2 = false;
      if (!bool1)
        bool2 = true;
      localzzaj.zzE(bool2);
    }
    while ((!"com.google.analytics.RADIO_POWERED".equals(str)) || (paramIntent.hasExtra(zzBO)))
    {
      boolean bool1;
      zzaj localzzaj;
      boolean bool2;
      return;
    }
    this.zzBP.zzfJ();
  }

  public void zzD(Context paramContext)
  {
    IntentFilter localIntentFilter1 = new IntentFilter();
    localIntentFilter1.addAction("android.net.conn.CONNECTIVITY_CHANGE");
    paramContext.registerReceiver(this, localIntentFilter1);
    IntentFilter localIntentFilter2 = new IntentFilter();
    localIntentFilter2.addAction("com.google.analytics.RADIO_POWERED");
    localIntentFilter2.addCategory(paramContext.getPackageName());
    paramContext.registerReceiver(this, localIntentFilter2);
  }
}