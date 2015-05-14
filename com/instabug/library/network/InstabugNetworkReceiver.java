package com.instabug.library.network;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;

public class InstabugNetworkReceiver extends BroadcastReceiver
{
  private static boolean a = false;

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (((ConnectivityManager)paramContext.getSystemService("connectivity")).getActiveNetworkInfo() != null)
    {
      if (!a)
      {
        a = true;
        ComponentName localComponentName = new ComponentName(paramContext, InstabugNetworkReceiver.class);
        paramContext.getPackageManager().setComponentEnabledSetting(localComponentName, 2, 1);
        paramContext.startService(new Intent(paramContext, UploadCacheService.class));
      }
      return;
    }
    a = false;
  }
}