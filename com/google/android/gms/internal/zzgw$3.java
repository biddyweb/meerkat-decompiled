package com.google.android.gms.internal;

final class zzgw$3
  implements Runnable
{
  zzgw$3(zzgy paramzzgy, zzdf paramzzdf)
  {
  }

  public void run()
  {
    this.zzxk.zzdT();
    if (this.zzxk.zzdR() != null)
    {
      this.zzxk.zzdR().zza(new zzia.zzd()
      {
        public void zzb(zzah paramAnonymouszzah)
        {
          paramAnonymouszzah.zzb("/invalidRequest", zzgw.3.this.zzxk.zzxz);
          paramAnonymouszzah.zzb("/loadAdURL", zzgw.3.this.zzxk.zzxA);
        }
      }
      , new zzia.zzb());
      this.zzxj.zzb(this.zzxk.zzdR());
    }
  }
}