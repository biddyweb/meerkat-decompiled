package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface zzul extends IInterface
{
  public abstract void zza(zzuk paramzzuk)
    throws RemoteException;

  public abstract void zza(zzuk paramzzuk, byte[] paramArrayOfByte)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzul
  {
    public static zzul zzcC(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
      if ((localIInterface != null) && ((localIInterface instanceof zzul)))
        return (zzul)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.safetynet.internal.ISafetyNetService");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
        zza(zzuk.zza.zzcB(paramParcel1.readStrongBinder()), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.safetynet.internal.ISafetyNetService");
      zza(zzuk.zza.zzcB(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzul
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

      public void zza(zzuk paramzzuk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
          if (paramzzuk != null);
          for (IBinder localIBinder = paramzzuk.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(2, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzuk paramzzuk, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.safetynet.internal.ISafetyNetService");
          if (paramzzuk != null);
          for (IBinder localIBinder = paramzzuk.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeByteArray(paramArrayOfByte);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
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