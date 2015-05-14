package com.google.android.gms.internal;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;

@zzgi
public final class zzhn
{
  private static final ThreadFactory zzzk = new zzhn.4();
  private static final ExecutorService zzzl = Executors.newFixedThreadPool(10, zzzk);
  private static final ExecutorService zzzm = Executors.newFixedThreadPool(5, zzzk);

  public static <T> Future<T> submit(Callable<T> paramCallable)
  {
    return zza(zzzl, paramCallable);
  }

  public static Future<Void> zza(int paramInt, Runnable paramRunnable)
  {
    if (paramInt == 1)
      return zza(zzzm, new zzhn.1(paramRunnable));
    return zza(zzzl, new zzhn.2(paramRunnable));
  }

  public static <T> Future<T> zza(ExecutorService paramExecutorService, Callable<T> paramCallable)
  {
    try
    {
      Future localFuture = paramExecutorService.submit(new zzhn.3(paramCallable));
      return localFuture;
    }
    catch (RejectedExecutionException localRejectedExecutionException)
    {
      zzhx.zzd("Thread execution is rejected.", localRejectedExecutionException);
    }
    return new zzhr(null);
  }

  public static Future<Void> zzb(Runnable paramRunnable)
  {
    return zza(0, paramRunnable);
  }
}