package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.ads.doubleclick.OnCustomRenderedAdLoadedListener;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.concurrent.atomic.AtomicBoolean;

public class zzbp
{
  private zzat zzoJ;
  private AdListener zzoK;
  private final zzdq zzpD = new zzdq();
  private final zzaz zzpE;
  private final AtomicBoolean zzpF;
  private zzbi zzpG;
  private String zzpH;
  private ViewGroup zzpI;
  private InAppPurchaseListener zzpJ;
  private PlayStorePurchaseListener zzpK;
  private OnCustomRenderedAdLoadedListener zzpL;
  private AppEventListener zzpd;
  private AdSize[] zzpe;
  private String zzpf;

  public zzbp(ViewGroup paramViewGroup)
  {
    this(paramViewGroup, null, false, zzaz.zzbA());
  }

  public zzbp(ViewGroup paramViewGroup, AttributeSet paramAttributeSet, boolean paramBoolean)
  {
    this(paramViewGroup, paramAttributeSet, paramBoolean, zzaz.zzbA());
  }

  zzbp(ViewGroup paramViewGroup, AttributeSet paramAttributeSet, boolean paramBoolean, zzaz paramzzaz)
  {
    this(paramViewGroup, paramAttributeSet, paramBoolean, paramzzaz, null);
  }

  zzbp(ViewGroup paramViewGroup, AttributeSet paramAttributeSet, boolean paramBoolean, zzaz paramzzaz, zzbi paramzzbi)
  {
    this.zzpI = paramViewGroup;
    this.zzpE = paramzzaz;
    this.zzpG = paramzzbi;
    this.zzpF = new AtomicBoolean(false);
    Context localContext;
    if (paramAttributeSet != null)
      localContext = paramViewGroup.getContext();
    try
    {
      zzbd localzzbd = new zzbd(localContext, paramAttributeSet);
      this.zzpe = localzzbd.zzi(paramBoolean);
      this.zzpf = localzzbd.getAdUnitId();
      if (paramViewGroup.isInEditMode())
        zzbe.zzbD().zza(paramViewGroup, new zzba(localContext, this.zzpe[0]), "Ads by Google");
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      zzbe.zzbD().zza(paramViewGroup, new zzba(localContext, AdSize.BANNER), localIllegalArgumentException.getMessage(), localIllegalArgumentException.getMessage());
    }
  }

  private void zzbN()
  {
    try
    {
      zzd localzzd = this.zzpG.zzac();
      if (localzzd == null)
        return;
      this.zzpI.addView((View)zze.zzf(localzzd));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to get an ad frame.", localRemoteException);
    }
  }

  private void zzbO()
    throws RemoteException
  {
    if (((this.zzpe == null) || (this.zzpf == null)) && (this.zzpG == null))
      throw new IllegalStateException("The ad size and ad unit ID must be set before loadAd is called.");
    Context localContext = this.zzpI.getContext();
    this.zzpG = zzbe.zzbE().zza(localContext, new zzba(localContext, this.zzpe), this.zzpf, this.zzpD);
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
    this.zzpG.zza(zzbe.zzbF());
    zzbN();
  }

  public void destroy()
  {
    try
    {
      if (this.zzpG != null)
        this.zzpG.destroy();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to destroy AdView.", localRemoteException);
    }
  }

  public AdListener getAdListener()
  {
    return this.zzoK;
  }

  public AdSize getAdSize()
  {
    try
    {
      if (this.zzpG != null)
      {
        zzba localzzba = this.zzpG.zzad();
        if (localzzba != null)
        {
          AdSize localAdSize = localzzba.zzbB();
          return localAdSize;
        }
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to get the current AdSize.", localRemoteException);
      if (this.zzpe != null)
        return this.zzpe[0];
    }
    return null;
  }

  public AdSize[] getAdSizes()
  {
    return this.zzpe;
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

  public void pause()
  {
    try
    {
      if (this.zzpG != null)
        this.zzpG.pause();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to call pause.", localRemoteException);
    }
  }

  public void recordManualImpression()
  {
    if (this.zzpF.getAndSet(true));
    while (true)
    {
      return;
      try
      {
        if (this.zzpG != null)
        {
          this.zzpG.zzan();
          return;
        }
      }
      catch (RemoteException localRemoteException)
      {
        zzhx.zzd("Failed to record impression.", localRemoteException);
      }
    }
  }

  public void resume()
  {
    try
    {
      if (this.zzpG != null)
        this.zzpG.resume();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to call resume.", localRemoteException);
    }
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

  public void setAdSizes(AdSize[] paramArrayOfAdSize)
  {
    if (this.zzpe != null)
      throw new IllegalStateException("The ad size can only be set once on AdView.");
    zza(paramArrayOfAdSize);
  }

  public void setAdUnitId(String paramString)
  {
    if (this.zzpf != null)
      throw new IllegalStateException("The ad unit ID can only be set once on AdView.");
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
          break label58;
      }
      label58: for (zzft localzzft = new zzft(paramInAppPurchaseListener); ; localzzft = null)
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
    this.zzpL = paramOnCustomRenderedAdLoadedListener;
    try
    {
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
      zzhx.zzd("Failed to set the onCustomRenderedAdLoadedListener.", localRemoteException);
    }
  }

  public void setPlayStorePurchaseParams(PlayStorePurchaseListener paramPlayStorePurchaseListener, String paramString)
  {
    if (this.zzpJ != null)
      throw new IllegalStateException("InAppPurchaseListener has already been set.");
    try
    {
      this.zzpK = paramPlayStorePurchaseListener;
      this.zzpH = paramString;
      zzbi localzzbi;
      if (this.zzpG != null)
      {
        localzzbi = this.zzpG;
        if (paramPlayStorePurchaseListener == null)
          break label66;
      }
      label66: for (zzfx localzzfx = new zzfx(paramPlayStorePurchaseListener); ; localzzfx = null)
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
        zzbO();
      if (this.zzpG.zza(this.zzpE.zza(this.zzpI.getContext(), paramzzbo)))
        this.zzpD.zze(paramzzbo.zzbJ());
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Failed to load ad.", localRemoteException);
    }
  }

  public void zza(AdSize[] paramArrayOfAdSize)
  {
    this.zzpe = paramArrayOfAdSize;
    try
    {
      if (this.zzpG != null)
        this.zzpG.zza(new zzba(this.zzpI.getContext(), this.zzpe));
      this.zzpI.requestLayout();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      while (true)
        zzhx.zzd("Failed to set the ad size.", localRemoteException);
    }
  }
}