package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

public abstract class zzbz extends zzaj
{
  private static final String zzayC = zzb.zzbw.toString();
  private static final String zzazv = zzb.zzbx.toString();

  public zzbz(String paramString)
  {
    super(paramString, arrayOfString);
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    Iterator localIterator = paramMap.values().iterator();
    while (localIterator.hasNext())
      if ((zzd.zza)localIterator.next() == zzde.zzuf())
        return zzde.zzx(Boolean.valueOf(false));
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzayC);
    zzd.zza localzza2 = (zzd.zza)paramMap.get(zzazv);
    if ((localzza1 == null) || (localzza2 == null));
    for (boolean bool = false; ; bool = zza(localzza1, localzza2, paramMap))
      return zzde.zzx(Boolean.valueOf(bool));
  }

  protected abstract boolean zza(zzd.zza paramzza1, zzd.zza paramzza2, Map<String, zzd.zza> paramMap);

  public boolean zzsD()
  {
    return true;
  }
}