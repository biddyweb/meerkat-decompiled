package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

abstract class zzcy extends zzbz
{
  public zzcy(String paramString)
  {
    super(paramString);
  }

  protected boolean zza(zzd.zza paramzza1, zzd.zza paramzza2, Map<String, zzd.zza> paramMap)
  {
    String str1 = zzde.zzg(paramzza1);
    String str2 = zzde.zzg(paramzza2);
    if ((str1 == zzde.zzue()) || (str2 == zzde.zzue()))
      return false;
    return zza(str1, str2, paramMap);
  }

  protected abstract boolean zza(String paramString1, String paramString2, Map<String, zzd.zza> paramMap);
}