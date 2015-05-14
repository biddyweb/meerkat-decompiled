package com.google.android.gms.internal;

import android.text.TextUtils;
import java.io.IOException;

public abstract class zzjt
{
  protected final zzkc zzKe;
  private final String zzKf;
  private zzke zzKg;

  protected zzjt(String paramString1, String paramString2, String paramString3)
  {
    zzjv.zzaK(paramString1);
    this.zzKf = paramString1;
    this.zzKe = new zzkc(paramString2);
    if (!TextUtils.isEmpty(paramString3))
      this.zzKe.zzaP(paramString3);
  }

  public final String getNamespace()
  {
    return this.zzKf;
  }

  public final void zza(zzke paramzzke)
  {
    this.zzKg = paramzzke;
    if (this.zzKg == null)
      zzhm();
  }

  protected final void zza(String paramString1, long paramLong, String paramString2)
    throws IOException
  {
    this.zzKe.zza("Sending text message: %s to: %s", new Object[] { paramString1, paramString2 });
    this.zzKg.zza(this.zzKf, paramString1, paramLong, paramString2);
  }

  public void zzaI(String paramString)
  {
  }

  public void zzb(long paramLong, int paramInt)
  {
  }

  public void zzhm()
  {
  }

  protected final long zzhn()
  {
    return this.zzKg.zzhk();
  }
}