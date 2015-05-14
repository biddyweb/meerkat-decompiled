package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zzrt extends IInterface
{
  public abstract void zza(zzrw paramzzrw)
    throws RemoteException;

  public abstract void zzb(zzrw paramzzrw)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzrt
  {
    public static zzrt zzcj(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.nearby.messages.internal.IMessageListener");
      if ((localIInterface != null) && ((localIInterface instanceof zzrt)))
        return (zzrt)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.nearby.messages.internal.IMessageListener");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.messages.internal.IMessageListener");
        int j = paramParcel1.readInt();
        zzrw localzzrw2 = null;
        if (j != 0)
          localzzrw2 = zzrw.CREATOR.zzen(paramParcel1);
        zza(localzzrw2);
        paramParcel2.writeNoException();
        return true;
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.nearby.messages.internal.IMessageListener");
      int i = paramParcel1.readInt();
      zzrw localzzrw1 = null;
      if (i != 0)
        localzzrw1 = zzrw.CREATOR.zzen(paramParcel1);
      zzb(localzzrw1);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzrt
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

      public void zza(zzrw paramzzrw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.messages.internal.IMessageListener");
          if (paramzzrw != null)
          {
            localParcel1.writeInt(1);
            paramzzrw.writeToParcel(localParcel1, 0);
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

      public void zzb(zzrw paramzzrw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.messages.internal.IMessageListener");
          if (paramzzrw != null)
          {
            localParcel1.writeInt(1);
            paramzzrw.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel1, localParcel2, 0);
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