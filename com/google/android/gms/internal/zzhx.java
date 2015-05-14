package com.google.android.gms.internal;

import android.util.Log;

@zzgi
public final class zzhx
{
  public static boolean zzA(int paramInt)
  {
    return ((paramInt >= 5) || (Log.isLoggable("Ads", paramInt))) && (paramInt != 2);
  }

  public static void zzY(String paramString)
  {
    if (zzA(3))
      Log.d("Ads", paramString);
  }

  public static void zzZ(String paramString)
  {
    if (zzA(6))
      Log.e("Ads", paramString);
  }

  public static void zza(String paramString, Throwable paramThrowable)
  {
    if (zzA(3))
      Log.d("Ads", paramString, paramThrowable);
  }

  public static void zzaa(String paramString)
  {
    if (zzA(4))
      Log.i("Ads", paramString);
  }

  public static void zzab(String paramString)
  {
    if (zzA(2))
      Log.v("Ads", paramString);
  }

  public static void zzac(String paramString)
  {
    if (zzA(5))
      Log.w("Ads", paramString);
  }

  public static void zzb(String paramString, Throwable paramThrowable)
  {
    if (zzA(6))
      Log.e("Ads", paramString, paramThrowable);
  }

  public static void zzc(String paramString, Throwable paramThrowable)
  {
    if (zzA(4))
      Log.i("Ads", paramString, paramThrowable);
  }

  public static void zzd(String paramString, Throwable paramThrowable)
  {
    if (zzA(5))
      Log.w("Ads", paramString, paramThrowable);
  }
}