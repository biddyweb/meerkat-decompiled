package com.google.android.gms.internal;

import java.util.Map;
import java.util.Set;

class zzid$zzb
  implements zzcv
{
  private zzid$zzb(zzid paramzzid)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    if (paramMap.keySet().contains("start"))
      zzid.zza(this.zzzZ);
    do
    {
      return;
      if (paramMap.keySet().contains("stop"))
      {
        zzid.zzb(this.zzzZ);
        return;
      }
    }
    while (!paramMap.keySet().contains("cancel"));
    zzid.zzc(this.zzzZ);
  }
}