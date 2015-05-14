package com.google.android.gms.internal;

import android.app.Activity;
import android.os.RemoteException;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONObject;

@zzgi
public final class zzdx<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> extends zzds.zza
{
  private final MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> zzsT;
  private final NETWORK_EXTRAS zzsU;

  public zzdx(MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> paramMediationAdapter, NETWORK_EXTRAS paramNETWORK_EXTRAS)
  {
    this.zzsT = paramMediationAdapter;
    this.zzsU = paramNETWORK_EXTRAS;
  }

  private SERVER_PARAMETERS zzb(String paramString1, int paramInt, String paramString2)
    throws RemoteException
  {
    HashMap localHashMap;
    if (paramString1 != null)
      try
      {
        JSONObject localJSONObject = new JSONObject(paramString1);
        localHashMap = new HashMap(localJSONObject.length());
        Iterator localIterator = localJSONObject.keys();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          localHashMap.put(str, localJSONObject.getString(str));
        }
      }
      catch (Throwable localThrowable)
      {
        zzhx.zzd("Could not get MediationServerParameters.", localThrowable);
        throw new RemoteException();
      }
    else
      localHashMap = new HashMap(0);
    Class localClass = this.zzsT.getServerParametersType();
    MediationServerParameters localMediationServerParameters = null;
    if (localClass != null)
    {
      localMediationServerParameters = (MediationServerParameters)localClass.newInstance();
      localMediationServerParameters.load(localHashMap);
    }
    return localMediationServerParameters;
  }

  public void destroy()
    throws RemoteException
  {
    try
    {
      this.zzsT.destroy();
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not destroy adapter.", localThrowable);
    }
    throw new RemoteException();
  }

  public zzd getView()
    throws RemoteException
  {
    if (!(this.zzsT instanceof MediationBannerAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationBannerAdapter: " + this.zzsT.getClass().getCanonicalName());
      throw new RemoteException();
    }
    try
    {
      zzd localzzd = zze.zzn(((MediationBannerAdapter)this.zzsT).getBannerView());
      return localzzd;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not get banner view from adapter.", localThrowable);
    }
    throw new RemoteException();
  }

  public void pause()
    throws RemoteException
  {
    throw new RemoteException();
  }

  public void resume()
    throws RemoteException
  {
    throw new RemoteException();
  }

  public void showInterstitial()
    throws RemoteException
  {
    if (!(this.zzsT instanceof MediationInterstitialAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationInterstitialAdapter: " + this.zzsT.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzhx.zzY("Showing interstitial from adapter.");
    try
    {
      ((MediationInterstitialAdapter)this.zzsT).showInterstitial();
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not show interstitial from adapter.", localThrowable);
    }
    throw new RemoteException();
  }

  public void zza(zzd paramzzd, zzax paramzzax, String paramString, zzdt paramzzdt)
    throws RemoteException
  {
    zza(paramzzd, paramzzax, paramString, null, paramzzdt);
  }

  public void zza(zzd paramzzd, zzax paramzzax, String paramString1, String paramString2, zzdt paramzzdt)
    throws RemoteException
  {
    if (!(this.zzsT instanceof MediationInterstitialAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationInterstitialAdapter: " + this.zzsT.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzhx.zzY("Requesting interstitial ad from adapter.");
    try
    {
      ((MediationInterstitialAdapter)this.zzsT).requestInterstitialAd(new zzdy(paramzzdt), (Activity)zze.zzf(paramzzd), zzb(paramString1, paramzzax.zzoP, paramString2), zzdz.zzd(paramzzax), this.zzsU);
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not request interstitial ad from adapter.", localThrowable);
    }
    throw new RemoteException();
  }

  public void zza(zzd paramzzd, zzba paramzzba, zzax paramzzax, String paramString, zzdt paramzzdt)
    throws RemoteException
  {
    zza(paramzzd, paramzzba, paramzzax, paramString, null, paramzzdt);
  }

  public void zza(zzd paramzzd, zzba paramzzba, zzax paramzzax, String paramString1, String paramString2, zzdt paramzzdt)
    throws RemoteException
  {
    if (!(this.zzsT instanceof MediationBannerAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationBannerAdapter: " + this.zzsT.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzhx.zzY("Requesting banner ad from adapter.");
    try
    {
      ((MediationBannerAdapter)this.zzsT).requestBannerAd(new zzdy(paramzzdt), (Activity)zze.zzf(paramzzd), zzb(paramString1, paramzzax.zzoP, paramString2), zzdz.zzb(paramzzba), zzdz.zzd(paramzzax), this.zzsU);
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not request banner ad from adapter.", localThrowable);
    }
    throw new RemoteException();
  }
}