package com.google.android.gms.internal;

import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

@zzgi
public class zzhr<T>
  implements Future<T>
{
  private final T zzzt;

  public zzhr(T paramT)
  {
    this.zzzt = paramT;
  }

  public boolean cancel(boolean paramBoolean)
  {
    return false;
  }

  public T get()
  {
    return this.zzzt;
  }

  public T get(long paramLong, TimeUnit paramTimeUnit)
  {
    return this.zzzt;
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