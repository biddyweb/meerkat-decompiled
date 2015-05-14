package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;

@zzgi
public class zzfz
  implements Runnable
{
  private final int zzli;
  private final int zzlj;
  protected final zzic zzmu;
  private final Handler zzvA;
  private final long zzvB;
  private long zzvC;
  private zzid.zza zzvD;
  protected boolean zzvE;
  protected boolean zzvF;

  public zzfz(zzid.zza paramzza, zzic paramzzic, int paramInt1, int paramInt2)
  {
    this(paramzza, paramzzic, paramInt1, paramInt2, 200L, 50L);
  }

  public zzfz(zzid.zza paramzza, zzic paramzzic, int paramInt1, int paramInt2, long paramLong1, long paramLong2)
  {
    this.zzvB = paramLong1;
    this.zzvC = paramLong2;
    this.zzvA = new Handler(Looper.getMainLooper());
    this.zzmu = paramzzic;
    this.zzvD = paramzza;
    this.zzvE = false;
    this.zzvF = false;
    this.zzlj = paramInt2;
    this.zzli = paramInt1;
  }

  public void run()
  {
    if ((this.zzmu == null) || (zzdE()))
    {
      this.zzvD.zza(this.zzmu, true);
      return;
    }
    new zzfz.zza(this, this.zzmu.getWebView()).execute(new Void[0]);
  }

  public void zza(zzgq paramzzgq)
  {
    zza(paramzzgq, new zzij(this, this.zzmu, paramzzgq.zzwP));
  }

  public void zza(zzgq paramzzgq, zzij paramzzij)
  {
    this.zzmu.setWebViewClient(paramzzij);
    zzic localzzic = this.zzmu;
    if (TextUtils.isEmpty(paramzzgq.zzus));
    for (String str = null; ; str = zzab.zzaM().zzS(paramzzgq.zzus))
    {
      localzzic.loadDataWithBaseURL(str, paramzzgq.zzwG, "text/html", "UTF-8", null);
      return;
    }
  }

  public void zzdC()
  {
    this.zzvA.postDelayed(this, this.zzvB);
  }

  public void zzdD()
  {
    try
    {
      this.zzvE = true;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean zzdE()
  {
    try
    {
      boolean bool = this.zzvE;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean zzdF()
  {
    return this.zzvF;
  }
}