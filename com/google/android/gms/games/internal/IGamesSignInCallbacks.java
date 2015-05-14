package com.google.android.gms.games.internal;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;

public abstract interface IGamesSignInCallbacks extends IInterface
{
  public abstract void zzU(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzV(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zza(int paramInt, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zzeD(int paramInt)
    throws RemoteException;

  public abstract void zzeE(int paramInt)
    throws RemoteException;

  public abstract void zzeF(int paramInt)
    throws RemoteException;

  public abstract void zzg(DataHolder paramDataHolder)
    throws RemoteException;

  public static abstract class Stub extends Binder
    implements IGamesSignInCallbacks
  {
    public Stub()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IGamesSignInCallbacks");
    }

    public static IGamesSignInCallbacks zzba(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof IGamesSignInCallbacks)))
        return (IGamesSignInCallbacks)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.games.internal.IGamesSignInCallbacks");
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
        int n = paramParcel1.readInt();
        DataHolder localDataHolder3 = null;
        if (n != 0)
          localDataHolder3 = DataHolder.CREATOR.zzA(paramParcel1);
        zzU(localDataHolder3);
        paramParcel2.writeNoException();
        return true;
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
        int m = paramParcel1.readInt();
        DataHolder localDataHolder2 = null;
        if (m != 0)
          localDataHolder2 = DataHolder.CREATOR.zzA(paramParcel1);
        zzV(localDataHolder2);
        paramParcel2.writeNoException();
        return true;
      case 5004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
        zzeD(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
        int k = paramParcel1.readInt();
        DataHolder localDataHolder1 = null;
        if (k != 0)
          localDataHolder1 = DataHolder.CREATOR.zzA(paramParcel1);
        zzg(localDataHolder1);
        paramParcel2.writeNoException();
        return true;
      case 5006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
        zzeE(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 14001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
        zzeF(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 15501:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesSignInCallbacks");
      int i = paramParcel1.readInt();
      int j = paramParcel1.readInt();
      PendingIntent localPendingIntent = null;
      if (j != 0)
        localPendingIntent = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1);
      zza(i, localPendingIntent);
      paramParcel2.writeNoException();
      return true;
    }

    private static class Proxy
      implements IGamesSignInCallbacks
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

      public void zzU(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5002, localParcel1, localParcel2, 0);
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

      public void zzV(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5003, localParcel1, localParcel2, 0);
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

      public void zza(int paramInt, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramPendingIntent != null)
          {
            localParcel1.writeInt(1);
            paramPendingIntent.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(15501, localParcel1, localParcel2, 0);
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

      public void zzeD(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInCallbacks");
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5004, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzeE(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInCallbacks");
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5006, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzeF(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInCallbacks");
          localParcel1.writeInt(paramInt);
          this.zzle.transact(14001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesSignInCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5005, localParcel1, localParcel2, 0);
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