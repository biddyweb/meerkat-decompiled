package com.google.android.gms.location;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zze extends IInterface
{
  public abstract void zza(zzh paramzzh)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zze
  {
    public static zze zzbh(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.location.ILocationResultListener");
      if ((localIInterface != null) && ((localIInterface instanceof zze)))
        return (zze)localIInterface;
      return new zza(paramIBinder);
    }

    public IBinder asBinder()
    {
      return this;
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.location.ILocationResultListener");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.location.ILocationResultListener");
      if (paramParcel1.readInt() != 0);
      for (zzh localzzh = zzh.CREATOR.zzdq(paramParcel1); ; localzzh = null)
      {
        zza(localzzh);
        return true;
      }
    }

    private static class zza
      implements zze
    {
      private IBinder zzle;

      zza(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void zza(zzh paramzzh)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.ILocationResultListener");
          if (paramzzh != null)
          {
            localParcel.writeInt(1);
            paramzzh.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(1, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}