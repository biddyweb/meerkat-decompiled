package com.google.android.gms.internal;

final class zzgw$1
  implements Runnable
{
  zzgw$1(zzdf paramzzdf, zzgy paramzzgy, zzcf paramzzcf, zzce paramzzce, String paramString)
  {
  }

  public void run()
  {
    zzia localzzia = this.zzxj.zzcJ();
    this.zzxk.zze(localzzia);
    this.zzxl.zza(this.zzxm, new String[] { "rwc" });
    localzzia.zza(new zzia.zzd()
    {
      public void zzb(zzah paramAnonymouszzah)
      {
        zzgw.1.this.zzxl.zza(this.zzxo, new String[] { "jsf" });
        paramAnonymouszzah.zza("/invalidRequest", zzgw.1.this.zzxk.zzxz);
        paramAnonymouszzah.zza("/loadAdURL", zzgw.1.this.zzxk.zzxA);
        try
        {
          paramAnonymouszzah.zzb("AFMA_buildAdURL", zzgw.1.this.zzxn);
          return;
        }
        catch (Exception localException)
        {
          zzhx.zzb("Error requesting an ad url", localException);
        }
      }
    }
    , new zzia.zza()
    {
      public void run()
      {
      }
    });
  }
}