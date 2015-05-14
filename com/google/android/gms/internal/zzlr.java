package com.google.android.gms.internal;

import android.os.SystemClock;
import android.support.v4.util.SimpleArrayMap;
import android.util.Log;

public class zzlr
{
  private final long zzRK;
  private final int zzRL;
  private final SimpleArrayMap<Long, Long> zzRM;

  public zzlr()
  {
    this.zzRK = 60000L;
    this.zzRL = 10;
    this.zzRM = new SimpleArrayMap(10);
  }

  public zzlr(int paramInt, long paramLong)
  {
    this.zzRK = paramLong;
    this.zzRL = paramInt;
    this.zzRM = new SimpleArrayMap();
  }

  private void zzc(long paramLong1, long paramLong2)
  {
    for (int i = -1 + this.zzRM.size(); i >= 0; i--)
      if (paramLong2 - ((Long)this.zzRM.valueAt(i)).longValue() > paramLong1)
        this.zzRM.removeAt(i);
  }

  public Long zza(Long paramLong)
  {
    long l1 = SystemClock.elapsedRealtime();
    long l2 = this.zzRK;
    try
    {
      while (this.zzRM.size() >= this.zzRL)
      {
        zzc(l2, l1);
        l2 /= 2L;
        Log.w("PassiveTimedConnectionMap", "The max capacity " + this.zzRL + " is not enough. Current durationThreshold is: " + l2);
      }
    }
    finally
    {
    }
    Long localLong = (Long)this.zzRM.put(paramLong, Long.valueOf(l1));
    return localLong;
  }

  public boolean zzr(long paramLong)
  {
    while (true)
    {
      try
      {
        if (this.zzRM.remove(Long.valueOf(paramLong)) != null)
        {
          bool = true;
          return bool;
        }
      }
      finally
      {
      }
      boolean bool = false;
    }
  }
}