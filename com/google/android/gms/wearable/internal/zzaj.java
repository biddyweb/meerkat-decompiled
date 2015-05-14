package com.google.android.gms.wearable.internal;

import android.content.IntentFilter;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.wearable.DataApi.DataListener;
import com.google.android.gms.wearable.MessageApi.MessageListener;
import com.google.android.gms.wearable.NodeApi.NodeListener;
import com.google.android.gms.wearable.zza.zza;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

abstract class zzaj<T>
{
  private final HashMap<T, zzbe> zzaGo = new HashMap();

  abstract zzbe zza(T paramT, IntentFilter[] paramArrayOfIntentFilter);

  public void zza(zzbd paramzzbd, zza.zzb<Status> paramzzb, T paramT)
    throws RemoteException
  {
    synchronized (this.zzaGo)
    {
      zzbe localzzbe = (zzbe)this.zzaGo.remove(paramT);
      if (localzzbe == null)
      {
        paramzzb.zzd(new Status(4002));
        return;
      }
      localzzbe.clear();
      ((zzai)paramzzbd.zzjb()).zza(new zzf(this.zzaGo, paramT, paramzzb), new zzau(localzzbe));
      return;
    }
  }

  public void zza(zzbd paramzzbd, zza.zzb<Status> paramzzb, T paramT, IntentFilter[] paramArrayOfIntentFilter)
    throws RemoteException
  {
    zzbe localzzbe = zza(paramT, paramArrayOfIntentFilter);
    synchronized (this.zzaGo)
    {
      if (this.zzaGo.get(paramT) != null)
      {
        paramzzb.zzd(new Status(4001));
        return;
      }
      this.zzaGo.put(paramT, localzzbe);
    }
    try
    {
      ((zzai)paramzzbd.zzjb()).zza(new zza(this.zzaGo, paramT, paramzzb), new zzb(localzzbe));
      return;
      localObject = finally;
      throw localObject;
    }
    catch (RemoteException localRemoteException)
    {
      this.zzaGo.remove(paramT);
      throw localRemoteException;
    }
  }

  public void zzb(zzbd paramzzbd)
  {
    synchronized (this.zzaGo)
    {
      zzbc.zzh localzzh = new zzbc.zzh();
      Iterator localIterator = this.zzaGo.entrySet().iterator();
      while (true)
        if (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          zzbe localzzbe = (zzbe)localEntry.getValue();
          if (localzzbe == null)
            continue;
          localzzbe.clear();
          boolean bool = paramzzbd.isConnected();
          if (!bool)
            continue;
          try
          {
            ((zzai)paramzzbd.zzjb()).zza(localzzh, new zzau(localzzbe));
            if (Log.isLoggable("WearableClient", 2))
              Log.d("WearableClient", "disconnect: removed: " + localEntry.getKey() + "/" + localzzbe);
          }
          catch (RemoteException localRemoteException)
          {
            Log.w("WearableClient", "disconnect: Didn't remove: " + localEntry.getKey() + "/" + localzzbe);
          }
        }
    }
    this.zzaGo.clear();
  }

  public void zzcS(IBinder paramIBinder)
  {
    synchronized (this.zzaGo)
    {
      zzai localzzai = zzai.zza.zzcR(paramIBinder);
      zzbc.zzh localzzh = new zzbc.zzh();
      Iterator localIterator = this.zzaGo.entrySet().iterator();
      while (true)
        if (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          zzbe localzzbe = (zzbe)localEntry.getValue();
          try
          {
            localzzai.zza(localzzh, new zzb(localzzbe));
            if (Log.isLoggable("WearableClient", 2))
              Log.d("WearableClient", "onPostInitHandler: added: " + localEntry.getKey() + "/" + localzzbe);
          }
          catch (RemoteException localRemoteException)
          {
            Log.d("WearableClient", "onPostInitHandler: Didn't add: " + localEntry.getKey() + "/" + localzzbe);
          }
        }
    }
  }

  private static class zza<T> extends zzbc.zza<Status>
  {
    private WeakReference<Map<T, zzbe>> zzaGp;
    private WeakReference<T> zzaGq;

    zza(Map<T, zzbe> paramMap, T paramT, zza.zzb<Status> paramzzb)
    {
      super();
      this.zzaGp = new WeakReference(paramMap);
      this.zzaGq = new WeakReference(paramT);
    }

    public void zza(Status paramStatus)
    {
      Map localMap = (Map)this.zzaGp.get();
      Object localObject1 = this.zzaGq.get();
      if ((!paramStatus.getStatus().isSuccess()) && (localMap != null) && (localObject1 != null));
      try
      {
        zzbe localzzbe = (zzbe)localMap.remove(localObject1);
        if (localzzbe != null)
          localzzbe.clear();
        zzE(paramStatus);
        return;
      }
      finally
      {
      }
    }
  }

  static final class zzb extends zzaj<zza.zza>
  {
    zzbe zza(zza.zza paramzza, IntentFilter[] paramArrayOfIntentFilter)
    {
      return zzbe.zza(paramzza);
    }
  }

  static final class zzc extends zzaj<DataApi.DataListener>
  {
    zzbe zza(DataApi.DataListener paramDataListener, IntentFilter[] paramArrayOfIntentFilter)
    {
      return zzbe.zzb(paramDataListener, paramArrayOfIntentFilter);
    }
  }

  static final class zzd extends zzaj<MessageApi.MessageListener>
  {
    zzbe zza(MessageApi.MessageListener paramMessageListener, IntentFilter[] paramArrayOfIntentFilter)
    {
      return zzbe.zzb(paramMessageListener, paramArrayOfIntentFilter);
    }
  }

  static final class zze extends zzaj<NodeApi.NodeListener>
  {
    zzbe zza(NodeApi.NodeListener paramNodeListener, IntentFilter[] paramArrayOfIntentFilter)
    {
      return zzbe.zza(paramNodeListener);
    }
  }

  private static class zzf<T> extends zzbc.zza<Status>
  {
    private WeakReference<Map<T, zzbe>> zzaGp;
    private WeakReference<T> zzaGq;

    zzf(Map<T, zzbe> paramMap, T paramT, zza.zzb<Status> paramzzb)
    {
      super();
      this.zzaGp = new WeakReference(paramMap);
      this.zzaGq = new WeakReference(paramT);
    }

    public void zza(Status paramStatus)
    {
      Map localMap = (Map)this.zzaGp.get();
      Object localObject1 = this.zzaGq.get();
      if ((paramStatus.getStatus().getStatusCode() == 4002) && (localMap != null) && (localObject1 != null));
      try
      {
        zzbe localzzbe = (zzbe)localMap.remove(localObject1);
        if (localzzbe != null)
          localzzbe.clear();
        zzE(paramStatus);
        return;
      }
      finally
      {
      }
    }
  }
}