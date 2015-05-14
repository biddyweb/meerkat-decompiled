package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.Container;
import com.google.android.gms.tagmanager.ContainerHolder;
import com.google.android.gms.tagmanager.TagManager;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class zztb
{
  private static zztb zzatE;
  private Context mContext;
  private boolean mStarted;
  private final Set<zza> zzatF = new HashSet();
  private TagManager zzatG = null;
  private zzta zzmB;

  zztb(Context paramContext, TagManager paramTagManager)
  {
    this.mContext = paramContext;
    this.zzatG = paramTagManager;
  }

  public static zztb zzah(Context paramContext)
  {
    zzx.zzl(paramContext);
    if (zzatE == null);
    try
    {
      if (zzatE == null)
        zzatE = new zztb(paramContext, TagManager.getInstance(paramContext.getApplicationContext()));
      return zzatE;
    }
    finally
    {
    }
  }

  private void zzrC()
  {
    try
    {
      Iterator localIterator = this.zzatF.iterator();
      while (localIterator.hasNext())
        ((zza)localIterator.next()).zzaE();
    }
    finally
    {
    }
  }

  public void start()
    throws IllegalStateException
  {
    try
    {
      if (this.mStarted)
        throw new IllegalStateException("Method start() has already been called");
    }
    finally
    {
    }
    if (this.zzmB == null)
      throw new IllegalStateException("No settings configured");
    this.mStarted = true;
    this.zzatG.zzc(this.zzmB.zzrx(), -1, "admob").setResultCallback(new ResultCallback()
    {
      public void zza(ContainerHolder paramAnonymousContainerHolder)
      {
        if (paramAnonymousContainerHolder.getStatus().isSuccess());
        for (Container localContainer = paramAnonymousContainerHolder.getContainer(); ; localContainer = null)
        {
          zzsz localzzsz = new zzsz(zztb.zza(zztb.this), localContainer, zztb.this.zzrB());
          zztb.zza(zztb.this, localzzsz.zzrv());
          zztb.zzb(zztb.this);
          return;
        }
      }
    });
  }

  public void zza(zzta paramzzta)
  {
    try
    {
      if (this.mStarted)
        throw new IllegalStateException("Settings can't be changed after TagManager has been started");
    }
    finally
    {
    }
    this.zzmB = paramzzta;
  }

  public void zza(zza paramzza)
  {
    try
    {
      this.zzatF.add(paramzza);
      return;
    }
    finally
    {
    }
  }

  public zzta zzrB()
  {
    try
    {
      zzta localzzta = this.zzmB;
      return localzzta;
    }
    finally
    {
    }
  }

  public static abstract interface zza
  {
    public abstract void zzaE();
  }
}