package com.google.android.gms.internal;

import com.google.android.gms.fitness.data.RawDataSet;
import java.util.List;

public class zzmv
{
  public static zzxd.zzc zzb(RawDataSet paramRawDataSet)
  {
    zzxd.zzc localzzc = new zzxd.zzc();
    localzzc.zzaID = paramRawDataSet.zzZJ;
    localzzc.zzaIK = zzmu.zzl(paramRawDataSet.zzZM);
    localzzc.zzaIx = paramRawDataSet.zzYF;
    return localzzc;
  }

  public static zzxd.zzc[] zzm(List<RawDataSet> paramList)
  {
    zzxd.zzc[] arrayOfzzc = new zzxd.zzc[paramList.size()];
    for (int i = 0; i < paramList.size(); i++)
      arrayOfzzc[i] = zzb((RawDataSet)paramList.get(i));
    return arrayOfzzc;
  }
}