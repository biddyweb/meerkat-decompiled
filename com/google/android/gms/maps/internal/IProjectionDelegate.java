package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.VisibleRegion;
import com.google.android.gms.maps.model.zzi;

public abstract interface IProjectionDelegate extends IInterface
{
  public abstract LatLng fromScreenLocation(zzd paramzzd)
    throws RemoteException;

  public abstract LatLng fromScreenLocation2(zzy paramzzy)
    throws RemoteException;

  public abstract VisibleRegion getVisibleRegion()
    throws RemoteException;

  public abstract zzd toScreenLocation(LatLng paramLatLng)
    throws RemoteException;

  public abstract zzy toScreenLocation2(LatLng paramLatLng)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements IProjectionDelegate
  {
    public static IProjectionDelegate zzbQ(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof IProjectionDelegate)))
        return (IProjectionDelegate)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IProjectionDelegate");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
        LatLng localLatLng4 = fromScreenLocation(zzd.zza.zzau(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        if (localLatLng4 != null)
        {
          paramParcel2.writeInt(1);
          localLatLng4.writeToParcel(paramParcel2, 1);
        }
        while (true)
        {
          return true;
          paramParcel2.writeInt(0);
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
        if (paramParcel1.readInt() != 0);
        for (LatLng localLatLng3 = LatLng.CREATOR.zzdW(paramParcel1); ; localLatLng3 = null)
        {
          zzd localzzd = toScreenLocation(localLatLng3);
          paramParcel2.writeNoException();
          IBinder localIBinder = null;
          if (localzzd != null)
            localIBinder = localzzd.asBinder();
          paramParcel2.writeStrongBinder(localIBinder);
          return true;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
        VisibleRegion localVisibleRegion = getVisibleRegion();
        paramParcel2.writeNoException();
        if (localVisibleRegion != null)
        {
          paramParcel2.writeInt(1);
          localVisibleRegion.writeToParcel(paramParcel2, 1);
        }
        while (true)
        {
          return true;
          paramParcel2.writeInt(0);
        }
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
        int j = paramParcel1.readInt();
        zzy localzzy2 = null;
        if (j != 0)
          localzzy2 = zzy.CREATOR.zzdR(paramParcel1);
        LatLng localLatLng2 = fromScreenLocation2(localzzy2);
        paramParcel2.writeNoException();
        if (localLatLng2 != null)
        {
          paramParcel2.writeInt(1);
          localLatLng2.writeToParcel(paramParcel2, 1);
        }
        while (true)
        {
          return true;
          paramParcel2.writeInt(0);
        }
      case 5:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IProjectionDelegate");
      int i = paramParcel1.readInt();
      LatLng localLatLng1 = null;
      if (i != 0)
        localLatLng1 = LatLng.CREATOR.zzdW(paramParcel1);
      zzy localzzy1 = toScreenLocation2(localLatLng1);
      paramParcel2.writeNoException();
      if (localzzy1 != null)
      {
        paramParcel2.writeInt(1);
        localzzy1.writeToParcel(paramParcel2, 1);
      }
      while (true)
      {
        return true;
        paramParcel2.writeInt(0);
      }
    }

    private static class zza
      implements IProjectionDelegate
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

      public LatLng fromScreenLocation(zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IProjectionDelegate");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            int i = localParcel2.readInt();
            Object localObject2 = null;
            if (i != 0)
            {
              LatLng localLatLng = LatLng.CREATOR.zzdW(localParcel2);
              localObject2 = localLatLng;
            }
            return localObject2;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public LatLng fromScreenLocation2(zzy paramzzy)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IProjectionDelegate");
            if (paramzzy != null)
            {
              localParcel1.writeInt(1);
              paramzzy.writeToParcel(localParcel1, 0);
              this.zzle.transact(4, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                LatLng localLatLng2 = LatLng.CREATOR.zzdW(localParcel2);
                localLatLng1 = localLatLng2;
                return localLatLng1;
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          LatLng localLatLng1 = null;
        }
      }

      public VisibleRegion getVisibleRegion()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IProjectionDelegate");
          this.zzle.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            VisibleRegion localVisibleRegion2 = VisibleRegion.CREATOR.zzeg(localParcel2);
            localVisibleRegion1 = localVisibleRegion2;
            return localVisibleRegion1;
          }
          VisibleRegion localVisibleRegion1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd toScreenLocation(LatLng paramLatLng)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IProjectionDelegate");
          if (paramLatLng != null)
          {
            localParcel1.writeInt(1);
            paramLatLng.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(2, localParcel1, localParcel2, 0);
            localParcel2.readException();
            zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
            return localzzd;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzy toScreenLocation2(LatLng paramLatLng)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IProjectionDelegate");
            if (paramLatLng != null)
            {
              localParcel1.writeInt(1);
              paramLatLng.writeToParcel(localParcel1, 0);
              this.zzle.transact(5, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                zzy localzzy2 = zzy.CREATOR.zzdR(localParcel2);
                localzzy1 = localzzy2;
                return localzzy1;
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          zzy localzzy1 = null;
        }
      }
    }
  }
}