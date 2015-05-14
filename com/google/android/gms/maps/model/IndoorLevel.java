package com.google.android.gms.maps.model;

import android.os.RemoteException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.maps.model.internal.zzk;

public final class IndoorLevel
{
  private final zzk zzarn;

  public IndoorLevel(zzk paramzzk)
  {
    this.zzarn = ((zzk)zzx.zzl(paramzzk));
  }

  public void activate()
  {
    try
    {
      this.zzarn.activate();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof IndoorLevel))
      return false;
    try
    {
      boolean bool = this.zzarn.zza(((IndoorLevel)paramObject).zzarn);
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getName()
  {
    try
    {
      String str = this.zzarn.getName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public String getShortName()
  {
    try
    {
      String str = this.zzarn.getShortName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }

  public int hashCode()
  {
    try
    {
      int i = this.zzarn.hashCodeRemote();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
}