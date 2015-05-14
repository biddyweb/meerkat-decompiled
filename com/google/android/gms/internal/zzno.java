package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.request.DataSourcesRequest;
import com.google.android.gms.fitness.request.zzac;
import com.google.android.gms.fitness.request.zzae;

public abstract interface zzno extends IInterface
{
  public abstract void zza(DataSourcesRequest paramDataSourcesRequest)
    throws RemoteException;

  public abstract void zza(zzac paramzzac)
    throws RemoteException;

  public abstract void zza(zzae paramzzae)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzno
  {
    public static zzno zzaL(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
      if ((localIInterface != null) && ((localIInterface instanceof zzno)))
        return (zzno)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
        int k = paramParcel1.readInt();
        DataSourcesRequest localDataSourcesRequest = null;
        if (k != 0)
          localDataSourcesRequest = (DataSourcesRequest)DataSourcesRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localDataSourcesRequest);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
        int j = paramParcel1.readInt();
        zzac localzzac = null;
        if (j != 0)
          localzzac = (zzac)zzac.CREATOR.createFromParcel(paramParcel1);
        zza(localzzac);
        return true;
      case 3:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
      int i = paramParcel1.readInt();
      zzae localzzae = null;
      if (i != 0)
        localzzae = (zzae)zzae.CREATOR.createFromParcel(paramParcel1);
      zza(localzzae);
      return true;
    }

    private static class zza
      implements zzno
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

      public void zza(DataSourcesRequest paramDataSourcesRequest)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
          if (paramDataSourcesRequest != null)
          {
            localParcel.writeInt(1);
            paramDataSourcesRequest.writeToParcel(localParcel, 0);
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

      public void zza(zzac paramzzac)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
          if (paramzzac != null)
          {
            localParcel.writeInt(1);
            paramzzac.writeToParcel(localParcel, 0);
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

      public void zza(zzae paramzzae)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitSensorsApi");
          if (paramzzae != null)
          {
            localParcel.writeInt(1);
            paramzzae.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel, null, 1);
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