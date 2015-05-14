package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;

@zzgi
public class zzcl extends zzco.zza
  implements zzcn.zza
{
  private final Object zznh = new Object();
  private final String zzrk;
  private final Drawable zzrl;
  private final String zzrm;
  private final Drawable zzrn;
  private final String zzro;
  private final double zzrp;
  private final String zzrq;
  private final String zzrr;
  private zzcn zzrs;

  public zzcl(String paramString1, Drawable paramDrawable1, String paramString2, Drawable paramDrawable2, String paramString3, double paramDouble, String paramString4, String paramString5)
  {
    this.zzrk = paramString1;
    this.zzrl = paramDrawable1;
    this.zzrm = paramString2;
    this.zzrn = paramDrawable2;
    this.zzro = paramString3;
    this.zzrp = paramDouble;
    this.zzrq = paramString4;
    this.zzrr = paramString5;
  }

  public String getBody()
  {
    return this.zzrm;
  }

  public void recordImpression()
  {
    synchronized (this.zznh)
    {
      if (this.zzrs == null)
      {
        zzhx.zzZ("Attempt to record impression before app install ad initialized.");
        return;
      }
      this.zzrs.recordImpression();
      return;
    }
  }

  public void zza(zzcn paramzzcn)
  {
    synchronized (this.zznh)
    {
      this.zzrs = paramzzcn;
      return;
    }
  }

  public double zzcA()
  {
    return this.zzrp;
  }

  public String zzcB()
  {
    return this.zzrq;
  }

  public String zzcC()
  {
    return this.zzrr;
  }

  public String zzcw()
  {
    return this.zzrk;
  }

  public zzd zzcx()
  {
    return zze.zzn(this.zzrl);
  }

  public zzd zzcy()
  {
    return zze.zzn(this.zzrn);
  }

  public String zzcz()
  {
    return this.zzro;
  }

  public void zzl(int paramInt)
  {
    synchronized (this.zznh)
    {
      if (this.zzrs == null)
      {
        zzhx.zzZ("Attempt to perform click before app install ad initialized.");
        return;
      }
      this.zzrs.zzb("2", paramInt);
      return;
    }
  }
}