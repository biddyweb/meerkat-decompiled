package com.google.android.gms.internal;

import com.google.android.gms.ads.AdListener;

@zzgi
public final class zzav extends zzbh.zza
{
  private final AdListener zzoK;

  public zzav(AdListener paramAdListener)
  {
    this.zzoK = paramAdListener;
  }

  public void onAdClosed()
  {
    this.zzoK.onAdClosed();
  }

  public void onAdFailedToLoad(int paramInt)
  {
    this.zzoK.onAdFailedToLoad(paramInt);
  }

  public void onAdLeftApplication()
  {
    this.zzoK.onAdLeftApplication();
  }

  public void onAdLoaded()
  {
    this.zzoK.onAdLoaded();
  }

  public void onAdOpened()
  {
    this.zzoK.onAdOpened();
  }
}