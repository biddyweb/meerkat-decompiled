package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

abstract class Futures$ImmediateFuture<V>
  implements ListenableFuture<V>
{
  private static final Logger log = Logger.getLogger(ImmediateFuture.class.getName());

  public void addListener(Runnable paramRunnable, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramRunnable, "Runnable was null.");
    Preconditions.checkNotNull(paramExecutor, "Executor was null.");
    try
    {
      paramExecutor.execute(paramRunnable);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      Logger localLogger = log;
      Level localLevel = Level.SEVERE;
      String str1 = String.valueOf(String.valueOf(paramRunnable));
      String str2 = String.valueOf(String.valueOf(paramExecutor));
      localLogger.log(localLevel, 57 + str1.length() + str2.length() + "RuntimeException while executing runnable " + str1 + " with executor " + str2, localRuntimeException);
    }
  }

  public boolean cancel(boolean paramBoolean)
  {
    return false;
  }

  public abstract V get()
    throws ExecutionException;

  public V get(long paramLong, TimeUnit paramTimeUnit)
    throws ExecutionException
  {
    Preconditions.checkNotNull(paramTimeUnit);
    return get();
  }

  public boolean isCancelled()
  {
    return false;
  }

  public boolean isDone()
  {
    return true;
  }
}