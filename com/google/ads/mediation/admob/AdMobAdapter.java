package com.google.ads.mediation.admob;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdRequest.Builder;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.InterstitialAd;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.mediation.MediationBannerAdapter;
import com.google.android.gms.ads.mediation.MediationBannerListener;
import com.google.android.gms.ads.mediation.MediationInterstitialAdapter;
import com.google.android.gms.ads.mediation.MediationInterstitialListener;
import com.google.android.gms.internal.zzat;
import com.google.android.gms.internal.zzbe;
import com.google.android.gms.internal.zzhw;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

public final class AdMobAdapter
  implements MediationBannerAdapter, MediationInterstitialAdapter
{
  private AdView zzi;
  private InterstitialAd zzj;

  static AdRequest zza(Context paramContext, MediationAdRequest paramMediationAdRequest, Bundle paramBundle1, Bundle paramBundle2)
  {
    AdRequest.Builder localBuilder = new AdRequest.Builder();
    Date localDate = paramMediationAdRequest.getBirthday();
    if (localDate != null)
      localBuilder.setBirthday(localDate);
    int i = paramMediationAdRequest.getGender();
    if (i != 0)
      localBuilder.setGender(i);
    Set localSet = paramMediationAdRequest.getKeywords();
    if (localSet != null)
    {
      Iterator localIterator = localSet.iterator();
      while (localIterator.hasNext())
        localBuilder.addKeyword((String)localIterator.next());
    }
    Location localLocation = paramMediationAdRequest.getLocation();
    if (localLocation != null)
      localBuilder.setLocation(localLocation);
    if (paramMediationAdRequest.isTesting())
      localBuilder.addTestDevice(zzbe.zzbD().zzz(paramContext));
    boolean bool;
    if (paramBundle2.getInt("tagForChildDirectedTreatment") != -1)
    {
      if (paramBundle2.getInt("tagForChildDirectedTreatment") == 1)
      {
        bool = true;
        localBuilder.tagForChildDirectedTreatment(bool);
      }
    }
    else
      if (paramBundle1 == null)
        break label251;
    while (true)
    {
      paramBundle1.putInt("gw", 1);
      paramBundle1.putString("mad_hac", paramBundle2.getString("mad_hac"));
      if (!TextUtils.isEmpty(paramBundle2.getString("adJson")))
        paramBundle1.putString("_ad", paramBundle2.getString("adJson"));
      paramBundle1.putBoolean("_noRefresh", true);
      localBuilder.addNetworkExtrasBundle(AdMobAdapter.class, paramBundle1);
      return localBuilder.build();
      bool = false;
      break;
      label251: paramBundle1 = new Bundle();
    }
  }

  public View getBannerView()
  {
    return this.zzi;
  }

  public void onDestroy()
  {
    if (this.zzi != null)
    {
      this.zzi.destroy();
      this.zzi = null;
    }
    if (this.zzj != null)
      this.zzj = null;
  }

  public void onPause()
  {
    if (this.zzi != null)
      this.zzi.pause();
  }

  public void onResume()
  {
    if (this.zzi != null)
      this.zzi.resume();
  }

  public void requestBannerAd(Context paramContext, MediationBannerListener paramMediationBannerListener, Bundle paramBundle1, AdSize paramAdSize, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    this.zzi = new AdView(paramContext);
    this.zzi.setAdSize(new AdSize(paramAdSize.getWidth(), paramAdSize.getHeight()));
    this.zzi.setAdUnitId(paramBundle1.getString("pubid"));
    this.zzi.setAdListener(new zza(this, paramMediationBannerListener));
    this.zzi.loadAd(zza(paramContext, paramMediationAdRequest, paramBundle2, paramBundle1));
  }

  public void requestInterstitialAd(Context paramContext, MediationInterstitialListener paramMediationInterstitialListener, Bundle paramBundle1, MediationAdRequest paramMediationAdRequest, Bundle paramBundle2)
  {
    this.zzj = new InterstitialAd(paramContext);
    this.zzj.setAdUnitId(paramBundle1.getString("pubid"));
    this.zzj.setAdListener(new zzb(this, paramMediationInterstitialListener));
    this.zzj.loadAd(zza(paramContext, paramMediationAdRequest, paramBundle2, paramBundle1));
  }

  public void showInterstitial()
  {
    this.zzj.show();
  }

  static final class zza extends AdListener
    implements zzat
  {
    final AdMobAdapter zzk;
    final MediationBannerListener zzl;

    public zza(AdMobAdapter paramAdMobAdapter, MediationBannerListener paramMediationBannerListener)
    {
      this.zzk = paramAdMobAdapter;
      this.zzl = paramMediationBannerListener;
    }

    public void onAdClicked()
    {
      this.zzl.onAdClicked(this.zzk);
    }

    public void onAdClosed()
    {
      this.zzl.onAdClosed(this.zzk);
    }

    public void onAdFailedToLoad(int paramInt)
    {
      this.zzl.onAdFailedToLoad(this.zzk, paramInt);
    }

    public void onAdLeftApplication()
    {
      this.zzl.onAdLeftApplication(this.zzk);
    }

    public void onAdLoaded()
    {
      this.zzl.onAdLoaded(this.zzk);
    }

    public void onAdOpened()
    {
      this.zzl.onAdOpened(this.zzk);
    }
  }

  static final class zzb extends AdListener
    implements zzat
  {
    final AdMobAdapter zzk;
    final MediationInterstitialListener zzm;

    public zzb(AdMobAdapter paramAdMobAdapter, MediationInterstitialListener paramMediationInterstitialListener)
    {
      this.zzk = paramAdMobAdapter;
      this.zzm = paramMediationInterstitialListener;
    }

    public void onAdClicked()
    {
      this.zzm.onAdClicked(this.zzk);
    }

    public void onAdClosed()
    {
      this.zzm.onAdClosed(this.zzk);
    }

    public void onAdFailedToLoad(int paramInt)
    {
      this.zzm.onAdFailedToLoad(this.zzk, paramInt);
    }

    public void onAdLeftApplication()
    {
      this.zzm.onAdLeftApplication(this.zzk);
    }

    public void onAdLoaded()
    {
      this.zzm.onAdLoaded(this.zzk);
    }

    public void onAdOpened()
    {
      this.zzm.onAdOpened(this.zzk);
    }
  }
}