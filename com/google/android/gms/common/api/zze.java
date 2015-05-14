package com.google.android.gms.common.api;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.gms.common.internal.zzx;

public final class zze<L>
{
  private volatile L mListener;
  private final zze<L>.zza zzNk;

  zze(Looper paramLooper, L paramL)
  {
    this.zzNk = new zza(paramLooper);
    this.mListener = zzx.zzb(paramL, "Listener must not be null");
  }

  public void clear()
  {
    this.mListener = null;
  }

  public void zza(zzb<? super L> paramzzb)
  {
    zzx.zzb(paramzzb, "Notifier must not be null");
    Message localMessage = this.zzNk.obtainMessage(1, paramzzb);
    this.zzNk.sendMessage(localMessage);
  }

  void zzb(zzb<? super L> paramzzb)
  {
    Object localObject = this.mListener;
    if (localObject == null)
    {
      paramzzb.zzhX();
      return;
    }
    try
    {
      paramzzb.zze(localObject);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      paramzzb.zzhX();
      throw localRuntimeException;
    }
  }

  private final class zza extends Handler
  {
    public zza(Looper arg2)
    {
      super();
    }

    public void handleMessage(Message paramMessage)
    {
      int i = 1;
      if (paramMessage.what == i);
      while (true)
      {
        zzx.zzO(i);
        zze.this.zzb((zze.zzb)paramMessage.obj);
        return;
        int j = 0;
      }
    }
  }

  public static abstract interface zzb<L>
  {
    public abstract void zze(L paramL);

    public abstract void zzhX();
  }
}