package com.google.android.gms.internal;

import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;

@zzgi
public final class zzck extends zzcj.zza
{
  private final OnCustomRenderedAdLoadedListener zzpL;

  public zzck(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    this.zzpL = paramOnCustomRenderedAdLoadedListener;
  }

  public void zza(zzci paramzzci)
  {
    this.zzpL.onCustomRenderedAdLoaded(new zzch(paramzzci));
  }
}