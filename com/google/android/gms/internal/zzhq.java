package com.google.android.gms.internal;

import java.util.concurrent.CancellationException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@zzgi
public class zzhq<T>
  implements Future<T>
{
  private final Object zznh = new Object();
  private boolean zzsg = false;
  private T zzzt = null;
  private boolean zzzu = false;

  public boolean cancel(boolean paramBoolean)
  {
    if (!paramBoolean)
      return false;
    synchronized (this.zznh)
    {
      if (this.zzzu)
        return false;
    }
    this.zzsg = true;
    this.zzzu = true;
    this.zznh.notifyAll();
    return true;
  }

  public T get()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzzu;
      if (bool);
    }
    try
    {
      this.zznh.wait();
      label23: if (this.zzsg)
      {
        throw new CancellationException("CallbackFuture was cancelled.");
        localObject2 = finally;
        throw localObject2;
      }
      Object localObject3 = this.zzzt;
      return localObject3;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label23;
    }
  }

  public T get(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzzu;
      if (bool);
    }
    try
    {
      long l = paramTimeUnit.toMillis(paramLong);
      if (l != 0L)
        this.zznh.wait(l);
      label43: if (!this.zzzu)
      {
        throw new TimeoutException("CallbackFuture timed out.");
        localObject2 = finally;
        throw localObject2;
      }
      if (this.zzsg)
        throw new CancellationException("CallbackFuture was cancelled.");
      Object localObject3 = this.zzzt;
      return localObject3;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label43;
    }
  }

  public boolean isCancelled()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzsg;
      return bool;
    }
  }

  public boolean isDone()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzzu;
      return bool;
    }
  }

  public void zzb(T paramT)
  {
    synchronized (this.zznh)
    {
      if (this.zzzu)
        throw new IllegalStateException("Provided CallbackFuture with multiple values.");
    }
    this.zzzu = true;
    this.zzzt = paramT;
    this.zznh.notifyAll();
  }
}