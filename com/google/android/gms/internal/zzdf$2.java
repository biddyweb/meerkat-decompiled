package com.google.android.gms.internal;

import java.util.Map;

class zzdf$2
  implements zzcv
{
  zzdf$2(zzdf paramzzdf, zzia paramzzia)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    synchronized (zzdf.zza(this.zzrZ))
    {
      if ((this.zzrY.getStatus() == -1) || (this.zzrY.getStatus() == 1))
        return;
      this.zzrY.zzc(zzdf.zzb(this.zzrZ));
      this.zzrY.zza(zzdf.zzc(this.zzrZ), new zzia.zzb());
      zzdf.zza(this.zzrZ, 0);
      if (this.zzrY != zzdf.zzd(this.zzrZ))
        this.zzrZ.zzd(zzdf.zzd(this.zzrZ));
      zzdf.zza(this.zzrZ, this.zzrY);
      this.zzrZ.zzc(zzdf.zzd(this.zzrZ));
      return;
    }
  }
}