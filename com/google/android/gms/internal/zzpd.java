package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.LocationSettingsResultCreator;

public abstract interface zzpd extends IInterface
{
  public abstract void zza(LocationSettingsResult paramLocationSettingsResult)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzpd
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.location.internal.ISettingsCallbacks");
    }

    public static zzpd zzbl(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.location.internal.ISettingsCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzpd)))
        return (zzpd)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.location.internal.ISettingsCallbacks");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.location.internal.ISettingsCallbacks");
      if (paramParcel1.readInt() != 0);
      for (LocationSettingsResult localLocationSettingsResult = LocationSettingsResult.CREATOR.createFromParcel(paramParcel1); ; localLocationSettingsResult = null)
      {
        zza(localLocationSettingsResult);
        paramParcel2.writeNoException();
        return true;
      }
    }

    private static class zza
      implements zzpd
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

      public void zza(LocationSettingsResult paramLocationSettingsResult)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.location.internal.ISettingsCallbacks");
          if (paramLocationSettingsResult != null)
          {
            localParcel1.writeInt(1);
            paramLocationSettingsResult.writeToParcel(localParcel1, 0);
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