package com.google.android.gms.internal;

class zzhg$2
  implements Runnable
{
  zzhg$2(zzhg paramzzhg)
  {
  }

  public void run()
  {
    zzcb localzzcb = new zzcb();
    localzzcb.zzb(zzhg.zza(this.zzyY), zzhg.zzb(this.zzyY).zzzH);
    try
    {
      zzhg.zza(this.zzyY, zzab.zzaR().zza(localzzcb));
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      zzhx.zzac("Cannot initialize CSI reporter." + localIllegalArgumentException.getMessage());
    }
  }
}