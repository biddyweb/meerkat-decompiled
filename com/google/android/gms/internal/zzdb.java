package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import java.util.Map;

@zzgi
public final class zzdb
  implements zzcv
{
  private static int zza(DisplayMetrics paramDisplayMetrics, Map<String, String> paramMap, String paramString, int paramInt)
  {
    String str = (String)paramMap.get(paramString);
    if (str != null);
    try
    {
      int i = zzbe.zzbD().zza(paramDisplayMetrics, Integer.parseInt(str));
      paramInt = i;
      return paramInt;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      zzhx.zzac("Could not parse " + paramString + " in a video GMSG: " + str);
    }
    return paramInt;
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str1 = (String)paramMap.get("action");
    if (str1 == null)
    {
      zzhx.zzac("Action missing from video GMSG.");
      return;
    }
    zzel localzzel = paramzzic.zzeF();
    if (localzzel == null)
    {
      zzhx.zzac("Could not get ad overlay for a video GMSG.");
      return;
    }
    boolean bool1 = "new".equalsIgnoreCase(str1);
    boolean bool2 = "position".equalsIgnoreCase(str1);
    if ((bool1) || (bool2))
    {
      DisplayMetrics localDisplayMetrics1 = paramzzic.getContext().getResources().getDisplayMetrics();
      int i = zza(localDisplayMetrics1, paramMap, "x", 0);
      int j = zza(localDisplayMetrics1, paramMap, "y", 0);
      int k = zza(localDisplayMetrics1, paramMap, "w", -1);
      int m = zza(localDisplayMetrics1, paramMap, "h", -1);
      if ((bool1) && (localzzel.zzdb() == null))
      {
        localzzel.zzf(i, j, k, m);
        return;
      }
      localzzel.zze(i, j, k, m);
      return;
    }
    zzeq localzzeq = localzzel.zzdb();
    if (localzzeq == null)
    {
      zzeq.zza(paramzzic, "no_video_view", null);
      return;
    }
    if ("click".equalsIgnoreCase(str1))
    {
      DisplayMetrics localDisplayMetrics2 = paramzzic.getContext().getResources().getDisplayMetrics();
      int n = zza(localDisplayMetrics2, paramMap, "x", 0);
      int i1 = zza(localDisplayMetrics2, paramMap, "y", 0);
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l, l, 0, n, i1, 0);
      localzzeq.zzb(localMotionEvent);
      localMotionEvent.recycle();
      return;
    }
    if ("controls".equalsIgnoreCase(str1))
    {
      String str3 = (String)paramMap.get("enabled");
      if (str3 == null)
      {
        zzhx.zzac("Enabled parameter missing from controls video GMSG.");
        return;
      }
      localzzeq.zzu(Boolean.parseBoolean(str3));
      return;
    }
    if ("currentTime".equalsIgnoreCase(str1))
    {
      String str2 = (String)paramMap.get("time");
      if (str2 == null)
      {
        zzhx.zzac("Time parameter missing from currentTime video GMSG.");
        return;
      }
      try
      {
        localzzeq.seekTo((int)(1000.0F * Float.parseFloat(str2)));
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        zzhx.zzac("Could not parse time parameter from currentTime video GMSG: " + str2);
        return;
      }
    }
    if ("hide".equalsIgnoreCase(str1))
    {
      localzzeq.setVisibility(4);
      return;
    }
    if ("load".equalsIgnoreCase(str1))
    {
      localzzeq.zzdo();
      return;
    }
    if ("pause".equalsIgnoreCase(str1))
    {
      localzzeq.pause();
      return;
    }
    if ("play".equalsIgnoreCase(str1))
    {
      localzzeq.play();
      return;
    }
    if ("show".equalsIgnoreCase(str1))
    {
      localzzeq.setVisibility(0);
      return;
    }
    if ("src".equalsIgnoreCase(str1))
    {
      localzzeq.zzK((String)paramMap.get("src"));
      return;
    }
    zzhx.zzac("Unknown video action: " + str1);
  }
}