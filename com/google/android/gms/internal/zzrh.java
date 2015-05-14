package com.google.android.gms.internal;

import android.support.v4.util.ArrayMap;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import java.util.Map;
import java.util.UUID;

public final class zzrh extends zzqy<zzrh>
{
  private String zzasq;
  private int zzasr;
  private int zzass;
  private String zzast;
  private String zzasu;
  private boolean zzasv;
  private boolean zzasw;
  private boolean zzasx;

  public zzrh()
  {
    this(false);
  }

  public zzrh(boolean paramBoolean)
  {
    this(paramBoolean, zzrd());
  }

  public zzrh(boolean paramBoolean, int paramInt)
  {
    zzx.zzaL(paramInt);
    this.zzasr = paramInt;
    this.zzasw = paramBoolean;
  }

  static int zzrd()
  {
    UUID localUUID = UUID.randomUUID();
    int i = (int)(0x7FFFFFFF & localUUID.getLeastSignificantBits());
    if (i != 0);
    do
    {
      return i;
      i = (int)(0x7FFFFFFF & localUUID.getMostSignificantBits());
    }
    while (i != 0);
    Log.e("com.google.android.gms.measurement.data.ScreenViewInfo", "UUID.randomUUID() returned 0.");
    return 2147483647;
  }

  private void zzrj()
  {
    if (this.zzasx)
      throw new IllegalStateException("ScreenViewInfo is immutable");
  }

  public boolean isMutable()
  {
    return !this.zzasx;
  }

  public void setScreenName(String paramString)
  {
    zzrj();
    this.zzasq = paramString;
  }

  public String toString()
  {
    ArrayMap localArrayMap = new ArrayMap();
    localArrayMap.put("screenName", this.zzasq);
    localArrayMap.put("interstitial", Boolean.valueOf(this.zzasv));
    localArrayMap.put("automatic", Boolean.valueOf(this.zzasw));
    localArrayMap.put("screenId", Integer.valueOf(this.zzasr));
    localArrayMap.put("referrerScreenId", Integer.valueOf(this.zzass));
    localArrayMap.put("referrerScreenName", this.zzast);
    localArrayMap.put("referrerUri", this.zzasu);
    return zzG(localArrayMap);
  }

  public int zzaF()
  {
    return this.zzasr;
  }

  public void zzaa(boolean paramBoolean)
  {
    zzrj();
    this.zzasv = paramBoolean;
  }

  public void zzcv(String paramString)
  {
    zzrj();
    this.zzast = paramString;
  }

  public void zzgr(int paramInt)
  {
    zzrj();
    this.zzass = paramInt;
  }

  public String zzre()
  {
    return this.zzasq;
  }

  public int zzrf()
  {
    return this.zzass;
  }

  public String zzrg()
  {
    return this.zzast;
  }

  public void zzrh()
  {
    this.zzasx = true;
  }

  public boolean zzri()
  {
    return this.zzasv;
  }
}