package com.google.android.gms.internal;

import java.util.HashMap;
import java.util.Map;

@zzgi
public class zzcz
  implements zzcv
{
  static final Map<String, Integer> zzrM = new HashMap();
  private final zzu zzrK;
  private final zzeb zzrL;

  static
  {
    zzrM.put("resize", Integer.valueOf(1));
    zzrM.put("playVideo", Integer.valueOf(2));
    zzrM.put("storePicture", Integer.valueOf(3));
    zzrM.put("createCalendarEvent", Integer.valueOf(4));
    zzrM.put("setOrientationProperties", Integer.valueOf(5));
    zzrM.put("closeResizedAd", Integer.valueOf(6));
  }

  public zzcz(zzu paramzzu, zzeb paramzzeb)
  {
    this.zzrK = paramzzu;
    this.zzrL = paramzzeb;
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str = (String)paramMap.get("a");
    int i = ((Integer)zzrM.get(str)).intValue();
    if ((i != 5) && (this.zzrK != null) && (!this.zzrK.zzaB()))
    {
      this.zzrK.zzd(null);
      return;
    }
    switch (i)
    {
    case 2:
    default:
      zzhx.zzaa("Unknown MRAID command called.");
      return;
    case 1:
      this.zzrL.zzg(paramMap);
      return;
    case 4:
      new zzea(paramzzic, paramMap).execute();
      return;
    case 3:
      new zzed(paramzzic, paramMap).execute();
      return;
    case 5:
      new zzec(paramzzic, paramMap).execute();
      return;
    case 6:
    }
    this.zzrL.zzm(true);
  }
}