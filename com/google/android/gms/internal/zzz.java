package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.ads.AdActivity;
import com.google.android.gms.ads.purchase.InAppPurchaseActivity;
import com.google.android.gms.analytics.GoogleAnalytics;

@zzgi
public class zzz extends zzbm.zza
  implements zzre.zza, zztb.zza
{
  private static zzz zzmA;
  private static final Object zzmz = new Object();
  private final Context mContext;
  zzta zzmB;
  String zzmC;
  String zzmD;
  private boolean zzmE;

  zzz(Context paramContext)
  {
    this.mContext = paramContext;
    this.zzmE = false;
  }

  public static zzz zzj(Context paramContext)
  {
    synchronized (zzmz)
    {
      if (zzmA == null)
        zzmA = new zzz(paramContext.getApplicationContext());
      zzz localzzz = zzmA;
      return localzzz;
    }
  }

  public String getClientId()
  {
    return GoogleAnalytics.getInstance(this.mContext).getClientId();
  }

  public boolean isInitialized()
  {
    synchronized (zzmz)
    {
      boolean bool = this.zzmE;
      return bool;
    }
  }

  public void zza(zzrh paramzzrh)
  {
  }

  public void zza(zzrh paramzzrh, Activity paramActivity)
  {
    if ((paramzzrh == null) || (paramActivity == null));
    do
    {
      return;
      if ((paramActivity instanceof AdActivity))
      {
        int i = zzab.zzaM().zzk(paramActivity);
        if (i == 1)
        {
          paramzzrh.zzaa(true);
          paramzzrh.setScreenName("Interstitial Ad");
          return;
        }
        if ((i == 2) || (i == 3))
        {
          paramzzrh.setScreenName("Expanded Ad");
          return;
        }
        paramzzrh.setScreenName(null);
        return;
      }
    }
    while (!(paramActivity instanceof InAppPurchaseActivity));
    paramzzrh.setScreenName(null);
  }

  public void zza(String paramString1, String paramString2)
  {
    synchronized (zzmz)
    {
      if (this.mContext == null)
      {
        zzhx.zzac("Fail to initialize MobileAdsSettingManager because context is null.");
        return;
      }
      if (TextUtils.isEmpty(paramString1))
      {
        zzhx.zzac("Fail to initialize MobileAdsSettingManager because ApplicationCode is empty.");
        return;
      }
    }
    if (this.zzmE)
    {
      zzhx.zzaa("MobileAdsSettingManager has been initialized.");
      return;
    }
    this.zzmE = true;
    this.zzmC = paramString1;
    this.zzmD = paramString2;
    zztb localzztb = zztb.zzah(this.mContext);
    zzta.zza localzza = new zzta.zza(this.zzmC);
    if (!TextUtils.isEmpty(this.zzmD))
      localzza.zzcA(this.zzmD);
    localzztb.zza(localzza.zzrA());
    localzztb.zza(this);
    zzre.zzag(this.mContext).zza(this);
    localzztb.start();
  }

  public void zzaE()
  {
    this.zzmB = zztb.zzah(this.mContext).zzrB();
  }

  public int zzaF()
  {
    zzrh localzzrh = zzre.zzag(this.mContext).zzqW();
    if (localzzrh != null)
      return localzzrh.zzaF();
    return 0;
  }
}