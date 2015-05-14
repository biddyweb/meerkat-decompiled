package com.google.android.gms.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

final class zzho$zza extends BroadcastReceiver
{
  private zzho$zza(zzho paramzzho)
  {
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ("android.intent.action.USER_PRESENT".equals(paramIntent.getAction()))
      zzho.zza(this.zzzs, true);
    while (!"android.intent.action.SCREEN_OFF".equals(paramIntent.getAction()))
      return;
    zzho.zza(this.zzzs, false);
  }
}