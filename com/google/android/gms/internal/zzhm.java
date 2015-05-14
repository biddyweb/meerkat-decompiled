package com.google.android.gms.internal;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

@zzgi
public final class zzhm
{
  public static void zza(Context paramContext, int paramInt)
  {
    SharedPreferences.Editor localEditor = zzq(paramContext).edit();
    localEditor.putInt("webview_cache_version", paramInt);
    localEditor.commit();
  }

  public static void zza(Context paramContext, boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = zzq(paramContext).edit();
    localEditor.putBoolean("use_https", paramBoolean);
    localEditor.commit();
  }

  private static SharedPreferences zzq(Context paramContext)
  {
    return paramContext.getSharedPreferences("admob", 0);
  }

  public static boolean zzr(Context paramContext)
  {
    return zzq(paramContext).getBoolean("use_https", true);
  }

  public static int zzs(Context paramContext)
  {
    return zzq(paramContext).getInt("webview_cache_version", 0);
  }
}