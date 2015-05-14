package com.google.android.gms.internal;

import android.view.View;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;

@zzgi
public final class zzcg extends zzci.zza
{
  private final zzv zzrg;
  private final String zzrh;
  private final String zzri;

  public zzcg(zzv paramzzv, String paramString1, String paramString2)
  {
    this.zzrg = paramzzv;
    this.zzrh = paramString1;
    this.zzri = paramString2;
  }

  public String getContent()
  {
    return this.zzri;
  }

  public void recordClick()
  {
    this.zzrg.recordClick();
  }

  public void recordImpression()
  {
    this.zzrg.recordImpression();
  }

  public void zza(zzd paramzzd)
  {
    if (paramzzd == null)
      return;
    this.zzrg.zzb((View)zze.zzf(paramzzd));
  }

  public String zzcv()
  {
    return this.zzrh;
  }
}