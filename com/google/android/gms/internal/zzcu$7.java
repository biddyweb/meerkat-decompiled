package com.google.android.gms.internal;

import java.util.Map;

final class zzcu$7
  implements zzcv
{
  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str = (String)paramMap.get("u");
    if (str == null)
    {
      zzhx.zzac("URL missing from httpTrack GMSG.");
      return;
    }
    new zzhu(paramzzic.getContext(), paramzzic.zzeJ().zzzH, str).start();
  }
}