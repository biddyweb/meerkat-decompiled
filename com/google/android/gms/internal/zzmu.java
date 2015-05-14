package com.google.android.gms.internal;

import com.google.android.gms.fitness.data.RawDataPoint;
import java.util.ArrayList;
import java.util.List;

public class zzmu
{
  public static RawDataPoint zza(zzxc.zzd[] paramArrayOfzzd, zzxd.zzb paramzzb)
  {
    return new RawDataPoint(4, paramzzb.zzaIA, zzmt.zza(paramzzb), zzmx.zza(paramArrayOfzzd, paramzzb.zzaIC), paramzzb.zzaID, paramzzb.zzaIF, zzmt.zzb(paramzzb), zzmt.zzc(paramzzb));
  }

  public static List<RawDataPoint> zza(zzxc.zzd[] paramArrayOfzzd, zzxd.zzb[] paramArrayOfzzb)
  {
    ArrayList localArrayList = new ArrayList(paramArrayOfzzb.length);
    int i = paramArrayOfzzb.length;
    for (int j = 0; j < i; j++)
      localArrayList.add(zza(paramArrayOfzzd, paramArrayOfzzb[j]));
    return localArrayList;
  }

  public static zzxd.zzb zzb(RawDataPoint paramRawDataPoint)
  {
    zzxd.zzb localzzb = new zzxd.zzb();
    localzzb.zzaIA = paramRawDataPoint.zzYG;
    localzzb.zzaIC = zzmx.zza(paramRawDataPoint.zzYI);
    localzzb.zzaID = paramRawDataPoint.zzZJ;
    localzzb.zzaIF = paramRawDataPoint.zzZK;
    localzzb.zzaIB = paramRawDataPoint.zzYH;
    localzzb.zzaIH = paramRawDataPoint.zzYK;
    localzzb.zzaII = paramRawDataPoint.zzYL;
    return localzzb;
  }

  public static zzxd.zzb[] zzl(List<RawDataPoint> paramList)
  {
    zzxd.zzb[] arrayOfzzb = new zzxd.zzb[paramList.size()];
    for (int i = 0; i < paramList.size(); i++)
      arrayOfzzb[i] = zzb((RawDataPoint)paramList.get(i));
    return arrayOfzzb;
  }
}