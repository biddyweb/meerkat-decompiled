package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

public abstract class zzjs extends zzjt
{
  protected final Handler mHandler = new Handler(Looper.getMainLooper());
  protected final long zzKa;
  protected final Runnable zzKb = new zza(null);
  protected boolean zzKc;

  public zzjs(String paramString1, String paramString2, String paramString3, long paramLong)
  {
    super(paramString1, paramString2, paramString3);
    this.zzKa = paramLong;
    zzK(false);
  }

  protected final void zzK(boolean paramBoolean)
  {
    if (this.zzKc != paramBoolean)
    {
      this.zzKc = paramBoolean;
      if (paramBoolean)
        this.mHandler.postDelayed(this.zzKb, this.zzKa);
    }
    else
    {
      return;
    }
    this.mHandler.removeCallbacks(this.zzKb);
  }

  public void zzhm()
  {
    zzK(false);
  }

  protected abstract boolean zzo(long paramLong);

  private class zza
    implements Runnable
  {
    private zza()
    {
    }

    public void run()
    {
      zzjs.this.zzKc = false;
      long l = SystemClock.elapsedRealtime();
      boolean bool = zzjs.this.zzo(l);
      zzjs.this.zzK(bool);
    }
  }
}