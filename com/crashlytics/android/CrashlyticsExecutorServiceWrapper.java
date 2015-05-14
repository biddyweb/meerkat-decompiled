package com.crashlytics.android;

import android.os.Looper;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;

class CrashlyticsExecutorServiceWrapper
{
  private final ExecutorService executorService;

  public CrashlyticsExecutorServiceWrapper(ExecutorService paramExecutorService)
  {
    this.executorService = paramExecutorService;
  }

  Future<?> executeAsync(final Runnable paramRunnable)
  {
    try
    {
      Future localFuture = this.executorService.submit(new Runnable()
      {
        public void run()
        {
          try
          {
            paramRunnable.run();
            return;
          }
          catch (Exception localException)
          {
            Fabric.getLogger().e("Fabric", "Failed to execute task.", localException);
          }
        }
      });
      return localFuture;
    }
    catch (RejectedExecutionException localRejectedExecutionException)
    {
      Fabric.getLogger().d("Fabric", "Executor is shut down because we're handling a fatal crash.");
    }
    return null;
  }

  <T> Future<T> executeAsync(final Callable<T> paramCallable)
  {
    try
    {
      Future localFuture = this.executorService.submit(new Callable()
      {
        public T call()
          throws Exception
        {
          try
          {
            Object localObject = paramCallable.call();
            return localObject;
          }
          catch (Exception localException)
          {
            Fabric.getLogger().e("Fabric", "Failed to execute task.", localException);
          }
          return null;
        }
      });
      return localFuture;
    }
    catch (RejectedExecutionException localRejectedExecutionException)
    {
      Fabric.getLogger().d("Fabric", "Executor is shut down because we're handling a fatal crash.");
    }
    return null;
  }

  <T> T executeSyncLoggingException(Callable<T> paramCallable)
  {
    try
    {
      if (Looper.getMainLooper() == Looper.myLooper())
        return this.executorService.submit(paramCallable).get(4L, TimeUnit.SECONDS);
      Object localObject = this.executorService.submit(paramCallable).get();
      return localObject;
    }
    catch (RejectedExecutionException localRejectedExecutionException)
    {
      Fabric.getLogger().d("Fabric", "Executor is shut down because we're handling a fatal crash.");
      return null;
    }
    catch (Exception localException)
    {
      Fabric.getLogger().e("Fabric", "Failed to execute task.", localException);
    }
    return null;
  }
}