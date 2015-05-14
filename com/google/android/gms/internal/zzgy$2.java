package com.google.android.gms.internal;

import java.util.Map;

class zzgy$2
  implements zzcv
{
  zzgy$2(zzgy paramzzgy)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    zzha localzzha;
    synchronized (zzgy.zza(this.zzxB))
    {
      if (zzgy.zzb(this.zzxB).isDone())
        return;
      localzzha = new zzha(-2, paramMap);
      if (!zzgy.zzc(this.zzxB).equals(localzzha.getRequestId()))
      {
        zzhx.zzac(localzzha.getRequestId() + " ==== " + zzgy.zzc(this.zzxB));
        return;
      }
    }
    String str1 = localzzha.getUrl();
    if (str1 == null)
    {
      zzhx.zzac("URL missing in loadAdUrl GMSG.");
      return;
    }
    if (str1.contains("%40mediation_adapters%40"))
    {
      String str2 = str1.replaceAll("%40mediation_adapters%40", zzhk.zza(paramzzic.getContext(), (String)paramMap.get("check_adapters"), zzgy.zzd(this.zzxB)));
      localzzha.setUrl(str2);
      zzhx.zzab("Ad request URL modified to " + str2);
    }
    zzgy.zzb(this.zzxB).zzb(localzzha);
  }
}