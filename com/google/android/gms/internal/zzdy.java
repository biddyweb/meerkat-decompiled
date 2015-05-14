package com.google.android.gms.internal;

import android.os.Handler;
import android.os.RemoteException;
import com.google.ads.AdRequest.ErrorCode;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;

@zzgi
public final class zzdy<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters>
  implements MediationBannerListener, MediationInterstitialListener
{
  private final zzdt zzsS;

  public zzdy(zzdt paramzzdt)
  {
    this.zzsS = paramzzdt;
  }

  public void onClick(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzhx.zzY("Adapter called onClick.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onClick must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.1(this));
      return;
    }
    try
    {
      this.zzsS.onAdClicked();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdClicked.", localRemoteException);
    }
  }

  public void onDismissScreen(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzhx.zzY("Adapter called onDismissScreen.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onDismissScreen must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.4(this));
      return;
    }
    try
    {
      this.zzsS.onAdClosed();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdClosed.", localRemoteException);
    }
  }

  public void onDismissScreen(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzhx.zzY("Adapter called onDismissScreen.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onDismissScreen must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.9(this));
      return;
    }
    try
    {
      this.zzsS.onAdClosed();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdClosed.", localRemoteException);
    }
  }

  public void onFailedToReceiveAd(MediationBannerAdapter<?, ?> paramMediationBannerAdapter, AdRequest.ErrorCode paramErrorCode)
  {
    zzhx.zzY("Adapter called onFailedToReceiveAd with error. " + paramErrorCode);
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onFailedToReceiveAd must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.5(this, paramErrorCode));
      return;
    }
    try
    {
      this.zzsS.onAdFailedToLoad(zzdz.zza(paramErrorCode));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdFailedToLoad.", localRemoteException);
    }
  }

  public void onFailedToReceiveAd(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter, AdRequest.ErrorCode paramErrorCode)
  {
    zzhx.zzY("Adapter called onFailedToReceiveAd with error " + paramErrorCode + ".");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onFailedToReceiveAd must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.10(this, paramErrorCode));
      return;
    }
    try
    {
      this.zzsS.onAdFailedToLoad(zzdz.zza(paramErrorCode));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdFailedToLoad.", localRemoteException);
    }
  }

  public void onLeaveApplication(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzhx.zzY("Adapter called onLeaveApplication.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onLeaveApplication must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.6(this));
      return;
    }
    try
    {
      this.zzsS.onAdLeftApplication();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdLeftApplication.", localRemoteException);
    }
  }

  public void onLeaveApplication(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzhx.zzY("Adapter called onLeaveApplication.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onLeaveApplication must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.11(this));
      return;
    }
    try
    {
      this.zzsS.onAdLeftApplication();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdLeftApplication.", localRemoteException);
    }
  }

  public void onPresentScreen(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzhx.zzY("Adapter called onPresentScreen.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onPresentScreen must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.7(this));
      return;
    }
    try
    {
      this.zzsS.onAdOpened();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdOpened.", localRemoteException);
    }
  }

  public void onPresentScreen(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzhx.zzY("Adapter called onPresentScreen.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onPresentScreen must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.2(this));
      return;
    }
    try
    {
      this.zzsS.onAdOpened();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdOpened.", localRemoteException);
    }
  }

  public void onReceivedAd(MediationBannerAdapter<?, ?> paramMediationBannerAdapter)
  {
    zzhx.zzY("Adapter called onReceivedAd.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onReceivedAd must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.8(this));
      return;
    }
    try
    {
      this.zzsS.onAdLoaded();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdLoaded.", localRemoteException);
    }
  }

  public void onReceivedAd(MediationInterstitialAdapter<?, ?> paramMediationInterstitialAdapter)
  {
    zzhx.zzY("Adapter called onReceivedAd.");
    if (!zzbe.zzbD().zzeC())
    {
      zzhx.zzac("onReceivedAd must be called on the main UI thread.");
      zzhw.zzzG.post(new zzdy.3(this));
      return;
    }
    try
    {
      this.zzsS.onAdLoaded();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdLoaded.", localRemoteException);
    }
  }
}