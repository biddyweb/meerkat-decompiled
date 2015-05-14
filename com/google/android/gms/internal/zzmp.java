package com.google.android.gms.internal;

import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.Field;
import java.util.List;

public class zzmp
{
  public static final zzmp zzZU = new zzmp();

  public zzxc.zzc zzc(DataType paramDataType)
  {
    zzxc.zzc localzzc = new zzxc.zzc();
    localzzc.name = paramDataType.getName();
    List localList = paramDataType.getFields();
    localzzc.zzaIf = new zzxc.zzd[localList.size()];
    for (int i = 0; i < localList.size(); i++)
      localzzc.zzaIf[i] = zzmq.zzZV.zzb((Field)localList.get(i));
    return localzzc;
  }
}