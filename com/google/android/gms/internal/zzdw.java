package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.common.internal.zzx;

@zzgi
public final class zzdw
  implements MediationBannerListener, MediationInterstitialListener
{
  private final zzdt zzsS;

  public zzdw(zzdt paramzzdt)
  {
    this.zzsS = paramzzdt;
  }

  public void onAdClicked(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzbd("onAdClicked must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdClicked.");
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

  public void onAdClicked(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzbd("onAdClicked must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdClicked.");
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

  public void onAdClosed(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzbd("onAdClosed must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdClosed.");
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

  public void onAdClosed(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzbd("onAdClosed must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdClosed.");
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

  public void onAdFailedToLoad(MediationBannerAdapter paramMediationBannerAdapter, int paramInt)
  {
    zzx.zzbd("onAdFailedToLoad must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdFailedToLoad with error. " + paramInt);
    try
    {
      this.zzsS.onAdFailedToLoad(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdFailedToLoad.", localRemoteException);
    }
  }

  public void onAdFailedToLoad(MediationInterstitialAdapter paramMediationInterstitialAdapter, int paramInt)
  {
    zzx.zzbd("onAdFailedToLoad must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdFailedToLoad with error " + paramInt + ".");
    try
    {
      this.zzsS.onAdFailedToLoad(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not call onAdFailedToLoad.", localRemoteException);
    }
  }

  public void onAdLeftApplication(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzbd("onAdLeftApplication must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdLeftApplication.");
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

  public void onAdLeftApplication(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzbd("onAdLeftApplication must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdLeftApplication.");
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

  public void onAdLoaded(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzbd("onAdLoaded must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdLoaded.");
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

  public void onAdLoaded(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzbd("onAdLoaded must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdLoaded.");
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

  public void onAdOpened(MediationBannerAdapter paramMediationBannerAdapter)
  {
    zzx.zzbd("onAdOpened must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdOpened.");
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

  public void onAdOpened(MediationInterstitialAdapter paramMediationInterstitialAdapter)
  {
    zzx.zzbd("onAdOpened must be called on the main UI thread.");
    zzhx.zzY("Adapter called onAdOpened.");
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
}