package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

abstract class zzbu extends zzbz
{
  public zzbu(String paramString)
  {
    super(paramString);
  }

  protected boolean zza(zzd.zza paramzza1, zzd.zza paramzza2, Map<String, zzd.zza> paramMap)
  {
    zzdd localzzdd1 = zzde.zzh(paramzza1);
    zzdd localzzdd2 = zzde.zzh(paramzza2);
    if ((localzzdd1 == zzde.zzud()) || (localzzdd2 == zzde.zzud()))
      return false;
    return zza(localzzdd1, localzzdd2, paramMap);
  }

  protected abstract boolean zza(zzdd paramzzdd1, zzdd paramzzdd2, Map<String, zzd.zza> paramMap);
}