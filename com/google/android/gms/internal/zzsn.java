package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface zzsn extends IInterface
{
  public abstract void zza(zzsp paramzzsp)
    throws RemoteException;

  public abstract void zza(zzss paramzzss)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzsn
  {
    public static zzsn zzcp(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.nearby.sharing.internal.INearbySharingService");
      if ((localIInterface != null) && ((localIInterface instanceof zzsn)))
        return (zzsn)localIInterface;
      return new zza(paramIBinder);
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.nearby.sharing.internal.INearbySharingService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.sharing.internal.INearbySharingService");
        int j = paramParcel1.readInt();
        zzsp localzzsp = null;
        if (j != 0)
          localzzsp = (zzsp)zzsp.CREATOR.createFromParcel(paramParcel1);
        zza(localzzsp);
        return true;
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.nearby.sharing.internal.INearbySharingService");
      int i = paramParcel1.readInt();
      zzss localzzss = null;
      if (i != 0)
        localzzss = (zzss)zzss.CREATOR.createFromParcel(paramParcel1);
      zza(localzzss);
      return true;
    }

    private static class zza
      implements zzsn
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

      public void zza(zzsp paramzzsp)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.nearby.sharing.internal.INearbySharingService");
          if (paramzzsp != null)
          {
            localParcel.writeInt(1);
            paramzzsp.writeToParcel(localParcel, 0);
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

      public void zza(zzss paramzzss)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.nearby.sharing.internal.INearbySharingService");
          if (paramzzss != null)
          {
            localParcel.writeInt(1);
            paramzzss.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel, null, 1);
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