package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.nearby.connection.AppMetadata;
import com.google.android.gms.nearby.connection.AppMetadataCreator;

public abstract interface zzrn extends IInterface
{
  public abstract void zzB(long paramLong)
    throws RemoteException;

  public abstract void zzC(long paramLong)
    throws RemoteException;

  public abstract void zzD(long paramLong)
    throws RemoteException;

  public abstract String zzE(long paramLong)
    throws RemoteException;

  public abstract void zza(zzrm paramzzrm, int paramInt, long paramLong1, long paramLong2)
    throws RemoteException;

  public abstract void zza(zzrm paramzzrm, String paramString, long paramLong)
    throws RemoteException;

  public abstract void zza(zzrm paramzzrm, String paramString, long paramLong1, long paramLong2)
    throws RemoteException;

  public abstract void zza(zzrm paramzzrm, String paramString, AppMetadata paramAppMetadata, long paramLong1, long paramLong2)
    throws RemoteException;

  public abstract void zza(zzrm paramzzrm, String paramString1, String paramString2, byte[] paramArrayOfByte, long paramLong)
    throws RemoteException;

  public abstract void zza(zzrm paramzzrm, String paramString, byte[] paramArrayOfByte, long paramLong)
    throws RemoteException;

  public abstract void zza(String[] paramArrayOfString, byte[] paramArrayOfByte, long paramLong)
    throws RemoteException;

  public abstract void zzb(String paramString, long paramLong)
    throws RemoteException;

  public abstract void zzb(String[] paramArrayOfString, byte[] paramArrayOfByte, long paramLong)
    throws RemoteException;

  public abstract void zzc(String paramString, long paramLong)
    throws RemoteException;

  public abstract String zzrl()
    throws RemoteException;

  public abstract void zzu(long paramLong)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzrn
  {
    public static zzrn zzci(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
      if ((localIInterface != null) && ((localIInterface instanceof zzrn)))
        return (zzrn)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        return true;
      case 1001:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzrm localzzrm = zzrm.zza.zzch(paramParcel1.readStrongBinder());
        String str3 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (AppMetadata localAppMetadata = AppMetadata.CREATOR.createFromParcel(paramParcel1); ; localAppMetadata = null)
        {
          zza(localzzrm, str3, localAppMetadata, paramParcel1.readLong(), paramParcel1.readLong());
          paramParcel2.writeNoException();
          return true;
        }
      case 1002:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzB(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1003:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zza(zzrm.zza.zzch(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readLong(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1004:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzb(paramParcel1.readString(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1005:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zza(zzrm.zza.zzch(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readLong(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1006:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzC(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1007:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zza(zzrm.zza.zzch(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.createByteArray(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1008:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zza(zzrm.zza.zzch(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.createByteArray(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1009:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zza(zzrm.zza.zzch(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1010:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zza(paramParcel1.createStringArray(), paramParcel1.createByteArray(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1011:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzb(paramParcel1.createStringArray(), paramParcel1.createByteArray(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1012:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzc(paramParcel1.readString(), paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1013:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzD(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1014:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        zzu(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 1015:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
        String str2 = zzE(paramParcel1.readLong());
        paramParcel2.writeNoException();
        paramParcel2.writeString(str2);
        return true;
      case 1016:
      }
      paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
      String str1 = zzrl();
      paramParcel2.writeNoException();
      paramParcel2.writeString(str1);
      return true;
    }

    private static class zza
      implements zzrn
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

      public void zzB(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzC(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1006, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzD(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1013, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String zzE(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1015, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzrm paramzzrm, int paramInt, long paramLong1, long paramLong2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          if (paramzzrm != null);
          for (IBinder localIBinder = paramzzrm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeLong(paramLong1);
            localParcel1.writeLong(paramLong2);
            this.zzle.transact(1005, localParcel1, localParcel2, 0);
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

      public void zza(zzrm paramzzrm, String paramString, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          if (paramzzrm != null);
          for (IBinder localIBinder = paramzzrm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(1009, localParcel1, localParcel2, 0);
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

      public void zza(zzrm paramzzrm, String paramString, long paramLong1, long paramLong2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          if (paramzzrm != null);
          for (IBinder localIBinder = paramzzrm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeLong(paramLong1);
            localParcel1.writeLong(paramLong2);
            this.zzle.transact(1003, localParcel1, localParcel2, 0);
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

      public void zza(zzrm paramzzrm, String paramString, AppMetadata paramAppMetadata, long paramLong1, long paramLong2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          IBinder localIBinder;
          if (paramzzrm != null)
          {
            localIBinder = paramzzrm.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            if (paramAppMetadata == null)
              break label113;
            localParcel1.writeInt(1);
            paramAppMetadata.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeLong(paramLong1);
            localParcel1.writeLong(paramLong2);
            this.zzle.transact(1001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label113: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(zzrm paramzzrm, String paramString1, String paramString2, byte[] paramArrayOfByte, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          if (paramzzrm != null);
          for (IBinder localIBinder = paramzzrm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeByteArray(paramArrayOfByte);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(1007, localParcel1, localParcel2, 0);
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

      public void zza(zzrm paramzzrm, String paramString, byte[] paramArrayOfByte, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          if (paramzzrm != null);
          for (IBinder localIBinder = paramzzrm.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeByteArray(paramArrayOfByte);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(1008, localParcel1, localParcel2, 0);
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

      public void zza(String[] paramArrayOfString, byte[] paramArrayOfByte, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeStringArray(paramArrayOfString);
          localParcel1.writeByteArray(paramArrayOfByte);
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1010, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(String paramString, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeString(paramString);
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1004, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(String[] paramArrayOfString, byte[] paramArrayOfByte, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeStringArray(paramArrayOfString);
          localParcel1.writeByteArray(paramArrayOfByte);
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1011, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(String paramString, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeString(paramString);
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1012, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String zzrl()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          this.zzle.transact(1016, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzu(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(1014, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
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