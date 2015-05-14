package com.google.android.gms.internal;

import java.util.Map;

class zzaf$9
  implements zzcv
{
  zzaf$9(zzaf paramzzaf)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    if (!this.zznI.zza(paramMap));
    while (!paramMap.containsKey("isVisible"))
      return;
    if (("1".equals(paramMap.get("isVisible"))) || ("true".equals(paramMap.get("isVisible"))));
    for (boolean bool = true; ; bool = false)
    {
      Boolean localBoolean = Boolean.valueOf(bool);
      this.zznI.zzg(localBoolean.booleanValue());
      return;
    }
  }
}