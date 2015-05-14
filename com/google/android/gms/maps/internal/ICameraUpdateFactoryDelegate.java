package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.zza;
import com.google.android.gms.maps.model.zzg;
import com.google.android.gms.maps.model.zzi;

public abstract interface ICameraUpdateFactoryDelegate extends IInterface
{
  public abstract zzd newCameraPosition(CameraPosition paramCameraPosition)
    throws RemoteException;

  public abstract zzd newLatLng(LatLng paramLatLng)
    throws RemoteException;

  public abstract zzd newLatLngBounds(LatLngBounds paramLatLngBounds, int paramInt)
    throws RemoteException;

  public abstract zzd newLatLngBoundsWithSize(LatLngBounds paramLatLngBounds, int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException;

  public abstract zzd newLatLngZoom(LatLng paramLatLng, float paramFloat)
    throws RemoteException;

  public abstract zzd scrollBy(float paramFloat1, float paramFloat2)
    throws RemoteException;

  public abstract zzd zoomBy(float paramFloat)
    throws RemoteException;

  public abstract zzd zoomByWithFocus(float paramFloat, int paramInt1, int paramInt2)
    throws RemoteException;

  public abstract zzd zoomIn()
    throws RemoteException;

  public abstract zzd zoomOut()
    throws RemoteException;

  public abstract zzd zoomTo(float paramFloat)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements ICameraUpdateFactoryDelegate
  {
    public static ICameraUpdateFactoryDelegate zzbr(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof ICameraUpdateFactoryDelegate)))
        return (ICameraUpdateFactoryDelegate)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        zzd localzzd11 = zoomIn();
        paramParcel2.writeNoException();
        IBinder localIBinder11 = null;
        if (localzzd11 != null)
          localIBinder11 = localzzd11.asBinder();
        paramParcel2.writeStrongBinder(localIBinder11);
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        zzd localzzd10 = zoomOut();
        paramParcel2.writeNoException();
        IBinder localIBinder10 = null;
        if (localzzd10 != null)
          localIBinder10 = localzzd10.asBinder();
        paramParcel2.writeStrongBinder(localIBinder10);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        zzd localzzd9 = scrollBy(paramParcel1.readFloat(), paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder9 = null;
        if (localzzd9 != null)
          localIBinder9 = localzzd9.asBinder();
        paramParcel2.writeStrongBinder(localIBinder9);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        zzd localzzd8 = zoomTo(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder8 = null;
        if (localzzd8 != null)
          localIBinder8 = localzzd8.asBinder();
        paramParcel2.writeStrongBinder(localIBinder8);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        zzd localzzd7 = zoomBy(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder7 = null;
        if (localzzd7 != null)
          localIBinder7 = localzzd7.asBinder();
        paramParcel2.writeStrongBinder(localIBinder7);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        zzd localzzd6 = zoomByWithFocus(paramParcel1.readFloat(), paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        IBinder localIBinder6 = null;
        if (localzzd6 != null)
          localIBinder6 = localzzd6.asBinder();
        paramParcel2.writeStrongBinder(localIBinder6);
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (CameraPosition localCameraPosition = CameraPosition.CREATOR.zzdS(paramParcel1); ; localCameraPosition = null)
        {
          zzd localzzd5 = newCameraPosition(localCameraPosition);
          paramParcel2.writeNoException();
          IBinder localIBinder5 = null;
          if (localzzd5 != null)
            localIBinder5 = localzzd5.asBinder();
          paramParcel2.writeStrongBinder(localIBinder5);
          return true;
        }
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (LatLng localLatLng2 = LatLng.CREATOR.zzdW(paramParcel1); ; localLatLng2 = null)
        {
          zzd localzzd4 = newLatLng(localLatLng2);
          paramParcel2.writeNoException();
          IBinder localIBinder4 = null;
          if (localzzd4 != null)
            localIBinder4 = localzzd4.asBinder();
          paramParcel2.writeStrongBinder(localIBinder4);
          return true;
        }
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (LatLng localLatLng1 = LatLng.CREATOR.zzdW(paramParcel1); ; localLatLng1 = null)
        {
          zzd localzzd3 = newLatLngZoom(localLatLng1, paramParcel1.readFloat());
          paramParcel2.writeNoException();
          IBinder localIBinder3 = null;
          if (localzzd3 != null)
            localIBinder3 = localzzd3.asBinder();
          paramParcel2.writeStrongBinder(localIBinder3);
          return true;
        }
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (LatLngBounds localLatLngBounds2 = LatLngBounds.CREATOR.zzdV(paramParcel1); ; localLatLngBounds2 = null)
        {
          zzd localzzd2 = newLatLngBounds(localLatLngBounds2, paramParcel1.readInt());
          paramParcel2.writeNoException();
          IBinder localIBinder2 = null;
          if (localzzd2 != null)
            localIBinder2 = localzzd2.asBinder();
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      case 11:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
      if (paramParcel1.readInt() != 0);
      for (LatLngBounds localLatLngBounds1 = LatLngBounds.CREATOR.zzdV(paramParcel1); ; localLatLngBounds1 = null)
      {
        zzd localzzd1 = newLatLngBoundsWithSize(localLatLngBounds1, paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt());
        paramParcel2.writeNoException();
        IBinder localIBinder1 = null;
        if (localzzd1 != null)
          localIBinder1 = localzzd1.asBinder();
        paramParcel2.writeStrongBinder(localIBinder1);
        return true;
      }
    }

    private static class zza
      implements ICameraUpdateFactoryDelegate
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

      public zzd newCameraPosition(CameraPosition paramCameraPosition)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramCameraPosition != null)
          {
            localParcel1.writeInt(1);
            paramCameraPosition.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(7, localParcel1, localParcel2, 0);
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

      public zzd newLatLng(LatLng paramLatLng)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLng != null)
          {
            localParcel1.writeInt(1);
            paramLatLng.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8, localParcel1, localParcel2, 0);
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

      public zzd newLatLngBounds(LatLngBounds paramLatLngBounds, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLngBounds != null)
          {
            localParcel1.writeInt(1);
            paramLatLngBounds.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt);
            this.zzle.transact(10, localParcel1, localParcel2, 0);
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

      public zzd newLatLngBoundsWithSize(LatLngBounds paramLatLngBounds, int paramInt1, int paramInt2, int paramInt3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLngBounds != null)
          {
            localParcel1.writeInt(1);
            paramLatLngBounds.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            this.zzle.transact(11, localParcel1, localParcel2, 0);
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

      public zzd newLatLngZoom(LatLng paramLatLng, float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          if (paramLatLng != null)
          {
            localParcel1.writeInt(1);
            paramLatLng.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeFloat(paramFloat);
            this.zzle.transact(9, localParcel1, localParcel2, 0);
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

      public zzd scrollBy(float paramFloat1, float paramFloat2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat1);
          localParcel1.writeFloat(paramFloat2);
          this.zzle.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
          return localzzd;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd zoomBy(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          this.zzle.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
          return localzzd;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd zoomByWithFocus(float paramFloat, int paramInt1, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          this.zzle.transact(6, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
          return localzzd;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd zoomIn()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          this.zzle.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
          return localzzd;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd zoomOut()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          this.zzle.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
          return localzzd;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd zoomTo(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.ICameraUpdateFactoryDelegate");
          localParcel1.writeFloat(paramFloat);
          this.zzle.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localzzd = zzd.zza.zzau(localParcel2.readStrongBinder());
          return localzzd;
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