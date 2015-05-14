package com.google.android.gms.plus.internal;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.StatusCreator;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;
import com.google.android.gms.internal.zzlk;
import com.google.android.gms.internal.zzll;
import com.google.android.gms.internal.zztw;
import com.google.android.gms.internal.zztx;

public abstract interface zzb extends IInterface
{
  public abstract void zza(int paramInt, Bundle paramBundle1, Bundle paramBundle2)
    throws RemoteException;

  public abstract void zza(int paramInt, Bundle paramBundle, ParcelFileDescriptor paramParcelFileDescriptor)
    throws RemoteException;

  public abstract void zza(int paramInt, Bundle paramBundle, zzlk paramzzlk)
    throws RemoteException;

  public abstract void zza(int paramInt, zztw paramzztw)
    throws RemoteException;

  public abstract void zza(DataHolder paramDataHolder, String paramString)
    throws RemoteException;

  public abstract void zza(DataHolder paramDataHolder, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zzaI(Status paramStatus)
    throws RemoteException;

  public abstract void zzcC(String paramString)
    throws RemoteException;

  public abstract void zzcD(String paramString)
    throws RemoteException;

  public abstract void zzj(int paramInt, Bundle paramBundle)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzb
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.plus.internal.IPlusCallbacks");
    }

    public static zzb zzcw(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof zzb)))
        return (zzb)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.plus.internal.IPlusCallbacks");
        return true;
      case 1:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i5 = paramParcel1.readInt();
        Bundle localBundle4;
        if (paramParcel1.readInt() != 0)
        {
          localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label194;
        }
        for (Bundle localBundle5 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle5 = null)
        {
          zza(i5, localBundle4, localBundle5);
          paramParcel2.writeNoException();
          return true;
          localBundle4 = null;
          break;
        }
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i4 = paramParcel1.readInt();
        Bundle localBundle3;
        if (paramParcel1.readInt() != 0)
        {
          localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label276;
        }
        for (ParcelFileDescriptor localParcelFileDescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(paramParcel1); ; localParcelFileDescriptor = null)
        {
          zza(i4, localBundle3, localParcelFileDescriptor);
          paramParcel2.writeNoException();
          return true;
          localBundle3 = null;
          break;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        zzcC(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i3 = paramParcel1.readInt();
        DataHolder localDataHolder2 = null;
        if (i3 != 0)
          localDataHolder2 = DataHolder.CREATOR.zzA(paramParcel1);
        zza(localDataHolder2, paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int i1 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle2 = null)
        {
          int i2 = paramParcel1.readInt();
          zzlk localzzlk = null;
          if (i2 != 0)
            localzzlk = zzlk.CREATOR.zzT(paramParcel1);
          zza(i1, localBundle2, localzzlk);
          paramParcel2.writeNoException();
          return true;
        }
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int n = paramParcel1.readInt();
        DataHolder localDataHolder1 = null;
        if (n != 0)
          localDataHolder1 = DataHolder.CREATOR.zzA(paramParcel1);
        zza(localDataHolder1, paramParcel1.readString(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        int m = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle1 = null)
        {
          zzj(m, localBundle1);
          paramParcel2.writeNoException();
          return true;
        }
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        zzcD(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 9:
        label194: paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
        label276: int j = paramParcel1.readInt();
        int k = paramParcel1.readInt();
        zztw localzztw = null;
        if (k != 0)
          localzztw = zztw.CREATOR.zzeB(paramParcel1);
        zza(j, localzztw);
        paramParcel2.writeNoException();
        return true;
      case 10:
      }
      paramParcel1.enforceInterface("com.google.android.gms.plus.internal.IPlusCallbacks");
      int i = paramParcel1.readInt();
      Status localStatus = null;
      if (i != 0)
        localStatus = Status.CREATOR.createFromParcel(paramParcel1);
      zzaI(localStatus);
      paramParcel2.writeNoException();
      return true;
    }

    private static class zza
      implements zzb
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

      public void zza(int paramInt, Bundle paramBundle1, Bundle paramBundle2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle1 != null)
            {
              localParcel1.writeInt(1);
              paramBundle1.writeToParcel(localParcel1, 0);
              if (paramBundle2 != null)
              {
                localParcel1.writeInt(1);
                paramBundle2.writeToParcel(localParcel1, 0);
                this.zzle.transact(1, localParcel1, localParcel2, 0);
                localParcel2.readException();
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
          localParcel1.writeInt(0);
        }
      }

      public void zza(int paramInt, Bundle paramBundle, ParcelFileDescriptor paramParcelFileDescriptor)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              if (paramParcelFileDescriptor != null)
              {
                localParcel1.writeInt(1);
                paramParcelFileDescriptor.writeToParcel(localParcel1, 0);
                this.zzle.transact(2, localParcel1, localParcel2, 0);
                localParcel2.readException();
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
          localParcel1.writeInt(0);
        }
      }

      public void zza(int paramInt, Bundle paramBundle, zzlk paramzzlk)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
            localParcel1.writeInt(paramInt);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              if (paramzzlk != null)
              {
                localParcel1.writeInt(1);
                paramzzlk.writeToParcel(localParcel1, 0);
                this.zzle.transact(5, localParcel1, localParcel2, 0);
                localParcel2.readException();
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
          localParcel1.writeInt(0);
        }
      }

      public void zza(int paramInt, zztw paramzztw)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramzztw != null)
          {
            localParcel1.writeInt(1);
            paramzztw.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
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

      public void zza(DataHolder paramDataHolder, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeString(paramString);
            this.zzle.transact(4, localParcel1, localParcel2, 0);
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

      public void zza(DataHolder paramDataHolder, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(6, localParcel1, localParcel2, 0);
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

      public void zzaI(Status paramStatus)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          if (paramStatus != null)
          {
            localParcel1.writeInt(1);
            paramStatus.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10, localParcel1, localParcel2, 0);
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

      public void zzcC(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          localParcel1.writeString(paramString);
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

      public void zzcD(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(8, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzj(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.plus.internal.IPlusCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(7, localParcel1, localParcel2, 0);
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