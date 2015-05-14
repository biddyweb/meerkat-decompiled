package com.google.android.gms.ads;

import android.content.Context;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.internal.zzat;
import com.google.android.gms.internal.zzbq;

public final class InterstitialAd
{
  private final zzbq zzlm;

  public InterstitialAd(Context paramContext)
  {
    this.zzlm = new zzbq(paramContext);
  }

  public AdListener getAdListener()
  {
    return this.zzlm.getAdListener();
  }

  public String getAdUnitId()
  {
    return this.zzlm.getAdUnitId();
  }

  public InAppPurchaseListener getInAppPurchaseListener()
  {
    return this.zzlm.getInAppPurchaseListener();
  }

  public String getMediationAdapterClassName()
  {
    return this.zzlm.getMediationAdapterClassName();
  }

  public boolean isLoaded()
  {
    return this.zzlm.isLoaded();
  }

  public void loadAd(AdRequest paramAdRequest)
  {
    this.zzlm.zza(paramAdRequest.zzY());
  }

  public void setAdListener(AdListener paramAdListener)
  {
    this.zzlm.setAdListener(paramAdListener);
    if ((paramAdListener != null) && ((paramAdListener instanceof zzat)))
      this.zzlm.zza((zzat)paramAdListener);
    while (paramAdListener != null)
      return;
    this.zzlm.zza(null);
  }

  public void setAdUnitId(String paramString)
  {
    this.zzlm.setAdUnitId(paramString);
  }

  public void setInAppPurchaseListener(InAppPurchaseListener paramInAppPurchaseListener)
  {
    this.zzlm.setInAppPurchaseListener(paramInAppPurchaseListener);
  }

  public void setPlayStorePurchaseParams(PlayStorePurchaseListener paramPlayStorePurchaseListener, String paramString)
  {
    this.zzlm.setPlayStorePurchaseParams(paramPlayStorePurchaseListener, paramString);
  }

  public void show()
  {
    this.zzlm.show();
  }
}