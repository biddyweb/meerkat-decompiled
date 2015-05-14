package com.google.android.gms.internal;

import java.util.Map;

final class zzcu$9
  implements zzcv
{
  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str1 = (String)paramMap.get("tx");
    String str2 = (String)paramMap.get("ty");
    String str3 = (String)paramMap.get("td");
    try
    {
      int i = Integer.parseInt(str1);
      int j = Integer.parseInt(str2);
      int k = Integer.parseInt(str3);
      zzk localzzk = paramzzic.zzeI();
      if (localzzk != null)
        localzzk.zzC().zza(i, j, k);
      return;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      zzhx.zzac("Could not parse touch parameters from gmsg.");
    }
  }
}