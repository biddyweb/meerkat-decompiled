package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.tagmanager.zzbf;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

public class zzvv
{
  private boolean mClosed;
  private final ScheduledExecutorService zzasc;
  private String zzaya = null;
  private ScheduledFuture<?> zzazR = null;

  public zzvv()
  {
    this(Executors.newSingleThreadScheduledExecutor());
  }

  public zzvv(String paramString)
  {
    this(Executors.newSingleThreadScheduledExecutor());
    this.zzaya = paramString;
  }

  zzvv(ScheduledExecutorService paramScheduledExecutorService)
  {
    this.zzasc = paramScheduledExecutorService;
    this.mClosed = false;
  }

  public void zza(Context paramContext, zzvj paramzzvj, long paramLong, zzvt paramzzvt)
  {
    while (true)
    {
      try
      {
        zzbf.zzab("ResourceLoaderScheduler: Loading new resource.");
        if (this.zzazR != null)
          return;
        if (this.zzaya != null)
        {
          localzzvu = new zzvu(paramContext, paramzzvj, paramzzvt, this.zzaya);
          this.zzazR = this.zzasc.schedule(localzzvu, paramLong, TimeUnit.MILLISECONDS);
          return;
        }
      }
      finally
      {
      }
      zzvu localzzvu = new zzvu(paramContext, paramzzvj, paramzzvt);
    }
  }
}