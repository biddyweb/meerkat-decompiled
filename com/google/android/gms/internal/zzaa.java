package com.google.android.gms.internal;

import java.lang.ref.WeakReference;

@zzgi
public class zzaa
{
  private final zzaa.zza zzmF;
  private final Runnable zzmG;
  private zzax zzmH;
  private boolean zzmI = false;
  private boolean zzmJ = false;
  private long zzmK = 0L;

  public zzaa(zzt paramzzt)
  {
    this(paramzzt, new zzaa.zza(zzhw.zzzG));
  }

  zzaa(zzt paramzzt, zzaa.zza paramzza)
  {
    this.zzmF = paramzza;
    this.zzmG = new zzaa.1(this, new WeakReference(paramzzt));
  }

  public void cancel()
  {
    this.zzmI = false;
    this.zzmF.removeCallbacks(this.zzmG);
  }

  public void pause()
  {
    this.zzmJ = true;
    if (this.zzmI)
      this.zzmF.removeCallbacks(this.zzmG);
  }

  public void resume()
  {
    this.zzmJ = false;
    if (this.zzmI)
    {
      this.zzmI = false;
      zza(this.zzmH, this.zzmK);
    }
  }

  public void zza(zzax paramzzax, long paramLong)
  {
    if (this.zzmI)
      zzhx.zzac("An ad refresh is already scheduled.");
    do
    {
      return;
      this.zzmH = paramzzax;
      this.zzmI = true;
      this.zzmK = paramLong;
    }
    while (this.zzmJ);
    zzhx.zzaa("Scheduling ad refresh " + paramLong + " milliseconds from now.");
    this.zzmF.postDelayed(this.zzmG, paramLong);
  }

  public boolean zzaG()
  {
    return this.zzmI;
  }

  public void zzc(zzax paramzzax)
  {
    zza(paramzzax, 60000L);
  }
}