package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;
import com.google.android.gms.ads.doubleclick.PublisherInterstitialAd;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;

public class zzbq
{
  private final Context mContext;
  private zzat zzoJ;
  private AdListener zzoK;
  private final zzdq zzpD = new zzdq();
  private final zzaz zzpE;
  private zzbi zzpG;
  private String zzpH;
  private InAppPurchaseListener zzpJ;
  private PlayStorePurchaseListener zzpK;
  private OnCustomRenderedAdLoadedListener zzpL;
  private PublisherInterstitialAd zzpM;
  private AppEventListener zzpd;
  private String zzpf;

  public zzbq(Context paramContext)
  {
    this(paramContext, zzaz.zzbA(), null);
  }

  public zzbq(Context paramContext, PublisherInterstitialAd paramPublisherInterstitialAd)
  {
    this(paramContext, zzaz.zzbA(), paramPublisherInterstitialAd);
  }

  public zzbq(Context paramContext, zzaz paramzzaz, PublisherInterstitialAd paramPublisherInterstitialAd)
  {
    this.mContext = paramContext;
    this.zzpE = paramzzaz;
    this.zzpM = paramPublisherInterstitialAd;
  }

  private void zzy(String paramString)
    throws RemoteException
  {
    if (this.zzpf == null)
      zzz(paramString);
    this.zzpG = zzbe.zzbE().zza(this.mContext, new zzba(), this.zzpf, this.zzpD);
    if (this.zzoK != null)
      this.zzpG.zza(new zzav(this.zzoK));
    if (this.zzoJ != null)
      this.zzpG.zza(new zzau(this.zzoJ));
    if (this.zzpd != null)
      this.zzpG.zza(new zzbc(this.zzpd));
    if (this.zzpJ != null)
      this.zzpG.zza(new zzft(this.zzpJ));
    if (this.zzpK != null)
      this.zzpG.zza(new zzfx(this.zzpK), this.zzpH);
    if (this.zzpL != null)
      this.zzpG.zza(new zzck(this.zzpL));
  }

  private void zzz(String paramString)
  {
    if (this.zzpG == null)
      throw new IllegalStateException("The ad unit ID must be set on InterstitialAd before " + paramString + " is called.");
  }

  public AdListener getAdListener()
  {
    return this.zzoK;
  }

  public String getAdUnitId()
  {
    return this.zzpf;
  }

  public AppEventListener getAppEventListener()
  {
    return this.zzpd;
  }

  public InAppPurchaseListener getInAppPurchaseListener()
  {
    return this.zzpJ;
  }

  public String getMediationAdapterClassName()
  {
    try
    {
      if (this.zzpG != null)
      {
        String str = this.zzpG.getMediationAdapterClassName();
        return str;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to get the mediation adapter class name.", localRemoteException);
    }
    return null;
  }

  public OnCustomRenderedAdLoadedListener getOnCustomRenderedAdLoadedListener()
  {
    return this.zzpL;
  }

  public boolean isLoaded()
  {
    try
    {
      if (this.zzpG == null)
        return false;
      boolean bool = this.zzpG.isReady();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to check if ad is ready.", localRemoteException);
    }
    return false;
  }

  public void setAdListener(AdListener paramAdListener)
  {
    try
    {
      this.zzoK = paramAdListener;
      zzbi localzzbi;
      if (this.zzpG != null)
      {
        localzzbi = this.zzpG;
        if (paramAdListener == null)
          break label40;
      }
      label40: for (zzav localzzav = new zzav(paramAdListener); ; localzzav = null)
      {
        localzzbi.zza(localzzav);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to set the AdListener.", localRemoteException);
    }
  }

  public void setAdUnitId(String paramString)
  {
    if (this.zzpf != null)
      throw new IllegalStateException("The ad unit ID can only be set once on InterstitialAd.");
    this.zzpf = paramString;
  }

  public void setAppEventListener(AppEventListener paramAppEventListener)
  {
    try
    {
      this.zzpd = paramAppEventListener;
      zzbi localzzbi;
      if (this.zzpG != null)
      {
        localzzbi = this.zzpG;
        if (paramAppEventListener == null)
          break label40;
      }
      label40: for (zzbc localzzbc = new zzbc(paramAppEventListener); ; localzzbc = null)
      {
        localzzbi.zza(localzzbc);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to set the AppEventListener.", localRemoteException);
    }
  }

  public void setInAppPurchaseListener(InAppPurchaseListener paramInAppPurchaseListener)
  {
    if (this.zzpK != null)
      throw new IllegalStateException("Play store purchase parameter has already been set.");
    try
    {
      this.zzpJ = paramInAppPurchaseListener;
      zzbi localzzbi;
      if (this.zzpG != null)
      {
        localzzbi = this.zzpG;
        if (paramInAppPurchaseListener == null)
          break label57;
      }
      label57: for (zzft localzzft = new zzft(paramInAppPurchaseListener); ; localzzft = null)
      {
        localzzbi.zza(localzzft);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to set the InAppPurchaseListener.", localRemoteException);
    }
  }

  public void setOnCustomRenderedAdLoadedListener(OnCustomRenderedAdLoadedListener paramOnCustomRenderedAdLoadedListener)
  {
    try
    {
      this.zzpL = paramOnCustomRenderedAdLoadedListener;
      zzbi localzzbi;
      if (this.zzpG != null)
      {
        localzzbi = this.zzpG;
        if (paramOnCustomRenderedAdLoadedListener == null)
          break label40;
      }
      label40: for (zzck localzzck = new zzck(paramOnCustomRenderedAdLoadedListener); ; localzzck = null)
      {
        localzzbi.zza(localzzck);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to set the OnCustomRenderedAdLoadedListener.", localRemoteException);
    }
  }

  public void setPlayStorePurchaseParams(PlayStorePurchaseListener paramPlayStorePurchaseListener, String paramString)
  {
    if (this.zzpJ != null)
      throw new IllegalStateException("In app purchase parameter has already been set.");
    try
    {
      this.zzpK = paramPlayStorePurchaseListener;
      this.zzpH = paramString;
      zzbi localzzbi;
      if (this.zzpG != null)
      {
        localzzbi = this.zzpG;
        if (paramPlayStorePurchaseListener == null)
          break label65;
      }
      label65: for (zzfx localzzfx = new zzfx(paramPlayStorePurchaseListener); ; localzzfx = null)
      {
        localzzbi.zza(localzzfx, paramString);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to set the play store purchase parameter.", localRemoteException);
    }
  }

  public void show()
  {
    try
    {
      zzz("show");
      this.zzpG.showInterstitial();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to show interstitial.", localRemoteException);
    }
  }

  public void zza(zzat paramzzat)
  {
    try
    {
      this.zzoJ = paramzzat;
      zzbi localzzbi;
      if (this.zzpG != null)
      {
        localzzbi = this.zzpG;
        if (paramzzat == null)
          break label40;
      }
      label40: for (zzau localzzau = new zzau(paramzzat); ; localzzau = null)
      {
        localzzbi.zza(localzzau);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to set the AdClickListener.", localRemoteException);
    }
  }

  public void zza(zzbo paramzzbo)
  {
    try
    {
      if (this.zzpG == null)
        zzy("loadAd");
      if (this.zzpG.zza(this.zzpE.zza(this.mContext, paramzzbo)))
        this.zzpD.zze(paramzzbo.zzbJ());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to load ad.", localRemoteException);
    }
  }
}