package com.google.android.gms.ads.mediation.customevent;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.internal.zzhx;

public final class CustomEventAdapter
  implements MediationBannerAdapter, MediationInterstitialAdapter
{
  CustomEventBanner zzAs;
  CustomEventInterstitial zzAt;
  private View zzn;

  private static <T> T zza(String paramString)
  {
    try
    {
      Object localObject = Class.forName(paramString).newInstance();
      return localObject;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzac("Could not instantiate custom event adapter: " + paramString + ". " + localThrowable.getMessage());
    }
    return null;
  }

  private void zza(View paramView)
  {
    this.zzn = paramView;
  }

  public View getBannerView()
  {
    return this.zzn;
  }

  public void onDestroy()
  {
    if (this.zzAs != null)
      this.zzAs.onDestroy();
    if (this.zzAt != null)
      this.zzAt.onDestroy();
  }

  public void onPause()
  {
    if (this.zzAs != null)
      this.zzAs.onPause();
    if (this.zzAt != null)
      this.zzAt.onPause();
  }

  public void onResume()
  {
    if (this.zzAs != null)
      this.zzAs.onResume();
    if (this.zzAt != null)
      this.zzAt.onResume();
  }

  public void requestBannerAd(Context paramContext, MediationBannerListener paramMediationBannerListener, Bundle paramBundle1, AdSize paramAdSize, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    this.zzAs = ((CustomEventBanner)zza(paramBundle1.getString("class_name")));
    if (this.zzAs == null)
    {
      paramMediationBannerListener.onAdFailedToLoad(this, 0);
      return;
    }
    if (paramBundle2 == null);
    for (Bundle localBundle = null; ; localBundle = paramBundle2.getBundle(paramBundle1.getString("class_name")))
    {
      this.zzAs.requestBannerAd(paramContext, new zza(this, paramMediationBannerListener), paramBundle1.getString("parameter"), paramAdSize, paramMediationAdRequest, localBundle);
      return;
    }
  }

  public void requestInterstitialAd(Context paramContext, MediationInterstitialListener paramMediationInterstitialListener, Bundle paramBundle1, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    this.zzAt = ((CustomEventInterstitial)zza(paramBundle1.getString("class_name")));
    if (this.zzAt == null)
    {
      paramMediationInterstitialListener.onAdFailedToLoad(this, 0);
      return;
    }
    if (paramBundle2 == null);
    for (Bundle localBundle = null; ; localBundle = paramBundle2.getBundle(paramBundle1.getString("class_name")))
    {
      this.zzAt.requestInterstitialAd(paramContext, zza(paramMediationInterstitialListener), paramBundle1.getString("parameter"), paramMediationAdRequest, localBundle);
      return;
    }
  }

  public void showInterstitial()
  {
    this.zzAt.showInterstitial();
  }

  zzb zza(MediationInterstitialListener paramMediationInterstitialListener)
  {
    return new zzb(this, paramMediationInterstitialListener);
  }

  static final class zza
    implements CustomEventBannerListener
  {
    private final CustomEventAdapter zzAu;
    private final MediationBannerListener zzl;

    public zza(CustomEventAdapter paramCustomEventAdapter, MediationBannerListener paramMediationBannerListener)
    {
      this.zzAu = paramCustomEventAdapter;
      this.zzl = paramMediationBannerListener;
    }

    public void onAdClicked()
    {
      zzhx.zzY("Custom event adapter called onAdClicked.");
      this.zzl.onAdClicked(this.zzAu);
    }

    public void onAdClosed()
    {
      zzhx.zzY("Custom event adapter called onAdClosed.");
      this.zzl.onAdClosed(this.zzAu);
    }

    public void onAdFailedToLoad(int paramInt)
    {
      zzhx.zzY("Custom event adapter called onAdFailedToLoad.");
      this.zzl.onAdFailedToLoad(this.zzAu, paramInt);
    }

    public void onAdLeftApplication()
    {
      zzhx.zzY("Custom event adapter called onAdLeftApplication.");
      this.zzl.onAdLeftApplication(this.zzAu);
    }

    public void onAdLoaded(View paramView)
    {
      zzhx.zzY("Custom event adapter called onAdLoaded.");
      CustomEventAdapter.zza(this.zzAu, paramView);
      this.zzl.onAdLoaded(this.zzAu);
    }

    public void onAdOpened()
    {
      zzhx.zzY("Custom event adapter called onAdOpened.");
      this.zzl.onAdOpened(this.zzAu);
    }
  }

  class zzb
    implements CustomEventInterstitialListener
  {
    private final CustomEventAdapter zzAu;
    private final MediationInterstitialListener zzm;

    public zzb(CustomEventAdapter paramMediationInterstitialListener, MediationInterstitialListener arg3)
    {
      this.zzAu = paramMediationInterstitialListener;
      Object localObject;
      this.zzm = localObject;
    }

    public void onAdClicked()
    {
      zzhx.zzY("Custom event adapter called onAdClicked.");
      this.zzm.onAdClicked(this.zzAu);
    }

    public void onAdClosed()
    {
      zzhx.zzY("Custom event adapter called onAdClosed.");
      this.zzm.onAdClosed(this.zzAu);
    }

    public void onAdFailedToLoad(int paramInt)
    {
      zzhx.zzY("Custom event adapter called onFailedToReceiveAd.");
      this.zzm.onAdFailedToLoad(this.zzAu, paramInt);
    }

    public void onAdLeftApplication()
    {
      zzhx.zzY("Custom event adapter called onAdLeftApplication.");
      this.zzm.onAdLeftApplication(this.zzAu);
    }

    public void onAdLoaded()
    {
      zzhx.zzY("Custom event adapter called onReceivedAd.");
      this.zzm.onAdLoaded(CustomEventAdapter.this);
    }

    public void onAdOpened()
    {
      zzhx.zzY("Custom event adapter called onAdOpened.");
      this.zzm.onAdOpened(this.zzAu);
    }
  }
}