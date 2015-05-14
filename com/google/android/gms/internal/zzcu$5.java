package com.google.android.gms.internal;

import java.util.Map;

final class zzcu$5
  implements zzcv
{
  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    zzel localzzel = paramzzic.zzeF();
    if (localzzel == null)
    {
      zzhx.zzac("A GMSG tried to close something that wasn't an overlay.");
      return;
    }
    localzzel.close();
  }
}