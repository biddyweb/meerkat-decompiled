package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.zza;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONObject;

@zzgi
public final class zzdv extends zzds.zza
{
  private final MediationAdapter zzsR;

  public zzdv(MediationAdapter paramMediationAdapter)
  {
    this.zzsR = paramMediationAdapter;
  }

  private Bundle zza(String paramString1, int paramInt, String paramString2)
    throws RemoteException
  {
    zzhx.zzac("Server parameters: " + paramString1);
    Bundle localBundle;
    try
    {
      localObject = new Bundle();
      if (paramString1 == null)
        break label121;
      JSONObject localJSONObject = new JSONObject(paramString1);
      localBundle = new Bundle();
      Iterator localIterator = localJSONObject.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localBundle.putString(str, localJSONObject.getString(str));
      }
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not get Server Parameters Bundle.", localThrowable);
      throw new RemoteException();
    }
    Object localObject = localBundle;
    label121: if ((this.zzsR instanceof AdMobAdapter))
    {
      ((Bundle)localObject).putString("adJson", paramString2);
      ((Bundle)localObject).putInt("tagForChildDirectedTreatment", paramInt);
    }
    return localObject;
  }

  public void destroy()
    throws RemoteException
  {
    try
    {
      this.zzsR.onDestroy();
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
    if (!(this.zzsR instanceof MediationBannerAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationBannerAdapter: " + this.zzsR.getClass().getCanonicalName());
      throw new RemoteException();
    }
    try
    {
      zzd localzzd = zze.zzn(((MediationBannerAdapter)this.zzsR).getBannerView());
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
    try
    {
      this.zzsR.onPause();
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not pause adapter.", localThrowable);
    }
    throw new RemoteException();
  }

  public void resume()
    throws RemoteException
  {
    try
    {
      this.zzsR.onResume();
      return;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not resume adapter.", localThrowable);
    }
    throw new RemoteException();
  }

  public void showInterstitial()
    throws RemoteException
  {
    if (!(this.zzsR instanceof MediationInterstitialAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationInterstitialAdapter: " + this.zzsR.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzhx.zzY("Showing interstitial from adapter.");
    try
    {
      ((MediationInterstitialAdapter)this.zzsR).showInterstitial();
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
    if (!(this.zzsR instanceof MediationInterstitialAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationInterstitialAdapter: " + this.zzsR.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzhx.zzY("Requesting interstitial ad from adapter.");
    try
    {
      MediationInterstitialAdapter localMediationInterstitialAdapter = (MediationInterstitialAdapter)this.zzsR;
      HashSet localHashSet;
      zzdu localzzdu;
      if (paramzzax.zzoN != null)
      {
        localHashSet = new HashSet(paramzzax.zzoN);
        localzzdu = new zzdu(new Date(paramzzax.zzoL), paramzzax.zzoM, localHashSet, paramzzax.zzoT, paramzzax.zzoO, paramzzax.zzoP);
        if (paramzzax.zzoV == null)
          break label190;
      }
      label190: for (Bundle localBundle = paramzzax.zzoV.getBundle(localMediationInterstitialAdapter.getClass().getName()); ; localBundle = null)
      {
        localMediationInterstitialAdapter.requestInterstitialAd((Context)zze.zzf(paramzzd), new zzdw(paramzzdt), zza(paramString1, paramzzax.zzoP, paramString2), localzzdu, localBundle);
        return;
        localHashSet = null;
        break;
      }
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
    if (!(this.zzsR instanceof MediationBannerAdapter))
    {
      zzhx.zzac("MediationAdapter is not a MediationBannerAdapter: " + this.zzsR.getClass().getCanonicalName());
      throw new RemoteException();
    }
    zzhx.zzY("Requesting banner ad from adapter.");
    try
    {
      MediationBannerAdapter localMediationBannerAdapter = (MediationBannerAdapter)this.zzsR;
      if (paramzzax.zzoN != null);
      for (HashSet localHashSet = new HashSet(paramzzax.zzoN); ; localHashSet = null)
      {
        zzdu localzzdu = new zzdu(new Date(paramzzax.zzoL), paramzzax.zzoM, localHashSet, paramzzax.zzoT, paramzzax.zzoO, paramzzax.zzoP);
        Bundle localBundle1 = paramzzax.zzoV;
        Bundle localBundle2 = null;
        if (localBundle1 != null)
          localBundle2 = paramzzax.zzoV.getBundle(localMediationBannerAdapter.getClass().getName());
        localMediationBannerAdapter.requestBannerAd((Context)zze.zzf(paramzzd), new zzdw(paramzzdt), zza(paramString1, paramzzax.zzoP, paramString2), zza.zza(paramzzba.width, paramzzba.height, paramzzba.zzpa), localzzdu, localBundle2);
        return;
      }
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzd("Could not request banner ad from adapter.", localThrowable);
    }
    throw new RemoteException();
  }
}