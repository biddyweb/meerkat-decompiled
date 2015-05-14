package com.google.android.gms.fitness.data;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface zzk extends IInterface
{
  public abstract void zzc(DataPoint paramDataPoint)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzk
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.fitness.data.IDataSourceListener");
    }

    public static zzk zzav(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.data.IDataSourceListener");
      if ((localIInterface != null) && ((localIInterface instanceof zzk)))
        return (zzk)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.data.IDataSourceListener");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.data.IDataSourceListener");
      if (paramParcel1.readInt() != 0);
      for (DataPoint localDataPoint = (DataPoint)DataPoint.CREATOR.createFromParcel(paramParcel1); ; localDataPoint = null)
      {
        zzc(localDataPoint);
        return true;
      }
    }

    private static class zza
      implements zzk
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

      public void zzc(DataPoint paramDataPoint)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.data.IDataSourceListener");
          if (paramDataPoint != null)
          {
            localParcel.writeInt(1);
            paramDataPoint.writeToParcel(localParcel, 0);
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