package com.google.android.gms.analytics;

import android.app.Activity;
import android.app.Application;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Build.VERSION;
import android.os.Bundle;
import com.google.android.gms.internal.zzra;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public class GoogleAnalytics extends TrackerHandler
{
  private static volatile GoogleAnalytics zzEl;
  private static List<Runnable> zzEm;
  private static boolean zzEv;
  private final Context mContext;
  private final zzra zzAM;
  private final zzk zzAN;
  private final zzf zzBS;
  private String zzBa;
  private String zzBb;
  private boolean zzBs;
  private final zzy zzEn;
  private final zzaj zzEo;
  private final zzai zzEp;
  private final zzg zzEq;
  private final zza zzEr;
  private Set<zza> zzEs;
  private boolean zzEt;
  private volatile boolean zzEu;

  protected GoogleAnalytics(Context paramContext)
  {
    this(paramContext, null, zzv.zzfE(), null);
  }

  protected GoogleAnalytics(Context paramContext, zzf paramzzf, zzaj paramzzaj, zzak paramzzak)
  {
    com.google.android.gms.common.internal.zzx.zzl(paramContext);
    Context localContext = paramContext.getApplicationContext();
    com.google.android.gms.common.internal.zzx.zzl(localContext);
    com.google.android.gms.common.internal.zzx.zzl(paramzzaj);
    this.zzEn = zzy.zzfV();
    this.mContext = localContext;
    this.zzAM = zzra.zzaf(localContext);
    com.google.android.gms.common.internal.zzx.zzl(this.zzAM);
    this.zzEo = paramzzaj;
    if (paramzzf != null);
    for (this.zzBS = paramzzf; ; this.zzBS = new zzx(this, paramzzak))
    {
      this.zzAN = new zzk(this.zzAM);
      this.zzEq = new zzg(this.zzAM);
      this.zzEp = new zzai(this.zzAM);
      this.zzEr = new zza(this.zzAM, this.zzAN);
      this.zzEs = new HashSet();
      zzgk();
      return;
    }
  }

  public static GoogleAnalytics getInstance(Context paramContext)
  {
    com.google.android.gms.common.internal.zzx.zzl(paramContext);
    if (zzEl == null)
    {
      try
      {
        if (zzEl != null)
          break label82;
        zzEl = new GoogleAnalytics(paramContext);
        if (zzEm == null)
          break label82;
        Iterator localIterator = zzEm.iterator();
        while (localIterator.hasNext())
          ((Runnable)localIterator.next()).run();
      }
      finally
      {
      }
      zzEm = null;
    }
    label82: return zzEl;
  }

  private Tracker zza(Tracker paramTracker)
  {
    if (this.zzBa != null)
      paramTracker.set("&an", this.zzBa);
    if (this.zzBb != null)
      paramTracker.set("&av", this.zzBb);
    return paramTracker;
  }

  private int zzao(String paramString)
  {
    String str = paramString.toLowerCase();
    if ("verbose".equals(str))
      return 0;
    if ("info".equals(str))
      return 1;
    if ("warning".equals(str))
      return 2;
    if ("error".equals(str))
      return 3;
    return -1;
  }

  static GoogleAnalytics zzgj()
  {
    try
    {
      GoogleAnalytics localGoogleAnalytics = zzEl;
      return localGoogleAnalytics;
    }
    finally
    {
    }
  }

  private void zzgk()
  {
    if (zzEv);
    zzaa localzzaa;
    do
    {
      int i;
      do
      {
        Bundle localBundle;
        do
        {
          return;
          try
          {
            ApplicationInfo localApplicationInfo2 = this.mContext.getPackageManager().getApplicationInfo(this.mContext.getPackageName(), 129);
            localApplicationInfo1 = localApplicationInfo2;
            if (localApplicationInfo1 == null)
            {
              zzae.zzac("Couldn't get ApplicationInfo to load global config.");
              return;
            }
          }
          catch (PackageManager.NameNotFoundException localNameNotFoundException)
          {
            ApplicationInfo localApplicationInfo1;
            while (true)
            {
              zzae.zzab("PackageManager doesn't know about package: " + localNameNotFoundException);
              localApplicationInfo1 = null;
            }
            localBundle = localApplicationInfo1.metaData;
          }
        }
        while (localBundle == null);
        i = localBundle.getInt("com.google.android.gms.analytics.globalConfigResource");
      }
      while (i <= 0);
      localzzaa = (zzaa)new zzz(this.mContext).zzD(i);
    }
    while (localzzaa == null);
    zza(localzzaa);
  }

  @Deprecated
  public void dispatchLocalHits()
  {
    this.zzEo.dispatchLocalHits();
  }

  public void enableAutoActivityReports(Application paramApplication)
  {
    if ((Build.VERSION.SDK_INT >= 14) && (!this.zzEt))
    {
      paramApplication.registerActivityLifecycleCallbacks(new zzb());
      this.zzEt = true;
    }
  }

  public boolean getAppOptOut()
  {
    this.zzEn.zza(zzy.zza.zzDM);
    return this.zzEu;
  }

  public String getClientId()
  {
    return this.zzAN.getValue("&cid");
  }

  public Context getContext()
  {
    return this.mContext;
  }

  public Logger getLogger()
  {
    return zzae.getLogger();
  }

  public boolean isDryRunEnabled()
  {
    this.zzEn.zza(zzy.zza.zzDY);
    return this.zzBs;
  }

  public Tracker newTracker(int paramInt)
  {
    try
    {
      this.zzEn.zza(zzy.zza.zzDI);
      Tracker localTracker1 = new Tracker(this, null, null, null);
      if (paramInt > 0)
      {
        zzam localzzam = (zzam)new zzal(this.mContext).zzD(paramInt);
        if (localzzam != null)
          localTracker1.zza(localzzam);
      }
      Tracker localTracker2 = zza(localTracker1);
      return localTracker2;
    }
    finally
    {
    }
  }

  public Tracker newTracker(String paramString)
  {
    try
    {
      this.zzEn.zza(zzy.zza.zzDI);
      Tracker localTracker = zza(new Tracker(this, paramString, null, null));
      return localTracker;
    }
    finally
    {
    }
  }

  public void reportActivityStart(Activity paramActivity)
  {
    if (!this.zzEt)
      zzl(paramActivity);
  }

  public void reportActivityStop(Activity paramActivity)
  {
    if (!this.zzEt)
      zzm(paramActivity);
  }

  public void setAppOptOut(boolean paramBoolean)
  {
    this.zzEn.zza(zzy.zza.zzDL);
    this.zzEu = paramBoolean;
    if (this.zzEu)
      this.zzBS.zzfa();
  }

  public void setDryRun(boolean paramBoolean)
  {
    this.zzEn.zza(zzy.zza.zzDX);
    this.zzBs = paramBoolean;
  }

  @Deprecated
  public void setLocalDispatchPeriod(int paramInt)
  {
    this.zzEo.setLocalDispatchPeriod(paramInt);
  }

  public void setLogger(Logger paramLogger)
  {
    this.zzEn.zza(zzy.zza.zzDZ);
    zzae.setLogger(paramLogger);
  }

  void zza(zza paramzza)
  {
    this.zzEs.add(paramzza);
    if ((this.mContext instanceof Application))
      enableAutoActivityReports((Application)this.mContext);
  }

  void zza(zzaa paramzzaa)
  {
    zzae.zzab("Loading global config values.");
    if (paramzzaa.zzfZ())
    {
      this.zzBa = paramzzaa.zzga();
      zzae.zzab("app name loaded: " + this.zzBa);
    }
    if (paramzzaa.zzgb())
    {
      this.zzBb = paramzzaa.zzgc();
      zzae.zzab("app version loaded: " + this.zzBb);
    }
    if (paramzzaa.zzgd())
    {
      int i = zzao(paramzzaa.zzge());
      if (i >= 0)
      {
        zzae.zzab("log level loaded: " + i);
        getLogger().setLogLevel(i);
      }
    }
    if (paramzzaa.zzgf())
      this.zzEo.setLocalDispatchPeriod(paramzzaa.zzgg());
    if (paramzzaa.zzgh())
      setDryRun(paramzzaa.zzgi());
  }

  void zzb(zza paramzza)
  {
    this.zzEs.remove(paramzza);
  }

  void zzfj()
  {
    this.zzBS.zzfj();
  }

  zzd zzgl()
  {
    return this.zzEo.zzE(this.mContext);
  }

  zzf zzgm()
  {
    return this.zzBS;
  }

  public zzai zzgn()
  {
    return this.zzEp;
  }

  public zzg zzgo()
  {
    return this.zzEq;
  }

  public zzk zzgp()
  {
    return this.zzAN;
  }

  public zza zzgq()
  {
    return this.zzEr;
  }

  void zzl(Activity paramActivity)
  {
    Iterator localIterator = this.zzEs.iterator();
    while (localIterator.hasNext())
      ((zza)localIterator.next()).zzn(paramActivity);
  }

  void zzm(Activity paramActivity)
  {
    Iterator localIterator = this.zzEs.iterator();
    while (localIterator.hasNext())
      ((zza)localIterator.next()).zzo(paramActivity);
  }

  void zzx(Map<String, String> paramMap)
  {
    com.google.android.gms.common.internal.zzx.zzl(paramMap);
    try
    {
      zzan.zza(paramMap, "&ul", zzan.zza(Locale.getDefault()));
      zzan.zza(paramMap, "&sr", this.zzEp);
      paramMap.put("&_u", this.zzEn.zzfX());
      this.zzEn.zzfW();
      this.zzBS.zzx(paramMap);
      return;
    }
    finally
    {
    }
  }

  static abstract interface zza
  {
    public abstract void zzn(Activity paramActivity);

    public abstract void zzo(Activity paramActivity);
  }

  class zzb
    implements Application.ActivityLifecycleCallbacks
  {
    zzb()
    {
    }

    public void onActivityCreated(Activity paramActivity, Bundle paramBundle)
    {
    }

    public void onActivityDestroyed(Activity paramActivity)
    {
    }

    public void onActivityPaused(Activity paramActivity)
    {
    }

    public void onActivityResumed(Activity paramActivity)
    {
    }

    public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
    {
    }

    public void onActivityStarted(Activity paramActivity)
    {
      GoogleAnalytics.this.zzl(paramActivity);
    }

    public void onActivityStopped(Activity paramActivity)
    {
      GoogleAnalytics.this.zzm(paramActivity);
    }
  }
}