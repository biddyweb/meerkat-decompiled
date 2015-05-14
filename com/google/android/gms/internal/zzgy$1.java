package com.google.android.gms.internal;

import java.util.Map;

class zzgy$1
  implements zzcv
{
  zzgy$1(zzgy paramzzgy)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    synchronized (zzgy.zza(this.zzxB))
    {
      if (zzgy.zzb(this.zzxB).isDone())
        return;
      if (!zzgy.zzc(this.zzxB).equals(paramMap.get("request_id")))
        return;
    }
    zzha localzzha = new zzha(1, paramMap);
    zzhx.zzac("Invalid " + localzzha.getType() + " request error: " + localzzha.zzdU());
    zzgy.zzb(this.zzxB).zzb(localzzha);
  }
}