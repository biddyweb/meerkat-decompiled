package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ContentProviderClient;
import android.content.Context;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.zzd.zza;
import com.google.android.gms.location.zze.zza;
import com.google.android.gms.location.zzh;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class zzpe
{
  private final Context mContext;
  private Map<LocationListener, zzb> zzZH = new HashMap();
  private ContentProviderClient zzamS = null;
  private boolean zzamT = false;
  private Map<Object, zzc> zzamU = new HashMap();
  private final zzpm<zzpc> zzamz;

  public zzpe(Context paramContext, zzpm<zzpc> paramzzpm)
  {
    this.mContext = paramContext;
    this.zzamz = paramzzpm;
  }

  private zzb zza(LocationListener paramLocationListener, Looper paramLooper)
  {
    if (paramLooper == null)
      zzx.zzb(Looper.myLooper(), "Can't create handler inside thread that has not called Looper.prepare()");
    synchronized (this.zzZH)
    {
      zzb localzzb = (zzb)this.zzZH.get(paramLocationListener);
      if (localzzb == null)
        localzzb = new zzb(paramLocationListener, paramLooper);
      this.zzZH.put(paramLocationListener, localzzb);
      return localzzb;
    }
  }

  public void removeAllListeners()
  {
    try
    {
      synchronized (this.zzZH)
      {
        Iterator localIterator1 = this.zzZH.values().iterator();
        while (localIterator1.hasNext())
        {
          zzb localzzb = (zzb)localIterator1.next();
          if (localzzb != null)
            ((zzpc)this.zzamz.zzjb()).zza(zzpi.zzb(localzzb));
        }
      }
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
    this.zzZH.clear();
    Iterator localIterator2 = this.zzamU.values().iterator();
    while (localIterator2.hasNext())
    {
      zzc localzzc = (zzc)localIterator2.next();
      if (localzzc != null)
        ((zzpc)this.zzamz.zzjb()).zza(zzpi.zza(localzzc));
    }
    this.zzamU.clear();
  }

  public void zzW(boolean paramBoolean)
    throws RemoteException
  {
    this.zzamz.zzfc();
    ((zzpc)this.zzamz.zzjb()).zzW(paramBoolean);
    this.zzamT = paramBoolean;
  }

  public void zza(LocationListener paramLocationListener)
    throws RemoteException
  {
    this.zzamz.zzfc();
    zzx.zzb(paramLocationListener, "Invalid null listener");
    synchronized (this.zzZH)
    {
      zzb localzzb = (zzb)this.zzZH.remove(paramLocationListener);
      if ((this.zzamS != null) && (this.zzZH.isEmpty()))
      {
        this.zzamS.release();
        this.zzamS = null;
      }
      if (localzzb != null)
      {
        localzzb.release();
        ((zzpc)this.zzamz.zzjb()).zza(zzpi.zzb(localzzb));
      }
      return;
    }
  }

  public void zza(LocationRequest paramLocationRequest, LocationListener paramLocationListener, Looper paramLooper)
    throws RemoteException
  {
    this.zzamz.zzfc();
    zzb localzzb = zza(paramLocationListener, paramLooper);
    ((zzpc)this.zzamz.zzjb()).zza(zzpi.zzb(zzpg.zzb(paramLocationRequest), localzzb));
  }

  public void zzb(Location paramLocation)
    throws RemoteException
  {
    this.zzamz.zzfc();
    ((zzpc)this.zzamz.zzjb()).zzb(paramLocation);
  }

  public void zzb(LocationRequest paramLocationRequest, PendingIntent paramPendingIntent)
    throws RemoteException
  {
    this.zzamz.zzfc();
    ((zzpc)this.zzamz.zzjb()).zza(zzpi.zzb(zzpg.zzb(paramLocationRequest), paramPendingIntent));
  }

  public void zzd(PendingIntent paramPendingIntent)
    throws RemoteException
  {
    this.zzamz.zzfc();
    ((zzpc)this.zzamz.zzjb()).zza(zzpi.zze(paramPendingIntent));
  }

  public Location zzpx()
  {
    this.zzamz.zzfc();
    try
    {
      Location localLocation = ((zzpc)this.zzamz.zzjb()).zzcj(this.mContext.getPackageName());
      return localLocation;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public void zzpy()
  {
    if (this.zzamT);
    try
    {
      zzW(false);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  private static class zza extends Handler
  {
    private final LocationListener zzamV;

    public zza(LocationListener paramLocationListener)
    {
      this.zzamV = paramLocationListener;
    }

    public zza(LocationListener paramLocationListener, Looper paramLooper)
    {
      super();
      this.zzamV = paramLocationListener;
    }

    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      default:
        Log.e("LocationClientHelper", "unknown message in LocationHandler.handleMessage");
        return;
      case 1:
      }
      Location localLocation = new Location((Location)paramMessage.obj);
      this.zzamV.onLocationChanged(localLocation);
    }
  }

  private static class zzb extends zzd.zza
  {
    private Handler zzamW;

    zzb(LocationListener paramLocationListener, Looper paramLooper)
    {
      if (paramLooper == null);
      for (zzpe.zza localzza = new zzpe.zza(paramLocationListener); ; localzza = new zzpe.zza(paramLocationListener, paramLooper))
      {
        this.zzamW = localzza;
        return;
      }
    }

    public void onLocationChanged(Location paramLocation)
    {
      if (this.zzamW == null)
      {
        Log.e("LocationClientHelper", "Received a location in client after calling removeLocationUpdates.");
        return;
      }
      Message localMessage = Message.obtain();
      localMessage.what = 1;
      localMessage.obj = paramLocation;
      this.zzamW.sendMessage(localMessage);
    }

    public void release()
    {
      this.zzamW = null;
    }
  }

  private static class zzc extends zze.zza
  {
    private Handler zzamW;

    public void zza(zzh paramzzh)
    {
      if (this.zzamW == null)
      {
        Log.e("LocationClientHelper", "Received a location in client after calling removeLocationUpdates.");
        return;
      }
      Message localMessage = Message.obtain();
      localMessage.obj = paramzzh;
      this.zzamW.sendMessage(localMessage);
    }
  }
}