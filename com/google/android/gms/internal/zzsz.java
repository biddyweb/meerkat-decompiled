package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.HitBuilders.ScreenViewBuilder;
import com.google.android.gms.analytics.Tracker;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.Container;

class zzsz
{
  private final Context mContext;
  private final zzta zzmB;

  public zzsz(Context paramContext, Container paramContainer, zzta paramzzta)
  {
    this.mContext = paramContext;
    this.zzmB = zza(paramContainer, paramzzta);
    zzrw();
  }

  static zzta zza(Container paramContainer, zzta paramzzta)
  {
    if ((paramContainer == null) || (paramContainer.isDefault()))
      return paramzzta;
    zzta.zza localzza = new zzta.zza(paramzzta.zzrx());
    localzza.zzcA(paramContainer.getString("trackingId")).zzab(paramContainer.getBoolean("trackScreenViews")).zzac(paramContainer.getBoolean("collectAdIdentifiers"));
    return localzza.zzrA();
  }

  private void zzrw()
  {
    if ((this.zzmB.zzry()) && (!TextUtils.isEmpty(this.zzmB.zzgL())))
    {
      Tracker localTracker = zzcz(this.zzmB.zzgL());
      localTracker.enableAdvertisingIdCollection(this.zzmB.zzrz());
      zzb(new zza(localTracker));
    }
  }

  void zzb(zzre.zza paramzza)
  {
    zzx.zzl(paramzza);
    zzre localzzre = zzre.zzag(this.mContext);
    localzzre.zzZ(true);
    localzzre.zza(paramzza);
  }

  Tracker zzcz(String paramString)
  {
    return GoogleAnalytics.getInstance(this.mContext).newTracker(paramString);
  }

  public zzta zzrv()
  {
    return this.zzmB;
  }

  static class zza
    implements zzre.zza
  {
    private final Tracker zzBL;

    zza(Tracker paramTracker)
    {
      this.zzBL = paramTracker;
    }

    public void zza(zzrh paramzzrh)
    {
      this.zzBL.setScreenName(paramzzrh.zzre());
      HitBuilders.ScreenViewBuilder localScreenViewBuilder = new HitBuilders.ScreenViewBuilder();
      localScreenViewBuilder.set("&a", String.valueOf(paramzzrh.zzaF()));
      this.zzBL.send(localScreenViewBuilder.build());
    }

    public void zza(zzrh paramzzrh, Activity paramActivity)
    {
    }
  }
}