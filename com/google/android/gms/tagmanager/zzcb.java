package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzcb extends zzaj
{
  private static final String ID = zza.zzQ.toString();
  private static final String zzazF = zzb.zzdz.toString();
  private static final String zzazG = zzb.zzdy.toString();

  public zzcb()
  {
    super(ID, new String[0]);
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzazF);
    zzd.zza localzza2 = (zzd.zza)paramMap.get(zzazG);
    double d3;
    double d1;
    if ((localzza1 != null) && (localzza1 != zzde.zzuf()) && (localzza2 != null) && (localzza2 != zzde.zzuf()))
    {
      zzdd localzzdd1 = zzde.zzh(localzza1);
      zzdd localzzdd2 = zzde.zzh(localzza2);
      if ((localzzdd1 != zzde.zzud()) && (localzzdd2 != zzde.zzud()))
      {
        d3 = localzzdd1.doubleValue();
        d1 = localzzdd2.doubleValue();
        if (d3 > d1);
      }
    }
    for (double d2 = d3; ; d2 = 0.0D)
    {
      return zzde.zzx(Long.valueOf(Math.round(d2 + Math.random() * (d1 - d2))));
      d1 = 2147483647.0D;
    }
  }

  public boolean zzsD()
  {
    return false;
  }
}