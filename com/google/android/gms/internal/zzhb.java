package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.DetailedState;
import android.net.Uri;
import android.os.Build.VERSION;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import java.util.Locale;

@zzgi
public final class zzhb
{
  public final int zzwx;
  public final int zzwy;
  public final float zzwz;
  public final int zzxY;
  public final boolean zzxZ;
  public final boolean zzya;
  public final String zzyb;
  public final String zzyc;
  public final boolean zzyd;
  public final boolean zzye;
  public final boolean zzyf;
  public final String zzyg;
  public final String zzyh;
  public final int zzyi;
  public final int zzyj;
  public final int zzyk;
  public final int zzyl;
  public final int zzym;
  public final int zzyn;
  public final double zzyo;
  public final boolean zzyp;
  public final boolean zzyq;
  public final int zzyr;

  public zzhb(Context paramContext)
  {
    AudioManager localAudioManager = (AudioManager)paramContext.getSystemService("audio");
    ConnectivityManager localConnectivityManager = (ConnectivityManager)paramContext.getSystemService("connectivity");
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    Locale localLocale = Locale.getDefault();
    PackageManager localPackageManager = paramContext.getPackageManager();
    TelephonyManager localTelephonyManager = (TelephonyManager)paramContext.getSystemService("phone");
    Intent localIntent = paramContext.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
    this.zzxY = localAudioManager.getMode();
    boolean bool2;
    boolean bool3;
    if (zza(localPackageManager, "geo:0,0?q=donuts") != null)
    {
      bool2 = bool1;
      this.zzxZ = bool2;
      if (zza(localPackageManager, "http://www.google.com") == null)
        break label376;
      bool3 = bool1;
      label114: this.zzya = bool3;
      this.zzyb = localTelephonyManager.getNetworkOperator();
      this.zzyc = localLocale.getCountry();
      this.zzyd = zzbe.zzbD().zzeB();
      this.zzye = localAudioManager.isMusicActive();
      this.zzyf = localAudioManager.isSpeakerphoneOn();
      this.zzyg = localLocale.getLanguage();
      this.zzyh = zza(localPackageManager);
      this.zzyi = localAudioManager.getStreamVolume(3);
      this.zzyj = zza(paramContext, localConnectivityManager, localPackageManager);
      this.zzyk = localTelephonyManager.getNetworkType();
      this.zzyl = localTelephonyManager.getPhoneType();
      this.zzym = localAudioManager.getRingerMode();
      this.zzyn = localAudioManager.getStreamVolume(2);
      this.zzwz = localDisplayMetrics.density;
      this.zzwx = localDisplayMetrics.widthPixels;
      this.zzwy = localDisplayMetrics.heightPixels;
      if (localIntent == null)
        break label387;
      int i = localIntent.getIntExtra("status", -1);
      int j = localIntent.getIntExtra("level", -1);
      int k = localIntent.getIntExtra("scale", -1);
      this.zzyo = (j / k);
      if ((i != 2) && (i != 5))
        break label382;
      label324: this.zzyp = bool1;
    }
    while (true)
      if (Build.VERSION.SDK_INT >= 16)
      {
        this.zzyq = localConnectivityManager.isActiveNetworkMetered();
        if (localConnectivityManager.getActiveNetworkInfo() != null)
        {
          this.zzyr = localConnectivityManager.getActiveNetworkInfo().getDetailedState().ordinal();
          return;
          bool2 = false;
          break;
          label376: bool3 = false;
          break label114;
          label382: bool1 = false;
          break label324;
          label387: this.zzyo = -1.0D;
          this.zzyp = false;
          continue;
        }
        this.zzyr = -1;
        return;
      }
    this.zzyq = false;
    this.zzyr = -1;
  }

  private static int zza(Context paramContext, ConnectivityManager paramConnectivityManager, PackageManager paramPackageManager)
  {
    int i = -2;
    if (zzab.zzaM().zza(paramPackageManager, paramContext.getPackageName(), "android.permission.ACCESS_NETWORK_STATE"))
    {
      NetworkInfo localNetworkInfo = paramConnectivityManager.getActiveNetworkInfo();
      if (localNetworkInfo != null)
        i = localNetworkInfo.getType();
    }
    else
    {
      return i;
    }
    return -1;
  }

  private static ResolveInfo zza(PackageManager paramPackageManager, String paramString)
  {
    return paramPackageManager.resolveActivity(new Intent("android.intent.action.VIEW", Uri.parse(paramString)), 65536);
  }

  private static String zza(PackageManager paramPackageManager)
  {
    ResolveInfo localResolveInfo = zza(paramPackageManager, "market://details?id=com.google.android.gms.ads");
    if (localResolveInfo == null);
    while (true)
    {
      return null;
      ActivityInfo localActivityInfo = localResolveInfo.activityInfo;
      if (localActivityInfo != null)
        try
        {
          PackageInfo localPackageInfo = paramPackageManager.getPackageInfo(localActivityInfo.packageName, 0);
          if (localPackageInfo != null)
          {
            String str = localPackageInfo.versionCode + "." + localActivityInfo.packageName;
            return str;
          }
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException)
        {
        }
    }
    return null;
  }
}