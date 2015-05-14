package com.google.android.gms.games.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;

public abstract interface IRoomService extends IInterface
{
  public abstract void zzV(boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IBinder paramIBinder, IRoomServiceCallbacks paramIRoomServiceCallbacks)
    throws RemoteException;

  public abstract void zza(DataHolder paramDataHolder, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(byte[] paramArrayOfByte, String paramString, int paramInt)
    throws RemoteException;

  public abstract void zza(byte[] paramArrayOfByte, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzcb(String paramString)
    throws RemoteException;

  public abstract void zzcc(String paramString)
    throws RemoteException;

  public abstract void zze(String paramString1, String paramString2, String paramString3)
    throws RemoteException;

  public abstract void zznV()
    throws RemoteException;

  public abstract void zznW()
    throws RemoteException;

  public abstract void zznX()
    throws RemoteException;

  public abstract void zznY()
    throws RemoteException;

  public abstract void zzw(String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzx(String paramString, int paramInt)
    throws RemoteException;

  public static abstract class Stub extends Binder
    implements IRoomService
  {
    public Stub()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IRoomService");
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.games.internal.IRoomService");
        return true;
      case 1001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zza(paramParcel1.readStrongBinder(), IRoomServiceCallbacks.Stub.zzbc(paramParcel1.readStrongBinder()));
        return true;
      case 1002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zznV();
        return true;
      case 1003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zznW();
        return true;
      case 1004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zze(paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString());
        return true;
      case 1005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zznX();
        return true;
      case 1006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        if (paramParcel1.readInt() != 0);
        for (DataHolder localDataHolder = DataHolder.CREATOR.zzA(paramParcel1); ; localDataHolder = null)
        {
          int j = paramParcel1.readInt();
          boolean bool2 = false;
          if (j != 0)
            bool2 = true;
          zza(localDataHolder, bool2);
          return true;
        }
      case 1007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zznY();
        return true;
      case 1008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        int i = paramParcel1.readInt();
        boolean bool1 = false;
        if (i != 0)
          bool1 = true;
        zzV(bool1);
        return true;
      case 1009:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zza(paramParcel1.createByteArray(), paramParcel1.readString(), paramParcel1.readInt());
        return true;
      case 1010:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zza(paramParcel1.createByteArray(), paramParcel1.createStringArray());
        return true;
      case 1011:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zzw(paramParcel1.readString(), paramParcel1.readInt());
        return true;
      case 1012:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zzx(paramParcel1.readString(), paramParcel1.readInt());
        return true;
      case 1013:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
        zzcb(paramParcel1.readString());
        return true;
      case 1014:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomService");
      zzcc(paramParcel1.readString());
      return true;
    }

    private static class Proxy
      implements IRoomService
    {
      private IBinder zzle;

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void zzV(boolean paramBoolean)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          if (paramBoolean);
          while (true)
          {
            localParcel.writeInt(i);
            this.zzle.transact(1008, localParcel, null, 1);
            return;
            i = 0;
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(IBinder paramIBinder, IRoomServiceCallbacks paramIRoomServiceCallbacks)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeStrongBinder(paramIBinder);
          IBinder localIBinder = null;
          if (paramIRoomServiceCallbacks != null)
            localIBinder = paramIRoomServiceCallbacks.asBinder();
          localParcel.writeStrongBinder(localIBinder);
          this.zzle.transact(1001, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(DataHolder paramDataHolder, boolean paramBoolean)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
            if (paramDataHolder != null)
            {
              localParcel.writeInt(1);
              paramDataHolder.writeToParcel(localParcel, 0);
              break label87;
              localParcel.writeInt(i);
              this.zzle.transact(1006, localParcel, null, 1);
            }
            else
            {
              localParcel.writeInt(0);
            }
          }
          finally
          {
            localParcel.recycle();
          }
          label87: 
          while (!paramBoolean)
          {
            i = 0;
            break;
          }
        }
      }

      public void zza(byte[] paramArrayOfByte, String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeByteArray(paramArrayOfByte);
          localParcel.writeString(paramString);
          localParcel.writeInt(paramInt);
          this.zzle.transact(1009, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(byte[] paramArrayOfByte, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeByteArray(paramArrayOfByte);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1010, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzcb(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeString(paramString);
          this.zzle.transact(1013, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzcc(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeString(paramString);
          this.zzle.transact(1014, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zze(String paramString1, String paramString2, String paramString3)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeString(paramString1);
          localParcel.writeString(paramString2);
          localParcel.writeString(paramString3);
          this.zzle.transact(1004, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zznV()
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          this.zzle.transact(1002, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zznW()
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          this.zzle.transact(1003, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zznX()
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          this.zzle.transact(1005, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zznY()
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          this.zzle.transact(1007, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzw(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeString(paramString);
          localParcel.writeInt(paramInt);
          this.zzle.transact(1011, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzx(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomService");
          localParcel.writeString(paramString);
          localParcel.writeInt(paramInt);
          this.zzle.transact(1012, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}