package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;

public abstract interface zzsm extends IInterface
{
  public abstract void zzaG(Status paramStatus)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzsm
  {
    public static zzsm zzco(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.nearby.sharing.internal.INearbySharingCallback");
      if ((localIInterface != null) && ((localIInterface instanceof zzsm)))
        return (zzsm)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.nearby.sharing.internal.INearbySharingCallback");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.nearby.sharing.internal.INearbySharingCallback");
      if (paramParcel1.readInt() != 0);
      for (Status localStatus = Status.CREATOR.createFromParcel(paramParcel1); ; localStatus = null)
      {
        zzaG(localStatus);
        paramParcel2.writeNoException();
        return true;
      }
    }

    private static class zza
      implements zzsm
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

      public void zzaG(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.sharing.internal.INearbySharingCallback");
          if (paramStatus != null)
          {
            localParcel1.writeInt(1);
            paramStatus.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
  }
}