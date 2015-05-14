package com.google.android.gms.internal;

import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;

@zzgi
public final class zzfx extends zzfs.zza
{
  private final PlayStorePurchaseListener zzpK;

  public zzfx(PlayStorePurchaseListener paramPlayStorePurchaseListener)
  {
    this.zzpK = paramPlayStorePurchaseListener;
  }

  public boolean isValidPurchase(String paramString)
  {
    return this.zzpK.isValidPurchase(paramString);
  }

  public void zza(zzfr paramzzfr)
  {
    this.zzpK.onInAppPurchaseFinished(new zzfv(paramzzfr));
  }
}