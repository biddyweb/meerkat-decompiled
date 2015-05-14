package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.fitness.result.DataReadResult;

public abstract interface zzng extends IInterface
{
  public abstract void zza(DataReadResult paramDataReadResult)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzng
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.fitness.internal.IDataReadCallback");
    }

    public static zzng zzaD(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.fitness.internal.IDataReadCallback");
      if ((localIInterface != null) && ((localIInterface instanceof zzng)))
        return (zzng)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.fitness.internal.IDataReadCallback");
        return true;
      case 1:
      }
      paramParcel1.enforceInterface("com.google.android.gms.fitness.internal.IDataReadCallback");
      if (paramParcel1.readInt() != 0);
      for (DataReadResult localDataReadResult = (DataReadResult)DataReadResult.CREATOR.createFromParcel(paramParcel1); ; localDataReadResult = null)
      {
        zza(localDataReadResult);
        return true;
      }
    }

    private static class zza
      implements zzng
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

      public void zza(DataReadResult paramDataReadResult)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.fitness.internal.IDataReadCallback");
          if (paramDataReadResult != null)
          {
            localParcel.writeInt(1);
            paramDataReadResult.writeToParcel(localParcel, 0);
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