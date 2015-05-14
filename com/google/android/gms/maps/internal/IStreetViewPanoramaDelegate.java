package com.google.android.gms.maps.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.StreetViewPanoramaCamera;
import com.google.android.gms.maps.model.StreetViewPanoramaLocation;
import com.google.android.gms.maps.model.StreetViewPanoramaOrientation;
import com.google.android.gms.maps.model.zzi;
import com.google.android.gms.maps.model.zzq;

public abstract interface IStreetViewPanoramaDelegate extends IInterface
{
  public abstract void animateTo(StreetViewPanoramaCamera paramStreetViewPanoramaCamera, long paramLong)
    throws RemoteException;

  public abstract void enablePanning(boolean paramBoolean)
    throws RemoteException;

  public abstract void enableStreetNames(boolean paramBoolean)
    throws RemoteException;

  public abstract void enableUserNavigation(boolean paramBoolean)
    throws RemoteException;

  public abstract void enableZoom(boolean paramBoolean)
    throws RemoteException;

  public abstract StreetViewPanoramaCamera getPanoramaCamera()
    throws RemoteException;

  public abstract StreetViewPanoramaLocation getStreetViewPanoramaLocation()
    throws RemoteException;

  public abstract boolean isPanningGesturesEnabled()
    throws RemoteException;

  public abstract boolean isStreetNamesEnabled()
    throws RemoteException;

  public abstract boolean isUserNavigationEnabled()
    throws RemoteException;

  public abstract boolean isZoomGesturesEnabled()
    throws RemoteException;

  public abstract zzd orientationToPoint(StreetViewPanoramaOrientation paramStreetViewPanoramaOrientation)
    throws RemoteException;

  public abstract StreetViewPanoramaOrientation pointToOrientation(zzd paramzzd)
    throws RemoteException;

  public abstract void setOnStreetViewPanoramaCameraChangeListener(zzr paramzzr)
    throws RemoteException;

  public abstract void setOnStreetViewPanoramaChangeListener(zzs paramzzs)
    throws RemoteException;

  public abstract void setOnStreetViewPanoramaClickListener(zzt paramzzt)
    throws RemoteException;

  public abstract void setPosition(LatLng paramLatLng)
    throws RemoteException;

  public abstract void setPositionWithID(String paramString)
    throws RemoteException;

