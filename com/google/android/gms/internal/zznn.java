package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.request.zzat;
import com.google.android.gms.fitness.request.zzax;
import com.google.android.gms.fitness.request.zzw;

public abstract interface zznn extends IInterface
{
  public abstract void zza(zzat paramzzat)
    throws RemoteException;

  public abstract void zza(zzax paramzzax)
    throws RemoteException;

  public abstract void zza(zzw paramzzw)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zznn
  {
    public static zznn zzaK(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
      if ((localIInterface != null) && ((localIInterface instanceof zznn)))
        return (zznn)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
        int k = paramParcel1.readInt();
        zzat localzzat = null;
        if (k != 0)
          localzzat = (zzat)zzat.CREATOR.createFromParcel(paramParcel1);
        zza(localzzat);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
        int j = paramParcel1.readInt();
        zzax localzzax = null;
        if (j != 0)
          localzzax = (zzax)zzax.CREATOR.createFromParcel(paramParcel1);
        zza(localzzax);
        return true;
      case 3:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
      int i = paramParcel1.readInt();
      zzw localzzw = null;
      if (i != 0)
        localzzw = (zzw)zzw.CREATOR.createFromParcel(paramParcel1);
      zza(localzzw);
      return true;
    }

    private static class zza
      implements zznn
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

      public void zza(zzat paramzzat)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
          if (paramzzat != null)
          {
            localParcel.writeInt(1);
            paramzzat.writeToParcel(localParcel, 0);
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

      public void zza(zzax paramzzax)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
          if (paramzzax != null)
          {
            localParcel.writeInt(1);
            paramzzax.writeToParcel(localParcel, 0);
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

      public void zza(zzw paramzzw)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IGoogleFitRecordingApi");
          if (paramzzw != null)
          {
            localParcel.writeInt(1);
            paramzzw.writeToParcel(localParcel, 0);
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