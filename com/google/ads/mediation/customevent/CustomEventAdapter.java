package com.google.ads.mediation.customevent;

import android.app.Activity;
import android.view.View;
import com.google.ads.AdRequest.ErrorCode;
import com.google.ads.AdSize;
import com.google.ads.mediation.MediationAdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.ads.mediation.customevent.CustomEventExtras;
import com.google.android.gms.internal.zzhx;

public final class CustomEventAdapter
  implements MediationBannerAdapter<CustomEventExtras, CustomEventServerParameters>, MediationInterstitialAdapter<CustomEventExtras, CustomEventServerParameters>
{
  private View zzn;
  CustomEventBanner zzo;
  CustomEventInterstitial zzp;

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

  public void destroy()
  {
    if (this.zzo != null)
      this.zzo.destroy();
    if (this.zzp != null)
      this.zzp.destroy();
  }

  public Class<CustomEventExtras> getAdditionalParametersType()
  {
    return CustomEventExtras.class;
  }

  public View getBannerView()
  {
    return this.zzn;
  }

  public Class<CustomEventServerParameters> getServerParametersType()
  {
    return CustomEventServerParameters.class;
  }

  public void requestBannerAd(MediationBannerListener paramMediationBannerListener, Activity paramActivity, CustomEventServerParameters paramCustomEventServerParameters, AdSize paramAdSize, MediationAdRequest paramMediationAdRequest, CustomEventExtras paramCustomEventExtras)
  {
    this.zzo = ((CustomEventBanner)zza(paramCustomEventServerParameters.className));
    if (this.zzo == null)
    {
      paramMediationBannerListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
      return;
    }
    if (paramCustomEventExtras == null);
    for (Object localObject = null; ; localObject = paramCustomEventExtras.getExtra(paramCustomEventServerParameters.label))
    {
      this.zzo.requestBannerAd(new zza(this, paramMediationBannerListener), paramActivity, paramCustomEventServerParameters.label, paramCustomEventServerParameters.parameter, paramAdSize, paramMediationAdRequest, localObject);
      return;
    }
  }

  public void requestInterstitialAd(MediationInterstitialListener paramMediationInterstitialListener, Activity paramActivity, CustomEventServerParameters paramCustomEventServerParameters, MediationAdRequest paramMediationAdRequest, CustomEventExtras paramCustomEventExtras)
  {
    this.zzp = ((CustomEventInterstitial)zza(paramCustomEventServerParameters.className));
    if (this.zzp == null)
    {
      paramMediationInterstitialListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
      return;
    }
    if (paramCustomEventExtras == null);
    for (Object localObject = null; ; localObject = paramCustomEventExtras.getExtra(paramCustomEventServerParameters.label))
    {
      this.zzp.requestInterstitialAd(zza(paramMediationInterstitialListener), paramActivity, paramCustomEventServerParameters.label, paramCustomEventServerParameters.parameter, paramMediationAdRequest, localObject);
      return;
    }
  }

  public void showInterstitial()
  {
    this.zzp.showInterstitial();
  }

  zzb zza(MediationInterstitialListener paramMediationInterstitialListener)
  {
    return new zzb(this, paramMediationInterstitialListener);
  }

  static final class zza
    implements CustomEventBannerListener
  {
    private final CustomEventAdapter zzq;
    private final MediationBannerListener zzr;

    public zza(CustomEventAdapter paramCustomEventAdapter, MediationBannerListener paramMediationBannerListener)
    {
      this.zzq = paramCustomEventAdapter;
      this.zzr = paramMediationBannerListener;
    }

    public void onClick()
    {
      zzhx.zzY("Custom event adapter called onFailedToReceiveAd.");
      this.zzr.onClick(this.zzq);
    }

    public void onDismissScreen()
    {
      zzhx.zzY("Custom event adapter called onFailedToReceiveAd.");
      this.zzr.onDismissScreen(this.zzq);
    }

    public void onFailedToReceiveAd()
    {
      zzhx.zzY("Custom event adapter called onFailedToReceiveAd.");
      this.zzr.onFailedToReceiveAd(this.zzq, AdRequest.ErrorCode.NO_FILL);
    }

    public void onLeaveApplication()
    {
      zzhx.zzY("Custom event adapter called onFailedToReceiveAd.");
      this.zzr.onLeaveApplication(this.zzq);
    }

    public void onPresentScreen()
    {
      zzhx.zzY("Custom event adapter called onFailedToReceiveAd.");
      this.zzr.onPresentScreen(this.zzq);
    }

    public void onReceivedAd(View paramView)
    {
      zzhx.zzY("Custom event adapter called onReceivedAd.");
      CustomEventAdapter.zza(this.zzq, paramView);
      this.zzr.onReceivedAd(this.zzq);
    }
  }

  class zzb
    implements CustomEventInterstitialListener
  {
    private final CustomEventAdapter zzq;
    private final MediationInterstitialListener zzs;

    public zzb(CustomEventAdapter paramMediationInterstitialListener, MediationInterstitialListener arg3)
    {
      this.zzq = paramMediationInterstitialListener;
      Object localObject;
      this.zzs = localObject;
    }

    public void onDismissScreen()
    {
      zzhx.zzY("Custom event adapter called onDismissScreen.");
      this.zzs.onDismissScreen(this.zzq);
    }

    public void onFailedToReceiveAd()
    {
      zzhx.zzY("Custom event adapter called onFailedToReceiveAd.");
      this.zzs.onFailedToReceiveAd(this.zzq, AdRequest.ErrorCode.NO_FILL);
    }

    public void onLeaveApplication()
    {
      zzhx.zzY("Custom event adapter called onLeaveApplication.");
      this.zzs.onLeaveApplication(this.zzq);
    }

    public void onPresentScreen()
    {
      zzhx.zzY("Custom event adapter called onPresentScreen.");
      this.zzs.onPresentScreen(this.zzq);
    }

    public void onReceivedAd()
    {
      zzhx.zzY("Custom event adapter called onReceivedAd.");
      this.zzs.onReceivedAd(CustomEventAdapter.this);
    }
  }
}