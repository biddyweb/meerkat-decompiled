package com.google.android.gms.internal;

import android.os.Handler;

public class zzaa$zza
{
  private final Handler mHandler;

  public zzaa$zza(Handler paramHandler)
  {
    this.mHandler = paramHandler;
  }

  public boolean postDelayed(Runnable paramRunnable, long paramLong)
  {
    return this.mHandler.postDelayed(paramRunnable, paramLong);
  }

  public void removeCallbacks(Runnable paramRunnable)
  {
    this.mHandler.removeCallbacks(paramRunnable);
  }
}