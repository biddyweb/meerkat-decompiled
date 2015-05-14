package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.request.DataTypeCreateRequest;
import com.google.android.gms.fitness.request.zzl;
import com.google.android.gms.fitness.request.zzp;

public abstract interface zznk extends IInterface
{
  public abstract void zza(DataTypeCreateRequest paramDataTypeCreateRequest)
    throws RemoteException;

  public abstract void zza(zzl paramzzl)
    throws RemoteException;

  public abstract void zza(zzp paramzzp)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zznk
  {
    public static zznk zzaH(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
      if ((localIInterface != null) && ((localIInterface instanceof zznk)))
        return (zznk)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
        int k = paramParcel1.readInt();
        DataTypeCreateRequest localDataTypeCreateRequest = null;
        if (k != 0)
          localDataTypeCreateRequest = (DataTypeCreateRequest)DataTypeCreateRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localDataTypeCreateRequest);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
        int j = paramParcel1.readInt();
        zzl localzzl = null;
        if (j != 0)
          localzzl = (zzl)zzl.CREATOR.createFromParcel(paramParcel1);
        zza(localzzl);
        return true;
      case 22:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
      int i = paramParcel1.readInt();
      zzp localzzp = null;
      if (i != 0)
        localzzp = (zzp)zzp.CREATOR.createFromParcel(paramParcel1);
      zza(localzzp);
      return true;
    }

    private static class zza
      implements zznk
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

      public void zza(DataTypeCreateRequest paramDataTypeCreateRequest)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
          if (paramDataTypeCreateRequest != null)
          {
            localParcel.writeInt(1);
            paramDataTypeCreateRequest.writeToParcel(localParcel, 0);
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

      public void zza(zzl paramzzl)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
          if (paramzzl != null)
          {
            localParcel.writeInt(1);
            paramzzl.writeToParcel(localParcel, 0);
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

      public void zza(zzp paramzzp)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitConfigApi");
          if (paramzzp != null)
          {
            localParcel.writeInt(1);
            paramzzp.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(22, localParcel, null, 1);
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