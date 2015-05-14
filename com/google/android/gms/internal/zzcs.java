package com.google.android.gms.internal;

import java.util.Map;

@zzgi
public final class zzcs
  implements zzcv
{
  private final zzct zzry;

  public zzcs(zzct paramzzct)
  {
    this.zzry = paramzzct;
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str = (String)paramMap.get("name");
    if (str == null)
    {
      zzhx.zzac("App event with no name parameter.");
      return;
    }
    this.zzry.onAppEvent(str, (String)paramMap.get("info"));
  }
}