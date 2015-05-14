package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;

@zzgi
public class zzcm extends zzcp.zza
  implements zzcn.zza
{
  private final Object zznh = new Object();
  private final String zzrk;
  private final Drawable zzrl;
  private final String zzrm;
  private final String zzro;
  private zzcn zzrs;
  private final Drawable zzrt;
  private final String zzru;

  public zzcm(String paramString1, Drawable paramDrawable1, String paramString2, Drawable paramDrawable2, String paramString3, String paramString4)
  {
    this.zzrk = paramString1;
    this.zzrl = paramDrawable1;
    this.zzrm = paramString2;
    this.zzrt = paramDrawable2;
    this.zzro = paramString3;
    this.zzru = paramString4;
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
        zzhx.zzZ("Attempt to record impression before content ad initialized.");
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

  public zzd zzcD()
  {
    return zze.zzn(this.zzrt);
  }

  public String zzcE()
  {
    return this.zzru;
  }

  public String zzcw()
  {
    return this.zzrk;
  }

  public zzd zzcx()
  {
    return zze.zzn(this.zzrl);
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
        zzhx.zzZ("Attempt to perform click before content ad initialized.");
        return;
      }
      this.zzrs.zzb("1", paramInt);
      return;
    }
  }
}