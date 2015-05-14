package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Process;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import com.google.android.gms.analytics.zzan;
import com.google.android.gms.common.internal.zzx;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

public final class zzra
{
  private static volatile zzra zzarZ;
  private final Context mContext;
  private final List<zzrb> zzasa;
  private final zzqw zzasb;
  private final ScheduledExecutorService zzasc;
  private volatile zzrf zzasd;

  zzra(Context paramContext)
  {
    Context localContext = paramContext.getApplicationContext();
    zzx.zzl(localContext);
    this.mContext = localContext;
    this.zzasc = Executors.newSingleThreadScheduledExecutor(new zza(null));
    this.zzasa = new CopyOnWriteArrayList();
    this.zzasb = new zzqw();
  }

  private void zza(zzqx paramzzqx)
  {
    zzx.zzbe("deliver should be called from worker thread");
    zzx.zzb(paramzzqx.zzqS(), "Measurement must be submitted");
    List localList = paramzzqx.zzqR();
    if (localList.isEmpty());
    while (true)
    {
      return;
      HashSet localHashSet = new HashSet();
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        zzrc localzzrc = (zzrc)localIterator.next();
        Uri localUri = localzzrc.zzqP();
        if (!localHashSet.contains(localUri))
        {
          localHashSet.add(localUri);
          localzzrc.zza(paramzzqx);
        }
      }
    }
  }

  public static zzra zzaf(Context paramContext)
  {
    zzx.zzl(paramContext);
    if (zzarZ == null);
    try
    {
      if (zzarZ == null)
        zzarZ = new zzra(paramContext);
      return zzarZ;
    }
    finally
    {
    }
  }

  public Context getContext()
  {
    return this.mContext;
  }

  public <V> Future<V> zza(Callable<V> paramCallable)
  {
    zzx.zzl(paramCallable);
    if ((Thread.currentThread() instanceof zzb))
    {
      FutureTask localFutureTask = new FutureTask(paramCallable);
      localFutureTask.run();
      return localFutureTask;
    }
    return this.zzasc.submit(paramCallable);
  }

  public zzrf zzqU()
  {
    if (this.zzasd == null);
    try
    {
      zzrf localzzrf;
      PackageManager localPackageManager;
      String str1;
      if (this.zzasd == null)
      {
        localzzrf = new zzrf();
        localPackageManager = this.mContext.getPackageManager();
        str1 = this.mContext.getPackageName();
        localzzrf.setAppId(str1);
        localzzrf.setAppInstallerId(localPackageManager.getInstallerPackageName(str1));
      }
      try
      {
        PackageInfo localPackageInfo = localPackageManager.getPackageInfo(this.mContext.getPackageName(), 0);
        str2 = null;
        if (localPackageInfo != null)
        {
          CharSequence localCharSequence = localPackageManager.getApplicationLabel(localPackageInfo.applicationInfo);
          if (!TextUtils.isEmpty(localCharSequence))
            str1 = localCharSequence.toString();
          str2 = localPackageInfo.versionName;
        }
        localzzrf.setAppName(str1);
        localzzrf.setAppVersion(str2);
        this.zzasd = localzzrf;
        return this.zzasd;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        while (true)
        {
          Log.e("GA", "Error retrieving package info: appName set to " + str1);
          String str2 = null;
        }
      }
    }
    finally
    {
    }
  }

  public zzrg zzqV()
  {
    DisplayMetrics localDisplayMetrics = this.mContext.getResources().getDisplayMetrics();
    zzrg localzzrg = new zzrg();
    localzzrg.setLanguage(zzan.zza(Locale.getDefault()));
    localzzrg.zzgp(localDisplayMetrics.widthPixels);
    localzzrg.zzgq(localDisplayMetrics.heightPixels);
    return localzzrg;
  }

  private static class zza
    implements ThreadFactory
  {
    private static final AtomicInteger zzasg = new AtomicInteger();

    public Thread newThread(Runnable paramRunnable)
    {
      return new zzra.zzb(paramRunnable, "measurement-" + zzasg.incrementAndGet());
    }
  }

  private static class zzb extends Thread
  {
    zzb(Runnable paramRunnable, String paramString)
    {
      super(paramString);
    }

    public void run()
    {
      Process.setThreadPriority(10);
      super.run();
    }
  }
}