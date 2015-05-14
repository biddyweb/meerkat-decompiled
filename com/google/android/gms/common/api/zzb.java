package com.google.android.gms.common.api;

import com.google.android.gms.common.data.DataHolder;

public abstract class zzb<L>
  implements zze.zzb<L>
{
  private final DataHolder zzMd;

  protected zzb(DataHolder paramDataHolder)
  {
    this.zzMd = paramDataHolder;
  }

  protected abstract void zza(L paramL, DataHolder paramDataHolder);

  public final void zze(L paramL)
  {
    zza(paramL, this.zzMd);
  }

  public void zzhX()
  {
    if (this.zzMd != null)
      this.zzMd.close();
  }
}