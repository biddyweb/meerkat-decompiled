package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzc.zzj;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

class zzcl
  implements zzo.zze
{
  private boolean mClosed;
  private final Context mContext;
  private final ScheduledExecutorService zzasc;
  private String zzaxT;
  private final String zzaxw;
  private zzbe<zzc.zzj> zzazN;
  private zzr zzazO;
  private final zza zzazQ;
  private ScheduledFuture<?> zzazR;

  public zzcl(Context paramContext, String paramString, zzr paramzzr)
  {
    this(paramContext, paramString, paramzzr, null, null);
  }

  zzcl(Context paramContext, String paramString, zzr paramzzr, zzb paramzzb, zza paramzza)
  {
    this.zzazO = paramzzr;
    this.mContext = paramContext;
    this.zzaxw = paramString;
    if (paramzzb == null)
      paramzzb = new zzb()
      {
        public ScheduledExecutorService zztE()
        {
          return Executors.newSingleThreadScheduledExecutor();
        }
      };
    this.zzasc = paramzzb.zztE();
    if (paramzza == null)
    {
      this.zzazQ = new zza()
      {
        public zzck zza(zzr paramAnonymouszzr)
        {
          return new zzck(zzcl.zza(zzcl.this), zzcl.zzb(zzcl.this), paramAnonymouszzr);
        }
      };
      return;
    }
    this.zzazQ = paramzza;
  }

  private zzck zzdh(String paramString)
  {
    zzck localzzck = this.zzazQ.zza(this.zzazO);
    localzzck.zza(this.zzazN);
    localzzck.zzcT(this.zzaxT);
    localzzck.zzdg(paramString);
    return localzzck;
  }

  private void zztD()
  {
    try
    {
      if (this.mClosed)
        throw new IllegalStateException("called method after closed");
    }
    finally
    {
    }
  }

  public void release()
  {
    try
    {
      zztD();
      if (this.zzazR != null)
        this.zzazR.cancel(false);
      this.zzasc.shutdown();
      this.mClosed = true;
      return;
    }
    finally
    {
    }
  }

  public void zza(zzbe<zzc.zzj> paramzzbe)
  {
    try
    {
      zztD();
      this.zzazN = paramzzbe;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void zzcT(String paramString)
  {
    try
    {
      zztD();
      this.zzaxT = paramString;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void zze(long paramLong, String paramString)
  {
    try
    {
      zzbf.zzab("loadAfterDelay: containerId=" + this.zzaxw + " delay=" + paramLong);
      zztD();
      if (this.zzazN == null)
        throw new IllegalStateException("callback must be set before loadAfterDelay() is called.");
    }
    finally
    {
    }
    if (this.zzazR != null)
      this.zzazR.cancel(false);
    this.zzazR = this.zzasc.schedule(zzdh(paramString), paramLong, TimeUnit.MILLISECONDS);
  }

  static abstract interface zza
  {
    public abstract zzck zza(zzr paramzzr);
  }

  static abstract interface zzb
  {
    public abstract ScheduledExecutorService zztE();
  }
}