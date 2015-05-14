package com.google.android.gms.internal;

import android.os.Handler;
import java.lang.ref.WeakReference;

final class zzeq$zza
{
  private final Runnable zzmG;
  private volatile boolean zzuF = false;

  public zzeq$zza(final zzeq paramzzeq)
  {
    this.zzmG = new Runnable()
    {
      private final WeakReference<zzeq> zzuG = new WeakReference(paramzzeq);

      public void run()
      {
        zzeq localzzeq = (zzeq)this.zzuG.get();
        if ((!zzeq.zza.zza(zzeq.zza.this)) && (localzzeq != null))
        {
          localzzeq.zzdp();
          zzeq.zza.this.zzdq();
        }
      }
    };
  }

  public void cancel()
  {
    this.zzuF = true;
    zzhw.zzzG.removeCallbacks(this.zzmG);
  }

  public void zzdq()
  {
    zzhw.zzzG.postDelayed(this.zzmG, 250L);
  }
}