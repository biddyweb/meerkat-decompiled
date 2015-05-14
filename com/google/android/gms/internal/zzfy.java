package com.google.android.gms.internal;

import android.content.Context;
import android.os.SystemClock;

@zzgi
public abstract class zzfy extends zzgb
  implements zzid.zza
{
  private boolean zzsg = false;
  private final zzid zzvy;
  protected boolean zzvz = false;

  protected zzfy(Context paramContext, zzhe.zza paramzza, zzic paramzzic, zzgc.zza paramzza1)
  {
    super(paramContext, paramzza, paramzzic, paramzza1);
    this.zzvy = paramzzic.zzeG();
  }

  private boolean zzd(long paramLong)
    throws zzgb.zza
  {
    long l = 60000L - (SystemClock.elapsedRealtime() - paramLong);
    if (l <= 1L)
      return false;
    try
    {
      this.zznh.wait(l);
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
    }
    throw new zzgb.zza("Ad request cancelled.", -1);
  }

  public void onStop()
  {
    synchronized (this.zzvM)
    {
      this.zzmu.stopLoading();
      zzab.zzaO().zza(this.zzmu.getWebView());
      return;
    }
  }

  public void zza(zzic paramzzic, boolean paramBoolean)
  {
    for (boolean bool = true; ; bool = false)
      synchronized (this.zznh)
      {
        zzhx.zzY("WebView finished loading.");
        this.zzvz = true;
        if (!paramBoolean)
        {
          this.zzsg = bool;
          this.zznh.notify();
          return;
        }
      }
  }

  protected void zzf(long paramLong)
    throws zzgb.zza
  {
    do
    {
      if (!zzd(paramLong))
        throw new zzgb.zza("Timed out waiting for WebView to finish loading.", 2);
      if (this.zzsg)
        throw new zzgb.zza("Received cancellation request from creative.", 0);
    }
    while (!this.zzvz);
  }
}