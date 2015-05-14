package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.maps.model.internal.zzj;
import com.google.android.gms.maps.model.internal.zzk.zza;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class IndoorBuilding
{
  private final zzj zzarm;

  public IndoorBuilding(zzj paramzzj)
  {
    this.zzarm = ((zzj)zzx.zzl(paramzzj));
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof IndoorBuilding))
      return false;
    try
    {
      boolean bool = this.zzarm.zzb(((IndoorBuilding)paramObject).zzarm);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public int getActiveLevelIndex()
  {
    try
    {
      int i = this.zzarm.getActiveLevelIndex();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public int getDefaultLevelIndex()
  {
    try
    {
      int i = this.zzarm.getActiveLevelIndex();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public List<IndoorLevel> getLevels()
  {
    ArrayList localArrayList;
    try
    {
      List localList = this.zzarm.getLevels();
      localArrayList = new ArrayList(localList.size());
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
        localArrayList.add(new IndoorLevel(zzk.zza.zzca((IBinder)localIterator.next())));
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
    return localArrayList;
  }

  public int hashCode()
  {
    try
    {
      int i = this.zzarm.hashCodeRemote();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean isUnderground()
  {
    try
    {
      boolean bool = this.zzarm.isUnderground();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}