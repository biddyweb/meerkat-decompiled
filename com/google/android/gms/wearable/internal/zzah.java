package com.google.android.gms.wearable.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;

public abstract interface zzah extends IInterface
{
  public abstract void zza(zzal paramzzal)
    throws RemoteException;

  public abstract void zza(zzao paramzzao)
    throws RemoteException;

  public abstract void zza(zze paramzze)
    throws RemoteException;

  public abstract void zzab(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzb(zzao paramzzao)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzah
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.wearable.internal.IWearableListener");
    }

    public static zzah zzcQ(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.wearable.internal.IWearableListener");
      if ((localIInterface != null) && ((localIInterface instanceof zzah)))
        return (zzah)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.wearable.internal.IWearableListener");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableListener");
        int n = paramParcel1.readInt();
        DataHolder localDataHolder = null;
        if (n != 0)
          localDataHolder = DataHolder.CREATOR.zzA(paramParcel1);
        zzab(localDataHolder);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableListener");
        int m = paramParcel1.readInt();
        zzal localzzal = null;
        if (m != 0)
          localzzal = (zzal)zzal.CREATOR.createFromParcel(paramParcel1);
        zza(localzzal);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableListener");
        int k = paramParcel1.readInt();
        zzao localzzao2 = null;
        if (k != 0)
          localzzao2 = (zzao)zzao.CREATOR.createFromParcel(paramParcel1);
        zza(localzzao2);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableListener");
        int j = paramParcel1.readInt();
        zzao localzzao1 = null;
        if (j != 0)
          localzzao1 = (zzao)zzao.CREATOR.createFromParcel(paramParcel1);
        zzb(localzzao1);
        return true;
      case 5:
      }
      paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableListener");
      int i = paramParcel1.readInt();
      zze localzze = null;
      if (i != 0)
        localzze = (zze)zze.CREATOR.createFromParcel(paramParcel1);
      zza(localzze);
      return true;
    }

    private static class zza
      implements zzah
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

      public void zza(zzal paramzzal)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableListener");
          if (paramzzal != null)
          {
            localParcel.writeInt(1);
            paramzzal.writeToParcel(localParcel, 0);
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

      public void zza(zzao paramzzao)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableListener");
          if (paramzzao != null)
          {
            localParcel.writeInt(1);
            paramzzao.writeToParcel(localParcel, 0);
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

      public void zza(zze paramzze)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableListener");
          if (paramzze != null)
          {
            localParcel.writeInt(1);
            paramzze.writeToParcel(localParcel, 0);
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

      public void zzab(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableListener");
          if (paramDataHolder != null)
          {
            localParcel.writeInt(1);
            paramDataHolder.writeToParcel(localParcel, 0);
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

      public void zzb(zzao paramzzao)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableListener");
          if (paramzzao != null)
          {
            localParcel.writeInt(1);
            paramzzao.writeToParcel(localParcel, 0);
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
    }
  }
}