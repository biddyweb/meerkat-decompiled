package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.nearby.connection.AppMetadata;
import com.google.android.gms.nearby.connection.AppMetadataCreator;

public abstract interface zzrm extends IInterface
{
  public abstract void onConnectionRequest(String paramString1, String paramString2, String paramString3, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void onDisconnected(String paramString)
    throws RemoteException;

  public abstract void onEndpointFound(String paramString1, String paramString2, String paramString3, String paramString4)
    throws RemoteException;

  public abstract void onEndpointLost(String paramString)
    throws RemoteException;

  public abstract void onMessageReceived(String paramString, byte[] paramArrayOfByte, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(String paramString, int paramInt, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void zza(String paramString1, String paramString2, String paramString3, String paramString4, AppMetadata paramAppMetadata)
    throws RemoteException;

  public abstract void zzcw(String paramString)
    throws RemoteException;

  public abstract void zzgs(int paramInt)
    throws RemoteException;

  public abstract void zzgt(int paramInt)
    throws RemoteException;

  public abstract void zzgu(int paramInt)
    throws RemoteException;

  public abstract void zzgv(int paramInt)
    throws RemoteException;

  public abstract void zzgw(int paramInt)
    throws RemoteException;

  public abstract void zzi(int paramInt, String paramString)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzrm
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
    }

    public static zzrm zzch(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzrm)))
        return (zzrm)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        return true;
      case 1001:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        onConnectionRequest(paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 1002:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        onEndpointFound(paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 1003:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        onEndpointLost(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 1004:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        String str2 = paramParcel1.readString();
        String str3 = paramParcel1.readString();
        String str4 = paramParcel1.readString();
        String str5 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (AppMetadata localAppMetadata = AppMetadata.CREATOR.createFromParcel(paramParcel1); ; localAppMetadata = null)
        {
          zza(str2, str3, str4, str5, localAppMetadata);
          paramParcel2.writeNoException();
          return true;
        }
      case 1005:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        zzcw(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 1006:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        zza(paramParcel1.readString(), paramParcel1.readInt(), paramParcel1.createByteArray());
        paramParcel2.writeNoException();
        return true;
      case 1007:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        String str1 = paramParcel1.readString();
        byte[] arrayOfByte = paramParcel1.createByteArray();
        if (paramParcel1.readInt() != 0);
        for (boolean bool = true; ; bool = false)
        {
          onMessageReceived(str1, arrayOfByte, bool);
          paramParcel2.writeNoException();
          return true;
        }
      case 1008:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        onDisconnected(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 1009:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        zzi(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 1010:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        zzgs(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 1011:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        zzgt(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 1012:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        zzgu(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 1013:
        paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
        zzgv(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 1014:
      }
      paramParcel1.enforceInterface("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
      zzgw(paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzrm
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

      public void onConnectionRequest(String paramString1, String paramString2, String paramString3, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          localParcel1.writeString(paramString3);
          localParcel1.writeByteArray(paramArrayOfByte);
          this.zzle.transact(1001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onDisconnected(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(1008, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onEndpointFound(String paramString1, String paramString2, String paramString3, String paramString4)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          localParcel1.writeString(paramString3);
          localParcel1.writeString(paramString4);
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

      public void onEndpointLost(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(1003, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onMessageReceived(String paramString, byte[] paramArrayOfByte, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString);
          localParcel1.writeByteArray(paramArrayOfByte);
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(1007, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(String paramString, int paramInt, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          localParcel1.writeByteArray(paramArrayOfByte);
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

      public void zza(String paramString1, String paramString2, String paramString3, String paramString4, AppMetadata paramAppMetadata)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          localParcel1.writeString(paramString3);
          localParcel1.writeString(paramString4);
          if (paramAppMetadata != null)
          {
            localParcel1.writeInt(1);
            paramAppMetadata.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(1004, localParcel1, localParcel2, 0);
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

      public void zzcw(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(1005, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzgs(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeInt(paramInt);
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

      public void zzgt(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeInt(paramInt);
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

      public void zzgu(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeInt(paramInt);
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

      public void zzgv(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeInt(paramInt);
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

      public void zzgw(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeInt(paramInt);
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

      public void zzi(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.nearby.internal.connection.INearbyConnectionCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.zzle.transact(1009, localParcel1, localParcel2, 0);
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