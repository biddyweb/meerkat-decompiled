package com.google.android.gms.internal;

import android.os.SystemClock;

public final class zzkg
{
  private static final zzkc zzKh = new zzkc("RequestTracker");
  public static final Object zzLm = new Object();
  private long zzLi;
  private long zzLj;
  private long zzLk;
  private zzkf zzLl;

  public zzkg(long paramLong)
  {
    this.zzLi = paramLong;
    this.zzLj = -1L;
    this.zzLk = 0L;
  }

  private void zzhH()
  {
    this.zzLj = -1L;
    this.zzLl = null;
    this.zzLk = 0L;
  }

  public void zza(long paramLong, zzkf paramzzkf)
  {
    synchronized (zzLm)
    {
      zzkf localzzkf = this.zzLl;
      long l = this.zzLj;
      this.zzLj = paramLong;
      this.zzLl = paramzzkf;
      this.zzLk = SystemClock.elapsedRealtime();
      if (localzzkf != null)
        localzzkf.zzn(l);
      return;
    }
  }

  public boolean zzb(long paramLong, int paramInt, Object paramObject)
  {
    for (boolean bool = true; ; bool = false)
    {
      synchronized (zzLm)
      {
        if ((this.zzLj != -1L) && (this.zzLj == paramLong))
        {
          zzkc localzzkc = zzKh;
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = Long.valueOf(this.zzLj);
          localzzkc.zzb("request %d completed", arrayOfObject);
          localzzkf = this.zzLl;
          zzhH();
          if (localzzkf != null)
            localzzkf.zza(paramLong, paramInt, paramObject);
          return bool;
        }
      }
      zzkf localzzkf = null;
    }
  }

  public boolean zzc(long paramLong, int paramInt)
  {
    return zzb(paramLong, paramInt, null);
  }

  public boolean zzd(long paramLong, int paramInt)
  {
    boolean bool = true;
    long l = 0L;
    while (true)
    {
      synchronized (zzLm)
      {
        if ((this.zzLj != -1L) && (paramLong - this.zzLk >= this.zzLi))
        {
          zzkc localzzkc = zzKh;
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = Long.valueOf(this.zzLj);
          localzzkc.zzb("request %d timed out", arrayOfObject);
          l = this.zzLj;
          localzzkf = this.zzLl;
          zzhH();
          if (localzzkf != null)
            localzzkf.zza(l, paramInt, null);
          return bool;
        }
      }
      zzkf localzzkf = null;
      bool = false;
    }
  }

  public boolean zzhI()
  {
    while (true)
    {
      synchronized (zzLm)
      {
        if (this.zzLj != -1L)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }

  public boolean zzq(long paramLong)
  {
    while (true)
    {
      synchronized (zzLm)
      {
        if ((this.zzLj != -1L) && (this.zzLj == paramLong))
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
}