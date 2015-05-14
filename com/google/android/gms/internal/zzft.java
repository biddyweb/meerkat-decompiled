package com.google.android.gms.internal;

import com.google.android.gms.ads.purchase.InAppPurchaseListener;

@zzgi
public final class zzft extends zzfo.zza
{
  private final InAppPurchaseListener zzpJ;

  public zzft(InAppPurchaseListener paramInAppPurchaseListener)
  {
    this.zzpJ = paramInAppPurchaseListener;
  }

  public void zza(zzfn paramzzfn)
  {
    this.zzpJ.onInAppPurchaseRequested(new zzfw(paramzzfn));
  }
}