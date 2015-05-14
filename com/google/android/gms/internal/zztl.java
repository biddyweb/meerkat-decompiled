package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.Iterator;

public class zztl extends zzk<zzte>
{
  private final String zzFO;
  private final zzti zzauc;
  private final zztg zzaud;
  private boolean zzaue;
  private final Object zznh;

  public zztl(Context paramContext, Looper paramLooper, zzti paramzzti, zzf paramzzf)
  {
    super(paramContext, paramLooper, 24, paramzzti, paramzzti, paramzzf);
    this.zzFO = paramContext.getPackageName();
    this.zzauc = ((zzti)zzx.zzl(paramzzti));
    this.zzauc.zza(this);
    this.zzaud = new zztg();
    this.zznh = new Object();
    this.zzaue = true;
  }

  private void zzc(zztj paramzztj, zztf paramzztf)
  {
    this.zzaud.zza(paramzztj, paramzztf);
  }

  private void zzd(zztj paramzztj, zztf paramzztf)
  {
    try
    {
      zzrI();
      ((zzte)zzjb()).zza(this.zzFO, paramzztj, paramzztf);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("PlayLoggerImpl", "Couldn't send log event.  Will try caching.");
      zzc(paramzztj, paramzztf);
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Log.e("PlayLoggerImpl", "Service was disconnected.  Will try caching.");
      zzc(paramzztj, paramzztf);
    }
  }

  private void zzrI()
  {
    boolean bool;
    if (!this.zzaue)
    {
      bool = true;
      zzb.zzN(bool);
      if (this.zzaud.isEmpty());
    }
    Object localObject2;
    for (Object localObject1 = null; ; localObject1 = localObject2)
    {
      ArrayList localArrayList;
      zztg.zza localzza;
      try
      {
        localArrayList = new ArrayList();
        Iterator localIterator = this.zzaud.zzrG().iterator();
        while (true)
        {
          if (!localIterator.hasNext())
            break label204;
          localzza = (zztg.zza)localIterator.next();
          if (localzza.zzatT == null)
            break;
          ((zzte)zzjb()).zza(this.zzFO, localzza.zzatR, zzwy.zzf(localzza.zzatT));
        }
      }
      catch (RemoteException localRemoteException)
      {
        Log.e("PlayLoggerImpl", "Couldn't send cached log events to AndroidLog service.  Retaining in memory cache.");
      }
      return;
      bool = false;
      break;
      if (localzza.zzatR.equals(localObject1))
      {
        localArrayList.add(localzza.zzatS);
        localObject2 = localObject1;
      }
      else
      {
        if (!localArrayList.isEmpty())
        {
          ((zzte)zzjb()).zza(this.zzFO, localObject1, localArrayList);
          localArrayList.clear();
        }
        zztj localzztj = localzza.zzatR;
        localArrayList.add(localzza.zzatS);
        localObject2 = localzztj;
        continue;
        label204: if (!localArrayList.isEmpty())
          ((zzte)zzjb()).zza(this.zzFO, localObject1, localArrayList);
        this.zzaud.clear();
        return;
      }
    }
  }

  public void start()
  {
    synchronized (this.zznh)
    {
      if ((isConnecting()) || (isConnected()))
        return;
      this.zzauc.zzad(true);
      connect();
      return;
    }
  }

  public void stop()
  {
    synchronized (this.zznh)
    {
      this.zzauc.zzad(false);
      disconnect();
      return;
    }
  }

  void zzae(boolean paramBoolean)
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzaue;
      this.zzaue = paramBoolean;
      if ((bool) && (!this.zzaue))
        zzrI();
      return;
    }
  }

  public void zzb(zztj paramzztj, zztf paramzztf)
  {
    synchronized (this.zznh)
    {
      if (this.zzaue)
      {
        zzc(paramzztj, paramzztf);
        return;
      }
      zzd(paramzztj, paramzztf);
    }
  }

  protected String zzcF()
  {
    return "com.google.android.gms.playlog.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.playlog.internal.IPlayLogService";
  }

  protected zzte zzcv(IBinder paramIBinder)
  {
    return zzte.zza.zzcu(paramIBinder);
  }
}