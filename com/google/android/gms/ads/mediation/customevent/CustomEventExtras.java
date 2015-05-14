package com.google.android.gms.ads.mediation.customevent;

import com.google.ads.mediation.NetworkExtras;
import java.util.HashMap;

@Deprecated
public final class CustomEventExtras
  implements NetworkExtras
{
  private final HashMap<String, Object> zzAw = new HashMap();

  public Object getExtra(String paramString)
  {
    return this.zzAw.get(paramString);
  }

  public void setExtra(String paramString, Object paramObject)
  {
    this.zzAw.put(paramString, paramObject);
  }
}