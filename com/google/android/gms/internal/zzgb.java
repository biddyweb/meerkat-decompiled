package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import android.os.SystemClock;

@zzgi
public abstract class zzgb extends zzhl
{
  protected final Context mContext;
  protected final zzic zzmu;
  protected final Object zznh = new Object();
  protected final zzgc.zza zzvL;
  protected final Object zzvM = new Object();
  protected final zzhe.zza zzvN;
  protected zzgq zzvO;

  protected zzgb(Context paramContext, zzhe.zza paramzza, zzic paramzzic, zzgc.zza paramzza1)
  {
    this.mContext = paramContext;
    this.zzvN = paramzza;
    this.zzvO = paramzza.zzyz;
    this.zzmu = paramzzic;
    this.zzvL = paramzza1;
  }

  public void onStop()
  {
  }

  public void zzdw()
  {
    while (true)
    {
      int j;
      synchronized (this.zznh)
      {
        zzhx.zzY("AdRendererBackgroundTask started.");
        int i = this.zzvN.errorCode;
        try
        {
          zzg(SystemClock.elapsedRealtime());
          zzhe localzzhe = zzt(i);
          zzhw.zzzG.post(new zzgb.2(this, localzzhe));
          return;
        }
        catch (zzgb.zza localzza)
        {
          j = localzza.getErrorCode();
          if (j == 3)
            continue;
        }
        if (j == -1)
        {
          zzhx.zzaa(localzza.getMessage());
          if (this.zzvO != null)
            break label140;
          this.zzvO = new zzgq(j);
          zzhw.zzzG.post(new zzgb.1(this));
          i = j;
          continue;
        }
        zzhx.zzac(localzza.getMessage());
      }
      label140: this.zzvO = new zzgq(j, this.zzvO.zzsx);
    }
  }

  protected abstract void zzg(long paramLong)
    throws zzgb.zza;

  protected void zzh(zzhe paramzzhe)
  {
    this.zzvL.zza(paramzzhe);
  }

  protected zzhe zzt(int paramInt)
  {
    zzgo localzzgo = this.zzvN.zzyy;
    return new zzhe(localzzgo.zzwn, this.zzmu, this.zzvO.zzst, paramInt, this.zzvO.zzsu, this.zzvO.zzwK, this.zzvO.orientation, this.zzvO.zzsx, localzzgo.zzwq, this.zzvO.zzwI, null, null, null, null, null, this.zzvO.zzwJ, this.zzvN.zzlV, this.zzvO.zzwH, this.zzvN.zzyv, this.zzvO.zzwM, this.zzvO.zzwN, this.zzvN.zzys, null, localzzgo.zzwD);
  }
}