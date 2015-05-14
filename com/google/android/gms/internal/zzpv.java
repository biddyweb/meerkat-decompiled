package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;

public abstract interface zzpv extends IInterface
{
  public abstract void zzX(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzY(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzZ(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzaa(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzay(Status paramStatus)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzpv
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.location.places.internal.IPlacesCallbacks");
    }

    public static zzpv zzbp(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzpv)))
        return (zzpv)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.location.places.internal.IPlacesCallbacks");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
        int n = paramParcel1.readInt();
        DataHolder localDataHolder4 = null;
        if (n != 0)
          localDataHolder4 = DataHolder.CREATOR.zzA(paramParcel1);
        zzX(localDataHolder4);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
        int m = paramParcel1.readInt();
        DataHolder localDataHolder3 = null;
        if (m != 0)
          localDataHolder3 = DataHolder.CREATOR.zzA(paramParcel1);
        zzY(localDataHolder3);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
        int k = paramParcel1.readInt();
        DataHolder localDataHolder2 = null;
        if (k != 0)
          localDataHolder2 = DataHolder.CREATOR.zzA(paramParcel1);
        zzZ(localDataHolder2);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
        int j = paramParcel1.readInt();
        Status localStatus = null;
        if (j != 0)
          localStatus = Status.CREATOR.createFromParcel(paramParcel1);
        zzay(localStatus);
        return true;
      case 5:
      }
      paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IPlacesCallbacks");
      int i = paramParcel1.readInt();
      DataHolder localDataHolder1 = null;
      if (i != 0)
        localDataHolder1 = DataHolder.CREATOR.zzA(paramParcel1);
      zzaa(localDataHolder1);
      return true;
    }

    private static class zza
      implements zzpv
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

      public void zzX(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IPlacesCallbacks");
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

      public void zzY(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IPlacesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel.writeInt(1);
            paramDataHolder.writeToParcel(localParcel, 0);
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

      public void zzZ(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IPlacesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel.writeInt(1);
            paramDataHolder.writeToParcel(localParcel, 0);
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

      public void zzaa(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IPlacesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel.writeInt(1);
            paramDataHolder.writeToParcel(localParcel, 0);
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

      public void zzay(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IPlacesCallbacks");
          if (paramStatus != null)
          {
            localParcel.writeInt(1);
            paramStatus.writeToParcel(localParcel, 0);
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