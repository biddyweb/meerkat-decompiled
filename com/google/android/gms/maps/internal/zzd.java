package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.internal.zzl;
import com.google.android.gms.maps.model.internal.zzl.zza;

public abstract interface zzd extends IInterface
{
  public abstract com.google.android.gms.dynamic.zzd zzf(zzl paramzzl)
    throws RemoteException;

  public abstract com.google.android.gms.dynamic.zzd zzg(zzl paramzzl)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzd
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.maps.internal.IInfoWindowAdapter");
    }

    public static zzd zzbv(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
      if ((localIInterface != null) && ((localIInterface instanceof zzd)))
        return (zzd)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IInfoWindowAdapter");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
        com.google.android.gms.dynamic.zzd localzzd2 = zzf(zzl.zza.zzcb(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        IBinder localIBinder2 = null;
        if (localzzd2 != null)
          localIBinder2 = localzzd2.asBinder();
        paramParcel2.writeStrongBinder(localIBinder2);
        return true;
      case 2:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowAdapter");
      com.google.android.gms.dynamic.zzd localzzd1 = zzg(zzl.zza.zzcb(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      IBinder localIBinder1 = null;
      if (localzzd1 != null)
        localIBinder1 = localzzd1.asBinder();
      paramParcel2.writeStrongBinder(localIBinder1);
      return true;
    }

    private static class zza
      implements zzd
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

      public com.google.android.gms.dynamic.zzd zzf(zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
          if (paramzzl != null);
          for (IBinder localIBinder = paramzzl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            com.google.android.gms.dynamic.zzd localzzd = com.google.android.gms.dynamic.zzd.zza.zzau(localParcel2.readStrongBinder());
            return localzzd;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public com.google.android.gms.dynamic.zzd zzg(zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IInfoWindowAdapter");
          if (paramzzl != null);
          for (IBinder localIBinder = paramzzl.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(2, localParcel1, localParcel2, 0);
            localParcel2.readException();
            com.google.android.gms.dynamic.zzd localzzd = com.google.android.gms.dynamic.zzd.zza.zzau(localParcel2.readStrongBinder());
            return localzzd;
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