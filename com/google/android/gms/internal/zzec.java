package com.google.android.gms.internal;

import java.util.Map;

@zzgi
public class zzec
{
  private final zzic zzmu;
  private final boolean zztv;
  private final String zztw;

  public zzec(zzic paramzzic, Map<String, String> paramMap)
  {
    this.zzmu = paramzzic;
    this.zztw = ((String)paramMap.get("forceOrientation"));
    if (paramMap.containsKey("allowOrientationChange"))
    {
      this.zztv = Boolean.parseBoolean((String)paramMap.get("allowOrientationChange"));
      return;
    }
    this.zztv = true;
  }

  public void execute()
  {
    if (this.zzmu == null)
    {
      zzhx.zzac("AdWebView is null");
      return;
    }
    int i;
    if ("portrait".equalsIgnoreCase(this.zztw))
      i = zzab.zzaO().zzey();
    while (true)
    {
      this.zzmu.setRequestedOrientation(i);
      return;
      if ("landscape".equalsIgnoreCase(this.zztw))
        i = zzab.zzaO().zzex();
      else if (this.zztv)
        i = -1;
      else
        i = zzab.zzaO().zzez();
    }
  }
}