package com.google.android.gms.tagmanager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public final class InstallReferrerReceiver extends BroadcastReceiver
{
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("referrer");
    if ((!"com.android.vending.INSTALL_REFERRER".equals(paramIntent.getAction())) || (str == null))
      return;
    zzaw.zzdc(str);
    Intent localIntent = new Intent(paramContext, InstallReferrerService.class);
    localIntent.putExtra("referrer", str);
    paramContext.startService(localIntent);
  }
}