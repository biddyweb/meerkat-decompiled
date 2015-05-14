package com.google.android.gms.internal;

import android.net.Uri;
import java.util.Map;

final class zzcu$4
  implements zzcv
{
  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str1 = (String)paramMap.get("u");
    if (str1 == null)
    {
      zzhx.zzac("URL missing from click GMSG.");
      return;
    }
    Uri localUri1 = Uri.parse(str1);
    try
    {
      zzk localzzk = paramzzic.zzeI();
      if ((localzzk != null) && (localzzk.zzb(localUri1)))
      {
        Uri localUri3 = localzzk.zza(localUri1, paramzzic.getContext());
        localUri2 = localUri3;
        String str2 = localUri2.toString();
        new zzhu(paramzzic.getContext(), paramzzic.zzeJ().zzzH, str2).start();
        return;
      }
    }
    catch (zzl localzzl)
    {
      while (true)
      {
        zzhx.zzac("Unable to append parameter to URL: " + str1);
        Uri localUri2 = localUri1;
      }
    }
  }
}