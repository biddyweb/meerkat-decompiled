package com.google.android.gms.internal;

import java.util.concurrent.Future;

@zzgi
public final class zzgy
{
  zzic zzmu;
  private final Object zznh = new Object();
  public final zzcv zzxA = new zzgy.2(this);
  private String zzxv;
  private String zzxw;
  private zzhq<zzha> zzxx = new zzhq();
  zzia<zzah> zzxy;
  public final zzcv zzxz = new zzgy.1(this);

  public zzgy(String paramString1, String paramString2)
  {
    this.zzxw = paramString2;
    this.zzxv = paramString1;
  }

  public void zza(zzic paramzzic)
  {
    this.zzmu = paramzzic;
  }

  public zzia<zzah> zzdR()
  {
    return this.zzxy;
  }

  public Future<zzha> zzdS()
  {
    return this.zzxx;
  }

  public void zzdT()
  {
    if (this.zzmu != null)
    {
      this.zzmu.destroy();
      this.zzmu = null;
    }
  }

  public void zze(zzia<zzah> paramzzia)
  {
    this.zzxy = paramzzia;
  }
}