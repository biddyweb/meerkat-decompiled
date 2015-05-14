package com.google.android.gms.internal;

import java.util.Map;

class zzaf$8
  implements zzcv
{
  zzaf$8(zzaf paramzzaf)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    if (!this.zznI.zza(paramMap))
      return;
    zzhx.zzY("Received request to untrack: " + zzaf.zzb(this.zznI).zzaZ());
    this.zznI.destroy();
  }
}