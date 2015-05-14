package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.request.zzn;

public abstract interface zznm extends IInterface
{
  public abstract void zza(zzn paramzzn)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zznm
  {
    public static zznm zzaJ(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IGoogleFitInternalApi");
      if ((localIInterface != null) && ((localIInterface instanceof zznm)))
        return (zznm)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IGoogleFitInternalApi");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitInternalApi");
      if (paramParcel1.readInt() != 0);
      for (zzn localzzn = (zzn)zzn.CREATOR.createFromParcel(paramParcel1); ; localzzn = null)
      {
        zza(localzzn);
        return true;
      }
    }

    private static class zza
      implements zznm
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

      public void zza(zzn paramzzn)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitInternalApi");
          if (paramzzn != null)
          {
            localParcel.writeInt(1);
            paramzzn.writeToParcel(localParcel, 0);
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