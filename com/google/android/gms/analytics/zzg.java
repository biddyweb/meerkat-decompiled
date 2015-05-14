package com.google.android.gms.analytics;

import com.google.android.gms.internal.zzra;
import com.google.android.gms.internal.zzrf;

class zzg
  implements zzq
{
  protected String zzBa;
  protected String zzBb;
  protected String zzBc;
  protected String zzBd;

  zzg(zzra paramzzra)
  {
    zzrf localzzrf = paramzzra.zzqU();
    this.zzBc = localzzrf.zznE();
    this.zzBd = localzzrf.zzra();
    this.zzBa = localzzrf.zzga();
    this.zzBb = localzzrf.zzgc();
  }

  public String getValue(String paramString)
  {
    if (paramString == null);
    do
    {
      return null;
      if (paramString.equals("&an"))
        return this.zzBa;
      if (paramString.equals("&av"))
        return this.zzBb;
      if (paramString.equals("&aid"))
        return this.zzBc;
    }
    while (!paramString.equals("&aiid"));
    return this.zzBd;
  }

  public boolean zzaj(String paramString)
  {
    return ("&an".equals(paramString)) || ("&av".equals(paramString)) || ("&aid".equals(paramString)) || ("&aiid".equals(paramString));
  }
}