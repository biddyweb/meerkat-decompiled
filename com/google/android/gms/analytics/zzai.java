package com.google.android.gms.analytics;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzra;
import com.google.android.gms.internal.zzrg;

class zzai
  implements zzq
{
  private final zzra zzAM;

  zzai(zzra paramzzra)
  {
    zzx.zzl(paramzzra);
    this.zzAM = paramzzra;
  }

  public String getValue(String paramString)
  {
    if ("&sr".equals(paramString))
      return zzgC();
    return null;
  }

  public boolean zzaj(String paramString)
  {
    return "&sr".equals(paramString);
  }

  protected String zzgC()
  {
    zzrg localzzrg = this.zzAM.zzqV();
    return localzzrg.zzrb() + "x" + localzzrg.zzrc();
  }
}