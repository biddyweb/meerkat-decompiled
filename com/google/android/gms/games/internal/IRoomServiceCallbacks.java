package com.google.android.gms.games.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract interface IRoomServiceCallbacks extends IInterface
{
  public abstract void onP2PConnected(String paramString)
    throws RemoteException;

  public abstract void onP2PDisconnected(String paramString)
    throws RemoteException;

  public abstract void zza(ParcelFileDescriptor paramParcelFileDescriptor, int paramInt)
    throws RemoteException;

  public abstract void zza(ConnectionInfo paramConnectionInfo)
    throws RemoteException;

  public abstract void zza(String paramString, byte[] paramArrayOfByte, int paramInt)
    throws RemoteException;

  public abstract void zza(String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzb(String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzbb(IBinder paramIBinder)
    throws RemoteException;

  public abstract void zzc(int paramInt1, int paramInt2, String paramString)
    throws RemoteException;

  public abstract void zzc(String paramString, byte[] paramArrayOfByte)
    throws RemoteException;

  public abstract void zzc(String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzcd(String paramString)
    throws RemoteException;

  public abstract void zzce(String paramString)
    throws RemoteException;

  public abstract void zzcf(String paramString)
    throws RemoteException;

  public abstract void zzcg(String paramString)
    throws RemoteException;

  public abstract void zzch(String paramString)
    throws RemoteException;

  public abstract void zzci(String paramString)
    throws RemoteException;

  public abstract void zzd(String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zze(String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzeG(int paramInt)
    throws RemoteException;

  public abstract void zzf(String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzg(String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzi(String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zznZ()
    throws RemoteException;

  public abstract void zzoa()
    throws RemoteException;

  public abstract void zzy(String paramString, int paramInt)
    throws RemoteException;

  public static abstract class Stub extends Binder
    implements IRoomServiceCallbacks
  {
    public Stub()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IRoomServiceCallbacks");
    }

    public static IRoomServiceCallbacks zzbc(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof IRoomServiceCallbacks)))
        return (IRoomServiceCallbacks)localIInterface;
      return new Proxy(paramIBinder);
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        return true;
      case 1001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzc(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        return true;
      case 1002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zza(paramParcel1.readString(), paramParcel1.createByteArray(), paramParcel1.readInt());
        return true;
      case 1003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzcd(paramParcel1.readString());
        return true;
      case 1004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzce(paramParcel1.readString());
        return true;
      case 1005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzcf(paramParcel1.readString());
        return true;
      case 1006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzcg(paramParcel1.readString());
        return true;
      case 1007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzch(paramParcel1.readString());
        return true;
      case 1008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zza(paramParcel1.readString(), paramParcel1.createStringArray());
        return true;
      case 1009:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzb(paramParcel1.readString(), paramParcel1.createStringArray());
        return true;
      case 1010:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzc(paramParcel1.readString(), paramParcel1.createStringArray());
        return true;
      case 1011:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzd(paramParcel1.readString(), paramParcel1.createStringArray());
        return true;
      case 1012:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zze(paramParcel1.readString(), paramParcel1.createStringArray());
        return true;
      case 1013:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzf(paramParcel1.readString(), paramParcel1.createStringArray());
        return true;
      case 1014:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        onP2PConnected(paramParcel1.readString());
        return true;
      case 1015:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        onP2PDisconnected(paramParcel1.readString());
        return true;
      case 1016:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zznZ();
        return true;
      case 1017:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzg(paramParcel1.readString(), paramParcel1.createStringArray());
        return true;
      case 1018:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzc(paramParcel1.readString(), paramParcel1.createByteArray());
        return true;
      case 1019:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzci(paramParcel1.readString());
        return true;
      case 1020:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzeG(paramParcel1.readInt());
        return true;
      case 1021:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzbb(paramParcel1.readStrongBinder());
        return true;
      case 1022:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        int j = paramParcel1.readInt();
        ConnectionInfo localConnectionInfo = null;
        if (j != 0)
          localConnectionInfo = ConnectionInfo.CREATOR.zzcX(paramParcel1);
        zza(localConnectionInfo);
        return true;
      case 1023:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzoa();
        return true;
      case 1024:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        int i = paramParcel1.readInt();
        ParcelFileDescriptor localParcelFileDescriptor = null;
        if (i != 0)
          localParcelFileDescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(paramParcel1);
        zza(localParcelFileDescriptor, paramParcel1.readInt());
        return true;
      case 1025:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
        zzy(paramParcel1.readString(), paramParcel1.readInt());
        return true;
      case 1026:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IRoomServiceCallbacks");
      String str = paramParcel1.readString();
      if (paramParcel1.readInt() != 0);
      for (boolean bool = true; ; bool = false)
      {
        zzi(str, bool);
        return true;
      }
    }

    private static class Proxy
      implements IRoomServiceCallbacks
    {
      private IBinder zzle;

      Proxy(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void onP2PConnected(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1014, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void onP2PDisconnected(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1015, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(ParcelFileDescriptor paramParcelFileDescriptor, int paramInt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          if (paramParcelFileDescriptor != null)
          {
            localParcel.writeInt(1);
            paramParcelFileDescriptor.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            localParcel.writeInt(paramInt);
            this.zzle.transact(1024, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(ConnectionInfo paramConnectionInfo)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          if (paramConnectionInfo != null)
          {
            localParcel.writeInt(1);
            paramConnectionInfo.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            this.zzle.transact(1022, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(String paramString, byte[] paramArrayOfByte, int paramInt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeByteArray(paramArrayOfByte);
          localParcel.writeInt(paramInt);
          this.zzle.transact(1002, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1008, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzb(String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1009, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzbb(IBinder paramIBinder)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeStrongBinder(paramIBinder);
          this.zzle.transact(1021, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzc(int paramInt1, int paramInt2, String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeInt(paramInt1);
          localParcel.writeInt(paramInt2);
          localParcel.writeString(paramString);
          this.zzle.transact(1001, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzc(String paramString, byte[] paramArrayOfByte)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeByteArray(paramArrayOfByte);
          this.zzle.transact(1018, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzc(String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1010, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzcd(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1003, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzce(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1004, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzcf(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1005, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzcg(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1006, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzch(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1007, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzci(String paramString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          this.zzle.transact(1019, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzd(String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1011, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zze(String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1012, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzeG(int paramInt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeInt(paramInt);
          this.zzle.transact(1020, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzf(String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1013, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzg(String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeStringArray(paramArrayOfString);
          this.zzle.transact(1017, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzi(String paramString, boolean paramBoolean)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          if (paramBoolean);
          while (true)
          {
            localParcel.writeInt(i);
            this.zzle.transact(1026, localParcel, null, 1);
            return;
            i = 0;
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zznZ()
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          this.zzle.transact(1016, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzoa()
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          this.zzle.transact(1023, localParcel, null, 1);
          return;
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzy(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.games.internal.IRoomServiceCallbacks");
          localParcel.writeString(paramString);
          localParcel.writeInt(paramInt);
          this.zzle.transact(1025, localParcel, null, 1);
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