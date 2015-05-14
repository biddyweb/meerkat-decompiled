package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.os.Bundle;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import java.util.Map;

public final class zzri
  implements Application.ActivityLifecycleCallbacks
{
  private final zzre zzasy;
  private final Map<Activity, zzrh> zzasz;

  public zzri(zzre paramzzre)
  {
    zzx.zzl(paramzzre);
    this.zzasy = paramzzre;
    this.zzasz = new ArrayMap();
  }

  public void onActivityCreated(Activity paramActivity, Bundle paramBundle)
  {
    if (paramBundle == null);
    Bundle localBundle;
    do
    {
      return;
      localBundle = paramBundle.getBundle("com.google.android.gms.measurement.screen_view");
    }
    while (localBundle == null);
    int i = localBundle.getInt("id");
    if (i <= 0)
    {
      Log.w("com.google.android.gms.measurement.internal.ActivityLifecycleTracker", "Invalid screenId in saved activity state");
      return;
    }
    zzrh localzzrh = zza(paramActivity, i);
    localzzrh.setScreenName(localBundle.getString("name"));
    localzzrh.zzgr(localBundle.getInt("referrer_id"));
    localzzrh.zzcv(localBundle.getString("referrer_name"));
    localzzrh.zzaa(localBundle.getBoolean("interstitial"));
    localzzrh.zzrh();
  }

  public void onActivityDestroyed(Activity paramActivity)
  {
    this.zzasz.remove(paramActivity);
  }

  public void onActivityPaused(Activity paramActivity)
  {
  }

  public void onActivityResumed(Activity paramActivity)
  {
  }

  public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
  {
    if (paramBundle == null);
    zzrh localzzrh;
    do
    {
      return;
      localzzrh = (zzrh)this.zzasz.get(paramActivity);
    }
    while (localzzrh == null);
    Bundle localBundle = new Bundle();
    localBundle.putInt("id", localzzrh.zzaF());
    localBundle.putString("name", localzzrh.zzre());
    localBundle.putInt("referrer_id", localzzrh.zzrf());
    localBundle.putString("referrer_name", localzzrh.zzrg());
    localBundle.putBoolean("interstitial", localzzrh.zzri());
    paramBundle.putBundle("com.google.android.gms.measurement.screen_view", localBundle);
  }

  public void onActivityStarted(Activity paramActivity)
  {
    zzrh localzzrh = zza(paramActivity, 0);
    this.zzasy.zzb(localzzrh, paramActivity);
  }

  public void onActivityStopped(Activity paramActivity)
  {
  }

  zzrh zza(Activity paramActivity, int paramInt)
  {
    zzx.zzl(paramActivity);
    zzrh localzzrh = (zzrh)this.zzasz.get(paramActivity);
    if (localzzrh == null)
      if (paramInt != 0)
        break label67;
    label67: for (localzzrh = new zzrh(true); ; localzzrh = new zzrh(true, paramInt))
    {
      localzzrh.setScreenName(paramActivity.getClass().getCanonicalName());
      this.zzasz.put(paramActivity, localzzrh);
      return localzzrh;
    }
  }
}