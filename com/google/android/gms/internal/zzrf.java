package com.google.android.gms.internal;

import android.support.v4.util.ArrayMap;
import java.util.Map;

public final class zzrf extends zzqy<zzrf>
{
  private String zzBa;
  private String zzBb;
  private String zzBc;
  private String zzBd;

  public void setAppId(String paramString)
  {
    this.zzBc = paramString;
  }

  public void setAppInstallerId(String paramString)
  {
    this.zzBd = paramString;
  }

  public void setAppName(String paramString)
  {
    this.zzBa = paramString;
  }

  public void setAppVersion(String paramString)
  {
    this.zzBb = paramString;
  }

  public String toString()
  {
    ArrayMap localArrayMap = new ArrayMap();
    localArrayMap.put("appName", this.zzBa);
    localArrayMap.put("appVersion", this.zzBb);
    localArrayMap.put("appId", this.zzBc);
    localArrayMap.put("appInstallerId", this.zzBd);
    return zzG(localArrayMap);
  }

  public String zzga()
  {
    return this.zzBa;
  }

  public String zzgc()
  {
    return this.zzBb;
  }

  public String zznE()
  {
    return this.zzBc;
  }

  public String zzra()
  {
    return this.zzBd;
  }
}