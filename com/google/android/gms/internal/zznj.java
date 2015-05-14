package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.request.StartBleScanRequest;
import com.google.android.gms.fitness.request.zzar;
import com.google.android.gms.fitness.request.zzav;
import com.google.android.gms.fitness.request.zzb;
import com.google.android.gms.fitness.request.zzu;

public abstract interface zznj extends IInterface
{
  public abstract void zza(StartBleScanRequest paramStartBleScanRequest)
    throws RemoteException;

  public abstract void zza(zzar paramzzar)
    throws RemoteException;

  public abstract void zza(zzav paramzzav)
    throws RemoteException;

  public abstract void zza(zzb paramzzb)
    throws RemoteException;

  public abstract void zza(zzu paramzzu)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zznj
  {
    public static zznj zzaG(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
      if ((localIInterface != null) && ((localIInterface instanceof zznj)))
        return (zznj)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
        int n = paramParcel1.readInt();
        StartBleScanRequest localStartBleScanRequest = null;
        if (n != 0)
          localStartBleScanRequest = (StartBleScanRequest)StartBleScanRequest.CREATOR.createFromParcel(paramParcel1);
        zza(localStartBleScanRequest);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
        int m = paramParcel1.readInt();
        zzar localzzar = null;
        if (m != 0)
          localzzar = (zzar)zzar.CREATOR.createFromParcel(paramParcel1);
        zza(localzzar);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
        int k = paramParcel1.readInt();
        zzb localzzb = null;
        if (k != 0)
          localzzb = (zzb)zzb.CREATOR.createFromParcel(paramParcel1);
        zza(localzzb);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
        int j = paramParcel1.readInt();
        zzav localzzav = null;
        if (j != 0)
          localzzav = (zzav)zzav.CREATOR.createFromParcel(paramParcel1);
        zza(localzzav);
        return true;
      case 5:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
      int i = paramParcel1.readInt();
      zzu localzzu = null;
      if (i != 0)
        localzzu = (zzu)zzu.CREATOR.createFromParcel(paramParcel1);
      zza(localzzu);
      return true;
    }

    private static class zza
      implements zznj
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

      public void zza(StartBleScanRequest paramStartBleScanRequest)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
          if (paramStartBleScanRequest != null)
          {
            localParcel.writeInt(1);
            paramStartBleScanRequest.writeToParcel(localParcel, 0);
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

      public void zza(zzar paramzzar)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
          if (paramzzar != null)
          {
            localParcel.writeInt(1);
            paramzzar.writeToParcel(localParcel, 0);
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

      public void zza(zzav paramzzav)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
          if (paramzzav != null)
          {
            localParcel.writeInt(1);
            paramzzav.writeToParcel(localParcel, 0);
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

      public void zza(zzb paramzzb)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
          if (paramzzb != null)
          {
            localParcel.writeInt(1);
            paramzzb.writeToParcel(localParcel, 0);
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

      public void zza(zzu paramzzu)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitBleApi");
          if (paramzzu != null)
          {
            localParcel.writeInt(1);
            paramzzu.writeToParcel(localParcel, 0);
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
    }
  }
}