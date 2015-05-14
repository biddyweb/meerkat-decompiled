package com.google.android.gms.tagmanager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;

class zzbk extends BroadcastReceiver
{
  static final String zzBO = zzbk.class.getName();
  private final zzcs zzazm;

  zzbk(zzcs paramzzcs)
  {
    this.zzazm = paramzzcs;
  }

  public static void zzan(Context paramContext)
  {
    Intent localIntent = new Intent("com.google.analytics.RADIO_POWERED");
    localIntent.addCategory(paramContext.getPackageName());
    localIntent.putExtra(zzBO, true);
    paramContext.sendBroadcast(localIntent);
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str = paramIntent.getAction();
    if ("android.net.conn.CONNECTIVITY_CHANGE".equals(str))
    {
      localBundle = paramIntent.getExtras();
      localBoolean = Boolean.FALSE;
      if (localBundle != null)
        localBoolean = Boolean.valueOf(paramIntent.getExtras().getBoolean("noConnectivity"));
      localzzcs = this.zzazm;
      if (!localBoolean.booleanValue())
      {
        bool = true;
        localzzcs.zzE(bool);
      }
    }
    while ((!"com.google.analytics.RADIO_POWERED".equals(str)) || (paramIntent.hasExtra(zzBO)))
      while (true)
      {
        Bundle localBundle;
        Boolean localBoolean;
        zzcs localzzcs;
        return;
        boolean bool = false;
      }
    this.zzazm.zzfJ();
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