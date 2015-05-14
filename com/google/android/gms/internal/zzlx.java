package com.google.android.gms.internal;

import android.os.SystemClock;

public final class zzlx
  implements zzlv
{
  private static zzlx zzRO;

  public static zzlv zzkc()
  {
    try
    {
      if (zzRO == null)
        zzRO = new zzlx();
      zzlx localzzlx = zzRO;
      return localzzlx;
    }
    finally
    {
    }
  }

  public long currentTimeMillis()
  {
    return System.currentTimeMillis();
  }

  public long elapsedRealtime()
  {
    return SystemClock.elapsedRealtime();
  }
}