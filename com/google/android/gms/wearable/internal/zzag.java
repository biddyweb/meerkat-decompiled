package com.google.android.gms.wearable.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;

public abstract interface zzag extends IInterface
{
  public abstract void zza(Status paramStatus)
    throws RemoteException;

  public abstract void zza(zzaa paramzzaa)
    throws RemoteException;

  public abstract void zza(zzac paramzzac)
    throws RemoteException;

  public abstract void zza(zzae paramzzae)
    throws RemoteException;

  public abstract void zza(zzas paramzzas)
    throws RemoteException;

  public abstract void zza(zzaw paramzzaw)
    throws RemoteException;

  public abstract void zza(zzaz paramzzaz)
    throws RemoteException;

  public abstract void zza(zzs paramzzs)
    throws RemoteException;

  public abstract void zza(zzu paramzzu)
    throws RemoteException;

  public abstract void zza(zzw paramzzw)
    throws RemoteException;

  public abstract void zza(zzy paramzzy)
    throws RemoteException;

  public abstract void zzac(DataHolder paramDataHolder)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzag
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.wearable.internal.IWearableCallbacks");
    }

    public static zzag zzcP(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzag)))
        return (zzag)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.wearable.internal.IWearableCallbacks");
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int i7 = paramParcel1.readInt();
        zzu localzzu = null;
        if (i7 != 0)
          localzzu = (zzu)zzu.CREATOR.createFromParcel(paramParcel1);
        zza(localzzu);
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int i6 = paramParcel1.readInt();
        zzw localzzw = null;
        if (i6 != 0)
          localzzw = (zzw)zzw.CREATOR.createFromParcel(paramParcel1);
        zza(localzzw);
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int i5 = paramParcel1.readInt();
        zzas localzzas = null;
        if (i5 != 0)
          localzzas = (zzas)zzas.CREATOR.createFromParcel(paramParcel1);
        zza(localzzas);
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int i4 = paramParcel1.readInt();
        zzaa localzzaa = null;
        if (i4 != 0)
          localzzaa = (zzaa)zzaa.CREATOR.createFromParcel(paramParcel1);
        zza(localzzaa);
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int i3 = paramParcel1.readInt();
        DataHolder localDataHolder = null;
        if (i3 != 0)
          localDataHolder = DataHolder.CREATOR.zzA(paramParcel1);
        zzac(localDataHolder);
        paramParcel2.writeNoException();
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int i2 = paramParcel1.readInt();
        zzs localzzs = null;
        if (i2 != 0)
          localzzs = (zzs)zzs.CREATOR.createFromParcel(paramParcel1);
        zza(localzzs);
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int i1 = paramParcel1.readInt();
        zzaw localzzaw = null;
        if (i1 != 0)
          localzzaw = (zzaw)zzaw.CREATOR.createFromParcel(paramParcel1);
        zza(localzzaw);
        paramParcel2.writeNoException();
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int n = paramParcel1.readInt();
        zzac localzzac = null;
        if (n != 0)
          localzzac = (zzac)zzac.CREATOR.createFromParcel(paramParcel1);
        zza(localzzac);
        paramParcel2.writeNoException();
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int m = paramParcel1.readInt();
        zzae localzzae = null;
        if (m != 0)
          localzzae = (zzae)zzae.CREATOR.createFromParcel(paramParcel1);
        zza(localzzae);
        paramParcel2.writeNoException();
        return true;
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int k = paramParcel1.readInt();
        zzy localzzy = null;
        if (k != 0)
          localzzy = (zzy)zzy.CREATOR.createFromParcel(paramParcel1);
        zza(localzzy);
        paramParcel2.writeNoException();
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
        int j = paramParcel1.readInt();
        Status localStatus = null;
        if (j != 0)
          localStatus = Status.CREATOR.createFromParcel(paramParcel1);
        zza(localStatus);
        paramParcel2.writeNoException();
        return true;
      case 12:
      }
      paramParcel1.enforceInterface("com.google.android.gms.wearable.internal.IWearableCallbacks");
      int i = paramParcel1.readInt();
      zzaz localzzaz = null;
      if (i != 0)
        localzzaz = (zzaz)zzaz.CREATOR.createFromParcel(paramParcel1);
      zza(localzzaz);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzag
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

      public void zza(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramStatus != null)
          {
            localParcel1.writeInt(1);
            paramStatus.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(11, localParcel1, localParcel2, 0);
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

      public void zza(zzaa paramzzaa)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzaa != null)
          {
            localParcel1.writeInt(1);
            paramzzaa.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(4, localParcel1, localParcel2, 0);
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

      public void zza(zzac paramzzac)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzac != null)
          {
            localParcel1.writeInt(1);
            paramzzac.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8, localParcel1, localParcel2, 0);
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

      public void zza(zzae paramzzae)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzae != null)
          {
            localParcel1.writeInt(1);
            paramzzae.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(9, localParcel1, localParcel2, 0);
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

      public void zza(zzas paramzzas)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzas != null)
          {
            localParcel1.writeInt(1);
            paramzzas.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(3, localParcel1, localParcel2, 0);
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

      public void zza(zzaw paramzzaw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzaw != null)
          {
            localParcel1.writeInt(1);
            paramzzaw.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(7, localParcel1, localParcel2, 0);
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

      public void zza(zzaz paramzzaz)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzaz != null)
          {
            localParcel1.writeInt(1);
            paramzzaz.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12, localParcel1, localParcel2, 0);
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

      public void zza(zzs paramzzs)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzs != null)
          {
            localParcel1.writeInt(1);
            paramzzs.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(6, localParcel1, localParcel2, 0);
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

      public void zza(zzu paramzzu)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzu != null)
          {
            localParcel1.writeInt(1);
            paramzzu.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel1, localParcel2, 0);
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

      public void zza(zzw paramzzw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzw != null)
          {
            localParcel1.writeInt(1);
            paramzzw.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(13, localParcel1, localParcel2, 0);
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

      public void zza(zzy paramzzy)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramzzy != null)
          {
            localParcel1.writeInt(1);
            paramzzy.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10, localParcel1, localParcel2, 0);
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

      public void zzac(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.wearable.internal.IWearableCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5, localParcel1, localParcel2, 0);
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