package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.result.DataSourcesResult;

public abstract interface zznh extends IInterface
{
  public abstract void zza(DataSourcesResult paramDataSourcesResult)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zznh
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.fitness.internal.IDataSourcesCallback");
    }

    public static zznh zzaE(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IDataSourcesCallback");
      if ((localIInterface != null) && ((localIInterface instanceof zznh)))
        return (zznh)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IDataSourcesCallback");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IDataSourcesCallback");
      if (paramParcel1.readInt() != 0);
      for (DataSourcesResult localDataSourcesResult = (DataSourcesResult)DataSourcesResult.CREATOR.createFromParcel(paramParcel1); ; localDataSourcesResult = null)
      {
        zza(localDataSourcesResult);
        paramParcel2.writeNoException();
        return true;
      }
    }

    private static class zza
      implements zznh
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

      public void zza(DataSourcesResult paramDataSourcesResult)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.fitness.internal.IDataSourcesCallback");
          if (paramDataSourcesResult != null)
          {
            localParcel1.writeInt(1);
            paramDataSourcesResult.writeToParcel(localParcel1, 0);
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