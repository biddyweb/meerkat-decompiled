package com.google.android.gms.internal;

import android.content.Context;

@zzgi
public final class zzgl
{
  public static zzhl zza(Context paramContext, zzgo paramzzgo, zzgl.zza paramzza)
  {
    return zza(paramContext, paramzzgo, paramzza, new zzgl.1());
  }

  static zzhl zza(Context paramContext, zzgo paramzzgo, zzgl.zza paramzza, zzgl.zzb paramzzb)
  {
    if (paramzzb.zzc(paramzzgo))
      return zzb(paramContext, paramzzgo, paramzza);
    return zzc(paramContext, paramzzgo, paramzza);
  }

  private static zzhl zzb(Context paramContext, zzgo paramzzgo, zzgl.zza paramzza)
  {
    zzhx.zzY("Fetching ad response from local ad request service.");
    zzgm.zza localzza = new zzgm.zza(paramContext, paramzzgo, paramzza);
    localzza.start();
    return localzza;
  }

  private static zzhl zzc(Context paramContext, zzgo paramzzgo, zzgl.zza paramzza)
  {
    zzhx.zzY("Fetching ad response from remote ad request service.");
    if (!zzbe.zzbD().zzA(paramContext))
    {
      zzhx.zzac("Failed to connect to remote ad request service.");
      return null;
    }
    return new zzgm.zzb(paramContext, paramzzgo, paramzza);
  }
}