  public abstract void setPositionWithRadius(LatLng paramLatLng, int paramInt)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements IStreetViewPanoramaDelegate
  {
    public static IStreetViewPanoramaDelegate zzbS(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof IStreetViewPanoramaDelegate)))
        return (IStreetViewPanoramaDelegate)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        int i5 = paramParcel1.readInt();
        boolean bool8 = false;
        if (i5 != 0)
          bool8 = true;
        enableZoom(bool8);
        paramParcel2.writeNoException();
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        int i4 = paramParcel1.readInt();
        boolean bool7 = false;
        if (i4 != 0)
          bool7 = true;
        enablePanning(bool7);
        paramParcel2.writeNoException();
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        int i3 = paramParcel1.readInt();
        boolean bool6 = false;
        if (i3 != 0)
          bool6 = true;
        enableUserNavigation(bool6);
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        int i2 = paramParcel1.readInt();
        boolean bool5 = false;
        if (i2 != 0)
          bool5 = true;
        enableStreetNames(bool5);
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        boolean bool4 = isZoomGesturesEnabled();
        paramParcel2.writeNoException();
        int i1 = 0;
        if (bool4)
          i1 = 1;
        paramParcel2.writeInt(i1);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        boolean bool3 = isPanningGesturesEnabled();
        paramParcel2.writeNoException();
        int n = 0;
        if (bool3)
          n = 1;
        paramParcel2.writeInt(n);
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        boolean bool2 = isUserNavigationEnabled();
        paramParcel2.writeNoException();
        int m = 0;
        if (bool2)
          m = 1;
        paramParcel2.writeInt(m);
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        boolean bool1 = isStreetNamesEnabled();
        paramParcel2.writeNoException();
        int k = 0;
        if (bool1)
          k = 1;
        paramParcel2.writeInt(k);
        return true;
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        if (paramParcel1.readInt() != 0);
        for (StreetViewPanoramaCamera localStreetViewPanoramaCamera2 = StreetViewPanoramaCamera.CREATOR.zzea(paramParcel1); ; localStreetViewPanoramaCamera2 = null)
        {
          animateTo(localStreetViewPanoramaCamera2, paramParcel1.readLong());
          paramParcel2.writeNoException();
          return true;
        }
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        StreetViewPanoramaCamera localStreetViewPanoramaCamera1 = getPanoramaCamera();
        paramParcel2.writeNoException();
        if (localStreetViewPanoramaCamera1 != null)
        {
          paramParcel2.writeInt(1);
          localStreetViewPanoramaCamera1.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        setPositionWithID(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        int j = paramParcel1.readInt();
        LatLng localLatLng2 = null;
        if (j != 0)
          localLatLng2 = LatLng.CREATOR.zzdW(paramParcel1);
        setPosition(localLatLng2);
        paramParcel2.writeNoException();
        return true;
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        int i = paramParcel1.readInt();
        LatLng localLatLng1 = null;
        if (i != 0)
          localLatLng1 = LatLng.CREATOR.zzdW(paramParcel1);
        setPositionWithRadius(localLatLng1, paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 14:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        StreetViewPanoramaLocation localStreetViewPanoramaLocation = getStreetViewPanoramaLocation();
        paramParcel2.writeNoException();
        if (localStreetViewPanoramaLocation != null)
        {
          paramParcel2.writeInt(1);
          localStreetViewPanoramaLocation.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 15:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        setOnStreetViewPanoramaChangeListener(zzs.zza.zzbN(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 16:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        setOnStreetViewPanoramaCameraChangeListener(zzr.zza.zzbM(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        setOnStreetViewPanoramaClickListener(zzt.zza.zzbO(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 18:
        paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
        StreetViewPanoramaOrientation localStreetViewPanoramaOrientation2 = pointToOrientation(zzd.zza.zzau(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        if (localStreetViewPanoramaOrientation2 != null)
        {
          paramParcel2.writeInt(1);
          localStreetViewPanoramaOrientation2.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 19:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
      if (paramParcel1.readInt() != 0);
      for (StreetViewPanoramaOrientation localStreetViewPanoramaOrientation1 = StreetViewPanoramaOrientation.CREATOR.zzed(paramParcel1); ; localStreetViewPanoramaOrientation1 = null)
      {
        zzd localzzd = orientationToPoint(localStreetViewPanoramaOrientation1);
        paramParcel2.writeNoException();
        IBinder localIBinder = null;
        if (localzzd != null)
          localIBinder = localzzd.asBinder();
        paramParcel2.writeStrongBinder(localIBinder);
        return true;
      }
    }

    private static class zza
      implements IStreetViewPanoramaDelegate
    {
      private IBinder zzle;

      zza(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public void animateTo(StreetViewPanoramaCamera paramStreetViewPanoramaCamera, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramStreetViewPanoramaCamera != null)
          {
            localParcel1.writeInt(1);
            paramStreetViewPanoramaCamera.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeLong(paramLong);
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

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void enablePanning(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void enableStreetNames(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void enableUserNavigation(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(3, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void enableZoom(boolean paramBoolean)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramBoolean);
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(1, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public StreetViewPanoramaCamera getPanoramaCamera()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          this.zzle.transact(10, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            StreetViewPanoramaCamera localStreetViewPanoramaCamera2 = StreetViewPanoramaCamera.CREATOR.zzea(localParcel2);
            localStreetViewPanoramaCamera1 = localStreetViewPanoramaCamera2;
            return localStreetViewPanoramaCamera1;
          }
          StreetViewPanoramaCamera localStreetViewPanoramaCamera1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public StreetViewPanoramaLocation getStreetViewPanoramaLocation()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          this.zzle.transact(14, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            StreetViewPanoramaLocation localStreetViewPanoramaLocation2 = StreetViewPanoramaLocation.CREATOR.zzec(localParcel2);
            localStreetViewPanoramaLocation1 = localStreetViewPanoramaLocation2;
            return localStreetViewPanoramaLocation1;
          }
          StreetViewPanoramaLocation localStreetViewPanoramaLocation1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public boolean isPanningGesturesEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          this.zzle.transact(6, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public boolean isStreetNamesEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          this.zzle.transact(8, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public boolean isUserNavigationEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          this.zzle.transact(7, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public boolean isZoomGesturesEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          this.zzle.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public zzd orientationToPoint(StreetViewPanoramaOrientation paramStreetViewPanoramaOrientation)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramStreetViewPanoramaOrientation != null)
          {
            localParcel1.writeInt(1);
            paramStreetViewPanoramaOrientation.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(19, localParcel1, localParcel2, 0);
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

      public StreetViewPanoramaOrientation pointToOrientation(zzd paramzzd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramzzd != null);
          for (IBinder localIBinder = paramzzd.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(18, localParcel1, localParcel2, 0);
            localParcel2.readException();
            int i = localParcel2.readInt();
            Object localObject2 = null;
            if (i != 0)
            {
              StreetViewPanoramaOrientation localStreetViewPanoramaOrientation = StreetViewPanoramaOrientation.CREATOR.zzed(localParcel2);
              localObject2 = localStreetViewPanoramaOrientation;
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

      public void setOnStreetViewPanoramaCameraChangeListener(zzr paramzzr)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramzzr != null);
          for (IBinder localIBinder = paramzzr.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(16, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void setOnStreetViewPanoramaChangeListener(zzs paramzzs)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramzzs != null);
          for (IBinder localIBinder = paramzzs.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(15, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void setOnStreetViewPanoramaClickListener(zzt paramzzt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramzzt != null);
          for (IBinder localIBinder = paramzzt.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(17, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void setPosition(LatLng paramLatLng)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramLatLng != null)
          {
            localParcel1.writeInt(1);
            paramLatLng.writeToParcel(localParcel1, 0);
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

      public void setPositionWithID(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          localParcel1.writeString(paramString);
          this.zzle.transact(11, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void setPositionWithRadius(LatLng paramLatLng, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate");
          if (paramLatLng != null)
          {
            localParcel1.writeInt(1);
            paramLatLng.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt);
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
    }
  }
}