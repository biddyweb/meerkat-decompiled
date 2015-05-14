package com.google.android.gms.maps.model.internal;

import android.graphics.Bitmap;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;

public abstract interface zzg extends IInterface
{
  public abstract zzd zzb(Bitmap paramBitmap)
    throws RemoteException;

  public abstract zzd zzcs(String paramString)
    throws RemoteException;

  public abstract zzd zzct(String paramString)
    throws RemoteException;

  public abstract zzd zzcu(String paramString)
    throws RemoteException;

  public abstract zzd zze(float paramFloat)
    throws RemoteException;

  public abstract zzd zzgn(int paramInt)
    throws RemoteException;

  public abstract zzd zzqN()
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzg
  {
    public static zzg zzbW(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof zzg)))
        return (zzg)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        zzd localzzd7 = zzgn(paramParcel1.readInt());
        paramParcel2.writeNoException();
        if (localzzd7 != null);
        for (IBinder localIBinder7 = localzzd7.asBinder(); ; localIBinder7 = null)
        {
          paramParcel2.writeStrongBinder(localIBinder7);
          return true;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        zzd localzzd6 = zzcs(paramParcel1.readString());
        paramParcel2.writeNoException();
        IBinder localIBinder6 = null;
        if (localzzd6 != null)
          localIBinder6 = localzzd6.asBinder();
        paramParcel2.writeStrongBinder(localIBinder6);
        return true;
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        zzd localzzd5 = zzct(paramParcel1.readString());
        paramParcel2.writeNoException();
        IBinder localIBinder5 = null;
        if (localzzd5 != null)
          localIBinder5 = localzzd5.asBinder();
        paramParcel2.writeStrongBinder(localIBinder5);
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        zzd localzzd4 = zzqN();
        paramParcel2.writeNoException();
        IBinder localIBinder4 = null;
        if (localzzd4 != null)
          localIBinder4 = localzzd4.asBinder();
        paramParcel2.writeStrongBinder(localIBinder4);
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        zzd localzzd3 = zze(paramParcel1.readFloat());
        paramParcel2.writeNoException();
        IBinder localIBinder3 = null;
        if (localzzd3 != null)
          localIBinder3 = localzzd3.asBinder();
        paramParcel2.writeStrongBinder(localIBinder3);
        return true;
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
        if (paramParcel1.readInt() != 0);
        for (Bitmap localBitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(paramParcel1); ; localBitmap = null)
        {
          zzd localzzd2 = zzb(localBitmap);
          paramParcel2.writeNoException();
          IBinder localIBinder2 = null;
          if (localzzd2 != null)
            localIBinder2 = localzzd2.asBinder();
          paramParcel2.writeStrongBinder(localIBinder2);
          return true;
        }
      case 7:
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
      zzd localzzd1 = zzcu(paramParcel1.readString());
      paramParcel2.writeNoException();
      IBinder localIBinder1 = null;
      if (localzzd1 != null)
        localIBinder1 = localzzd1.asBinder();
      paramParcel2.writeStrongBinder(localIBinder1);
      return true;
    }

    private static class zza
      implements zzg
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

      public zzd zzb(Bitmap paramBitmap)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          if (paramBitmap != null)
          {
            localParcel1.writeInt(1);
            paramBitmap.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(6, localParcel1, localParcel2, 0);
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

      public zzd zzcs(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeString(paramString);
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

      public zzd zzct(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeString(paramString);
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

      public zzd zzcu(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeString(paramString);
          this.zzle.transact(7, localParcel1, localParcel2, 0);
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

      public zzd zze(float paramFloat)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
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

      public zzd zzgn(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
          localParcel1.writeInt(paramInt);
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

      public zzd zzqN()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.model.internal.IBitmapDescriptorFactoryDelegate");
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