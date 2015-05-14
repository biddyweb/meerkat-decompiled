package com.google.android.gms.internal;

import android.support.v4.util.ArrayMap;
import java.util.Map;

public final class zzrg extends zzqy<zzrg>
{
  private String zzIO;
  public int zzasn;
  public int zzaso;
  public int zzasp;
  public int zztI;
  public int zztJ;

  public void setLanguage(String paramString)
  {
    this.zzIO = paramString;
  }

  public String toString()
  {
    ArrayMap localArrayMap = new ArrayMap();
    localArrayMap.put("language", this.zzIO);
    localArrayMap.put("screenColors", Integer.valueOf(this.zzasn));
    localArrayMap.put("screenWidth", Integer.valueOf(this.zztI));
    localArrayMap.put("screenHeight", Integer.valueOf(this.zztJ));
    localArrayMap.put("viewportWidth", Integer.valueOf(this.zzaso));
    localArrayMap.put("viewportHeight", Integer.valueOf(this.zzasp));
    return zzG(localArrayMap);
  }

  public void zzgp(int paramInt)
  {
    this.zztI = paramInt;
  }

  public void zzgq(int paramInt)
  {
    this.zztJ = paramInt;
  }

  public int zzrb()
  {
    return this.zztI;
  }

  public int zzrc()
  {
    return this.zztJ;
  }
}