package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.request.DataDeleteRequest;
import com.google.android.gms.fitness.request.DataReadRequest;
import com.google.android.gms.fitness.request.zzaa;
import com.google.android.gms.fitness.request.zze;
import com.google.android.gms.fitness.request.zzr;
import com.google.android.gms.fitness.request.zzy;

public abstract interface zznl extends IInterface
{
  public abstract void zza(DataDeleteRequest paramDataDeleteRequest)
    throws RemoteException;

  public abstract void zza(DataReadRequest paramDataReadRequest)
    throws RemoteException;

  public abstract void zza(zzaa paramzzaa)
    throws RemoteException;

  public abstract void zza(zze paramzze)
    throws RemoteException;

  public abstract void zza(zzr paramzzr)
    throws RemoteException;

  public abstract void zza(zzy paramzzy)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zznl
  {
    public static zznl zzaI(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
      if ((localIInterface != null) && ((localIInterface instanceof zznl)))
        return (zznl)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
        int i1 = paramParcel1.readInt();
        DataReadRequest localDataReadRequest = null;
        if (i1 != 0)
          localDataReadRequest = (DataReadRequest)DataReadRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localDataReadRequest);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
        int n = paramParcel1.readInt();
        zze localzze = null;
        if (n != 0)
          localzze = (zze)zze.CREATOR.createFromParcel(paramParcel1);
        zza(localzze);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
        int m = paramParcel1.readInt();
        DataDeleteRequest localDataDeleteRequest = null;
        if (m != 0)
          localDataDeleteRequest = (DataDeleteRequest)DataDeleteRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localDataDeleteRequest);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
        int k = paramParcel1.readInt();
        zzr localzzr = null;
        if (k != 0)
          localzzr = (zzr)zzr.CREATOR.createFromParcel(paramParcel1);
        zza(localzzr);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
        int j = paramParcel1.readInt();
        zzaa localzzaa = null;
        if (j != 0)
          localzzaa = (zzaa)zzaa.CREATOR.createFromParcel(paramParcel1);
        zza(localzzaa);
        return true;
      case 6:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
      int i = paramParcel1.readInt();
      zzy localzzy = null;
      if (i != 0)
        localzzy = (zzy)zzy.CREATOR.createFromParcel(paramParcel1);
      zza(localzzy);
      return true;
    }

    private static class zza
      implements zznl
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

      public void zza(DataDeleteRequest paramDataDeleteRequest)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
          if (paramDataDeleteRequest != null)
          {
            localParcel.writeInt(1);
            paramDataDeleteRequest.writeToParcel(localParcel, 0);
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

      public void zza(DataReadRequest paramDataReadRequest)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
          if (paramDataReadRequest != null)
          {
            localParcel.writeInt(1);
            paramDataReadRequest.writeToParcel(localParcel, 0);
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

      public void zza(zzaa paramzzaa)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
          if (paramzzaa != null)
          {
            localParcel.writeInt(1);
            paramzzaa.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(5, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zze paramzze)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
          if (paramzze != null)
          {
            localParcel.writeInt(1);
            paramzze.writeToParcel(localParcel, 0);
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

      public void zza(zzr paramzzr)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
          if (paramzzr != null)
          {
            localParcel.writeInt(1);
            paramzzr.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(4, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(zzy paramzzy)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitHistoryApi");
          if (paramzzy != null)
          {
            localParcel.writeInt(1);
            paramzzy.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(6, localParcel, null, 1);
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