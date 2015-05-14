package com.google.android.gms.internal;

import android.content.Context;

@zzgi
public class zzgc
{
  public zzhl zza(Context paramContext, zzt paramzzt, zzhe.zza paramzza, zzic paramzzic, zzdr paramzzdr, zzgc.zza paramzza1)
  {
    zzgq localzzgq = paramzza.zzyz;
    Object localObject;
    if (localzzgq.zzwS)
      localObject = new zzgg(paramContext, paramzzt, new zzai(), paramzza, paramzza1);
    while (true)
    {
      ((zzhl)localObject).start();
      return localObject;
      if (localzzgq.zzwI)
        localObject = new zzgf(paramContext, paramzza, paramzzic, paramzzdr, paramzza1);
      else if (localzzgq.zzwO)
        localObject = new zzga(paramContext, paramzza, paramzzic, paramzza1);
      else if ((((Boolean)zzca.zzqI.get()).booleanValue()) && (zzme.zzkj()) && (!zzme.zzkk()) && (paramzzic.zzad().zzpb))
        localObject = new zzge(paramContext, paramzza, paramzzic, paramzza1);
      else
        localObject = new zzgd(paramContext, paramzza, paramzzic, paramzza1);
    }
  }
}