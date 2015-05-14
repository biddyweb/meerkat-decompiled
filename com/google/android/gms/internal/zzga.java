package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.util.DisplayMetrics;

@zzgi
public class zzga extends zzfy
{
  zzga(Context paramContext, zzhe.zza paramzza, zzic paramzzic, zzgc.zza paramzza1)
  {
    super(paramContext, paramzza, paramzzic, paramzza1);
  }

  protected void zzg(long paramLong)
    throws zzgb.zza
  {
    zzba localzzba = this.zzmu.zzad();
    int i;
    if (localzzba.zzpb)
      i = this.mContext.getResources().getDisplayMetrics().widthPixels;
    zzfz localzzfz;
    for (int j = this.mContext.getResources().getDisplayMetrics().heightPixels; ; j = localzzba.heightPixels)
    {
      localzzfz = new zzfz(this, this.zzmu, i, j);
      zzhw.zzzG.post(new zzga.1(this, localzzfz));
      zzf(paramLong);
      if (!localzzfz.zzdE())
        break;
      zzhx.zzY("Ad-Network indicated no fill with passback URL.");
      throw new zzgb.zza("AdNetwork sent passback url", 3);
      i = localzzba.widthPixels;
    }
    if (!localzzfz.zzdF())
      throw new zzgb.zza("AdNetwork timed out", 2);
  }
}