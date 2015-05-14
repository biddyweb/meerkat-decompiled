package com.google.android.gms.internal;

import java.util.Map;

class zzdf$3
  implements zzcv
{
  zzdf$3(zzdf paramzzdf, zzhv paramzzhv)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    synchronized (zzdf.zza(this.zzrZ))
    {
      zzdf.zza(this.zzrZ, 1);
      zzhx.zzaa("Javascript is requesting an update");
      zzdf.zzb(this.zzrZ).zzb("/requestReload", (zzcv)this.zzsb.get());
      return;
    }
  }
}