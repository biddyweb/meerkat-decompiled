package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.internal.zzl;
import com.google.android.gms.maps.model.internal.zzl.zza;

public abstract interface zzn extends IInterface
{
  public abstract boolean zza(zzl paramzzl)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzn
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.maps.internal.IOnMarkerClickListener");
    }

    public static zzn zzbI(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IOnMarkerClickListener");
      if ((localIInterface != null) && ((localIInterface instanceof zzn)))
        return (zzn)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IOnMarkerClickListener");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IOnMarkerClickListener");
      boolean bool = zza(zzl.zza.zzcb(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      if (bool);
      for (int i = 1; ; i = 0)
      {
        paramParcel2.writeInt(i);
        return true;
      }
    }

    private static class zza
      implements zzn
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

      public boolean zza(zzl paramzzl)
        throws RemoteException
      {
        boolean bool = true;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IOnMarkerClickListener");
          IBinder localIBinder;
          if (paramzzl != null)
          {
            localIBinder = paramzzl.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            int i = localParcel2.readInt();
            if (i == 0)
              break label84;
          }
          while (true)
          {
            return bool;
            localIBinder = null;
            break;
            label84: bool = false;
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