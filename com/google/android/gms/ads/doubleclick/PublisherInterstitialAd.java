package com.google.android.gms.ads.doubleclick;

import android.content.Context;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.internal.zzbq;

public final class PublisherInterstitialAd
{
  private final zzbq zzlm = new zzbq(paramContext, this);

  public PublisherInterstitialAd(Context paramContext)
  {
  }

  public AdListener getAdListener()
  {
    return this.zzlm.getAdListener();
  }

  public String getAdUnitId()
  {
    return this.zzlm.getAdUnitId();
  }

  public AppEventListener getAppEventListener()
  {
    return this.zzlm.getAppEventListener();
  }

  public String getMediationAdapterClassName()
  {
    return this.zzlm.getMediationAdapterClassName();
  }

  public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener()
  {
    return this.zzlm.getOnCustomRenderedAdLoadedListener();
  }

  public boolean isLoaded()
  {
    return this.zzlm.isLoaded();
  }

  public void loadAd(PublisherAdRequest paramPublisherAdRequest)
  {
    this.zzlm.zza(paramPublisherAdRequest.zzY());
  }

  public void setAdListener(AdListener paramAdListener)
  {
    this.zzlm.setAdListener(paramAdListener);
  }

  public void setAdUnitId(String paramString)
  {
    this.zzlm.setAdUnitId(paramString);
  }

  public void setAppEventListener(AppEventListener paramAppEventListener)
  {
    this.zzlm.setAppEventListener(paramAppEventListener);
  }

  public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    this.zzlm.setOnCustomRenderedAdLoadedListener(paramOnCustomRenderedAdLoadedListener);
  }

  public void show()
  {
    this.zzlm.show();
  }
}