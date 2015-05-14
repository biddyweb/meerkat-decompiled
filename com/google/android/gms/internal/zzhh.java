package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.os.Bundle;

@zzgi
public class zzhh
{
  private final Object zznh = new Object();
  final String zzyL;
  long zzyZ = -1L;
  long zzza = -1L;
  int zzzb = -1;
  int zzzc = 0;
  int zzzd = 0;

  public zzhh(String paramString)
  {
    this.zzyL = paramString;
  }

  public static boolean zzp(Context paramContext)
  {
    int i = paramContext.getResources().getIdentifier("Theme.Translucent", "style", "android");
    if (i == 0)
    {
      zzhx.zzaa("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
      return false;
    }
    ComponentName localComponentName = new ComponentName(paramContext.getPackageName(), "com.google.android.gms.ads.AdActivity");
    try
    {
      if (i == paramContext.getPackageManager().getActivityInfo(localComponentName, 0).theme)
        return true;
      zzhx.zzaa("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
      return false;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      zzhx.zzac("Fail to fetch AdActivity theme");
      zzhx.zzaa("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
    }
    return false;
  }

  public void zzb(zzax paramzzax, long paramLong)
  {
    synchronized (this.zznh)
    {
      if (this.zzza == -1L)
      {
        this.zzza = paramLong;
        this.zzyZ = this.zzza;
        if ((paramzzax.extras == null) || (paramzzax.extras.getInt("gw", 2) != 1));
      }
      else
      {
        this.zzyZ = paramLong;
      }
    }
    this.zzzb = (1 + this.zzzb);
  }

  public Bundle zzc(Context paramContext, String paramString)
  {
    synchronized (this.zznh)
    {
      Bundle localBundle = new Bundle();
      localBundle.putString("session_id", this.zzyL);
      localBundle.putLong("basets", this.zzza);
      localBundle.putLong("currts", this.zzyZ);
      localBundle.putString("seq_num", paramString);
      localBundle.putInt("preqs", this.zzzb);
      localBundle.putInt("pclick", this.zzzc);
      localBundle.putInt("pimp", this.zzzd);
      localBundle.putBoolean("support_transparent_background", zzp(paramContext));
      return localBundle;
    }
  }

  public void zzdX()
  {
    synchronized (this.zznh)
    {
      this.zzzd = (1 + this.zzzd);
      return;
    }
  }

  public void zzdY()
  {
    synchronized (this.zznh)
    {
      this.zzzc = (1 + this.zzzc);
      return;
    }
  }

  public long zzeo()
  {
    return this.zzza;
  }
}