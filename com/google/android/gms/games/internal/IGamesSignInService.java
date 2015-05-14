package com.google.android.gms.games.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract interface IGamesSignInService extends IInterface
{
  public abstract void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString)
    throws RemoteException;

  public abstract void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3)
    throws RemoteException;

  public abstract void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3, String paramString4, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3, String[] paramArrayOfString, String paramString4)
    throws RemoteException;

  public abstract void zzb(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3)
    throws RemoteException;

  public abstract String zzbZ(String paramString)
    throws RemoteException;

  public abstract String zzca(String paramString)
    throws RemoteException;

  public abstract String zzh(String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzx(String paramString1, String paramString2)
    throws RemoteException;

  public static abstract class Stub extends Binder
    implements IGamesSignInService
  {
    public Stub()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IGamesSignInService");
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.games.internal.IGamesSignInService");
        return true;
      case 5001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        String str4 = zzbZ(paramParcel1.readString());
        paramParcel2.writeNoException();
        paramParcel2.writeString(str4);
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        String str3 = zzca(paramParcel1.readString());
        paramParcel2.writeNoException();
        paramParcel2.writeString(str3);
        return true;
      case 5009:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        String str1 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (boolean bool = true; ; bool = false)
        {
          String str2 = zzh(str1, bool);
          paramParcel2.writeNoException();
          paramParcel2.writeString(str2);
          return true;
        }
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        zza(IGamesSignInCallbacks.Stub.zzba(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.createStringArray(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        zza(IGamesSignInCallbacks.Stub.zzba(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        zza(IGamesSignInCallbacks.Stub.zzba(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        zza(IGamesSignInCallbacks.Stub.zzba(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        zzb(IGamesSignInCallbacks.Stub.zzba(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        zza(IGamesSignInCallbacks.Stub.zzba(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.readString(), paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 9001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
        zzx(paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 14001:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInService");
      zza(IGamesSignInCallbacks.Stub.zzba(paramParcel1.readStrongBinder()), paramParcel1.readString());
      paramParcel2.writeNoException();
      return true;
    }

    private static class Proxy
      implements IGamesSignInService
    {
      private IBinder zzle;

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          if (paramIGamesSignInCallbacks != null);
          for (IBinder localIBinder = paramIGamesSignInCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(14001, localParcel1, localParcel2, 0);
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

      public void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          if (paramIGamesSignInCallbacks != null);
          for (IBinder localIBinder = paramIGamesSignInCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(5006, localParcel1, localParcel2, 0);
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

      public void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          if (paramIGamesSignInCallbacks != null);
          for (IBinder localIBinder = paramIGamesSignInCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeString(paramString3);
            this.zzle.transact(5005, localParcel1, localParcel2, 0);
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

      public void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3, String paramString4, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          if (paramIGamesSignInCallbacks != null);
          for (IBinder localIBinder = paramIGamesSignInCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeString(paramString3);
            localParcel1.writeString(paramString4);
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5008, localParcel1, localParcel2, 0);
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

      public void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          if (paramIGamesSignInCallbacks != null);
          for (IBinder localIBinder = paramIGamesSignInCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeString(paramString3);
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5004, localParcel1, localParcel2, 0);
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

      public void zza(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3, String[] paramArrayOfString, String paramString4)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          if (paramIGamesSignInCallbacks != null);
          for (IBinder localIBinder = paramIGamesSignInCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeString(paramString3);
            localParcel1.writeStringArray(paramArrayOfString);
            localParcel1.writeString(paramString4);
            this.zzle.transact(5003, localParcel1, localParcel2, 0);
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

      public void zzb(IGamesSignInCallbacks paramIGamesSignInCallbacks, String paramString1, String paramString2, String paramString3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          if (paramIGamesSignInCallbacks != null);
          for (IBinder localIBinder = paramIGamesSignInCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeString(paramString3);
            this.zzle.transact(5007, localParcel1, localParcel2, 0);
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

      public String zzbZ(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          localParcel1.writeString(paramString);
          this.zzle.transact(5001, localParcel1, localParcel2, 0);
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

      public String zzca(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          localParcel1.writeString(paramString);
          this.zzle.transact(5002, localParcel1, localParcel2, 0);
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

      public String zzh(String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          localParcel1.writeString(paramString);
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(5009, localParcel1, localParcel2, 0);
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

      public void zzx(String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          this.zzle.transact(9001, localParcel1, localParcel2, 0);
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