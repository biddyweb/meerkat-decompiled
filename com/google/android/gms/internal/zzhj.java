package com.google.android.gms.internal;

import android.os.Bundle;

@zzgi
public class zzhj
{
  private final zzhg zzmV;
  private final Object zznh = new Object();
  private final String zzyC;
  private int zzze;
  private int zzzf;

  zzhj(zzhg paramzzhg, String paramString)
  {
    this.zzmV = paramzzhg;
    this.zzyC = paramString;
  }

  public zzhj(String paramString)
  {
    this(zzab.zzaP(), paramString);
  }

  public Bundle toBundle()
  {
    synchronized (this.zznh)
    {
      Bundle localBundle = new Bundle();
      localBundle.putInt("pmnli", this.zzze);
      localBundle.putInt("pmnll", this.zzzf);
      return localBundle;
    }
  }

  public void zzg(int paramInt1, int paramInt2)
  {
    synchronized (this.zznh)
    {
      this.zzze = paramInt1;
      this.zzzf = paramInt2;
      this.zzmV.zza(this.zzyC, this);
      return;
    }
  }
}